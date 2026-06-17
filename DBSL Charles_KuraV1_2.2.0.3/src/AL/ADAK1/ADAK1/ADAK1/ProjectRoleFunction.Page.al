#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72211 "Project Role Function"
{
    PageType = List;
    SourceTable = "Project Mobilization Header";
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
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Commencement Order ID"; Rec."Commencement Order ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

