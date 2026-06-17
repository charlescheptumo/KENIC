#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72364 "WorkPlan Budget Ceilings"
{
    Caption = 'WorkPlan Budget Ceilings';
    PageType = ListPart;
    SourceTable = "Road WorkPlan Package";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Budget Entry No"; Rec."Budget Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Entry No field.';
                }
                field("Package Name"; Rec."Package Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Package Name field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Works Category field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Funding Agency ID field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Pavement Surface Type"; Rec."Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Surface Type field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Workplanned Length (Km)"; Rec."Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length (Km) field.';
                }
                field("Budget (Cost) Excl. VAT"; Rec."Budget (Cost) Excl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget (Cost) Excl. VAT field.';
                }
                field("Budget (VAT Amount)"; Rec."Budget (VAT Amount)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget (VAT Amount) field.';
                }
                field("Budget (Cost) Incl. VAT"; Rec."Budget (Cost) Incl. VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget (Cost) Incl. VAT field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line Function")
            {
                Caption = '&Line Function';
                action(Tasks)
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = TaskList;
                    RunObject = Page "Work Plan Tasks";
                    ToolTip = 'Executes the Tasks action.';
                    // RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
                    //               "Package No."=field("Budget Entry No");
                }
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Planning;
                    RunObject = Page "WP Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Budget Entry No");
                    ToolTip = 'Executes the Planning Lines action.';
                }
            }
        }
    }
}

