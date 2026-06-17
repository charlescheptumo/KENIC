#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 70146 "Disposal Plan Lines-f"
{
    PageType = ListPart;
    SourceTable = "Disposal Plan Lines";
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Description of Item"; Rec."Description of Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of Item field.';
                }
                field("Unit of Issue"; Rec."Unit of Issue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit of measure';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Unit of measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Date Of Purchase"; Rec."Date Of Purchase")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date Of Purchase field.';
                }
                field("Purchase Unit Price"; Rec."Purchase Unit Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Purchase Unit Price field.';
                }
                field("Total Purchase Price"; Rec."Total Purchase Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Purchase Price field.';
                }
                field("Estimated current value"; Rec."Estimated current value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated current value field.';
                }
                // field("Total Estimated current value";"Total Estimated current value")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                field("General Condition"; Rec."General Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Condition field.';
                }
                field("Disposal committee Recommend"; Rec."Disposal committee Recommend")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Disposal committee Recommend field.';
                }
                field("Disposal Type"; Rec."Disposal Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Disposal Type field.';
                }
                field("Disposal Methods"; Rec."Disposal Methods")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Disposal Methods field.';
                }
            }
        }
    }

    actions
    {
    }
}
