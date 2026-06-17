#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75036 "Vendor Past Experience"
{
    Caption = 'Vendor Past Experience';
    PageType = ListPart;
    SourceTable = "Vendor Past Experience";
    ApplicationArea = All;
    

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Client Name field.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Nationality ID"; Rec."Nationality ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality ID field.';
                }
                field("Citizenship Type"; Rec."Citizenship Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship Type field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Entity Ownership %"; Rec."Entity Ownership %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entity Ownership % field.';
                }
                field("Share Types"; Rec."Share Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Share Types field.';
                }
                field("No. of Shares"; Rec."No. of Shares")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Shares field.';
                }
                field("Nominal Value/Share"; Rec."Nominal Value/Share")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominal Value/Share field.';
                }
                field("Total Nominal Value"; Rec."Total Nominal Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Nominal Value field.';
                }
                field("Ownership Effective Date"; Rec."Ownership Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Effective Date field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
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
                field("Assignment Name"; Rec."Assignment Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment Name field.';
                }
                field("Project Scope Summary"; Rec."Project Scope Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Scope Summary field.';
                }
                field("Delivery Location"; Rec."Delivery Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delivery Location field.';
                }
                field("Contract Ref No"; Rec."Contract Ref No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Ref No field.';
                }
                field("Assignment Start Date"; Rec."Assignment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment Start Date field.';
                }
                field("Assignment End Date"; Rec."Assignment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment End Date field.';
                }
                field("Assignment Value LCY"; Rec."Assignment Value LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment Value LCY field.';
                }
                field("Assignment Status"; Rec."Assignment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

