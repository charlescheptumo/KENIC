#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72518 "Project Road Links"
{
    CardPageID = "Project Road Link";
    PageType = List;
    SourceTable = "Project Road Link";
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
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("KeRRA Road Code"; Rec."KeRRA Road Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'ADAK Budget Code';
                    ToolTip = 'Specifies the value of the ADAK Budget Code field.';
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
                field("Desired Road Reserve Width(M)"; Rec."Desired Road Reserve Width(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the width that is defined under the contract specifications/ Standard road reserve length.';
                }
                field("Authentic Road Reserve Width"; Rec."Authentic Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve width that is defined under the survey maps.';
                }
                field("Actual Road Reserve Width"; Rec."Actual Road Reserve Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve width that is on the ground.';
                }
                field("Planned Road Width"; Rec."Planned Road Width")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the road reserve width that is on the design.';
                }
                field("Road Reserve Status"; Rec."Road Reserve Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Reserve Status field.';
                }
                field("Current Pavement Surface Type"; Rec."Current Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Pavement Surface Type field.';
                }
                field("New Pavement Surface Type"; Rec."New Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Pavement Surface Type field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Global Budget Book Code"; Rec."Global Budget Book Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Budget Book Code field.';
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    caption = 'ADAK Budget Code';
                    ToolTip = 'Specifies the value of the ADAK Budget Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
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
                ApplicationArea = Basic;
                Caption = 'Scope of pavement works';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Layer Specifications";
                RunPageLink = "Road Code" = field("Road Code");
                ToolTip = 'Executes the Scope of pavement works action.';
            }
            action("Constituencies Covered")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Road Constituencies";
                RunPageLink = "Road Code" = field("Road Code"),
                              "Global Budget Book ID" = field("Global Budget Book Code"),
                              "KeRRA Budget Code" = field("KeRRA Budget Code");
                ToolTip = 'Executes the Constituencies Covered action.';
            }
        }
    }
}

#pragma implicitwith restore

