#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50193 "Incoming Corrs Sources"
{
    CardPageID = "Incoming Correspondence Source";
    PageType = List;
    SourceTable = "Incoming Correspondence Source";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("No of Correspondences"; Rec."No of Correspondences")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Correspondences field.';
                }
            }
        }
    }

    actions
    {
    }
}

