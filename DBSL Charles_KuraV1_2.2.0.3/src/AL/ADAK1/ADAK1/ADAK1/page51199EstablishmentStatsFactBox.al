page 51199 "EstablishmentStatsFactBox"
{
    PageType = CardPart;
    SourceTable = "Company Information";
    Caption = 'Establishment (Statistics / Summary)';

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;

                field("Active Staff Count"; Rec."Active Staff Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of currently active employees.';
                    Importance = Promoted;
                }
                field("Established Positions"; Rec."Established Positions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of non-blocked established positions.';
                    Importance = Promoted;
                }
                field("Total Job Grades"; Rec."Total Job Grades")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of salary scales configured.';
                    Importance = Promoted;
                }
                field("Approved Duty Stations"; Rec."Approved Duty Stations")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total number of active, approved duty stations.';
                    Importance = Promoted;
                }
            }
        }
    }
}