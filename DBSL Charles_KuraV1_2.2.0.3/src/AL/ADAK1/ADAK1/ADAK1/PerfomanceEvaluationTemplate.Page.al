#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80046 "Perfomance Evaluation Template"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
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
                field("General Instructions"; Rec."General Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Instructions field.';
                }
                field("Global?"; Rec."Global?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global? field.';
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Responsibility Center field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Performance Rating Model"; Rec."Performance Rating Model")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Rating Model field.';
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Rating Scale field.';
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proficiency Rating Scale field.';
                }
                field("Total Score Model"; Rec."Total Score Model")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Score Model field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Default Competency A_Template"; Rec."Default Competency A_Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Competency A_Template field.';
                }
                field("General A_Questionnaire"; Rec."General A_Questionnaire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General A_Questionnaire field.';
                }
                field("Peer Reviewer FB_Questionnaire"; Rec."Peer Reviewer FB_Questionnaire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Peer Reviewer FB_Questionnaire field.';
                }
                field("Total Allocated Weight (%)"; Rec."Total Allocated Weight (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Allocated Weight (%) field.';
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
        area(creation)
        {
            action("Performance Evaluation Weight")
            {
                ApplicationArea = Basic;
                Image = UnitConversions;
                Promoted = true;
                Caption = 'Annual Performance Evaluation Weight';
                PromotedCategory = Process;
                RunObject = Page "Performance Evaluation Weight";
                RunPageLink = "Per_Evaluation Template ID" = field(Code);
                ToolTip = 'Executes the Annual Performance Evaluation Weight action.';
            }
        }
    }
}

