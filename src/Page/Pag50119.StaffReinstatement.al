page 50119 "Staff Reinstatement"
{
    ApplicationArea = All;
    Caption = 'Staff Reinstatement';
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."No.");
                        if Employee.FindFirst then begin
                            Rec."First Name" := Employee."First Name";
                            Rec."Middle Name" := Employee."Middle Name";
                            Rec."Last Name" := Employee."Last Name";
                            Rec."Job Title" := Employee."Job Title";
                            Rec.Address := Employee.Address;
                            Rec."Address 2" := Employee."Address 2";
                            Rec."Phone No." := Employee."Phone No.";
                            Rec."E-Mail" := Employee."E-Mail";
                            Rec."Department Name" := Employee."Department Name";
                            Rec."Region Name" := Employee."Region Name";
                            Rec."Shortcut Dimension 3" := Employee."Shortcut Dimension 3";
                            Rec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                            Rec.Workstation := Employee.Workstation;
                            Rec.Gender := Employee.Gender;
                            Rec."Date Of Leaving" := Employee."Date Of Leaving";
                            Rec."Date Of Birth" := Employee."Date Of Birth";
                            Rec.Age := Employee.Age;
                            Rec."Employment Date" := Employee."Employment Date";
                            Rec."Retirement Date" := Employee."Retirement Date";
                            Rec."Employee Category" := Employee."Employee Category";
                            Rec."Exit Interview Date" := Employee."Exit Interview Date";
                            Rec."Exit Interview Conducted" := Employee."Exit Interview Conducted";
                            Rec."ID Number" := Employee."ID Number";
                            Rec."Social Security No." := Employee."Social Security No.";
                            Rec."N.H.I.F No" := Employee."N.H.I.F No";
                            Rec."Leave Balance" := Employee."Leave Balance";
                            Rec.Balance := Employee.Balance;
                            Rec."Salary Scale" := Employee."Salary Scale";
                            Rec."P.I.N" := Employee."P.I.N";
                            Rec."Approval Status" := Rec."Approval Status"::Open;
                        end;
                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s first name.';
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s middle name.';
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s last name.';
                    Editable = false;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s initials.';
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s job title.';
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s address.';
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the address.';
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the postal code.';
                    Editable = false;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the county of the employee.';
                    Editable = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                    Editable = false;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s private telephone number.';
                    Editable = false;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s private email address.';
                    Editable = false;
                }
                field("Date of Reinstatement"; Rec."Date of Reinstatement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s Date of Reinstatement.';
                }
                field("Reinstatement Reason"; Rec."Reinstatement Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s Reinstatement Reason.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the document''s Approval Status.';
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(5200), "No." = FIELD("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Reinstate Employee")
            {
                ApplicationArea = All;
                Caption = 'Reinstate Employee', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Employee;
                ToolTip = 'Executes the Reinstate Employee action.';

                trigger OnAction()
                begin
                    HREmpCodeunit.ReinstateEmployee(Rec."No.");
                end;
            }
            action("Send For Approval")
            {
                ApplicationArea = All;
                Caption = 'Send For Approval', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send For Approval action.';

                trigger OnAction()
                begin
                    if Rec."Approval Status" <> Rec."Approval Status"::Open then
                        Error('You cannot send the document for approval');
                    VarVariant := Rec;
                    if CustomApp.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApp.OnSendDocForApproval(VarVariant);
                end;
            }
            action("Cancel Approval")
            {
                ApplicationArea = All;
                Caption = 'Cancel Approval', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval action.';

                trigger OnAction()
                begin
                    if Rec."Approval Status" <> Rec."Approval Status"::"Pending Approval" then
                        Error('You cannot send the document for approval');
                    VarVariant := Rec;
                    if CustomApp.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApp.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            group(Approvals)
            {
                action(Approve)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Approve;
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Approve action.';

                    trigger OnAction()
                    begin
                        ApprMgt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Reject;
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Reject action.';

                    trigger OnAction()
                    begin
                        ApprMgt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Delegate;
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Delegate action.';

                    trigger OnAction()
                    begin
                        ApprMgt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Comment;
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Comment action.';

                    trigger OnAction()
                    begin
                        ApprMgt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Approval Status" := Rec."Approval Status"::Open;
        Rec."Document Type" := Rec."Document Type"::"Staff Reinstatement";
    end;

    var
        HREmpCodeunit: Codeunit "HR Make Leave Ledg. Entry";
        Emp: Record Employee;
        CustomApp: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        ApprMgt: Codeunit "Approvals Mgmt.";
}
