#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80103 "Performance Improvement Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Performance Improvement Plan";
    PageType = List;
    SourceTable = "Performance Improvement Plan";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Primary Evaluation ID"; Rec."Primary Evaluation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Evaluation ID field.';
                }
                field("Original PIP"; Rec."Original PIP")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original PIP field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("PIP Template ID"; Rec."PIP Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIP Template ID field.';
                }
                field("PIP Start Date"; Rec."PIP Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIP Start Date field.';
                }
                field("PIP End Date"; Rec."PIP End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIP End Date field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Staff No. field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal Scorecard ID field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked? field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field("Performance Review Type"; Rec."Performance Review Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Review Type field.';
                }
                field("Final PIP Outcome"; Rec."Final PIP Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final PIP Outcome field.';
                }
                field("Final PIP Verdict Code"; Rec."Final PIP Verdict Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final PIP Verdict Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

