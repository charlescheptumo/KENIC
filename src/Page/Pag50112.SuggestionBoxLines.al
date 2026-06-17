page 50112 "Suggestion Box Lines"
{
    ApplicationArea = All;
    Caption = 'Suggestion Box Lines';
    PageType = ListPart;
    SourceTable = "Suggestion Box Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field(Proposal; Rec.Proposal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal field.', Comment = '%';
                }
            }
        }
    }
}
