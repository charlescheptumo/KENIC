#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56060 "CRM Setup List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Crm General Setup.";
    CardPageId = "CRM Setup Card";
    Caption = 'Setup List';
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary key"; Rec."Primary key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary key field.';
                }
                field("Visitor Pass Nos"; Rec."Visitor Pass Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitor Pass Nos field.', Comment = '%';
                }
                field("CEO Booking Nos"; Rec."CEO Booking Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Booking Nos field.', Comment = '%';
                }
                field("CEO Task Assignment Line Nos"; Rec."CEO Task Assignment Line Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Task Assignment Line Nos field.', Comment = '%';
                }
                field("CEO Task Assignment Nos"; Rec."CEO Task Assignment Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Task Assignment Nos field.', Comment = '%';
                }
                // field("Lead Nos";Rec."Lead Nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("General Enquiries Nos";Rec."General Enquiries Nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cases nos";Rec."Cases nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Crm logs Nos";Rec."Crm logs Nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Training Nos";Rec."Training Nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Customer App Nos";Rec."Customer App Nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Customer Feedback Nos";Rec."Customer Feedback Nos")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Advocate Nos"; Rec."Advocate Nos")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Advocate Nos field.', Comment = '%';
                // }
                // field("Company Judges Nos"; Rec."Company Judges Nos")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Company Judges Nos field.', Comment = '%';
                // }
                // field("Complaint Nos"; Rec."Complaint Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Complaint Nos field.', Comment = '%';
                // }
                // field("Conflict of Interest Nos"; Rec."Conflict of Interest Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Conflict of Interest Nos field.', Comment = '%';
                // }
                // field("Corruption Prevention Vchr Nos"; Rec."Corruption Prevention Vchr Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Corruption Prevention Vchr Nos field.', Comment = '%';
                // }
                // field("Declarations Nos"; Rec."Declarations Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Declarations Nos field.', Comment = '%';
                // }
                // field("Court Houses Nos"; Rec."Court Houses Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Court Houses Nos field.', Comment = '%';
                // }
                // field("Default Prequalification Categ"; Rec."Default Prequalification Categ")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Default Prequalification Categ field.', Comment = '%';
                // }
                // field("Defendants Nos"; Rec."Defendants Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Defendants Nos field.', Comment = '%';
                // }
                // field("Event Planner Nos"; Rec."Event Planner Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Event Planner Nos field.', Comment = '%';
                // }
                // field("Gifts Given Nos"; Rec."Gifts Given Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Gifts Given Nos field.', Comment = '%';
                // }
                // field("Gifts Nos"; Rec."Gifts Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Gifts Nos field.', Comment = '%';
                // }
                // field("Gifts Receiving Nos"; Rec."Gifts Receiving Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Gifts Receiving Nos field.', Comment = '%';
                // }
                // field("Head of Legal Email"; Rec."Head of Legal Email")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Head of Legal Email field.', Comment = '%';
                // }
                // field("Interested Parties Nos"; Rec."Interested Parties Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Interested Parties Nos field.', Comment = '%';
                // }
                // field("Lease Agreement"; Rec."Lease Agreement")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Lease Agreement field.', Comment = '%';
                // }
                // field("Legal Advice Nos"; Rec."Legal Advice Nos")
                // {
                //    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Legal Advice Nos field.', Comment = '%';
                // }
                // field("Legal Application Nos"; Rec."Legal Application Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Legal Application Nos field.', Comment = '%';
                // }
                // field("Legal Closing Voucher Nos"; Rec."Legal Closing Voucher Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Legal Closing Voucher Nos field.', Comment = '%';
                // }
                // field("Legal Department  Email"; Rec."Legal Department  Email")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Legal Department  Email field.', Comment = '%';
                // }
                // field("Legal Enforcement Nos"; Rec."Legal Enforcement Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Legal Enforcement Nos field.', Comment = '%';
                // }
                // field("Legal Pleading Nos"; Rec."Legal Pleading Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Legal Pleading Nos field.', Comment = '%';
                // }
                // field("MOU Nos"; Rec."MOU Nos")
                // {ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the MOU Nos field.', Comment = '%';
                // }
                // field("Maximum Value of Gift"; Rec."Maximum Value of Gift")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Maximum Value of Gift field.', Comment = '%';
                // }
                // field(Notify; Rec.Notify)
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Notify field.', Comment = '%';
                // }
                // field("Plaintiff Nos"; Rec."Plaintiff Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Plaintiff Nos field.', Comment = '%';
                // }
                // field("Visitor Pass Nos"; Rec."Visitor Pass Nos")
                // {
                //     ApplicationArea = Basic;ToolTip = 'Specifies the value of the Visitor Pass Nos field.', Comment = '%';
                // }
            }
        }
    }

    actions
    {
    }
}

