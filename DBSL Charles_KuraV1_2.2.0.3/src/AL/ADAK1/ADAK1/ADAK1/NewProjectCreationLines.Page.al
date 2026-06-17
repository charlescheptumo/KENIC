#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72513 "New Project Creation Lines"
{
    PageType = ListPart;
    SourceTable = "Road WorkPlan Package";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Voucher No';
                    ToolTip = 'Specifies the value of the Voucher No field.';
                }
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
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Works Category field.';
                }
                field("Pavement Surface Type"; Rec."Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Surface Type field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Type';
                    ToolTip = 'Specifies the value of the Works Type field.';
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
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Agency ID field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Total Road Section Length"; Rec."Total Road Section Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Road Section Length field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default VAT Bus. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default VAT Prod. Posting Group field.';
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Sum field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Bill Categories")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = TaskList;
                    RunObject = Page "New Project Creation Tasks";
                    ToolTip = 'Executes the Bill Categories action.';
                    // RunPageLink = "Road Work Program ID" = field("Road Work Program ID"), "Package No." = field("Budget Entry No");
                }
                action("Bill Items")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Planning;
                    RunObject = Page "Project Creation Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Budget Entry No");
                    ToolTip = 'Executes the Bill Items action.';
                }
            }
        }
    }
}

