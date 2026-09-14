#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
#pragma implicitwith disable

page 58174 "Probation Assessment Card"
{
    PageType = Card;
    SourceTable = "Probationary Assessment Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = PageEditable;

                field("Assessment No."; Rec."Assessment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unique document number for the probationary assessment.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the probationary assessment document was created.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee number being assessed.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the full name of the employee.';
                }
                field("Job Title/Position"; Rec."Job Title/Position")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the job title or position of the employee.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the department code of the employee.';
                }
                field("Date Engaged"; Rec."Date Engaged")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment start date.';
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the start date of the probation period.';
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the end date of the probation period.';
                }
                field("Highest Qualification"; Rec."Highest Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee highest academic or professional qualification.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the current processing status of the probationary assessment.';
                }
            }
            group("Supervisor Details")
            {
                Caption = 'Supervisor Details';
                Editable = PageEditable;

                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the supervisor assigned to conduct the assessment.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the name of the assigned supervisor.';
                }
            }
            group("Section C: Performance Ratings & Qualitative Remarks")
            {
                Caption = 'Performance Ratings & Qualitative Remarks';
                Editable = PageEditable;

                group("Job Knowledge")
                {
                    Caption = 'Job Knowledge';
                    field("Job Knowledge Rating"; Rec."Job Knowledge Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the job knowledge rating.';
                    }
                    field("Job Knowledge Remarks"; Rec."Job Knowledge Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding job knowledge.';
                    }
                }
                group("Work Output")
                {
                    Caption = 'Work Output';
                    field("Work Output Rating"; Rec."Work Output Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the work output rating.';
                    }
                    field("Work Output Remarks"; Rec."Work Output Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding work output.';
                    }
                }
                group("Work Quality")
                {
                    Caption = 'Work Quality';
                    field("Work Quality Rating"; Rec."Work Quality Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the work quality rating.';
                    }
                    field("Work Quality Remarks"; Rec."Work Quality Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding work quality.';
                    }
                }
                group("Attitude to Work")
                {
                    Caption = 'Attitude to Work';
                    field("Attitude to Work Rating"; Rec."Attitude to Work Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the attitude to work rating.';
                    }
                    field("Attitude to Work Remarks"; Rec."Attitude to Work Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding attitude to work.';
                    }
                }
                group("Initiative")
                {
                    Caption = 'Initiative';
                    field("Initiative Rating"; Rec."Initiative Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the initiative rating.';
                    }
                    field("Initiative Remarks"; Rec."Initiative Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding initiative.';
                    }
                }
                group("Planning & Organising")
                {
                    Caption = 'Planning & Organising';
                    field("Planning & Organising Rating"; Rec."Planning & Organising Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the planning & organising rating.';
                    }
                    field("Planning & Organising Remarks"; Rec."Planning & Organising Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding planning & organising.';
                    }
                }
                group("Co-operation")
                {
                    Caption = 'Co-operation';
                    field("Co-operation Rating"; Rec."Co-operation Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the co-operation rating.';
                    }
                    field("Co-operation Remarks"; Rec."Co-operation Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding co-operation.';
                    }
                }
                group("Attendance & Timing")
                {
                    Caption = 'Attendance & Timing';
                    field("Attendance & Timing Rating"; Rec."Attendance & Timing Rating")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the attendance & timing rating.';
                    }
                    field("Attendance & Timing Remarks"; Rec."Attendance & Timing Remarks")
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        ToolTip = 'Specifies remarks regarding attendance & timing.';
                    }
                }
            }
            group("Recommendations & Signoff")
            {
                Caption = 'Recommendations & Signoff';
                Editable = PageEditable;

                field("Supervisor Recommendations"; Rec."Supervisor Recommendations")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies supervisor recommendations.';
                }
                field("HR Manager Comments"; Rec."HR Manager Comments")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies HR Manager comments.';
                }
                field("Employee Signed"; Rec."Employee Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee has signed off on the assessment.';
                }
                field("Employee Signed Date"; Rec."Employee Signed Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee signed off.';
                }
            }
            // group("Audit Details")
            // {
            //     Caption = 'Audit Details';
            //     Editable = false;

            //     field("Created By"; Rec."Created By")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the user who generated this record.';
            //     }
            //     field("Created On"; Rec."Created On")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the date and time the record was created.';
            //     }
            //     field("No. Series"; Rec."No. Series")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the number series code used for this record.';
            //     }
            // }
        }
        area(factboxes)
        {
            systempart(Control66; Outlook)
            {
            }
            systempart(Control67; Notes)
            {
            }
            systempart(Control68; MyNotes)
            {
            }
            systempart(Control69; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Complete Assessment")
            {
                ApplicationArea = Basic;
                Caption = 'Complete Assessment';
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Marks the probationary assessment process as completed.';

                trigger OnAction()
                var
                    ConfirmTxt: Label 'Are you sure you want to mark this Probationary Assessment as completed?';
                begin
                    Rec.TestField(Status, Rec.Status::Open);

                    if Confirm(ConfirmTxt) then begin
                        Rec.Status := Rec.Status::Completed;
                        Rec.Modify(true);
                        Message('Probationary Assessment %1 has been completed.', Rec."Assessment No.");
                    end;
                end;
            }
            group("Request Approval")
            {
                // Caption = 'Request Approval';

                // action(SendApprovalRequest)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Send A&pproval Request';
                //     Image = SendApprovalRequest;
                //     Promoted = true;
                //     PromotedCategory = Category9;
                //     ToolTip = 'Sends the document for approval.';

                //     trigger OnAction()
                //     var
                //         CustomApprovals: Codeunit "Custom Approvals Codeunit";
                //         VarVariant: Variant;
                //     begin
                //         VarVariant := Rec;
                //         if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                //             CustomApprovals.OnSendDocForApproval(VarVariant);
                //     end;
                // }
                // action(CancelApprovalRequest)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Cancel Approval Re&quest';
                //     Image = Cancel;
                //     Promoted = true;
                //     PromotedCategory = Category9;
                //     ToolTip = 'Cancels the pending approval request.';

                //     trigger OnAction()
                //     var
                //         CustomApprovals: Codeunit "Custom Approvals Codeunit";
                //         VarVariant: Variant;
                //     begin
                //         VarVariant := Rec;
                //         CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                //     end;
                // }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetPageEditability();
    end;

    trigger OnOpenPage()
    begin
        SetPageEditability();
    end;

    var
        PageEditable: Boolean;

    local procedure SetPageEditability()
    begin
        PageEditable := (Rec.Status = Rec.Status::Open);
    end;
}

#pragma implicitwith restore