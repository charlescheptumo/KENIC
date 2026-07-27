page 58149 "Compliance Legislation Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Compliance Legislation";
    Caption = 'Compliance Legislation Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique code for the legislation.';
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the full title or description of the legislation (e.g., Companies Act).';
                }
                field("Authority"; Rec."Authority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the governing or issuing authority (e.g., Parliament of Kenya).';
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
}