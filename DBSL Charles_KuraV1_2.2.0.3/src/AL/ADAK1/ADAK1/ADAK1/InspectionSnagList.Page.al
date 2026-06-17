#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72652 "Inspection Snag List"
{
    PageType = List;
    SourceTable = "Inspection Snag List";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("Bill Item Code"; Rec."Bill Item Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Code field.';
                }
                field("Plan Line No"; Rec."Plan Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Line No field.';
                }
                field("Bill No"; Rec."Bill No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill No field.';
                }
                field("Bill Description"; Rec."Bill Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Description field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

