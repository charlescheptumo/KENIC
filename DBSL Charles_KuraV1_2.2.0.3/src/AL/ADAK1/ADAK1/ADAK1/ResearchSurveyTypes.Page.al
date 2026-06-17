#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80231 "Research Survey Types"
{
    CardPageID = "Research Survey Type Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Survey Type";
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Category field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
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
                field("No. of BR Templates"; Rec."No. of BR Templates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of BR Templates field.';
                }
                field("No. of BR Surveys"; Rec."No. of BR Surveys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of BR Surveys field.';
                }
                field("No. of Survey Responses"; Rec."No. of Survey Responses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Survey Responses field.';
                }
                field("No. of BR Final Reports"; Rec."No. of BR Final Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of BR Final Reports field.';
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

