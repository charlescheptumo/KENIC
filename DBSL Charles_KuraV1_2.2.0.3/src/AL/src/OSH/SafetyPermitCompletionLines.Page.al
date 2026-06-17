#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69489 "Safety Permit Completion Lines"
{
    PageType = ListPart;
    SourceTable = 69445;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Restricted Activity ID"; Rec."Restricted Activity ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted Activity ID field.';
                }
                field("Compliance Requirement"; Rec."Compliance Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Requirement field.';
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
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Status field.';
                }
                field("Additional Compliance Notes"; Rec."Additional Compliance Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Compliance Notes field.';
                }
            }
        }
    }

    actions
    {
    }
}
