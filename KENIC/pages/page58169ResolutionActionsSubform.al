#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58169 "Resolution Actions Subform"
{
    Caption = 'Resolution Actions';
    PageType = ListPart;
    SourceTable = "Resolution Actions";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = All;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = All;
                }
                field("Chaired By"; Rec."Chaired By")
                {
                    ApplicationArea = All;
                }
                field("Notes"; Rec."Notes")
                {
                    ApplicationArea = All;
                }
                field("Action Date"; Rec."Action Date")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}