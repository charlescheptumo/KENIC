#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72281 "Measurement Sheet Bill Codes"
{
    PageType = List;
    SourceTable = "Measurement Sheet Bill Code";
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
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Planning Line No"; Rec."Planning Line No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill Item Category Line No';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bill Item Category Line No field.';
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

