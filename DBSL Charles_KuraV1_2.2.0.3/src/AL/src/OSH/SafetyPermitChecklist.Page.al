#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69416 "Safety Permit Checklist"
{
    PageType = Card;
    SourceTable = 69408;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Permit Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Condition Type"; Rec."Condition Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition Type field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Severity Level for Violation"; Rec."Severity Level for Violation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Severity Level for Violation field.';
                }
            }
        }
    }

    actions
    {
    }
}
