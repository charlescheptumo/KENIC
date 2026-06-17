namespace KICD.KICD;

using Microsoft.Purchases.Vendor;

page 50350 "VLE Tax Code Cleaner"
{
    PageType = Card;
    Caption = 'VLE Tax Code Cleaner';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Filters)
            {
                Caption = 'Filters';

                field(FromDate; FromDate)
                {
                    ApplicationArea = All;
                    Caption = 'From Date';
                    ToolTip = 'Filter entries from this posting date.';
                }
                field(ToDate; ToDate)
                {
                    ApplicationArea = All;
                    Caption = 'To Date';
                    ToolTip = 'Filter entries up to this posting date.';
                }
                field(VendorNo; VendorNo)
                {
                    ApplicationArea = All;
                    Caption = 'Vendor No.';
                    TableRelation = Vendor;
                    ToolTip = 'Filter by a specific vendor. Leave blank for all vendors.';
                }
                field(DocumentNo; DocumentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    ToolTip = 'Filter by a specific PV document number. Leave blank for all.';
                }
            }

            group(Options)
            {
                Caption = 'Options';

                field(PreviewMode; PreviewMode)
                {
                    ApplicationArea = All;
                    Caption = 'Preview Only (Do Not Save)';
                    ToolTip = 'When enabled, shows what will change without saving anything to the database. Always run preview first.';
                }
            }

            group(Results)
            {
                Caption = 'Results';

                field(ResultLog; ResultLog)
                {
                    ApplicationArea = All;
                    Caption = 'Result Log';
                    MultiLine = true;
                    Editable = false;
                    Style = StrongAccent;
                    ToolTip = 'Shows the result of the last run.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RunPreview)
            {
                ApplicationArea = All;
                Caption = 'Run Preview';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PreviewMode := true;
                    ResultLog := '';
                    Cleaner.ProcessEntries(FromDate, ToDate, VendorNo, DocumentNo, true, ResultLog);
                    CurrPage.Update(false);
                end;
            }

            action(ApplyChanges)
            {
                ApplicationArea = All;
                Caption = 'Apply Changes';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('You are about to SAVE changes to Vendor Ledger Entries. Have you reviewed the preview first and are you sure you want to proceed?') then
                        exit;
                    PreviewMode := false;
                    ResultLog := '';
                    Cleaner.ProcessEntries(FromDate, ToDate, VendorNo, DocumentNo, false, ResultLog);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    var
        Cleaner: Codeunit "VLE Tax Code Cleaner";
        FromDate: Date;
        ToDate: Date;
        VendorNo: Code[20];
        DocumentNo: Code[20];
        PreviewMode: Boolean;
        ResultLog: Text;
}
