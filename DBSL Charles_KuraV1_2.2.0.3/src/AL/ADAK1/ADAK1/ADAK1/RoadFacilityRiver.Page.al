#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72596 "Road Facility River"
{
    PageType = Card;
    SourceTable = "Road Facility River";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("No of Structures"; Rec."No of Structures")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Structures field.';
                }
            }
        }
    }

    actions
    {
    }
}

