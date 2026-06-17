#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72185 "BoQ Template Line"
{
    PageType = ListPart;
    SourceTable = "Requisition Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("BOQ Type"; Rec."BOQ Type")
                {
                    ApplicationArea = Basic;
                    Visible = TRUE;
                    ToolTip = 'Specifies the value of the BOQ Type field.';
                }
                field("BoQ No"; Rec."BoQ No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Technology Type"; Rec."Technology Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technology Type field.';
                }
                field("Labour %"; Rec."Labour %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Labour % field.';
                }
                field("Unit Amount Excl. VAT"; Rec."Unit Amount Excl. VAT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Rate';
                    ToolTip = 'Specifies the value of the Planned Rate field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Reversion Type"; Rec."Reversion Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversion Type field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Category Code field.';
                    trigger onvalidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Default Contingency %"; Rec."Default Contingency %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Contingency % field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("Default Job Task No."; Rec."Default Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Job Task No. field.';
                }
                field("Begin-Total Job Task No."; Rec."Begin-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Begin-Total Job Task No. field.';
                }
                field("End-Total Job Task No."; Rec."End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End-Total Job Task No. field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("F&unctions")
                {
                    Caption = 'F&unctions';
                    Image = "Action";
                    action("Regional Rates")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Planned Regional Rate Template";
                        RunPageLink = "Requisition Template ID" = field("Requisition Template ID"),
                                      "Line No" = field("Line No.");
                        ToolTip = 'Executes the Regional Rates action.';
                    }
                }
            }
        }
    }

}

#pragma implicitwith restore

