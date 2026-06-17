#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65004 "Research Center Programs Card"
{
    PageType = Card;
    SourceTable = "Research Center Programs";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Center Code field.';
                }
                field("Program Code"; Rec."Program Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Program Code field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

