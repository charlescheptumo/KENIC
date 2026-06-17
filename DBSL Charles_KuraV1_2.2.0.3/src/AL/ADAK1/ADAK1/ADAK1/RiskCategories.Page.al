#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95017 "Risk Categories"
{
    CardPageID = "Risk Category";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Category";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Type';
                    ToolTip = 'Specifies the value of the Risk Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Source ID field.';
                }
                field("Addditiona Comments"; Rec."Addditiona Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Addditiona Comments field.';
                }
                field("No. of Risk Triggers"; Rec."No. of Risk Triggers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Risk Triggers field.';
                }
                field("No of Strategic Risks"; Rec."No of Strategic Risks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Strategic Risks field.';
                }
                field("No of Operational Risks"; Rec."No of Operational Risks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Operational Risks field.';
                }
                field("No of Project Risks"; Rec."No of Project Risks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Project Risks field.';
                }
                field("No. of Incidents"; Rec."No. of Incidents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Incidents field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

