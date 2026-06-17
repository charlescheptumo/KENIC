report 50061 "Email All Payslips"
{
    Caption = 'Email Payslips';
    ProcessingOnly = true;
    ApplicationArea = All;
    dataset
    {
        dataitem(Integer; "Integer")
        {

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1);
            end;

            trigger OnAfterGetRecord()
            begin
                if PeriodFilter = 0D then Error('Please enter a period filter');
                if not Confirm(StrSubstNo('Do you want to email pay slips for the pay period %1 to the employee? %2', Format(PeriodFilter), Format(Emp.FullName()))) then
                    exit;

                Emp.Reset();
                Emp.SetRange(Status, Emp.Status::Active);
                if PayrollNo <> '' then
                    Emp.SetRange("No.", PayrollNo);
                if Emp.FindSet() then
                    repeat
                        AssMat.Reset();
                        AssMat.SetRange("Employee No", Emp."No.");
                        AssMat.SetRange("Payroll Period", PeriodFilter);
                        if AssMat.FindFirst() then begin
                            Clear(RecRef);
                            Employee2.Reset();
                            Employee2.SetRange("No.", Emp."No.");
                            Employee2.FindFirst();
                            Employee2.SetFilter("Pay Period Filter", '=%1', PeriodFilter);
                            RecRef.GetTable(Employee2);
                            if Emp."Company E-Mail" = '' then
                                Error('Please add an employee email for employee %1', Emp."No.");
                            Recepient := Emp."Company E-Mail";
                            Subject := 'Payslip ==> ' + 'Employee No: ' + Emp."No." + ' ' + Format(PeriodFilter, 0, '<Month Text> <year4>') + ' Payslip';
                            Body := 'Dear ' + Emp."First Name" + ',<br>';
                            Body += '<br> Please find attached your payslip for ' + Format(PeriodFilter, 0, '<Month Text> <year4>');
                            Body += '<br> <br> Kind Regards, <br>';
                            Body += '<br> Human Capital. <br>';
                            Body += '<br> Kenya Institute of Curriculum Development';

                            if Emp."ID Number" = '' then
                                Error('Please add the ID Number for Employee %1', Emp.FullName());
                            Password := Emp."ID Number";

                            EmailMessage.Create(Recepient, Subject, Body, true);
                            TempBlob.CreateOutStream(OuStr);
                            Report.SaveAs(Report::"1 Page Payslip", '', ReportFormat::Pdf, OuStr, RecRef);
                            TempBlob.CreateInStream(InStr);
                            Filename := Emp."First Name" + '''s Payslip for ' + Format(PeriodFilter, 0, '<Month Text> <year4>') + '.pdf';

                            EmailMessage.AddAttachment(Filename, 'PDF', Instr);


                            Email.Send(EmailMessage, "Email Scenario"::Default);
                        end;
                    until Emp.Next() = 0;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(PayrollNo; PayrollNo)
                    {
                        ApplicationArea = all;
                        Caption = 'Payroll No.';
                        TableRelation = Employee."No.";
                        ToolTip = 'Specifies the value of the Payroll No. field.';
                    }
                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = all;
                        Caption = 'Period Filter';
                        TableRelation = "Payroll PeriodX"."Starting Date";
                        ToolTip = 'Specifies the value of the Period Filter field.';
                    }
                    field(PostingGroup; PostingGroup)
                    {
                        ApplicationArea = all;
                        Caption = 'Posting Group';
                        TableRelation = "Employee Posting GroupX";
                        ToolTip = 'Specifies the value of the Posting Group field.';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        Instr: InStream;
        Oustr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        Emp: Record Employee;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recepient: Text[100];
        Subject: Text;
        Filename, Body : Text;
        PayrollNo: Code[20];
        PeriodFilter: Date;
        PostingGroup: Code[20];
        AssMat: Record "Assignment Matrix-X";
        RecRef: RecordRef;
        Employee2: Record Employee;
        BaseCalendar: Record "Base Calendar Change";
        Password: Text[2048];
        AzureAuth: Codeunit "Azure Functions Authentication";
        AzureFunc: Codeunit "Azure Functions";
        Auth: Interface "Azure Functions Authentication";
        Response: Codeunit "Azure Functions Response";
        Query: Dictionary of [Text, Text];
        Result: Text;
        AzureUrl: Text;
        AzureAuthCode: Text;
        RequestContent: Text;
        ResponseContent: Text;
        PasswordProtectedPdfStream: InStream;
        BaseUrl: Text;

        Content: HttpContent;
        ResponseMessage: HttpResponseMessage;
        Url: Text;
        pdftext: Text;
        Base64Convert: Codeunit "Base64 Convert";
        HttpClient: HttpClient;
        Context: HttpContent;
        ResponseMsg: HttpResponseMessage;
        RequestMsg: HttpRequestMessage;
        TestUrl: Text;
        Pass1: Text;
        Pass2: Text;
}
