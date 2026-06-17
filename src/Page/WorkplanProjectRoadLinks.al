#pragma implicitwith disable
page 99668 "Workplan Project Road Links"
{
    PageType = List;
    SourceTable = "Workplan Project Road Link";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Type field.';
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Check Entire Inventory"; Rec."Check Entire Inventory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Check Entire Inventory field.';
                }
                field("Road Section No"; Rec."Road Section No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Code field.';
                }

                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(KM) field.';
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage Description field.';
                }
                field("End Chainage(KM)"; Rec."End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(KM) field.';
                }
                field("Workplanned Length(KM)"; Rec."Workplanned Length(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length(KM) field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Current Pavement Surface Type"; Rec."Current Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Pavement Surface Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Actual Road Reserve Width"; Rec."Actual Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Road Reserve Width field.';
                }
                field("KeRRaBudget Code"; Rec."KeRRA Budget Code")
                {
                    Caption = 'ADAK Budget Code';
                    ToolTip = 'Specifies the value of the ADAK Budget Code field.';
                }
                field("New Pavement Surface Type"; Rec."New Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Pavement Surface Type field.';
                }
                field("Road Auth Road Code"; Rec."KeRRA Road Code")
                {
                    Caption = 'ADAK Road Code';
                    ToolTip = 'Specifies the value of the ADAK Road Code field.';
                }
                field("Planned Road Width"; Rec."Planned Road Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Road Width field.';
                }
                field("Road Reserve Status"; Rec."Road Reserve Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Reserve Status field.';
                }
                field("Authentic Road Reserve Width"; Rec."Authentic Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentic Road Reserve Width field.';
                }
                field("Desired Road Reserve Width(M)"; Rec."Desired Road Reserve Width(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Road Reserve Width(M) field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Scope of pavement works")
            {
                Caption = 'Scope of pavement works';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page 72412;
                RunPageLink = "Road Code" = FIELD("Road Code");
                ToolTip = 'Executes the Scope of pavement works action.';
            }
        }
    }
}

#pragma implicitwith restore

