#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50034 "Legal Declarations Register"
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "PF Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Name of Staff"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                Customers.Reset;
                Customers.SetRange("No.", "Institution Code");
                if Customers.FindSet then begin
                    "Institution Name" := Customers.Name;

                end;
            end;
        }
        field(6; "Institution Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Job Group"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Designation; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Male,Female,Other';
            OptionMembers = Male,Female,Other;
        }
        field(10; "Process Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Wealth Management,Gift Management,Legal Advice,Corruption Prevention Voucher,Lease Agreement,Memorandum of Understanding  ,Conflict of Interest,Gifts Given';
            OptionMembers = " ","Wealth Management","Gift Management","Legal Advice","Corruption Prevention Voucher","Lease Agreement","Memorandum of Understanding  ","Conflict of Interest","Gifts Given";
        }
        field(11; "Entity Giving"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Value of Gift"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Purpose of Gift"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date of Gift"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; Decision; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'For Officer,For Organization,To be Returned';
            OptionMembers = "For Officer","For Organization","To be Returned";
        }
        field(17; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Reference No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact."No.";

            trigger OnValidate()
            begin
                Contact.Reset;
                Contact.SetRange("No.", "Reference No");
                if Contact.FindSet then begin
                    "Entity Giving" := Contact.Name;
                end;
            end;
        }
        field(22; "Assigned Legal Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(23; "Legal Advice"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Legal Advice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Active,Submitted,Assigned,Escalated,Closed,Pending Verdict';
            OptionMembers = Active,Submitted,Assigned,Escalated,Closed,"Pending Verdict";
        }
        field(26; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(27; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                Email := Employee."E-Mail";
            end;
        }
        field(28; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "No. of Officers Prosecuted"; Integer)
        {
            CalcFormula = count("Hr Case Witness" where("Action Taken" = const(Prosecuted)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "No. of Officers Convicted"; Integer)
        {
            CalcFormula = count("Hr Case Witness" where("Action Taken" = const(Convicted)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "No. of Cases Reffered for Adm"; Integer)
        {
            CalcFormula = count("Hr Case Witness" where("Action Taken" = const("Referred For Administrative Action")));
            Caption = 'No. of Cases Referred for Administrative Action';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Value of Assets/Money Lost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Value of Assets/Money Recovere"; Decimal)
        {
            Caption = 'Value of Assets/Money Recovered';
            DataClassification = ToBeClassified;
        }
        field(34; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                // YearCodes.RESET;
                // YearCodes.SETRANGE(Code,"Financial Year Code");
                // IF YearCodes.FINDSET THEN
                //  BEGIN
                //    "Start Date":=YearCodes."Starting Date";
                //    "End Date":=YearCodes."Ending Date";
                //  END;
            end;
        }
        field(35; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Legal Advise"; Text[2000])
        {
            Caption = 'Decision';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Legal Advice Date" := Today;
            end;
        }
        field(37; "Assigned Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(38; "Assigned User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID" where("Legal Officer" = const(true));

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "Assigned User ID");
                if UserSetup.FindSet then
                    "Assigned Legal Officer" := UserSetup."Employee No.";
                "Assigned Employee Name" := UserSetup."Employee Name"
            end;
        }
        field(39; "No. Declared"; Integer)
        {
            CalcFormula = count("Legal Declarations Lines" where("Submission Status" = const(Declared),
                                                                  No = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "No. Not Declared"; Integer)
        {
            CalcFormula = count("Legal Declarations Lines" where("Submission Status" = const("Not Declared"),
                                                                  No = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Total No. of Employees"; Integer)
        {
            CalcFormula = count("Legal Declarations Lines" where(No = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Regulation/Act Involved"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(43; Period; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Legal Declaration Period".Code where(Closed = const(false));
        }
        field(44; Category; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Legal Advice Categories".Code where(Blocked = const(false));
        }
        field(45; Comments; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Declaration Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',CUE Staff,Institution';
            OptionMembers = ,"CUE Staff",Institution;
        }
        field(47; "Declaration Start  Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Declaration End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Declaration Sub-Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry,Exit,Biennial';
            OptionMembers = ,Entry,"Exit",Biennial;
        }
        field(50; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(51; Email; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(52; "Remarks Of Authorizing"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Retain,Surrender';
            OptionMembers = " ",Retain,Surrender;
        }
        field(53; "Advise With Instructions"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // Wealth Management
        if "Process Type" = "process type"::"Wealth Management" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Declarations Nos");
                         rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Declarations Nos", WorkDate(), true);
            end;
        end;
        // Gift Management
        if "Process Type" = "process type"::"Gift Management" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Gifts Receiving Nos");
           rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Gifts Receiving Nos", WorkDate(), true);
            end;
        end;
        // Legal Advice
        if "Process Type" = "process type"::"Legal Advice" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Legal Advice Nos");
              rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Legal Advice Nos", WorkDate(), true);
            end;
        end;
        // Corruption Prevention Voucher
        if "Process Type" = "process type"::"Corruption Prevention Voucher" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Corruption Prevention Vchr Nos");
                 rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Corruption Prevention Vchr Nos", WorkDate(), true);
            end;
        end;
        // Lease Agreement
        if "Process Type" = "process type"::"Lease Agreement" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Lease Agreement");
             rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Lease Agreement", WorkDate(), true);
            end;
        end;
        // Memorandum of Understanding
        if "Process Type" = "process type"::"Memorandum of Understanding  " then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("MOU Nos");
                rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."MOU Nos", WorkDate(), true);
            end;
        end;
        // Conflict of Interest
        if "Process Type" = "process type"::"Conflict of Interest" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Conflict of Interest Nos");
                  rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Conflict of Interest Nos", WorkDate(), true);
            end;
        end;
        // Gifts Given
        if "Process Type" = "process type"::"Gifts Given" then begin
            if No = '' then begin
                CrmGeneralSetup.Get;
                CrmGeneralSetup.TestField("Gifts Given Nos");
                     rec."No" := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Gifts Given Nos", WorkDate(), true);
            end;
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created Time" := Time;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then
            if UserSetup."Portal User" = false then begin
                "Employee No" := UserSetup."Employee No.";
                "Employee Name" := UserSetup."Employee Name";
                Description := Format("Process Type");
            end;
    end;

    var
        CrmGeneralSetup: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        Customers: Record Customer;
        Contact: Record Contact;
        Employee: Record Employee;


    procedure FnSendEmailLegalAdviceSubmitUser(LegalDecl: Record "Legal Declarations Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
    begin

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        Employee.Reset;
        Employee.SetRange("No.", "Employee No");
        if Employee.FindSet then
            RequesterEmail := Employee."Company E-Mail";
        RequesterName := "Employee Name";

        Window.Open('Notifying...');

        WindowisOpen := true;




        //Create message
        if CompInfo."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CompanyDetails := 'Dear ,' + RequesterName + '';
        SenderMessage := '<BR>Please Note that Your ' + Format("Process Type") + ' request has been successfully submitted</BR> Below are the' +
        'Details:-' + '<BR></BR>';
        SupplierDetails := '<BR><b>' + Format("Process Type") + ' No: </b>' + No + '</BR>';
        LoginDetails := '<BR>' + '<b>Description </b>' + Description + '</BR>';
        // ActivationDetails:='<BR>On';
        // ProcNote:='Plea';

        emailhdr := Format("Process Type") + '( No:' + No + ')';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

        // //cu400.AddCC(RequesterEmail);

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmailLegalAdviceSubmitLegalOfficer(LegalDecl: Record "Legal Declarations Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
    begin

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        CrmGeneralSetup1.Get;
        Employee.Reset;
        Employee.SetRange("No.", "Employee No");
        if Employee.FindSet then
            RequesterEmail := CrmGeneralSetup1."Head of Legal Email";
        RequesterName := 'Sir/Madam';

        Window.Open('Notifying...');

        WindowisOpen := true;




        //Create message
        if CompInfo."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CompanyDetails := 'Dear ,' + RequesterName + '';
        SenderMessage := '<BR>Please Note that a ' + Format("Process Type") + ' has been successfully sent for Your Action</BR> Below are the' +
        'Details:-' + '<BR>';
        SupplierDetails := '<BR><b>' + Format("Process Type") + ' No: </b>' + No + '</BR>';
        LoginDetails := '<BR>' + '<b>Description </b>' + Description + '</BR>';
        ActivationDetails := '<BR>Kindly Login into the System and act on the ' + Format("Process Type");
        // ProcNote:='Plea';

        emailhdr := Format("Process Type") + '( No:' + No + ')';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

        // cu400.AddCC(CrmGeneralSetup1."Legal Department  Email");

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmailLegalAdviceAssignedUser(LegalDecl: Record "Legal Declarations Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
    begin

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        Employee.Reset;
        Employee.SetRange("No.", "Employee No");
        if Employee.FindSet then
            RequesterEmail := Employee."Company E-Mail";
        RequesterName := "Employee Name";

        Window.Open('Notifying...');

        WindowisOpen := true;




        //Create message
        if CompInfo."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CompanyDetails := 'Dear ,' + RequesterName + '';
        SenderMessage := '<BR>Your ' + Format("Process Type") + ' request has been successfully Assigned to a legal Officer</BR></BR>';
        // SupplierDetails:='<BR><b>'+FORMAT("Process Type")+ ' No: </b>'+No+'</BR>';
        // LoginDetails:='<BR>'+'<b>Description </b>'+Description+'</BR>';
        // ActivationDetails:='<BR>On';
        // ProcNote:='Plea';

        emailhdr := Format("Process Type") + '( No:' + No + ')';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

        //cu400.AddCC(RequesterEmail);

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmailLegalAdviceAssignedLegalOfficer(LegalDecl: Record "Legal Declarations Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
    begin

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        CrmGeneralSetup1.Get;
        Employee.Reset;
        Employee.SetRange("No.", "Assigned Legal Officer");
        if Employee.FindSet then
            RequesterEmail := Employee."Company E-Mail";

        RequesterName := 'Sir/Madam';

        Window.Open('Notifying...');

        WindowisOpen := true;




        //Create message
        if CompInfo."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CompanyDetails := 'Dear ,' + RequesterName + '';
        SenderMessage := '<BR>Please Note that a ' + Format("Process Type") + ' request has been successfully Assigned for Your Action</BR> Below are the' +
        'Details:-' + '<BR></BR>';
        SupplierDetails := '<BR><b>' + Format("Process Type") + ' No: </b>' + No + '</BR>';
        LoginDetails := '<BR></BR>';
        ActivationDetails := '<BR>Kindly Login into the System and act on the ' + Format("Process Type");
        // ProcNote:='Plea';

        emailhdr := Format("Process Type") + '( No:' + No + ')';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

        // //cu400.AddCC(RequesterEmail);

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmailLegalAdviceFedbackUser(LegalDecl: Record "Legal Declarations Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
    begin

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        CrmGeneralSetup1.Get;


        Employee.Reset;
        Employee.SetRange("No.", "Employee No");
        if Employee.FindSet then
            RequesterEmail := Employee."Company E-Mail";
        RequesterName := "Employee Name";
        CustEmail := CrmGeneralSetup1."Head of Legal Email";
        Window.Open('Notifying...');

        WindowisOpen := true;




        //Create message
        if CompInfo."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CompanyDetails := 'Dear ,' + RequesterName + '';
        SenderMessage := '<BR>Your ' + Format("Process Type") + ' request has been successfully responded to with the following advice</BR></BR>';
        // SupplierDetails:='<BR><b>'+FORMAT("Process Type")+ ' No: </b>'+No+'</BR>';
        //LoginDetails:='<BR>'+''+Description+''+Comments+'</BR>';
        LoginDetails := 'BR' + '' + "Legal Advice" + 'BR';
        ActivationDetails := '<BR><BR>';
        // ProcNote:='Plea';

        emailhdr := Format("Process Type") + '( No:' + No + ')';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

        // cu400.AddCC(CustEmail);

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmailLegalAdviceCloseLegalUser(LegalDecl: Record "Legal Declarations Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Employee: Record Employee;
        CrmGeneralSetup1: Record "Crm General Setup.";
    begin

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        CrmGeneralSetup1.Get;


        Employee.Reset;
        Employee.SetRange("No.", "Employee No");
        if Employee.FindSet then
            RequesterEmail := Employee."Company E-Mail";
        RequesterName := "Employee Name";
        CustEmail := CrmGeneralSetup1."Head of Legal Email";
        Window.Open('Notifying...');

        WindowisOpen := true;




        //Create message
        if CompInfo."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CompanyDetails := 'Dear ,' + RequesterName + '';
        SenderMessage := '<BR>Your ' + Format("Process Type") + ' request has been closed successfully</BR></BR>';
        // SupplierDetails:='<BR><b>'+FORMAT("Process Type")+ ' No: </b>'+No+'</BR>';
        LoginDetails := '<BR>' + '' + "Legal Advice" + ' ' + Comments + '</BR>';
        ActivationDetails := '<BR>Regard<BR>';
        // ProcNote:='Plea';

        emailhdr := Format("Process Type") + '( No:' + No + ')';

        // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

        // cu400.AddCC(CustEmail);

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;
}

