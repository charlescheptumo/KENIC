/// <summary>
/// Page Security Incidences Awaiting H (ID 60087).
/// </summary>
page 60087 "Security Incidences Awaiting H"
{
    Caption = 'Security Incidences Awaiting HOD  Closure';
    CardPageID = "Security Incidence Card";
    PageType = List;
    SourceTable = "Security Incidences";
    SourceTableView = WHERE("Incidence Stage" = CONST(Closed),
                            "Approval Status" = CONST(Released));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Severity Level field.';
                }
                field("Incident Type"; Rec."Incident Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Type field.';
                }
                field("Incident Type Details"; Rec."Incident Type Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Type Details field.';
                }
                field("Time Reported"; Rec."Time Reported")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Reported field.';
                }
                field("Reported By Type"; Rec."Reported By Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reported By Type field.';
                }
                field(Stakeholder; Rec.Stakeholder)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder field.';
                }
                field("Reporter Number"; Rec."Reporter Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporter Number field.';
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporter Name field.';
                }
                field("Reporter Phone Number"; Rec."Reporter Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporter Phone Number field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {

                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Incidence Stage"; Rec."Incidence Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incidence Stage field.';
                }
                field("Reporter Email Address"; Rec."Reporter Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporter Email Address field.';
                }
                field("Incident Details"; Rec."Incident Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Details field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}

