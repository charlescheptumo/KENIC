#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50153 "Employee Exit Voucher"
{
    PageType = Card;
    SourceTable = "Employee Exit header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Exit Method"; Rec."Exit Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Method field.';
                }
                field("Position Id"; Rec."Position Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position Id field.';
                }
                field("Reasons Code"; Rec."Reasons Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons Code field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Use Leave Days"; Rec."Use Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Use Leave Days field.', Comment = '%';
                }
                field("No of Leave Days to Use"; Rec."No of Leave Days to Use")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Leave Days to Use field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            group("Important Dates")
            {
                field("Date of Join"; Rec."Date of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Join field.';
                }
                field("Last working Date"; Rec."Last working Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last working Date field.';
                }
                field("Notice Date"; Rec."Notice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Date field.';
                }
                field("Employee Exit Date"; Rec."Employee Exit Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Exit Date field.';
                }
            }
            group(Statistics)
            {
                field("No of Hand Over Notes"; Rec."No of Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Hand Over Notes field.';
                }
                field("No of Open Hand Over Notes"; Rec."No of Open Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Open Hand Over Notes field.';
                }
                field("No of Open Hand Cleared Notes"; Rec."No of Open Hand Cleared Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Open Hand Cleared Notes field.';
                }
            }
            part("Exit Plan Lines"; "Exit Plan Lines")
            {
                SubPageLink = "Exit Header No" = FIELD("Document No."),
                            "Document Type" = FIELD("Document Type");
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents1"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(69743), "No." = FIELD("Document No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
            }
            action("Create Hand Over Vouchers")
            {
                ApplicationArea = Basic;
                Image = BusinessRelation;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Hand Over Vouchers action.';

                trigger OnAction()
                begin
                    Recruitment.FnCreateHandOverVoucher(Rec);
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Approvals action.';
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    Var_Variant: Variant;
                    CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::Open);//status must be open.
                    Var_Variant := Rec;
                    if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Variant) then
                        CustomApprovalMgt.OnSendDocForApproval(Var_Variant);

                end;
            }
            action("&Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Cancel Approval Request action.';

                trigger OnAction()
                var
                    Var_Variant: Variant;
                    CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                    Var_Variant := Rec;
                    CustomApprovalMgt.OnCancelDocApprovalRequest(Var_Variant);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Close - Staff Exit';
                Image = CloseDocument;
                Promoted = true;
                PromotedCategory = New;
                ToolTip = 'Executes the Close - Staff Exit action.';

                trigger OnAction()
                var
                    CloseDocument: Codeunit "HR Make Leave Ledg. Entry";
                begin
                    Rec.Testfield("Approval Status", Rec."Approval Status"::Approved);
                    CloseDocument.CloseStaffExitCust(Rec);
                end;
            }
            action("Send Certificate of Service")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send Certificate of Service';
                Image = Email;
                ToolTip = 'Send staff a certificate of service.';

                trigger OnAction()
                var
                    Employee: Record Employee;
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(50019, true, true, Rec);
                end;
            }
            action("Clearance Certificate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Clearance Certificate';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Clearance Certificate';
                trigger OnAction()
                begin
                    Report.Run(50035, true, true, Rec);
                end;
            }
            action("Handing Over Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Handing Over Report';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Handing Over Report';
                trigger OnAction()
                begin
                    Report.Run(50044, true, true, Rec);
                end;
            }
            action("Suggest Clearance Lines")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Suggest Clearance Lines';
                Image = Suggest;
                ToolTip = 'Suggest Clearance Lines.';
                Visible = Clearance;

                trigger OnAction()
                begin
                    FnSuggestClearanceLines();
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Print action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Document Type" := Rec."document type"::"Exit Voucher";
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Use Leave Days" then
            LeaveDays := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Exit Voucher";
        LeaveDays := false;
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Exit Voucher";
    end;

    var
        Recruitment: Codeunit Recruitment;
        LeaveDays: Boolean;
        ExitInterview: Boolean;
        Clearance: Boolean;

    procedure RequiresInterview(): Boolean
    begin
        exit(Rec."Requires Exit Interview" = true);
    end;

    procedure RequiresClearance(): Boolean
    begin
        exit(Rec."Requires Clearance" = true);
    end;

    procedure RequiresNotice(): Boolean
    begin
        exit(Rec."Requires Notice" = true);
    end;

    procedure HasTerminalBenefits(): Boolean
    begin
        exit(Rec."Has Terminal Benefits" = true);
    end;

    procedure HasTerminationGrounds(): Boolean
    begin
        exit(Rec."Has Termination Grounds" = true);
    end;

    procedure FnSuggestClearanceLines()
    var
        StaffClearanceSetup: Record "Staff Clearance Setup";
        StaffClearance: Record "Staff Clearance";
    begin
        StaffClearanceSetup.Reset();
        StaffClearanceSetup.SetRange("Position ID", Rec."Position ID");
        if StaffClearanceSetup.FindSet() then begin
            repeat
                StaffClearance.Init();
                StaffClearance."Document No." := Rec."Document No.";
                StaffClearance."Employee No" := Rec."Employee No";
                StaffClearance."Staff Clearance Code" := StaffClearanceSetup."Exit Code";
                StaffClearance."Item Code" := StaffClearanceSetup."Item Code";
                StaffClearance."Item Description" := StaffClearanceSetup."Item Description";
            //StaffClearance.Insert();
            until StaffClearanceSetup.Next = 0;
        end;
    end;
}

