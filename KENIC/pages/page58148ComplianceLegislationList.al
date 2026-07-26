page 58148 "Compliance Legislation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Compliance Legislation";
    Caption = 'Compliance Legislation';
    CardPageId = "Compliance Legislation Card";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
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

    actions
    {
        area(processing)
        {
            action(NewLegislation)
            {
                ApplicationArea = All;
                Caption = 'New Legislation';
                Image = NewDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Create a new legislation record.';
                RunObject = Page "Compliance Legislation Card";
                RunPageMode = Create;
            }
        }
    }
}