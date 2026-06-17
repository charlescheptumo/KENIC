#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80413 "Sub Intiative Entries"
{
    PageType = List;
    SourceTable = Sub_Strategy_Activity;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plan ID field.';
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Theme ID field.';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective ID field.';
                }
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy ID field.';
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Entry Description"; Rec."Entry Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Description field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Quarter Reporting Code"; Rec."Quarter Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter Reporting Code field.';
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Amount field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Performance Contract ID"; Rec."Performance Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Contract ID field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                    // Caption = 'ADAK Annual Workplan';
                }
                field("Board PC ID"; Rec."Board PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board PC ID field.';
                }
                field("CEO PC ID"; Rec."CEO PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO PC ID field.';
                }
                field("Functional PC ID"; Rec."Functional PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional PC ID field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed By field.';
                }
                field("Reversed Entry No"; Rec."Reversed Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed Entry No field.';
                }
                field("Directors PC ID"; Rec."Directors PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directors PC ID field.';
                }
                field("Department/Center PC ID"; Rec."Department/Center PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department/Center PC ID field.';
                }
                field("Sub Initiative No."; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Initiative No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

