/// <summary>
/// Page Contract ImplementaionTeamAppt (ID 99517).
/// </summary>

page 99517 ContractImplementationTeamApps
{
    ApplicationArea = All;
    Caption = 'Contract Implementation Team Appointments';
    PageType = List;
    SourceTable = "IFS Tender Committee";
    UsageCategory = Lists;
    CardPageId = ContractImplementationTeamAppt;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
            }
        }
    }
}


