#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
report 55010 "Board Meeting Attendance Rpt"
{
    Caption = 'Board Meeting Attendance Report';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(BoardMeetingAttendance; "Board Meeting Attendance")
        {
            RequestFilterFields = "Meeting Code", "Meeting Date", "Commitee No";

            trigger OnPreDataItem()
            begin
                ExcelBuffer.Reset();
                ExcelBuffer.DeleteAll();
                WriteHeaderRow();

                PresentCount := 0;
                ApologyCount := 0;
                AbsentCount := 0;
                InPersonCount := 0;
                VirtualCount := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                WriteDataRow(BoardMeetingAttendance);
                Tally(BoardMeetingAttendance);
            end;

            trigger OnPostDataItem()
            begin
                WriteBlankRow();
                WriteSummaryRow(TotalPresentLbl, PresentCount);
                WriteSummaryRow(TotalApologyLbl, ApologyCount);
                WriteSummaryRow(TotalAbsentLbl, AbsentCount);
                WriteSummaryRow(TotalInPersonLbl, InPersonCount);
                WriteSummaryRow(TotalVirtualLbl, VirtualCount);

                ExcelBuffer.CreateNewBook(ReportCaptionLbl);
                ExcelBuffer.WriteSheet(SheetNameLbl, CompanyName(), UserId());
                ExcelBuffer.CloseBook();
                ExcelBuffer.OpenExcel();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }
    }

    local procedure WriteHeaderRow()
    begin
        ExcelBuffer.NewRow();
        WriteCell('Meeting Code', true);
        WriteCell('Meeting Name', true);
        WriteCell('Meeting Date', true);
        WriteCell('Committee No.', true);
        WriteCell('Committee Name', true);
        WriteCell('Member No.', true);
        WriteCell('Member Name', true);
        WriteCell('Confirmed in Advance', true);
        WriteCell('Attendance', true);
        WriteCell('Attendance Mode', true);
        WriteCell('Counted as Attended', true);
    end;

    local procedure WriteDataRow(var AttendanceLine: Record "Board Meeting Attendance")
    begin
        ExcelBuffer.NewRow();
        WriteCell(AttendanceLine."Meeting Code", false);
        WriteCell(AttendanceLine."Meeting Name", false);
        WriteCell(Format(AttendanceLine."Meeting Date"), false);
        WriteCell(AttendanceLine."Commitee No", false);
        WriteCell(AttendanceLine."Committee  Name", false);
        WriteCell(AttendanceLine."Member No", false);
        WriteCell(AttendanceLine."Member Name", false);
        WriteCell(Format(AttendanceLine."Attendance Confirmation"), false);
        WriteCell(Format(AttendanceLine.Attendance), false);
        WriteCell(Format(AttendanceLine."Attendance Mode"), false);
        WriteCell(Format(AttendanceLine."Has Attended"), false);
    end;

    local procedure WriteBlankRow()
    begin
        ExcelBuffer.NewRow();
    end;

    local procedure WriteSummaryRow(Label_: Text; Count: Integer)
    begin
        ExcelBuffer.NewRow();
        WriteCell(Label_, true);
        WriteCell(Format(Count), true);
    end;

    local procedure WriteCell(CellValue: Text; Bold: Boolean)
    begin
        ExcelBuffer.AddColumn(CellValue, Bold, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
    end;

    local procedure Tally(var AttendanceLine: Record "Board Meeting Attendance")
    begin
        case AttendanceLine.Attendance of
            AttendanceLine.Attendance::Present:
                PresentCount += 1;
            AttendanceLine.Attendance::Apology:
                ApologyCount += 1;
            AttendanceLine.Attendance::Absent:
                AbsentCount += 1;
        end;

        case AttendanceLine."Attendance Mode" of
            AttendanceLine."Attendance Mode"::"In-Person":
                InPersonCount += 1;
            AttendanceLine."Attendance Mode"::Virtual:
                VirtualCount += 1;
        end;
    end;

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        PresentCount: Integer;
        ApologyCount: Integer;
        AbsentCount: Integer;
        InPersonCount: Integer;
        VirtualCount: Integer;
        ReportCaptionLbl: Label 'Board Meeting Attendance';
        SheetNameLbl: Label 'Attendance';
        TotalPresentLbl: Label 'Total Present';
        TotalApologyLbl: Label 'Total Apology';
        TotalAbsentLbl: Label 'Total Absent';
        TotalInPersonLbl: Label 'Total In-Person';
        TotalVirtualLbl: Label 'Total Virtual';
}