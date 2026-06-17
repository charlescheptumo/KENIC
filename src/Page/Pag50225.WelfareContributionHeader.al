namespace KICD.KICD;

page 50225 "Welfare Contribution Header"
{
    Caption = 'Welfare Contribution Header';
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contribution No"; Rec."Welfare No.")
                {
                    ToolTip = 'Specifies the value of the Welfare No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ToolTip = 'Specifies the value of the Raisee Name field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Welfare Lines"; "Welfare Lines")
            {
                SubPageLink = "Welfare Header No." = FIELD("Welfare No.");
            }
        }
        area(factboxes)
        {
            systempart(Outlook; Outlook)
            {
            }
            systempart(Notes; Notes)
            {
            }
            systempart(MyNotes; MyNotes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Contributions")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Import Contributions action.';

                trigger OnAction()
                begin
                    // SETRANGE("Welfare No.","Welfare No.");
                    // WelfareImport.GetVariables(Rec);
                    // WelfareImport.RUN();
                end;
            }
            action(Dimensions)
            {
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page 658;
                begin
                    // ApprovalEntries.SetRecordFilters(DATABASE::"Purchase Header",14,Rec."Welfare No.");
                    // ApprovalEntries.RUN;
                end;
            }
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit 1535;
                begin
                    /*IF ApprovalsMgmt.CheckWelfareBenefitApprovalPossible(Rec) THEN
                      ApprovalsMgmt.OnCancelDebitNoteApprovalRequest(Rec);*/

                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit 1535;
                begin
                    //ApprovalsMgmt.OnCancelBenefitForApproval(Rec);
                end;
            }
            action("Co&mments")
            {
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page 66;
                ToolTip = 'Executes the Co&mments action.';
            }
        }
        area(Processing)
        {
            group("&Release")
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                // separator()
                // {
                // }
                action(Release)
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                // separator()
                // {
                // }
            }
        }
        area(reporting)
        {
            action("Welfare Report")
            {
                Caption = 'Welfare Report';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Welfare Report action.';

                trigger OnAction()
                begin
                    // SETRANGE("Welfare No.","Welfare No.");
                    REPORT.RUN(69026, TRUE, TRUE, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Welfare Type" := Rec."Welfare Type"::Contribution;
    end;

    var
    // WelfareImport: XMLport "69001";
}

