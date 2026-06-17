#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69055 "Employee List-HR"
{
    ApplicationArea = Basic;
    Caption = 'Employee List - HR';
    CardPageID = "Employee Card-HR1";
    Editable = false;
    PageType = List;
    SourceTable = Employee;
    //SourceTableView = where("Employee Category" = filter(Permanent));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(FullName; Rec.FullName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Directorate Head"; Rec."Directorate Head")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Head field.';
                }
                field(Workstation; Rec.Workstation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
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
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Date field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("HELB No"; Rec."HELB No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HELB No field.';
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch Name field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays tax? field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Disability No."; Rec."Disability No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability No. field.';
                }
                field("Renewal date/Expiry date"; Rec."Renewal date/Expiry date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal date/Expiry date field.';
                }

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
            }
        }
        area(factboxes)
        {
            part(Control3; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
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
            action(Test)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                Image = Account;
                ToolTip = 'Executes the Test action.';
                trigger OnAction()
                begin
                    NoticePeriodDeadline(Rec."No.");
                end;
            }
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
                    Visible = false;
                    ToolTip = 'Executes the Co&mments action.';
                }
                action("&Notice of Contract Expiry")
                {
                    ApplicationArea = All;
                    Caption = '&Notice of Contract Expiry', comment = 'NLB="YourLanguageCaption"';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = ContactPerson;
                    ToolTip = 'Executes the &Notice of Contract Expiry action.';

                    trigger OnAction()
                    var
                        Emp: Record Employee;
                    begin
                        Report.Run(50045, true, true, Emp);
                    end;
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        // RunObject = Page "Default Dimensions";
                        // RunPageLink = "Table ID" = const(5200),
                        //               "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        Visible = false;
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';

                        // trigger OnAction()
                        // var
                        //     Employee: Record Employee;
                        //     DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        // begin
                        //     CurrPage.SetSelectionFilter(Employee);
                        //     DefaultDimMultiple.SetMultiEmployee(Employee);
                        //     DefaultDimMultiple.RunModal;
                        // end;
                    }
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
                action("Co&nfidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Co&nfidential Information action.';
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
                    Visible = false;
                    ToolTip = 'Executes the A&bsences action.';
                }
                separator(Action51)
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
                    Visible = false;
                    ToolTip = 'Executes the Absences by Ca&tegories action.';
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                    Visible = false;
                    ToolTip = 'Executes the Misc. Articles &Overview action.';
                }
                action("Con&fidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    Visible = false;
                    ToolTip = 'Executes the Con&fidential Info. Overview action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // NoticePeriodDeadline(Rec."No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Principal Accountant" = true then
                Error('You do not have permissions to create a new employee.Please contact ICT department');
        end;
    end;

    trigger OnOpenPage()
    begin
        //NotifyofContractExpiry
        // NoticePeriodDeadline(Rec."No.");
    end;

    var
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        UserSetup: Record "User Setup";

    procedure NoticePeriodDeadline(EmpNo: Code[200])
    var
        Emp: Record Employee;
        Emai: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Recepient, Subject, Body : Text;
        Notice: Date;
    begin
        Emp.Reset();
        Emp.SetRange(Status, Rec.Status::Active);
        Emp.SetRange("No.", '2007041031');
        if Emp.FindSet then begin
            repeat
                // if (Format(Emp."Renewal date/Expiry date") - Format(Today)) < Format(Emp."Notice Period) then begin
                Notice := CalcDate('6M', Emp."Contract End Date");
                if (Notice < Today) or (Notice = Today) then begin
                    if Emp."E-Mail" = '' then
                        Error('Insert email for Employee %1', Rec."No.");
                    Recepient := Emp."E-Mail";
                    Subject := 'Notice Period Deadline';
                    Body += 'Dear ' + Emp.FullName + ',';
                    Body += '<br><br>This is an automated email to notify you that you are nearing the end of your employment contract.';
                    Body += '<br><br>Kind Regards,';
                    Body += '<br>The Human Resource Department.<br>';
                    Body += '<br>Anti-Doping Agency of Kenya.<br>';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    // Emai.Send(EmailMess, EmailScen::HR);
                    Emai.OpenInEditor(EmailMess, EmailScen::HR);
                end;
            until Emp.Next() = 0;
        end;
    end;

    local procedure NotifyofContractExpiry()
    var
        Emp: Record Employee;
    begin
        if Rec."Contract End Date" <> 0D then begin
            // if (Today - "Contract End Date") <= 180 then begin
            //     if Emp.Get("No.") then begin
            //         Header := 'END OF CONTRACT NOTIFICATION ON ' + Format("Contract End Date");
            //         if SMTPSetup.Get() then begin
            //             SenderEmail := SMTPSetup."Email Sender Address";
            //             SenderName := SMTPSetup."Email Sender Name";
            //         end;
            //         if Emp."E-Mail" <> '' then begin
            //             //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline('This is to notify you that your contract will be coming to an end on');// for the month of January 2014');
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline('Contract End Date: ' + Format("Contract End Date"));
            //             //SMTPMail.AddBodyline('<br>');
            //             //SMTPMail.AddBodyline('Kindly prepare adequately');
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline('Thanks & Regards');
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline(SenderName);
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline('<HR>');
            //             //SMTPMail.AddBodyline('This is a system generated mail.');
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
            //             //SMTPMail.AddBodyline('<br><br>');
            //             //SMTPMail.Send;
            //         end;
            //         //End email
            //     end;
            // end;
        end;
    end;
}

