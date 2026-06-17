#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72412 "Layer Specifications"
{
    CardPageID = "Layer Specification";
    PageType = List;
    SourceTable = "Layer Specification";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Thickness(MM)"; Rec."Thickness(MM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Thickness(MM) field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Road Materials")
            {
                ApplicationArea = Basic;
                Image = Lot;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Layer Materials";
                RunPageLink = "Layer Code" = field(Code),
                              "Road Code" = field("Road Code");
                ToolTip = 'Executes the Road Materials action.';
            }
        }
    }
}

