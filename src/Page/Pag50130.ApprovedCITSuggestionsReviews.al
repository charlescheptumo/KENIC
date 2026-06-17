page 50130 "Approved CIT Suggestions Revie"
{
    ApplicationArea = All;
    Caption = 'Approved CIT Suggestions Reviews';
    PageType = List;
    SourceTable = "Suggestion Box";
    UsageCategory = Lists;
    CardPageId = "Approved CIT Suggestions Revi";
    SourceTableView = where("Process Status" = const("Under CIT Completion"), "Approval Status" = const(Approved));
    // SourceTableView = where("Approval Status"= const(Approved), "Process Status"= filter("Under ICT"));

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
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("ICT Feedback"; Rec."ICT Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Feedback field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Type field.', Comment = '%';
                }
                field("Raised Date"; Rec."Raised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised Date field.', Comment = '%';
                }
                field("Project Team"; Rec."Project Team")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team field.', Comment = '%';
                }
                field("Project Team Name"; Rec."Project Team Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team Name field.', Comment = '%';
                }
                field("Process Status"; Rec."Process Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Status field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" = Rec."Approval Status"::Approved then
            Rec."Process Status" := Rec."Process Status"::"Under CIT Completion";
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Approval Status" = Rec."Approval Status"::Approved then
            Rec."Process Status" := Rec."Process Status"::"Under CIT Completion";
    end;
}
