#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72767 "SUB Project Evaluation Lines"
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
                    ToolTip = 'Specifies the value of the EOT Recommended Days field.';
                }
                field("Evaluation Remarks"; Rec."Evaluation Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Remarks field.';
                }
                field("Original Project Starting Date"; Rec."Original Project Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Project Starting Date field.';
                }
                field("Original Project Ending Date"; Rec."Original Project Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Project Ending Date field.';
                }
                field("Requested Extension Period"; Rec."Requested Extension Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Extension Period (Days) field.';
                }
                field("Extended Project End Date"; Rec."Extended Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extended Project End Date field.';
                }
                field("Approved Extension Period"; Rec."Approved Extension Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Extension Period field.';
                }
                field("Revised Project End Date"; Rec."Revised Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revised Project End Date field.';
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

