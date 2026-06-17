#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72646 "Workplan Materials on Site"
{
    PageType = List;
    SourceTable = "Workplan Material on Site";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Material Code"; Rec."Material Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Code field.';
                }
                field("Material Description"; Rec."Material Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Description field.';
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
                field("Activity No"; Rec."Activity No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Material Line No"; Rec."Material Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Line No field.';
                }
                field("Approved?"; Rec."Approved?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved? field.';
                }
            }
        }
    }

    actions
    {
    }
}

