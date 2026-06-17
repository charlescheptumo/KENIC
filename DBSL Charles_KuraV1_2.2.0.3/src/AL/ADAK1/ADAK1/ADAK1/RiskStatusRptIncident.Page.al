#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95068 "Risk Status Rpt Incident"
{
    PageType = Card;
    SourceTable = "Risk Status Rpt Incident";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Incident Line No."; Rec."Incident Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Line No. field.';
                }
                field("Risk Incident Category"; Rec."Risk Incident Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Incident Category field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Severity Level field.';
                }
                field("Occurrence Type"; Rec."Occurrence Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occurrence Type field.';
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Date field.';
                }
                field("Incident Start Time"; Rec."Incident Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Start Time field.';
                }
                field("Incident End Time"; Rec."Incident End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident End Time field.';
                }
                field("Incident Location Details"; Rec."Incident Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Location Details field.';
                }
                field("Primary Trigger ID"; Rec."Primary Trigger ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Trigger ID field.';
                }
                field("Root Cause Summary"; Rec."Root Cause Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Root Cause Summary field.';
                }
                field("Category of Person Reporting"; Rec."Category of Person Reporting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category of Person Reporting field.';
                }
                field("Reported By (Name)"; Rec."Reported By (Name)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reported By (Name) field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field("HSE Plan ID"; Rec."HSE Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HSE Plan ID field.';
                }
                field("Hazard ID"; Rec."Hazard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard ID field.';
                }
                field("Actual Financial Impact (LCY)"; Rec."Actual Financial Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Financial Impact (LCY) field.';
                }
                field("Actual Schedule Delay(Days)"; Rec."Actual Schedule Delay(Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Schedule Delay(Days) field.';
                }
                field("Actual No. Injured Persons"; Rec."Actual No. Injured Persons")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. Injured Persons field.';
                }
                field("Actual No. of Fatalities"; Rec."Actual No. of Fatalities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. of Fatalities field.';
                }
                field("Police Report Reference No."; Rec."Police Report Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Report Reference No. field.';
                }
                field("Police Report Date"; Rec."Police Report Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Report Date field.';
                }
                field("Police Station"; Rec."Police Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Station field.';
                }
                field("Reporting Officer"; Rec."Reporting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting Officer field.';
                }
            }
        }
    }

    actions
    {
    }
}

