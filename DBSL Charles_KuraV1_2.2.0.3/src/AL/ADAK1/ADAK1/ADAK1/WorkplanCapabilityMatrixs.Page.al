#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80053 "Workplan Capability Matrixs"
{
    PageType = List;
    SourceTable = "PC Capability Matrix";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Capability Category"; Rec."Capability Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capability Category field.';
                }
                field("Capability Description"; Rec."Capability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capability Description field.';
                }
                field("Inventory Summary"; Rec."Inventory Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory Summary field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }

    actions
    {
    }
}

