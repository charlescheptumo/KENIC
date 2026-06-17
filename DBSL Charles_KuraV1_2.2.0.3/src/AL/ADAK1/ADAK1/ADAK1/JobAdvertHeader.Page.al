#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69140 "Job Advert Header"
{
    PageType = Card;
    SourceTable = "Advertisement Channels";
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
                field(Mode; Rec.Mode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field(Stat us;Status)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Document Dat e";"Document Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created B y";"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Publish ed;Published)
                // {
                //     ApplicationArea = Basic;
                // }
            }
            part(Control10; "Vacancy Media Advertisements")
            {
                SubPageLink = "Vacancy No." = field(Code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Advert")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Job Advert action.';
                // RunObject = Report "Job advert Template";
            }
        }
    }
}

