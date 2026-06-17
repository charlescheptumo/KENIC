page 50056 "CRM Setup Card"
{
    ApplicationArea = All;
    Caption = 'CRM Setup Card';
    PageType = Card;
    SourceTable = "Crm General Setup.";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Primary key"; Rec."Primary key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary key field.', Comment = '%';
                }
                field("Lead Nos"; Rec."Lead Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Nos field.', Comment = '%';
                }
                field("General Enquiries Nos"; Rec."General Enquiries Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Enquiries Nos field.', Comment = '%';
                }
                field("Cases nos"; Rec."Cases nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cases nos field.', Comment = '%';
                }
                field("Crm logs Nos"; Rec."Crm logs Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Crm logs Nos field.', Comment = '%';
                }
                field("Customer App Nos"; Rec."Customer App Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer App Nos field.', Comment = '%';
                }
                field("Customer Feedback Nos"; Rec."Customer Feedback Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Feedback Nos field.', Comment = '%';
                }
                field("Visitor Pass Nos"; Rec."Visitor Pass Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitor Pass Nos field.';
                }
            }
        }
    }
}
