#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69309 "Training Needs Lines"
{
    ApplicationArea = Basic;
    PageType = List;
    CardPageId = "Training Needs Projection";
    Caption = 'Training Needs Projections Lines';
    SourceTable = "Training Needs Lines";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("No. of Linked Objectives"; Rec."No. of Linked Objectives")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Linked Objectives field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Need Objectives")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Training Objectives";
                RunPageLink = Type = const(Need),
                              Code = field(Code);
                ToolTip = 'Executes the Need Objectives action.';
            }
        }
    }
}

#pragma implicitwith restore

