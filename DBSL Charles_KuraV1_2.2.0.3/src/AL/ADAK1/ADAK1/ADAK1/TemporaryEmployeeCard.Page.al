#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69095 "Temporary Employee Card"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Employee";
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
                          CurrPage.UPDATE;*/ //commented by morris during upgrade

                    end;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the City field.';
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     NotBlank = true;
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Posting Group field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
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
                field("Payroll Pay Mode"; Rec."Payroll Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Pay Mode field.';
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
                field("Social Security No."; Rec."Social Security No.")
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
                field("Taxable Allowance"; Rec."Taxable Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable Allowance field.';
                }
                field("Total Allowances"; Rec."Total Allowances")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Allowances field.';
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Deductions field.';
                }
                field("Total Gratuity Amount"; Rec."Total Gratuity Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Gratuity Amount field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field(Present; Rec.Present)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Present field.';
                }
                field(Halt; Rec.Halt)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Halt field.';
                }
                field(Previous; Rec.Previous)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project';
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field(Basic; Rec.Basic)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic field.';
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Primary Bank %"; Rec."Primary Bank %")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary Bank % field.';
                    }
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
                    field("Bank 2 %"; Rec."Bank 2 %")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank 2 % field.';
                    }
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
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = Basic;
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
                field("Send Payslip By E-mail?"; Rec."Send Payslip By E-mail?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Payslip By E-mail? field.';
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alt. Address Code field.';
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alt. Address Start Date field.';
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alt. Address End Date field.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Date field.';
                }
                field("Employement Terms"; Rec."Employement Terms")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employement Terms field.';
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
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Termination Date field.';
                }
                field("Reason for termination Code"; Rec."Reason for termination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grounds for Term. Code field.';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Emplymt. Contract Code field.';
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statistics Group Code field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
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
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
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
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash per Leave Day field.';
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash - Leave Earned field.';
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
                    ToolTip = 'Specifies the value of the Leave Type Filter field.';
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Period Filter field.';
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Leave field.';
                }
            }
            group("Update Employee Details")
            {
                Caption = 'Update Employee Details';
                field(overtimehrs; overtimehrs)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 1.5';
                    ToolTip = 'Specifies the value of the Overtime 1.5 field.';
                }
                field(overtimehrs2; overtimehrs2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 2.0';
                    ToolTip = 'Specifies the value of the Overtime 2.0 field.';
                }
                field(lostdays2; lostdays2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Lost Days';
                    ToolTip = 'Specifies the value of the Lost Days field.';
                }
                field(leavedays; leavedays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days';
                    ToolTip = 'Specifies the value of the Leave Days field.';
                }
                field("insurance Relief2"; "insurance Relief2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Relief';
                    ToolTip = 'Specifies the value of the Insurance Relief field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
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
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    //RunObject = Page "Default Dimensions";
#pragma warning disable AL0171
                    //  RunPageLink = "Table ID"=const(5200),
                    //    "No."=field("No.");
#pragma warning restore AL0171
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the &Picture action.';
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Alternative Addresses action.';
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Relatives action.';
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Mi&sc. Article Information action.';
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Confidential Information action.';
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Q&ualifications action.';
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the A&bsences action.';
                }
                separator(Action23)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                    ToolTip = 'Executes the Absences by Ca&tegories action.';
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                    ToolTip = 'Executes the Misc. Articles &Overview action.';
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'Executes the Co&nfidential Info. Overview action.';
                }
                separator(Action61)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'Executes the Online Map action.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
            }
        }
        area(creation)
        {
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Assign Default Earn/Ded action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    UserSetup.Get(UserId);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        PayDateP := PayPeriod."Starting Date";

                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        //Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Insert then;
                            until Earnings.Next = 0;
                        end;
                    end;

                    // Deducton
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        PayDateP := PayPeriod."Starting Date";
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);
                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Insert then;
                            until Ded.Next = 0;
                        end;
                        //MESSAGE('Defauts assigned to %1 period',PayPeriod."Starting Date");
                    end;
                end;
            }
            action("Assign Earnings")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Earnings';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Assign Earnings action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        Earnings.SetRange(Earnings."Basic Salary Code", true);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;
                    end;


                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        // Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;
                    end;

                    AssMatrix.Reset;
                    AssMatrix.SetRange("Employee No", Rec."No.");
                    AssMatrix.SetRange(Type, AssMatrix.Type::Payment);
                    AssMatrix.SetRange(Closed, false);
                    Page.Run(69098, AssMatrix);
                end;
            }
            action("Assign Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Deductions';
                Ellipsis = true;
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Assign Deductions action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        // Deducton
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);
                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Ded.Next = 0;
                        end;
                        //MESSAGE('Defauts assigned to %1 period',PayPeriod."Starting Date");
                    end;
                    AssMatrix.Reset;
                    AssMatrix.SetRange("Employee No", Rec."No.");
                    AssMatrix.SetRange(Type, AssMatrix.Type::Deduction);
                    AssMatrix.SetRange(Closed, false);
                    Page.Run(69098, AssMatrix);
                end;
            }
            action("&Generate Payslip")
            {
                ApplicationArea = Basic;
                Caption = '&Generate Payslip';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Generate Payslip action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    EmployeeRec.SetRange(EmployeeRec."Pay Period Filter", CurrentMonth);
                    Report.Run(69401, true, false, EmployeeRec);
                end;
            }
            action("&Employee Statement")
            {
                ApplicationArea = Basic;
                Caption = '&Employee Statement';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Employee Statement action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    Report.Run(69407, true, false, EmployeeRec);
                end;
            }
            separator(Action1000000046)
            {
            }
            action("&Run Emp Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Emp Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Run Emp Payroll action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateRedemptionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange("No.", Rec."No.");
                    EmployeeRec.SetRange("Pay Period Filter", CurrentMonth);
                    Report.Run(69400, true, false, EmployeeRec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");

        Rec.SetRange("No.");

        /*
         IF "Terminal Dues Paid?"=TRUE THEN
         CurrPage."Terminal Dues Paid?".Enabled(FALSE)
         ELSE
          CurrPage."Terminal Dues Paid?".ENABLED(TRUE);
        */

    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        //Rec."Responsibility Center" := UserSetup."Responsibility Center";
        Rec."Global Dimension 1 Code" := UserSetup."Responsibility Center";
        Rec."Global Dimension 1 Code" := UserSetup."Responsibility Center";
    end;

    trigger OnModifyRecord(): Boolean
    begin

        //Rec."Responsibility Center" := UserSetup."Responsibility Center";
        Rec."Global Dimension 1 Code" := UserSetup."Responsibility Center";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Pays tax?" := true;

        //Rec."Responsibility Center" := UserSetup."Responsibility Center";
        Rec."Global Dimension 1 Code" := UserSetup."Responsibility Center";
        Rec."Global Dimension 1 Code" := UserSetup."Responsibility Center";
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if not MapMgt.TestSetup then
            MapPointVisible := false;

        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        //[InDataSet]
        MapPointVisible: Boolean;
        PayPeriod: Record "Payroll PeriodXT";
        CurrentMonth: Date;
        UserSetup: Record "User Setup";
        AssMatrix2: Record "Assignment Matrix-X Temp-E";
        AssMatrix3: Record "Assignment Matrix-X Temp-E";
        Mail: Codeunit Mail;
        EmployeeRec: Record "Temporary Employee";
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        Earnings: Record "EarningsX Temp-E";
        Ded: Record "DeductionsX Temp-E";
        AssMatrix: Record "Assignment Matrix-X Temp-E";
        SalaryPointer: Record "Salary Pointers";
        assm: Record "Assignment Matrix-X Temp-E";
        i: Integer;
        OT: Decimal;
        LE: Decimal;
        BA: Decimal;
        overtimehrs: Integer;
        leavedays: Integer;
        OT2: Decimal;
        overtimehrs2: Integer;
        payperiod2: Date;
        sals: Record "Assignment Matrix-X Temp-E";
        empp: Record "Temporary Employee";
        someform: Page "Temporary Employee Card";
        text: Text[250];
        lostdays2: Integer;
        LD: Decimal;
        "insurance Relief2": Decimal;
        "insurance Reliefcalc": Decimal;
        PayrollRun: Report "Payroll Run Temp";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
        EmpTrans: Record "Employee Transfers";
        Emp: Record "Temporary Employee";
        PayDateP: Date;
}

