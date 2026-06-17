#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80375 "Workplan Revision Lines"
{
    PageType = ListPart;
    SourceTable = "Workplan Lines Revision";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Revision Workplan"; Rec."Revision Workplan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Workplan field.';
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Perfomance Indicator field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = "Unit of Measure";
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imported Annual Target Qty field.';
                }
                field("Imported Annual Budget Est."; Rec."Imported Annual Budget Est.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imported Annual Budget Est. field.';
                }
                field("Source Of Fund"; Rec."Source Of Fund")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Source Of Fund field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("New Description"; Rec."New Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Description field.';
                }
                field("New Target Qty"; Rec."New Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Target Qty field.';
                }
                field("New Budget Est."; Rec."New Budget Est.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Budget Est. field.';
                }
                field("New Primary Directorate"; Rec."New Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Primary Directorate field.';
                }
                field("New Primary Department"; Rec."New Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Primary Department field.';
                }
                field("New Perfomance Indicator"; Rec."New Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Perfomance Indicator field.';
                }
                field("New Source Of Fund"; Rec."New Source Of Fund")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Of Fund field.';
                }
                field("New Unit of Measure"; Rec."New Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Unit of Measure field.';
                }
                field("New Perfomance Direction"; Rec."New Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Perfomance Direction field.';
                }
                field("New Framework Perspective"; Rec."New Framework Perspective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Framework Perspective field.';
                }
                field("New Strategy Framework"; Rec."New Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Strategy Framework field.';
                }
            }
        }
    }

    actions
    {
    }
}

