#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75465 "Fin Evaluation Lines"
{
    Caption = 'Finance Evaluation';
    PageType = List;
    SourceTable = "Fin Evaluation Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bid No"; Rec."Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field("Evaluated Tender Sum"; Rec."Evaluated Tender Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluated Tender Sum field.';
                }
                field("Escalated Tender Sum"; Rec."Escalated Tender Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated Tender Sum field.';
                }
                field("Escalation %"; Rec."Escalation %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Escalation % field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calculate Escalated Amount")
            {
                ApplicationArea = Basic;
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Escalation Percentage";
                Visible = false;
                ToolTip = 'Executes the Calculate Escalated Amount action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // PurchaseLine.RESET;
        // PurchaseLine.SETRANGE("Document No.","Bid No");
        // PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type"::Quote);
        // PurchaseLine.SETRANGE(Escalated,TRUE);
        // IF PurchaseLine.FINDSET THEN BEGIN
        //  PurchaseLine.CALCSUMS(Amount);
        //  PurchaseLine.CALCSUMS("Escalaleted Amount");
        //  "Escalated Tender Sum":=(("Evaluated Tender Sum"-PurchaseLine.Amount)+PurchaseLine."Escalaleted Amount");
        //  MODIFY(TRUE);
        //  //  VALIDATE("Escalated Tender Sum");
        //   // END;
        // END;
        Rec.Validate("Bid No");
        Rec.Validate("Bidder No");
        Rec.Modify(true);
    end;

    trigger OnOpenPage()
    begin
        //IF "Bid No"<>'' THEN BEGIN
        // PurchaseLine.RESET;
        // PurchaseLine.SETRANGE("Document No.","Bid No");
        // PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type"::Quote);
        // PurchaseLine.SETRANGE(Escalated,TRUE);
        // IF PurchaseLine.FINDSET THEN BEGIN
        //  PurchaseLine.CALCSUMS(Amount);
        //  PurchaseLine.CALCSUMS("Escalaleted Amount");
        //  "Escalated Tender Sum":=(("Evaluated Tender Sum"-PurchaseLine.Amount)+PurchaseLine."Escalaleted Amount");
        //  MODIFY(TRUE);
        //  //  VALIDATE("Escalated Tender Sum");
        //   // END;
        // END;
        //END;
        Rec.Validate("Bid No");
        Rec.Validate("Bidder No");
        Rec.Modify(true);
    end;

    var
        PurchaseLine: Record "Purchase Line";
}

