namespace KICD.KICD;

page 50237 "Return Stores Requisitions"
{
    ApplicationArea = Basic;
    Caption = 'Return to Stores Requisitions';
    PageType = List;
    SourceTable = "Store Returns Header";
    UsageCategory = Lists;
    SourceTableView = where(Status = filter(Open | "Pending Approval" | Rejected));
    Editable = false;
    InsertAllowed = true;
    DeleteAllowed = true;
    CardPageId = "Store Returns Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor ID field.', Comment = '%';
                }
                field("Requestor No."; Rec."Requestor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor No. field.', Comment = '%';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.', Comment = '%';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.', Comment = '%';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.', Comment = '%';
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations By Tech. Unit field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
            }
        }
    }
}
