page 50167 "Candidate Shortlist Criteria"
{
    ApplicationArea = All;
    Caption = 'Candidate Shortlist Criteria';
    PageType = List;
    SourceTable = "Candidate Shortlist Criteria";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Requiement ID."; Rec."Requiement ID.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requiement ID. field.', Comment = '%';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.', Comment = '%';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.', Comment = '%';
                }
                field("Assigned Weight"; Rec."Assigned Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight field.', Comment = '%';
                }
            }
        }
    }
}
