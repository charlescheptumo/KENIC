#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69094 "Temporary Employees List"
{
    ApplicationArea = Basic;
    Caption = 'Temporary Employees List';
    CardPageID = "Temporary Employee Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Employee";
    SourceTableView = where ("Employee Category" = filter(Temporary));
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
                    Visible = true;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch field.';
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
                field("Staffing Group"; Rec."Staffing Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staffing Group field.';
                }
                field(Paypoint; Rec.Paypoint)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paypoint field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Employee's Bank"; Rec."Employee's Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee''s Bank field.';
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
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
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
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';

                        trigger OnAction()
                        var
                            Employee: Record "Temporary Employee";
#pragma warning disable AL0275
                        //    DefaultDimMultiple: Page "Default Dimensions-Multiple";
#pragma warning restore AL0275
                        begin
                            CurrPage.SetSelectionFilter(Employee);
                            //DefaultDimMultiple.SetMultiEmployee(Employee);
                            // DefaultDimMultiple.RunModal;
                        end;
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
                action("Con&fidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'Executes the Con&fidential Info. Overview action.';
                }
                action("Employee Salary Aging Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Employee Salary Aging Report action.';
                    //RunObject = Report "Std. Monthly E\D Comparison";
                }
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
                        if PayPeriod.Find('-') then begin
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
                                    AssMatrix."Responsibility Center" := PayPeriod."Responsibility Center";
                                    AssMatrix.Code := Earnings.Code;
                                    AssMatrix.Validate(Code);
                                    if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                        AssMatrix.Insert;
                                until Earnings.Next = 0;
                            end;







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
                                    AssMatrix."Responsibility Center" := PayPeriod."Responsibility Center";
                                    AssMatrix.Code := Ded.Code;
                                    AssMatrix.Validate(Code);
                                    if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                        AssMatrix.Insert;
                                until Ded.Next = 0;
                            end;

                        end;
                    end;
                    // if Confirm(Text000,false) then;
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
                        UserSetup.Get(UserId);
                        PayPeriod.Reset;
                        PayPeriod.SetRange(PayPeriod.Closed, false);
                        PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                        if PayPeriod.Find('-') then
                            CurrentMonth := PayPeriod."Starting Date";
                        EmployeeRec.SetRange("No.", Rec."No.");
                        EmployeeRec.SetRange("Pay Period Filter", CurrentMonth);
                        EmployeeRec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                        Report.Run(69400, true, false, EmployeeRec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    trigger OnInit()
    begin
        //UserSetup.GET(USERID);
        // // Rec.SetRange("Responsibility Center",UserSetup."Responsibility Center");
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        //Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
        //IF UserSetup."Interbank Amt Approval Limit"=FALSE THEN

        //ERROR('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
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
        EmpTrans: Record "Employee Transfers";
        Emp: Record "Temporary Employee";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
}

