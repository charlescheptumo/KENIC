
page 60003 "Security Incidence List"
{
    CardPageID = "Security Incidence Card";
    PageType = List;
    SourceTable = "Security Incidences";
    SourceTableView = WHERE("Incidence Stage" = CONST(New),
                            "Approval Status" = CONST(Open));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Severity Level field.';
                }
                field("Incident Type"; Rec."Incident Type")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Incident Type field.';
                }
                field("Incident Type Details"; Rec."Incident Type Details")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Incident Type Details field.';
                }
                field("Time Reported"; Rec."Time Reported")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Time Reported field.';
                }
                field("Reported By Type"; Rec."Reported By Type")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Reported By Type field.';
                }
                field(Stakeholder; Rec.Stakeholder)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Stakeholder field.';
                }
                field("Reporter Number"; Rec."Reporter Number")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Reporter Number field.';
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                    ToolTip = 'Specifies the value of the Reporter Name field.';
                }
                field("Reporter Phone Number"; Rec."Reporter Phone Number")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Reporter Phone Number field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Incidence Stage"; Rec."Incidence Stage")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Incidence Stage field.';
                }
                field("Reporter Email Address"; Rec."Reporter Email Address")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Reporter Email Address field.';
                }
                field("Incident Details"; Rec."Incident Details")
                {
                    ApplicationArea = BasicHR;
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



