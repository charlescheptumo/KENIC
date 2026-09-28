#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
report 55010 "Board Meeting Attendance Rpt"
{
    Caption = 'Board Meeting Attendance Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep55010BoardMeetingAttendance.rdlc';

    dataset
    {
        dataitem(BoardMeetingAttendance; "Board Meeting Attendance")
        {
            RequestFilterFields = "Meeting Code", "Meeting Date", "Commitee No";

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(MeetingCode; "Meeting Code") { }
            column(MeetingName; "Meeting Name") { }
            column(MeetingDate; "Meeting Date") { }
            column(CommiteeNo; "Commitee No") { }
            column(CommitteeName; "Committee  Name") { }
            column(MemberNo; "Member No") { }
            column(MemberName; "Member Name") { }
            column(AttendanceConfirmation; "Attendance Confirmation") { }
            column(Attendance; Attendance) { }
            column(AttendanceMode; "Attendance Mode") { }
            column(HasAttended; "Has Attended") { }

            trigger OnPreDataItem()
            begin
                PresentCount := 0;
                ApologyCount := 0;
                AbsentCount := 0;
                InPersonCount := 0;
                VirtualCount := 0;

                if ExportToExcel then begin
                    ExcelBuffer.Reset();
                    ExcelBuffer.DeleteAll();
                    WriteHeaderRow();
                end;
            end;

            trigger OnAfterGetRecord()
            begin
                if ExportToExcel then
                    WriteDataRow(BoardMeetingAttendance);
                Tally(BoardMeetingAttendance);
            end;

            trigger OnPostDataItem()
            begin
                if not ExportToExcel then
                    exit;

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

                CurrReport.Quit();
            end;
        }

        dataitem(Summary; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));

            column(PresentCount; PresentCount) { }
            column(ApologyCount; ApologyCount) { }
            column(AbsentCount; AbsentCount) { }
            column(InPersonCount; InPersonCount) { }
            column(VirtualCount; VirtualCount) { }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(ExportToExcelCtrl; ExportToExcel)
                    {
                        ApplicationArea = All;
                        Caption = 'Export to Excel';
                        ToolTip = 'Tick to export to Excel. Leave unticked to preview, print or save as PDF.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            ExportToExcel := false;
        end;
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

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
        ExcelBuffer.AddColumn(CellValue, false, '', Bold, false, false, '', ExcelBuffer."Cell Type"::Text);
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
        CompanyInfo: Record "Company Information";
        ExcelBuffer: Record "Excel Buffer" temporary;
        ExportToExcel: Boolean;
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