#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75186 "Prequalification Score Header"
{
    ApplicationArea = Basic;
    CardPageID = "Prequalification Score Card";
    Editable = false;
    PageType = List;
    SourceTable = "Prequalification Score Header";
    SourceTableView = where(Type = filter(<> Multiple));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Prequalification Evaluation Te"; Rec."Prequalification Evaluation Te")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Evaluation Template ID field.';
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Lead field.';
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Lead Name field.';
                }
                field("Prequalification Response No."; Rec."Prequalification Response No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Response No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("IFP No."; Rec."IFP No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFP No. field.';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Responsibility Center field.';
                }
                field("System Evaluation Score %"; Rec."System Evaluation Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Evaluation Score % field.';
                }
                field("Final Evaluation Score %"; Rec."Final Evaluation Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluation Score % field.';
                }
                field("Final Evaluation Decision"; Rec."Final Evaluation Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluation Decision field.';
                }
                field("Evaluation Committee Remarks"; Rec."Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Remarks field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
        }
    }

    actions
    {
    }
}

