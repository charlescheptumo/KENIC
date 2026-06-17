/// <summary>
/// Page Exit Questions Template Card (ID 50169).
/// </summary>
page 50169 "Exit Questions Template Card"
{
    Caption = 'Exit Questions Template Card';
    PageType = Document;
    SourceTable = "Exit Interview Qns Templates";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Template ID"; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Template ID field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
            part("Exit Interview Questions"; "Exit Questions Temp Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Exit Interview Questions';
                SubPageLink = "Document No." = field("Document No.");
            }
        }
    }
}
