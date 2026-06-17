#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75143 "Bid Past Experience"
{
    PageType = List;
    SourceTable = "Bid Past Experience";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Type of Engagement"; Rec."Type of Engagement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Engagement field.';
                }
                field("Primary Contractor"; Rec."Primary Contractor")
                {
                    ApplicationArea = Basic;
                    Caption = 'Main Contractor';
                    ToolTip = 'Specifies the value of the Main Contractor field.';
                }
                field("Assignment/Project Name"; Rec."Assignment/Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment/Project Name field.';
                }
                field("Project Scope Summary"; Rec."Project Scope Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Scope Summary field.';
                }
                field("Assignment Start Date"; Rec."Assignment Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/ Project Start Date';
                    ToolTip = 'Specifies the value of the Assignment/ Project Start Date field.';
                }
                field("Assignment End Date"; Rec."Assignment End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/Project End Date';
                    ToolTip = 'Specifies the value of the Assignment/Project End Date field.';
                }
                field("Assignment Value LCY"; Rec."Assignment Value LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/Project Value LCY';
                    ToolTip = 'Specifies the value of the Assignment/Project Value LCY field.';
                }
                field("Assignment Status"; Rec."Assignment Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assignment/Project Status';
                    ToolTip = 'Specifies the value of the Assignment/Project Status field.';
                }
                field("Project Completion % (Value)"; Rec."Project Completion % (Value)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Completion % (Value) field.';
                }
                field("Delivery Location"; Rec."Delivery Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delivery Location field.';
                }
                field("Project Completion % (Work)"; Rec."Project Completion % (Work)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Completion % (Work Done) field.';
                }
                field("Primary Contact Person"; Rec."Primary Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Person field.';
                }
                field("Primary Contact Designation"; Rec."Primary Contact Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Designation field.';
                }
                field("Primary Contact Tel"; Rec."Primary Contact Tel")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Tel field.';
                }
                field("Primary Contact Email"; Rec."Primary Contact Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Email field.';
                }
            }
        }
    }

    actions
    {
    }
}

