#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72728 "Materials On site"
{
    PageType = List;
    SourceTable = "Material On site";
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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
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
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
            }
        }
    }

    actions
    {
    }
}

