page 50074 "CEO Assign Tasks List"
{
    ApplicationArea = All;
    Caption = 'CEO Assign Tasks List';
    PageType = ListPart;
    SourceTable = "CEO Assign Tasks List";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No field.', Comment = '%';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field(Tasks; Rec.Tasks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tasks field.', Comment = '%';
                }
                field(Completed; Rec.Completed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Completed field.', Comment = '%';
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion Date field.', Comment = '%';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CEOMainTask.Reset();
        CEOMainTask.SetRange(No, Rec.No);
        if CEOMainTask.Find('-') then begin
            Rec.No := CEOMainTask.No;
        end;
    end;

    var
        CEOMainTask: Record "CEO Assign Tasks";
}
