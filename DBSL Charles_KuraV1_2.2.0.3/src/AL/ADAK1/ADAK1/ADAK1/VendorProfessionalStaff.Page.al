#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75037 "Vendor Professional Staff"
{
    PageType = List;
    SourceTable = "Vendor Professional Staff";
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Staff Number"; Rec."Staff Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Number field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field(Proffesion; Rec.Proffesion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proffesion field.';
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Designation field.';
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
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("Citizenship Type"; Rec."Citizenship Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship Type field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
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
                field("Joining Date"; Rec."Joining Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Joining Date field.';
                }
                field("Years With the Firm"; Rec."Years With the Firm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years With the Firm field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Vendor Staff Qualification")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Qualification";
                ToolTip = 'Executes the Vendor Staff Qualification action.';
                //   RunPageLink = "Staff Id"=field("Entry No.");
            }
            action("Vendor Staff Experience")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Experience";
                ToolTip = 'Executes the Vendor Staff Experience action.';
                //RunPageLink = "Staff ID"=field("Entry No.");
            }
            action("Vendor Staff Employment")
            {
                ApplicationArea = Basic;
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Employment";
                ToolTip = 'Executes the Vendor Staff Employment action.';
                // RunPageLink = "Staff ID"=field("Entry No.");
            }
        }
    }
}

