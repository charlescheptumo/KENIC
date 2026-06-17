page 50168 "Recruitment Req Requirement"
{
    ApplicationArea = All;
    Caption = 'Recruitment Req Requirement';
    PageType = List;
    SourceTable = "Recruitment Req Requirement";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ToolTip = 'Specifies the value of the Requirement ID field.', Comment = '%';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ToolTip = 'Specifies the value of the Qualification Category field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ToolTip = 'Specifies the value of the Requirement Type field.', Comment = '%';
                }
                field("Substitute Qualification Exist"; Rec."Substitute Qualification Exist")
                {
                    ToolTip = 'Specifies the value of the Substitute Qualification Exist field.', Comment = '%';
                }
            }
        }
    }
}
