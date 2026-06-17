#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72707 "Cost Claim Lines"
{
    PageType = ListPart;
    SourceTable = "Cost Claim Lines";
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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Cause of Overrun"; Rec."Cause of Overrun")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cause of Overrun field.';
                }
                field("Cost Claim Requested Amount"; Rec."Cost Claim Requested Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Claim Requested Amount field.';
                }
                field("Cost Claim Approved Amount"; Rec."Cost Claim Approved Amount")
                {
                    ApplicationArea = Basic;
                    Visible = apprvisible;
                    ToolTip = 'Specifies the value of the Cost Claim Approved Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        apprvisible := false;
        Rec.CalcFields(Status);
        if Rec.Status = Rec.Status::Released then
            apprvisible := true;
    end;

    trigger OnAfterGetRecord()
    begin
        apprvisible := false;
        Rec.CalcFields(Status);
        if Rec.Status = Rec.Status::Released then
            apprvisible := true;
    end;

    trigger OnOpenPage()
    begin
        apprvisible := false;
        Rec.CalcFields(Status);
        if Rec.Status = Rec.Status::Released then
            apprvisible := true;
    end;

    var
        apprvisible: Boolean;
}

