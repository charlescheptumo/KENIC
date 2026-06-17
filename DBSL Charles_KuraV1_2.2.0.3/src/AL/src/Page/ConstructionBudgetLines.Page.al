#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72334 "Construction  Budget Lines"
{
    Caption = 'Budget  Ceilings (Maintenance Works)';
    PageType = ListPart;
    SourceTable = "New Road Work Program Package";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KeRRA Budget Code field.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Entry No';
                    ToolTip = 'Specifies the value of the Budget Entry No field.';
                }
                field("Package Name"; Rec."Package Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Works Category field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Workplanned Length (Km)"; Rec."Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Workplanned Length (Km) field.';
                }
                field("Total Budget Cost"; Rec."Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Year Budget';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Year Budget field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Project Details")
            {
                Caption = 'Project Details';
                action("Project Roads")
                {
                    ApplicationArea = Basic;
                    Image = ExportToBank;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Project Roads action.';
                }
                action(Tasks)
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = TaskList;
                    RunObject = Page "Work Plan Tasks";
                    // RunPageLink = "Road Work Program ID"=field("Road Work Program ID"),
                    //               "Package No."=field("Package No.");
                    Visible = false;
                    ToolTip = 'Executes the Tasks action.';
                }
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Planning;
                    RunObject = Page "WP Plan Lines";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "Budget Entry No" = field("Package No.");
                    Visible = false;
                    ToolTip = 'Executes the Planning Lines action.';
                }
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Sources';
                    Ellipsis = true;
                    Image = SourceDocLine;
                    RunObject = Page "Project Funding Sources";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Funding Sources action.';
                }
                action("Project Road Facilities")
                {
                    ApplicationArea = Basic;
                    Image = Components;
                    RunObject = Page "Project Road Facility Items";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Project Road Facilities action.';
                }
            }
        }
    }
}

