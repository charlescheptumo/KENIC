#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50046 "pageextension50046" extends "Bank Acc. Reconciliation"
{

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Bank Acc. Reconciliation"(Page 379)".

    layout
    {

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter(StatementEndingBalance)
        {
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Approval Status field.';
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "ImportBankStatement(Action 3)".


        //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 17)".


        //Unsupported feature: Property Modification (PromotedCategory) on "PostAndPrint(Action 9)".



        //Unsupported feature: Code Insertion on "Post(Action 17)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
        /*
        TESTFIELD("Approval Status","Approval Status"::Released);
        */
        //end;


        //Unsupported feature: Code Insertion on "PostAndPrint(Action 9)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
        /*
        TESTFIELD("Approval Status","Approval Status"::Released)
        */
        //end;
        addfirst("F&unctions")
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                begin
                    //   if ApprovalsMgmt.CheckBankRecReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendBankRecReqForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelBankRecReqApprovalRequest(Rec);
                end;
            }
        }
        addafter(SuggestLines)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
        addfirst("Ba&nk")
        {
            action("Import Bank Statement")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Config. Packages";
                RunPageLink = Code = const('001');
                ToolTip = 'Executes the Import Bank Statement action.';
            }
        }
    }

    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

