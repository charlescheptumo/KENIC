#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72715 "Pavement Lab Test SubPage"
{
    PageType = ListPart;
    SourceTable = "Pavement Test Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Layer Code"; Rec."Layer Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Code field.';
                }
                field("Layer Description"; Rec."Layer Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Description field.';
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
                action("Detailed Pavemet Tests")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Detailed Pavemet Tests";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Line No." = field("Line No."),
                                  "Layer Code" = field("Layer Code");
                    ToolTip = 'Executes the Detailed Pavemet Tests action.';
                }
            }
        }
    }
}

