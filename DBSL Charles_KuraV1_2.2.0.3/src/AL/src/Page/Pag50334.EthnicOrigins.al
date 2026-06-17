namespace KICD.KICD;
page 50334 "Ethnic Backgrounds"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Ethnic Background";
    Caption = 'Ethnic Backgrounds';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field("Ethnic group"; Rec."Ethnic group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}