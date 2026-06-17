#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72662 "Project Staff Appoint. List"
{
    PageType = List;
    SourceTable = "Project Staff Appointment Line";
    Caption = 'Project Implementation Team';
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Notified on Email"; Rec."Notified on Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified on Email field.';
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date/Time Notified field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Effect Selection")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Effect Selection action.';

                trigger OnAction()
                begin
                    if Confirm(Text0001, true) then begin
                        TransferFrom.Reset;
                        TransferFrom.SetRange(TransferFrom."Document No.", Rec."Document No.");
                        //TransferFrom.SETRANGE(TransferFrom.Suggested,FALSE);
                        if TransferFrom.FindSet then begin
                            ProjectStaffAppointmentLine.Reset;
                            ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine.Select, true);
                            ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", TransferFrom."Document No.");
                            if ProjectStaffAppointmentLine.FindSet then begin
                                repeat
                                    ProjectStaffTerminationLine.Init;
                                    ProjectStaffTerminationLine."Document No." := InitialDocNo;
                                    ProjectStaffTerminationLine."Line No" := ProjectStaffTerminationLine.Count + 1;
                                    ProjectStaffTerminationLine."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                                    ProjectStaffTerminationLine.Name := ProjectStaffAppointmentLine.Name;
                                    ProjectStaffTerminationLine.Email := ProjectStaffAppointmentLine.Email;
                                    ProjectStaffTerminationLine."Role Code" := ProjectStaffTerminationLine."Role Code";
                                    ProjectStaffTerminationLine."Staff Category" := ProjectStaffAppointmentLine."Staff Category";
                                    ProjectStaffTerminationLine.Designation := ProjectStaffAppointmentLine.Designation;
                                    ProjectStaffTerminationLine."Staff Category" := ProjectStaffAppointmentLine."Staff Category";
                                    ProjectStaffTerminationLine."Termination  Date" := Today;
                                    ProjectStaffTerminationLine."Termination Category" := ProjectStaffTerminationLine."termination category"::"Contract Expiry";
                                    if not ProjectStaffTerminationLine.Insert(true) then
                                        ProjectStaffTerminationLine.Modify(true);
                                until ProjectStaffAppointmentLine.Next = 0;
                            end;
                            TransferFrom.Suggested := true;
                            TransferFrom.Modify;
                            Message('Suggestions from %1 Inserted', TransferFrom."Staff Appointment Voucher No.");
                        end;

                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        //MESSAGE('%1 %2',InitialDocNo,StaffVouchNo);
    end;

    var
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        ProjectStaffTerminationLine: Record "Project Staff Termination Line";
        UserSetup: Record "User Setup";
        TransferTo: Record "Project Staff Termination Line";
        TransferFrom: Record "Project Staff Voucher";
        SelectedRecords: Integer;
        TransFromLines: Record "Project Staff Appointment Line";
        ObjInterBTLine: Record "Project Staff Termination Line";
        LineNo: Integer;
        Text0001: label 'Are you sure you want to transfer the selected lines to Termination?';
        Text0002: label 'No Record Selected';
        CopyFrom: Record "Project Staff Appointment Line";
        CopyTo: Record "Project Staff Termination Line";
        InitialDocNo: Code[20];
        StaffVouchNo: Code[20];


    procedure GetDocNumber(DocNo: Code[20]; StafApNo: Code[20])
    begin
        InitialDocNo := DocNo;
        StaffVouchNo := StafApNo;
    end;
}

