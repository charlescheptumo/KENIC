#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72425 "Mobilized Project Objectives"
{
    CardPageID = "Mobilized Project Objective";
    PageType = List;
    SourceTable = "Mobilized Project Objective";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Objective Verifiable Indicator"; Rec."Objective Verifiable Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective Verifiable Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Source of Evidence"; Rec."Source of Evidence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source of Evidence field.';
                }
                field("No. of Project Assumptions"; Rec."No. of Project Assumptions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Project Assumptions field.';
                }
                field("No. of Project Constraints"; Rec."No. of Project Constraints")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Project Constraints field.';
                }
                field("No. of Critical Success Factor"; Rec."No. of Critical Success Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Critical Success Factor field.';
                }
            }
        }
    }

    actions
    {
    }
}

