#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69768 "Candidate Interview Line"
{
    PageType = ListPart;
    SourceTable = "Candidate Interview Line";
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
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Source Document No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview Start Time"; Rec."Interview Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Start Time field.';
                }
                field("Interview End Time"; Rec."Interview End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview End Time field.';
                }
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field("Interview Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Venue field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("Candidate Attendance Status"; Rec."Candidate Attendance Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Candidate Attendance Status field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Candidate Shortlist Voucher"; Rec."Candidate Shortlist Voucher")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Voucher field.';
                }
                field("Interview Panel Outcome"; Rec."Interview Panel Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Interview Panel Outcome field.';
                }
                field("Interview Panel Score %"; Rec."Interview Panel Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Interview Panel Score % field.';
                }
                field("Interview Panel Remarks"; Rec."Interview Panel Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Panel Remarks field.';
                }
                field("Unsuccesful Application Reason"; Rec."Unsuccesful Application Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unsuccesful Application Reason field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                // field("Mobile Phone No."; Rec."Mobile Phone No.")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                // field("Birth Date"; Rec."Birth Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Gender; Rec.Gender)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("ID Number"; Rec."ID Number")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Passport No."; Rec."Passport No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Tax Registration(PIN)"; Rec."Tax Registration(PIN)")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Marital Status"; Rec."Marital Status")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Religion; Rec.Religion)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Ethnic Group"; Rec."Ethnic Group")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Nationality; Rec.Nationality)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Specialization Area"; Rec."Specialization Area")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Academic Qualification Name"; Rec."Academic Qualification Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Highest Academic Pointer"; Rec."Highest Academic Pointer")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("General Work Experience Yrs"; Rec."General Work Experience Yrs")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Management Experience Yrs"; Rec."Management Experience Yrs")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Disability Code"; Rec."Disability Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Disabled; Rec.Disabled)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Disability Description"; Rec."Disability Description")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Disability Cert No."; Rec."Disability Cert No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Notified; Rec.Notified)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Notified On"; Rec."Notified On")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

