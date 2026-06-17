page 80523 "Approved DCS Revision Contract"
{
    Caption = 'DCS Annual Performance Revision Contracts';
    CardPageID = "Approved DCS Revision Contrac";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = 80055;
    SourceTableView = WHERE("Document Type" = CONST("Individual Scorecard PC"),
                            "Score Card Type" = CONST(Directors),
                            "Approval Status" = CONST(Released),
                            "Planning Budget Type" = CONST(Supplementary));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    ToolTip = 'Specifies the value of the Objective Setting Due Date field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ToolTip = 'Specifies the value of the Responsible Employee No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Blocked?"; Rec."Blocked")
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

