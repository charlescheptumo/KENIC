#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72376 "Multi_Year Work"
{
    PageType = ListPart;
    SourceTable = "Multi_Year Work";
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
                    Caption = 'ADAK Budget Code';
                    ToolTip = 'Specifies the value of the ADAK Budget Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Global Dimension Code 2"; Rec."Global Dimension Code 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Works Category field.';
                }
                field("Total Workplanned Length"; Rec."Total Workplanned Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Workplanned Length field.';
                }
                field("Total Project Cost"; Rec."Total Project Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Project Cost';
                    ToolTip = 'Specifies the value of the Estimated Project Cost field.';
                }
                field("Total Budget Cost"; Rec."Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Allocation';
                    ToolTip = 'Specifies the value of the Total Budget Allocation field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
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
                action("Multi Works Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Multi Year Financing';
                    Image = JobLines;
                    
                    RunObject = Page "Multi Works Line";
                    RunPageLink = "Road Work Program ID" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Multi Year Financing action.';
                }
                action("Project Road Links")
                {
                    ApplicationArea = Basic;
                    Image = Price;
                    RunObject = Page "Project Road Links";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Project Road Links action.';
                }
                action("Project Road Facility Items")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    RunObject = Page "Project Road Facility Items";
                    RunPageLink = "Global Budget Book Code" = field("Road Work Program ID"),
                                  "KeRRA Budget Code" = field("KeRRA Budget Code");
                    ToolTip = 'Executes the Project Road Facility Items action.';
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
            }
        }
    }
}

