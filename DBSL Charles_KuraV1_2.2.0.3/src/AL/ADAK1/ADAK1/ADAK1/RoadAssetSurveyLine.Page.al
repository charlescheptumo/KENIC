#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72070 "Road Asset Survey Line"
{
    PageType = ListPart;
    SourceTable = "Road Asset Survey Sheet Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Item; Rec.Item)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item field.';
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field("Simple Quantity"; Rec."Simple Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Simple Quantity field.';
                }
                field("Actual Quantity"; Rec."Actual Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Quantity field.';
                }
                field("Dimension & Condition"; Rec."Dimension & Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension & Condition field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
            }
        }
    }

    actions
    {
    }
}

