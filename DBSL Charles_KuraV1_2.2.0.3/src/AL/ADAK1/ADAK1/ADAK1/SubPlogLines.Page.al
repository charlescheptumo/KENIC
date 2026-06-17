#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80360 "Sub Plog Lines"
{
    PageType = List;
    SourceTable = "Sub Plog Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Activity No."; Rec."Sub Activity No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Activity No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Date field.';
                }
                field("Achieved Date"; Rec."Achieved Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Achieved Target"; Rec."Achieved Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Target field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Type field.';
                }
                field("Remaining Targets"; Rec."Remaining Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Targets field.';
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Weight % field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        PlogLines: Record "Plog Lines";
}

