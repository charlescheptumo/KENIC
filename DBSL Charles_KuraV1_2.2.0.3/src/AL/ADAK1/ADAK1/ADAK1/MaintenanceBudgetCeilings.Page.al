#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72311 "Maintenance Budget  Ceilings"
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
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Road Works Category"; Rec."Road Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Works Category field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Project Location ID"; Rec."Project Location ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Location ID field.';
                }
                field("Has PBRM Component"; Rec."Has PBRM Component")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has PBRM Component field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("PBRM BoQ Template Code"; Rec."PBRM BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PBRM BoQ Template Code field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Workplanned Length (Km)"; Rec."Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Workplanned Length (Km) field.';
                }
                field("Total Budget Cost"; Rec."Total Budget Cost")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Total Budget Cost field.';
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
                    ToolTip = 'Executes the Tasks action.';
                    // RunObject = Page "Work Plan Tasks";
                    // RunPageLink = "Road Work Program  = D"=field("Road Work Program ID"),
                    //               "Package N = ."=field("Package No.");
                    //Visible = false;
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
                action("Project Roads")
                {
                    ApplicationArea = Basic;
                    Image = ExportToBank;
                    
                    RunObject = Page "Project Road Links";
                    RunPageLink = "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                  "Global Budget Book Code" = field("Road Work Program ID");
                    ToolTip = 'Executes the Project Roads action.';
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

    trigger OnAfterGetCurrRecord()
    begin
        PBRMVisible := false;
        if Rec."Has PBRM Component" = true then
            PBRMVisible := true;
        CurrPage.Update();
    end;

    trigger OnAfterGetRecord()
    begin
        PBRMVisible := false;
        if Rec."Has PBRM Component" = true then
            PBRMVisible := true;
        CurrPage.Update();
    end;

    trigger OnOpenPage()
    begin
        PBRMVisible := false;
        if Rec."Has PBRM Component" = true then
            PBRMVisible := true;
        CurrPage.Update();
    end;

    var
        PBRMVisible: Boolean;
}

