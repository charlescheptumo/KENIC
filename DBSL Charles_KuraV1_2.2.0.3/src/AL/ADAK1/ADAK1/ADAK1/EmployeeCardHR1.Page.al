#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69146 "Employee Card-HR1"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Employee;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';

                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                          */

                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name/Initials';
                    ToolTip = 'Specifies the value of the Middle Name/Initials field.';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initials field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
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
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
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
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Gender; Rec.Gender1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender1 field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region ';
                    ToolTip = 'Specifies the value of the Region  field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3"; Rec."Shortcut Dimension 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Picture; Rec.Image)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field(CEO; Rec.CEO)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CEO field.', Comment = '%';
                }
                field("Regional Manager"; Rec."Regional Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Manager field.';
                }
                field("Committee Member"; Rec."Committee Member")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committee Member field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("ICT Help Desk Admin"; Rec."ICT Help Desk Admin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Help Desk Admin field.';
                }
                field("Directorate Head"; Rec."Directorate Head")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division Head';
                    ToolTip = 'Specifies the value of the Division Head field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field(Workstation; Rec.Workstation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Alternative Station"; Rec."Alternative Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alternative Station field.';
                }
                field("Driver?"; Rec."Driver?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver? field.';
                }
                field("Fleet Admin"; Rec."Fleet Admin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fleet Admin field.';
                }
                field("Chief Executive Officer"; Rec."Chief Executive Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Executive Officer field.', Comment = '%';
                }
            }
            group("Organization Units")
            {
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Extension field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Pager; Rec.Pager)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pager field.';
                }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Email field.';
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Alt. Address Code field.';
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Alt. Address Start Date field.';
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Alt. Address End Date field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Ext. field.';
                }
            }
            group("Human Resource")
            {
                Caption = 'Human Resource';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Current Year"; CurrentYear)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the CurrentYear field.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Date field.';
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Promotion Date';
                    ToolTip = 'Specifies the value of the Last Promotion Date field.';
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Scheme Join Date';
                    ToolTip = 'Specifies the value of the Pension Scheme Join Date field.';
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Scheme Join Date';
                    ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Send Alert to field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Inactive Date"; Rec."Inactive Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inactive Date field.';
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cause of Inactivity Code field.';
                }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Type';
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Statistics Group Code field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Union Code field.';
                }
                field("Union Membership No."; Rec."Union Membership No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Union Membership No. field.';
                }
                field("Disciplinary status"; Rec."Disciplinary status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary status field.';
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Category field.';
                }
            }
            group("Disability Details")
            {
                Caption = 'Disability Details';
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability No."; Rec."Disability No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability No. field.';
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Description field.';
                }
                field("Renewal date/Expiry date"; Rec."Renewal date/Expiry date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal date/Expiry date field.';
                }
            }
            group("Separation Details")
            {

                field("Reason for termination"; Rec."Reason for termination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for termination field.';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Termination Date field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Separation Type"; Rec."Separation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation Type field.';
                }
                field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Interview Conducted field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Editable = ExitDateEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Editable = ExitByEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Done by field.';
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Re-Employment In Future field.';
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays tax? field.';
                }
                field("Pay Wages"; Rec."Pay Wages")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Wages field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("HELB No"; Rec."HELB No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HELB No field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                    ToolTip = 'Specifies the value of the N.S.S.F No. field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Birth Certificate Number";Rec."Birth Certificate Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Species the value of Birth Certificate';
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Posting Group field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Bank Account Number"; Rec."Bank Account Number")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account Number field.';
                    }
                    field("Employee's Bank"; Rec."Employee's Bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank field.';
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name field.';
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch field.';
                    }
                    field("Bank Branch Name"; Rec."Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name field.';
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Employee's Bank 2"; Rec."Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank 2 field.';
                    }
                    field("Bank Name 2"; Rec."Bank Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name 2 field.';
                    }
                    field("Bank Branch 2"; Rec."Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch 2 field.';
                    }
                    field("Bank Branch Name 2"; Rec."Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name 2 field.';
                    }
                    field("Bank Account No. 2"; Rec."Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account No. field.';
                    }
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Leave Days B/F"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Days B/F field.';
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total (Leave Days)';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total (Leave Days) field.';
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Recalled Leave"; Rec."Recalled Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recalled Leave field.';
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Acrued Leave Days field.';
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Status field.';
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Leave Type Filter field.';
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Leave Period Filter field.';
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Leave field.';
                }
                field("Use Leave Plan"; Rec."Use Leave Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Use Leave Plan field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "HR Employees Factbox")
            {
                Caption = '<Employees Factbox>';
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
           // part("Attached Documents"; "Doc. Attachment List Factbox")
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(5200), "No." = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Picture action.';
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Alternative Addresses action.';
                }
                action("&Next of Kin/Estate Administrator")
                {
                    ApplicationArea = Basic;
                    Caption = '&Next of Kin/Estate Administrator';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Next of Kin/Estate Administrator action.';
                }
                action("Notification on Contract Expiry")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notification on Contract Expiry';
                    Image = EmployeeAgreement;
                    RunObject = Report "Notice On Contract";
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Notification on Contract Expiry action.';
                }
                action("Staff Exit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Exit';
                    Image = Absence;
                    RunObject = Page "Staff Exit Card";
                    RunPageLink = "Employee No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Staff Exit action.';
                }
                action("Staff Reinstatement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Reinstatement';
                    Image = Employee;
                    RunObject = Page "Staff Reinstatement";
                    RunPageLink = "No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Staff Reinstatement action.';
                }
                // action("&Next Of Kin")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Next Of Kin';
                //     Image = Relatives;
                //     RunObject = Page "Employment History";
                //     RunPageLink = "Application No" = field("No.");
                //     Visible = false;
                // }
                // action("&Dependants")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Dependants';
                //     Image = Relatives;
                //     RunObject = Page "Professional Qualifications";
                //     RunPageLink = "Application No" = field("No.");
                //     Visible = false;
                // }
                // action("&Emergency Contacts")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Emergency Contacts';
                //     Image = ContactPerson;
                //     RunObject = Page "Apptitude Interview Lines";
                //     RunPageLink = "Line No" = field("No.");
                //     Visible = false;
                // }
                // action("Mi&sc. Article Information")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Mi&sc. Article Information';
                //     Image = Filed;
                //     RunObject = Page "Misc. Article Information";
                //     RunPageLink = "Employee No." = field("No.");
                //     Visible = false;
                // }
                // action("&Confidential Information")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Confidential Information';
                //     Image = Lock;
                //     RunObject = Page "Confidential Information";
                //     RunPageLink = "Employee No." = field("No.");
                //     Visible = false;
                // }
                // action("&Medical Info")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Medical Info';
                //     Image = Lock;
                //     RunObject = Page "Vacancy Media Advertisements";
                //     RunPageLink = "Entry No." = field("No.");
                //     Visible = false;
                // }
                // action("R&esponsibilities")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'R&esponsibilities';
                //     Image = Position;
                //     RunObject = Page "Manpower Planning Lines";
                //     RunPageLink = "Entry No" = field(Position);
                //     Visible = false;
                // }
                // action("Q&ualifications")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Q&ualifications';
                //     Image = Certificate;
                //     RunObject = Page "Employee Qualifications";
                //     RunPageLink = "Employee No." = field("No.");
                // }
                // action("Employment H&istory")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employment H&istory';
                //     Image = History;
                //     RunObject = Page "Oral Interview  List";
                //     RunPageLink = "Line No." = field("No.");
                //     Visible = false;
                // }
                // action("Employee Referees")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employee Referees';
                //     Image = History;
                //     RunObject = Page "Employee Referees";
                //     RunPageLink = Field8 = field("No.");
                //     Visible = false;
                // }
                // action("I&tems Assigned")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'I&tems Assigned';
                //     Image = CheckList;
                //     RunObject = Page "Oral Interview Card";
                //     RunPageLink = "Line No." = field("No.");
                //     Visible = false;
                // }
                // action("C&onfidential Info")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'C&onfidential Info';
                //     Image = ConfidentialOverview;
                //     RunObject = Page "Job Advertisement Templates";
                //     RunPageLink = Code = field("No.");
                //     Visible = false;
                // }
                // action("A&bsences")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'A&bsences';
                //     Image = Absence;
                //     RunObject = Page "Employee Absences";
                //     RunPageLink = "Employee No." = field("No.");
                //     Visible = false;
                // }
                // separator(Action23)
                // {
                // }
                // action("Absences by Ca&tegories")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Absences by Ca&tegories';
                //     Image = AbsenceCategory;
                //     RunObject = Page "Empl. Absences by Categories";
                //     RunPageLink = "No." = field("No."),
                //                   "Employee No. Filter" = field("No.");
                //     Visible = false;
                // }
                // action("Misc. Articles &Overview")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Misc. Articles &Overview';
                //     Image = FiledOverview;
                //     RunObject = Page "Misc. Articles Overview";
                //     Visible = false;
                // }
                // action("Co&nfidential Info. Overview")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Co&nfidential Info. Overview';
                //     Image = ConfidentialOverview;
                //     RunObject = Page "Confidential Info. Overview";
                //     Visible = false;
                // }
                // separator(Action61)
                // {
                // }
                // action("Online Map")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Online Map';
                //     Image = Map;
                //     Visible = false;

                //     trigger OnAction()
                //     begin
                //         DisplayMap;
                //     end;
                // }
                // action("Create Customer Imprest A/C")
                // {
                //     ApplicationArea = Basic;
                //     Enabled = ShowCust;
                //     Image = Customer;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     Visible = false;

                //     trigger OnAction()
                //     var
                //         Cust: Record Customer;
                //     begin
                //         if CreateCustomer then
                //             Message(Text000, 'Imprest A/C')
                //         else
                //             Message(Text001, 'Imprest A/C');
                //     end;
                // }
                // action("Create Resource A/C")
                // {
                //     ApplicationArea = Basic;
                //     Enabled = ShowResource;
                //     Image = Resource;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     Visible = false;

                //     trigger OnAction()
                //     begin
                //         if CreateResource then
                //             Message(Text000, 'Resource')
                //         else
                //             Message(Text001, 'Resource');
                //     end;
                // }
                // action(Attachments)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Attachments';
                //     Image = Attachments;
                //     Promoted = true;
                //     PromotedCategory = Category6;
                //     RunObject = Page "Applicant Referees";
                //     RunPageLink = "Job Application No" = field("No.");
                // }
                // action("Transfer Employee")
                // {
                //     ApplicationArea = Basic;
                //     Image = HRSetup;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;

                //     trigger OnAction()
                //     begin
                //         if Dialog.Confirm('Are you sure you want to stransfer %1 ?', true, "First Name" + ' ' + "Last Name") then begin
                //             Emp.Reset;
                //             Emp.SetRange("No.", "No.");
                //             Report.Run(69120, true, true, Emp);
                //             CurrPage.Close;
                //             EmpTrans.Reset;
                //             EmpTrans.SetRange("Employee No", "No.");
                //             Page.Run(69057, EmpTrans);
                //         end;
                //     end;
                // }
                // action("Transfer History")
                // {
                //     ApplicationArea = Basic;
                //     Image = History;
                //     Promoted = true;
                //     PromotedCategory = Process;

                //     trigger OnAction()
                //     begin
                //         EmpTrans.Reset;
                //         EmpTrans.SetRange("Employee No", "No.");
                //         Page.Run(69057, EmpTrans);
                //     end;
                // }
                action("Notify of Contract Expiry")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Notify of Contract Expiry action.';

                    // trigger OnAction()
                    // begin
                    //     TestField("Contract End Date");
                    //     if "Contract End Date" <> 0D then begin
                    //         if (Today - "Contract End Date") <= 180 then begin
                    //             if Emp.Get("No.") then begin
                    //                 Header := 'END OF CONTRACT NOTIFICATION ON ' + Format("Contract End Date");
                    //                 if SMTPSetup.Get() then begin
                    //                     SenderEmail := SMTPSetup."Email Sender Address";
                    //                     SenderName := SMTPSetup."Email Sender Name";
                    //                 end;
                    //                 if Emp."E-Mail" <> '' then begin
                    //                     //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('This is to notify you that your contract will be coming to an end on');// for the month of January 2014');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('Contract End Date: ' + Format("Contract End Date"));
                    //                     //SMTPMail.AddBodyline('<br>');
                    //                     //SMTPMail.AddBodyline('Kindly prepare adequately');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('Thanks & Regards');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline(SenderName);
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('<HR>');
                    //                     //SMTPMail.AddBodyline('This is a system generated mail.');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.Send;
                    //                 end;
                    //                 //End email
                    //             end;
                    //         end;
                    //     end;
                    // end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // ShowCust := Rec.CreateCustomer;
        // ShowResource := Rec.CreateResource;
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
        ExitDateEditable := true;
        ExitByEditable := true;
        CalculateDates;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Principal Accountant" = true then
                Error('You do not have permissions to create a new employee.Please contact ICT department');
        end;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        // ShowCust := Rec.CreateCustomer;
        // ShowResource := Rec.CreateResource;
        CalculateDates;
    end;

    var
       // [InDataSet]
        MapPointVisible: Boolean;
       // [InDataSet]
        ShowCust: Boolean;
       // [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
        //[InDataSet]
        ExitDateEditable: Boolean;
      //  [InDataSet]
        ExitByEditable: Boolean;
        Emp: Record Employee;
        EmpTrans: Record "Employee Transfers";
        CurrentYear: Integer;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        UserSetup: Record "User Setup";


    procedure Updatecontrols()
    begin

        if Rec."Exit Interview Conducted" = Rec."exit interview conducted"::Yes then begin
            ExitByEditable := true;
            ExitDateEditable := true;
        end else begin
            ExitByEditable := false;
            ExitDateEditable := false;
        end;
    end;

    local procedure CalculateDates()
    begin
        if Rec."Date Of Birth" <> 0D then
            Rec.Age := Format(Date2dmy(Today, 3) - Date2dmy(Rec."Date Of Birth", 3)) + ' Years';
        CurrentYear := Date2dmy(Today, 3);
    end;
}

