#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80350 "BR Survey Participants"
{
    PageType = List;
    SourceTable = "BR Survey Participant";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Participant ID"; Rec."Participant ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Participant ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Due Date field.';
                }
                field(Invited; Rec.Invited)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited field.';
                }
                field("Date Invited"; Rec."Date Invited")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Invited field.';
                }
                field("Time Invited"; Rec."Time Invited")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Invited field.';
                }
                field("Invited By"; Rec."Invited By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited By field.';
                }
                field("Survey Response ID"; Rec."Survey Response ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Response ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

