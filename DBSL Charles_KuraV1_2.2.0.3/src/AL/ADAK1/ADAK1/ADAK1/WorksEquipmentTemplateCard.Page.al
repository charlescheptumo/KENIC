#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75231 "Works Equipment Template Card"
{
    PageType = Card;
    SourceTable = "Works Equipment Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Main Works Category"; Rec."Main Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Works Category field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("No. of Purchase Requisitions"; Rec."No. of Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Purchase Requisitions field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control17; "Works Equipment Template Line")
            {
                Caption = 'Equipment Types';
                SubPageLink = "Equipment Template ID" = field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
            }
            systempart(Control14; Notes)
            {
            }
            systempart(Control15; MyNotes)
            {
            }
            systempart(Control16; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup19)
            {
                action("Purchase requisitions")
                {
                    ApplicationArea = Basic;
                    Image = ReviewWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Purchase Requisitions";
                    RunPageLink = "Document Type" = const("Purchase Requisition"),
                                  "Works Equipment Template ID" = field(Code);
                    ToolTip = 'Executes the Purchase requisitions action.';
                }
            }
        }
    }
}

