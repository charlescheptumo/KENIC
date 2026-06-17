page 50213 "Correspondence Cues"
{
    ApplicationArea = All;
    Caption = 'Correspondence Cues';
    PageType = CardPart;
    SourceTable = "Correspondence Cues";
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Correspondence Cues")
            {
                field("Incoming Correspondence"; Rec."Incoming Correspondence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incoming Correspondence field.', Comment = '%';
                    // DrillDownPageId = "General Correspondences";
                    DrillDownPageId = "Incoming Correspondences File";
                }
                field("Outgoing Correspondence"; Rec."Outgoing Correspondence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outgoing Correspondence field.', Comment = '%';
                    DrillDownPageId = "Correspondences Pending Approv";
                }
                // field("Correspondence Awaiting Approval"; Rec."Correspondence Awaiting Approval")
                // {
                //     ApplicationArea = Basic;
                //     // DrillDownPageId = "General Correspond Approvals";
                //     DrillDownPageId = "General Correspondences";
                //     ToolTip = 'Specifies the value of the Correspondence Awaiting Approval field.', Comment = '%';
                // }
                // field("Correspondence Sent for Approval"; Rec."Correspondence Sent for Approval")
                // {
                //     ApplicationArea = Basic;
                //     // DrillDownPageId = "General Correspond Approvals";
                //     DrillDownPageId = "General Correspondences";
                //     ToolTip = 'Specifies the value of the Correspondence Sent for Approval field.', Comment = '%';
                // }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        Rec.SetRange("User ID Filter", UserId);
    end;
}
