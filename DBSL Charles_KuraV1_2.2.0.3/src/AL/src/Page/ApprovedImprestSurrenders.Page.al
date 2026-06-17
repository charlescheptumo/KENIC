#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57028 "Approved Imprest Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Imprest Surrender";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Released),
                            Posted = const(false),
                            Surrendered = const(false),
                            "Archive Document" = const(false));
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
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
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
                    Rec.Reset;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin


        //Fred Rc
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        //SETRANGE("Created By",USERID);
        // end;

        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF UserSetup."post surrender" = TRUE THEN BEGIN
        //    RESET;
        //    SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    //SETRANGE("Document Type","Document Type"::Surrender);
        //    SETRANGE("Payment Type","Payment Type"::Surrender);
        //    SETRANGE(Status,Status::Released);
        //    END;
        //  END;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        // if UserSetup.Get(UserId) then begin
        //     SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        //SETRANGE("Created By",USERID);
        // end;

        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF UserSetup."post surrender" = TRUE THEN BEGIN
        //    RESET;
        //    SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    //SETRANGE("Document Type","Document Type"::Surrender);
        //    SETRANGE("Payment Type","Payment Type"::Surrender);
        //    SETRANGE(Status,Status::Released);
        //    END;
        //  END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        //Fred RC
        // if UserSetup.Get(UserId) then begin
        //     if not UserSetup."Accounts Administrator" then
        //         Rec.SetRange("Responsibility Center", UserSetup."Purchase Resp. Ctr. Filter");
        //     //SETRANGE("Created By",USERID);
        // end;

        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF UserSetup."post surrender" = TRUE THEN BEGIN
        //    RESET;
        //    SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    //SETRANGE("Document Type","Document Type"::Surrender);
        //    SETRANGE("Payment Type","Payment Type"::Surrender);
        //    SETRANGE(Status,Status::Released);
        //    END;
        //  END;
        UserSetup.Get(UserId);
        if not UserSetup."Accounts User" then
            Error('You do not have the required access rights to use this page. Please contact your system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}

