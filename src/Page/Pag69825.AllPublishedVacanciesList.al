#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69825 "All Published  Vacancies List"
{
    ApplicationArea = Basic;
    CardPageID = "Insurance Headers";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = const("Job Vacancy"),
                            "Approval Status" = const(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("No. of Applications"; Rec."No. of Applications")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Applications field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
            }
            systempart(Control42; Notes)
            {
            }
            systempart(Control43; MyNotes)
            {
            }
            systempart(Control44; Links)
            {
            }
        }
    }

    actions
    {
    }
}

