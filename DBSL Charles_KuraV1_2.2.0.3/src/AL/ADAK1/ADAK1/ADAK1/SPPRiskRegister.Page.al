#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 92554 "SPP Risk Register"
{
    Caption = 'SPP Risk Register';
    PageType = List;
    SourceTable = "Schedule of PP Requirements";
    SourceTableView = where("Requirement Type" = filter("Risk Register"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Category field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Risk Allocation"; Rec."Risk Allocation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Allocation field.';
                }
                field("Contractual Reference Clause"; Rec."Contractual Reference Clause")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractual Reference Clause field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Requirement Type" := Rec."requirement type"::"Risk Register";
    end;
}
