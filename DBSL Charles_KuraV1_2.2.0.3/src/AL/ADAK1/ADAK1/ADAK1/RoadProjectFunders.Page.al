#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52041 "Road Project Funders"
{
    PageType = List;
    SourceTable = "Road Project Funders";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Project"; Rec."Road Project")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Project field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Funding Source Name"; Rec."Funding Source Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Name field.';
                }
                field("Funded Amount(LCY)"; Rec."Funded Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funded Amount(LCY) field.';
                }
                field("Funded Percentage"; Rec."Funded Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funded Percentage field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
            }
        }
    }

    actions
    {
    }
}

