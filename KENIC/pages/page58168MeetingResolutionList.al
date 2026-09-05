#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58168 "Meeting Resolution List"
{
    Caption = 'Meeting Resolutions';
    PageType = List;
    SourceTable = "Meeting Resolutions";
    CardPageId = "Meeting Resolution Card";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                }
                field("Resolution Type"; Rec."Resolution Type")
                {
                    ApplicationArea = All;
                }
                field("Committee Id"; Rec."Committee Id")
                {
                    ApplicationArea = All;
                }
                field("Majority Type"; Rec."Majority Type")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Outcome"; Rec."Outcome")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
