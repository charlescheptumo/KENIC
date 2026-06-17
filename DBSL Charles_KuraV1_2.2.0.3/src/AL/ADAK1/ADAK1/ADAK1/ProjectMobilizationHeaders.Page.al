#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72271 "Project Mobilization Headers"
{
    CardPageID = "Project Mobilization Header";
    PageType = List;
    SourceTable = "Project Mobilization Header";
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
                field("Commencement Order ID"; Rec."Commencement Order ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order ID field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
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
                field("Project Mission"; Rec."Project Mission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Mission field.';
                }
                field("Staff Appointment Voucher No."; Rec."Staff Appointment Voucher No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Appointment Voucher No. field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address field.';
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address 2 field.';
                }
                field("Vendor Post Code"; Rec."Vendor Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Post Code field.';
                }
                field("Primary E-mail"; Rec."Primary E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary E-mail field.';
                }
                field("Vendor City"; Rec."Vendor City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor City field.';
                }
                field("Project Delivery Strategy"; Rec."Project Delivery Strategy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Delivery Strategy field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Tender Date"; Rec."Tender Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Date field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field("Award Date"; Rec."Award Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Date field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Award Tend Sum Inc Taxes (LCY)"; Rec."Award Tend Sum Inc Taxes (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tend Sum Inc Taxes (LCY) field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End  Date"; Rec."Project End  Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End  Date field.';
                }
                field("Defect Liability Start Date"; Rec."Defect Liability Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defect Liability Start Date field.';
                }
                field("Defect Liability End Date"; Rec."Defect Liability End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defect Liability End Date field.';
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
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer Name field.';
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Representative No. field.';
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Representative Name field.';
                }
                field("Implementing Agency ID"; Rec."Implementing Agency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implementing Agency ID field.';
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
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Funding Agency No."; Rec."Funding Agency No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Agency No. field.';
                }
                field("Funder Name"; Rec."Funder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder Name field.';
                }
                field("Funder Address"; Rec."Funder Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder Address field.';
                }
                field("Funder Address 2"; Rec."Funder Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder Address 2 field.';
                }
                field("Funder Post Code"; Rec."Funder Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder Post Code field.';
                }
                field("Funder City"; Rec."Funder City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder City field.';
                }
                field("Funder County"; Rec."Funder County")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder County field.';
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
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
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
                field("Project Site Description"; Rec."Project Site Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Site Description field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End  Chainage"; Rec."End  Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End  Chainage field.';
                }
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Point Longitude field.';
                }
                field("Start  Point Latitude"; Rec."Start  Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start  Point Latitude field.';
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Point Latitude field.';
                }
                field("End  Point Longitude"; Rec."End  Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End  Point Longitude field.';
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

