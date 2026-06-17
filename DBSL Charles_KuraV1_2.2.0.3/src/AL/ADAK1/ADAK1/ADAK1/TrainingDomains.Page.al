#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69306 "Training Domains"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Training Domains";
    UsageCategory = Tasks;

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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. of Courses"; Rec."No. of Courses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Courses field.';
                }
                field("No. of Actual Staff Trained"; Rec."No. of Actual Staff Trained")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Actual Staff Trained field.';
                }
                field("Actual Budget Spent"; Rec."Actual Budget Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Budget Spent field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Courses")
            {
                ApplicationArea = Basic;
                Image = RelatedInformation;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Training Courses Setup";
                RunPageLink = Domain = field(Code);
                ToolTip = 'Executes the Courses action.';
            }
        }
    }
}

