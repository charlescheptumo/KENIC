namespace KICD.KICD;
using System.Security.User;

page 50327 "Archived Imprest Surrenders"
{
    ApplicationArea = Basic;
    Caption = 'Archived Imprest Surrenders';
    PageType = List;
    SourceTable = Payments;
    UsageCategory = Lists;
    CardPageID = "Archived Imprest Surrender";
    DeleteAllowed = false;
    Editable = false;
    SourceTableView = where("Payment Type" = const(Surrender),
                            "Document Type" = const(Surrender),"Archive Document"=const(true));
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57002, true, true);
                end;
            }
            action(Archive)
            {
            ApplicationArea = Suite;
            Caption = 'UnArchive';
            Image = Archive;
            Promoted = true;
            PromotedCategory = Category4;
            PromotedIsBig = true;
            PromotedOnly = true;
            ToolTip = 'UnArchive selected imprests.';

            trigger OnAction()
            var
            SelectedImprests: Record payments;
            CountArchived: Integer;
            begin
            CurrPage.SetSelectionFilter(SelectedImprests);

            if SelectedImprests.FindSet() then begin
                repeat
                    SelectedImprests."Archive Document" := false;
                    SelectedImprests.Modify();
                    CountArchived += 1;
                until SelectedImprests.Next() = 0;

                Message('%1 imprest(s) have been Unarchived.', CountArchived);
            end else
                Message('No imprest selected.');
            end;
            }

        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //Fred RC
        // if UserSetup.Get(UserId) then begin
        //     Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");//Remove filter
            // SETRANGE("Created By",USERID);
        //end;

        // if UserSetup.Get(UserId) then begin
        //     if UserSetup."post surrender" = true then begin
        //         Rec.Reset;
        //         Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        //     end;
        // end;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        if UserSetup.Get(UserId) then begin
            //   SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            Rec.SetRange("Payment Type", Rec."payment type"::Surrender);
            Rec.SetRange("Document Type", Rec."document type"::Surrender);
            //SETRANGE(Status, Status::"Pending Approval")
            // SETRANGE("Created By",USERID);
        end;
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."post surrender" = TRUE THEN BEGIN
            RESET;
            SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            END;
          END;*/

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Payment Type" := Rec."payment type"::Surrender;
        Rec."Document Type" := Rec."document type"::Surrender;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."post surrender" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;


        //Fred RC
        if UserSetup.Get(UserId) then begin
            //   SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            Rec.SetRange("Payment Type", Rec."payment type"::Surrender);
            Rec.SetRange("Document Type", Rec."document type"::Surrender);
            //SETRANGE(Status, Status::"Pending Approval")
            //SETRANGE("Created By",USERID);
        end;
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."post surrender" = TRUE THEN BEGIN
            RESET;
            SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            END;
          END;
          */

    end;

    var
        UserSetup: Record "User Setup";
}
