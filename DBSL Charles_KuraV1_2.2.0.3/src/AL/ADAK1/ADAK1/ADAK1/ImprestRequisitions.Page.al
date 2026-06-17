#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57011 "Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Requisition";
    PageType = List;
    DeleteAllowed = false;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Open | "Pending Approval"),
                            "Archive Document" = filter(false));
    UsageCategory = Lists;

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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo No field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrendered field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
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
                Visible = false;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57002, true, true);
                    Rec.Reset;
                end;
            }

            action(Archive)
            {
                ApplicationArea = Suite;
                Caption = 'Archive';
                Image = Archive;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Archive selected imprests.';

                trigger OnAction()
                var
                    SelectedImprests: Record payments;
                    CountArchived: Integer;
                begin
                    CurrPage.SetSelectionFilter(SelectedImprests);

                    if SelectedImprests.FindSet() then begin
                        repeat
                            SelectedImprests."Archive Document" := true;
                            SelectedImprests.Modify();
                            CountArchived += 1;
                        until SelectedImprests.Next() = 0;

                        Message('%1 imprest(s) have been archived.', CountArchived);
                    end else
                        Message('No imprest selected.');
                end;
            }

        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;*/
        //Fred RC
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

    end;

    trigger OnAfterGetRecord()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;
        */
        //Fred RC
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Document Type" := Rec."document type"::Imprest;
    end;

    trigger OnOpenPage()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        //SETRANGE("Created By",USERID);
        END;
        */
        //Fred RC
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        // end;
        UserSetup.Get(UserId);
        if UserSetup."Accounts User" = false then
            ERROR('You do not have sufficient rights to view Imprest Requisitions!Please contact system administrator.');

    end;

    var
        UserSetup: Record "User Setup";
}

