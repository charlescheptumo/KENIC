page 50122 "Complaints Cues"
{
    ApplicationArea = All;
    Caption = 'Complaints Cue';
    PageType = CardPart;
    SourceTable = "Complaints Cues";

    layout
    {
        area(Content)
        {
            cuegroup("Complaints and Compliments")
            {
                field("Open Tickets"; Rec."Open Tickets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open Tickets field.', Comment = '%';
                    DrillDownPageId = "Open Tickets List";
                }
                field("Resolved Tickets"; Rec."Resolved Tickets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resolved Tickets field.', Comment = '%';
                    DrillDownPageId = "Resolved Tickets lists";
                }
                field("Assigned Tickets"; Rec."Assigned Tickets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Tickets field.', Comment = '%';
                    DrillDownPageId = "Assigned General List";
                }
                field("Closed Tickets"; Rec."Closed Tickets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed Tickets field.', Comment = '%';
                    DrillDownPageId = "My Closed Tickets";
                }
                field("Escalated Tickets"; Rec."Escalated Tickets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated Tickets field.', Comment = '%';
                    DrillDownPageId = "Escalated Tickets list";
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}
