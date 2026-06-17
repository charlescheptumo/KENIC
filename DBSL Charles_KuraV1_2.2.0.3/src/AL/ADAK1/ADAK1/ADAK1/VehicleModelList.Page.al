#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59004 "Vehicle Model List"
{
    CardPageID = "Vehicle Model Card";
    DeleteAllowed = true;
    PageType = List;
    SourceTable = "Vehicle Model";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mode';
                    ToolTip = 'Specifies the value of the Mode field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

