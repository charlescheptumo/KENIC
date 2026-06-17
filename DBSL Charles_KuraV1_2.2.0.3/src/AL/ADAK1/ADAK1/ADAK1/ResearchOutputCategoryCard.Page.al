#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65013 "Research Output Category Card"
{
    PageType = Card;
    SourceTable = "Research Output Categories";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("code"; Rec.code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the code field.';
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup7)
            {
                action("Research Output Sub-Categories")
                {
                    ApplicationArea = Basic;
                    Image = OutputJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Research Output Sublist";
                    RunPageLink = Category = field(code);
                    ToolTip = 'Executes the Research Output Sub-Categories action.';
                }
            }
        }
    }
}

