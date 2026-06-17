#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 92539 "SPP Financials"
{
    Caption = 'SPP Financials';
    PageType = List;
    SourceTable = "Schedule of PP Requirements";
    SourceTableView = where("Requirement Type" = filter(Financials));
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
                field("Financial Category"; Rec."Financial Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Category field.';
                }
                field("Financial Requirement"; Rec."Financial Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Requirement field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Requirement Type" := Rec."requirement type"::Financials;
    end;
}
