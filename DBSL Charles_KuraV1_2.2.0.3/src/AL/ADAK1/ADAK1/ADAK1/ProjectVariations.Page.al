#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72465 "Project Variations"
{
    CardPageID = "Project Variation Header";
    PageType = List;
    SourceTable = "Project Variation Header";
    ApplicationArea = All;

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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
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
                field("Variation Reason Code"; Rec."Variation Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variation Reason Code field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Original Value of Work (LCY)"; Rec."Original Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Value of Work (LCY) field.';
                }
                field("New Varied Works Value (LCY)"; Rec."New Varied Works Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Varied Works Value (LCY) field.';
                }
                field("Net Change Value of Work (LCY)"; Rec."Net Change Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change Value of Work (LCY) field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("External Contract Reference"; Rec."External Contract Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Contract Reference field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracting Vendor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Contractor Representative"; Rec."Contractor Representative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contractor Representative field.';
                }
                field("Contractor Rep Email"; Rec."Contractor Rep Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Representative Email field.';
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes (LCY) field.';
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
                field("Contractor Variation Req No."; Rec."Contractor Variation Req No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Variation Req No. field.';
                }
                field("Value of Work Added"; Rec."Value of Work Added")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value of Work Added field.';
                }
                field("Value of Work Omitted"; Rec."Value of Work Omitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value of Work Omitted field.';
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer No. field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
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
                field("Project Variation Order No."; Rec."Project Variation Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Variation Order No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

