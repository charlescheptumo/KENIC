#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72670 "Project POP Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "Project Evaluation Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Cause of Delay"; Rec."Cause of Delay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cause of Delay field.';
                }
                field("EOT Requested Days"; Rec."EOT Requested Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the EOT Requested Days field.';
                }
                field("EOT Recommended Days"; Rec."EOT Recommended Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the EOT Recommended Days field.';
                }
                field("Evaluation Remarks"; Rec."Evaluation Remarks")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Remarks field.';
                }
                field("Professional Opinion"; Rec."Professional Opinion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Opinion field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        RecommVisible := false;
        Rec.CalcFields(Status);
        if Rec.Status = Rec.Status::Released then
            RecommVisible := true;
    end;

    trigger OnAfterGetRecord()
    begin
        RecommVisible := false;
        Rec.CalcFields(Status);
        if Rec.Status = Rec.Status::Released then
            RecommVisible := true;
    end;

    trigger OnOpenPage()
    begin
        RecommVisible := false;
        Rec.CalcFields(Status);
        if Rec.Status = Rec.Status::Released then
            RecommVisible := true;
    end;

    var
        RecommVisible: Boolean;
}

