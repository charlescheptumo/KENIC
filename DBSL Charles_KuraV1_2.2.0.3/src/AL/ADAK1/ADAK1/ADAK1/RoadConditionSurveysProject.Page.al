#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72359 "Road Condition Surveys(Project"
{
    ApplicationArea = Basic;
    Caption = 'Road Condition Surveys(Project Closeout)';
    //CardPageID = "Road Condition Survey Project";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Road Inv. Condition Survey";
    SourceTableView = where(Posted = filter(false),
                            "Survey Type" = const("Project-Based"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No. field.';
                }
                field("Primary Vendor No."; Rec."Primary Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Target Road Inventory Type"; Rec."Target Road Inventory Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Road Inventory Type field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Branch/Center"; Rec."Branch/Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch/Center field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("No. of Constituencies"; Rec."No. of Constituencies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Constituencies field.';
                }
                field("No.Of Existing Roads"; Rec."No.Of Existing Roads")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Existing Roads field.';
                }
                field("No. of New Roads"; Rec."No. of New Roads")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of New Roads field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Approval Status" := Rec."approval status"::Open;
        Rec."Service Type" := Rec."service type"::OutSourced;
    end;
}

