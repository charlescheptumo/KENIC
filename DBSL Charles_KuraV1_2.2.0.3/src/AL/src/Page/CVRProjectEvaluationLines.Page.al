#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72763 "CVR Project Evaluation Lines"
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
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Evaluation Remarks"; Rec."Evaluation Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Remarks field.';
                }
                field("Original Quantity"; Rec."Original Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Quantity field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Original Total Cost (LCY)"; Rec."Original Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Total Cost (LCY) field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("New Quantity"; Rec."New Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Quantity field.';
                }
                field("Approved Quantity"; Rec."Approved Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Quantity field.';
                }
                field("New Total Cost (LCY)"; Rec."New Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Total Cost (LCY) field.';
                }
                field("Approved Total Cost(LCY)"; Rec."Approved Total Cost(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Total Cost(LCY) field.';
                }
                field("Net Change (Quantity)"; Rec."Net Change (Quantity)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change (Quantity) field.';
                }
                field("Net Change (Total Cost LCY)"; Rec."Net Change (Total Cost LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change (Total Cost LCY) field.';
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

