namespace KICD.KICD;

page 50316 "Subtype Categories"
{
    ApplicationArea = All;
    Caption = 'Subtype Categories';
    PageType = List;
    SourceTable = "Subtype Categories";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("File Category Code"; Rec."File Category Code")
                {
                    ToolTip = 'Specifies the value of the File Category Code field.', Comment = '%';
                }
                field(Decsription; Rec.Decsription)
                {
                    ToolTip = 'Specifies the value of the Decsription field.', Comment = '%';
                }
                field("Subtype "; Rec."Subtype ")
                {
                    ToolTip = 'Specifies the value of the Subtype field.', Comment = '%';
                }
                field("No series"; Rec."No series")
                {
                    ToolTip = 'Specifies the value of the No series field.', Comment = '%';
                }
            }
        }
   
    }

    actions
    {
        area(Navigation)
        {
        action(ActionName)
        {
            ApplicationArea = All;
            Caption = 'Caption', comment = 'NLB="YourLanguageCaption"';
            Promoted = true;
            PromotedCategory = Process;
            PromotedIsBig = true;
            Image = FARegisters;

            RunObject = Page SubtypeII;
            RunPageLink = Code = field(Code);
        
            trigger OnAction()
            begin

                
            end;
        }
        }
    }
  
}
