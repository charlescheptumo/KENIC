#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72492 "Rejected CV Requests"
{
    ApplicationArea = Basic;
    Caption = 'Rejected Contractor Variation Requests';
    CardPageID = "Contractor Variation Request";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Project Variation Header";
    SourceTableView = where("Document Type" = filter("Contractor Variation Request"),
                            Status = filter(Released),
                            "Review Status" = const(Declined));
    UsageCategory = History;

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
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Extension Reason Code"; Rec."Extension Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extension Reason Code field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Original Project Starting Date"; Rec."Original Project Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Project Starting Date field.';
                }
                field("Original Project Ending Date"; Rec."Original Project Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Project Ending Date field.';
                }
                field("Requested Extension Period"; Rec."Requested Extension Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Extension Period (Days) field.';
                }
                field("Extended Project End Date"; Rec."Extended Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extended Project End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Review Status"; Rec."Review Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Status field.';
                }
                field("Review Rejection Notes"; Rec."Review Rejection Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Rejection Notes field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Variation Request";
    end;
}

