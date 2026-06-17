/// <summary>
/// Page Professional Body (ID 50022).
/// </summary>
page 50022 "Professional Body"
{
    Caption = 'Professional Body';
    PageType = Document;
    SourceTable = "Professional Bodies";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. of Members"; Rec."No. of Members")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Members field.';
                }
            }
            part("Members"; "ProfessionalBodyMembers")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }
}
