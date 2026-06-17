#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50036 "ICT Helpdesk Assign Expiry"
{
    WordLayout = './Layouts/ICTHelpdeskAssignExpiry.docx';
    DefaultLayout = Word;
    ApplicationArea = All;
    requestpage
    {
        SaveValues = false;
        layout
        {
        }

    }

    trigger OnPreReport()
    begin
        // ICTHelpdesk.
        // UserSetup
        ICTHelpdeskSetup.Get;
        ICTHelpdesk.Reset;
        ICTHelpdesk.SetRange(Status, ICTHelpdesk.Status::Assigned);
        //InsuranceReg.SETFILTER("Next Service Date",'<%1',TODAY);
        if ICTHelpdesk.FindSet then begin
            repeat
                NewDate := CalcDate(ICTHelpdeskSetup."Assigned Issue Duration", ICTHelpdesk."Assigned Date");
                if Today = NewDate then begin
                    // SMTPMailSetup.Get;
                    // CompInfo.Get;
                    // ;
                    // HRSetup.Get;
                    // UserSetup.Reset;
                    // UserSetup.SetRange("User ID", ICTHelpdesk."Assigned To");
                    // if UserSetup.FindSet then
                    //     RequesterEmail := UserSetup."E-Mail";
                    // RequesterName := UserSetup."Employee Name";
                    // //Window.OPEN('Sending...');
                    // //WindowisOpen := TRUE;
                    // //Create message
                    // // if SMTPMailSetup."Email Sender Address" = '' then
                    // //     Error('Please Contact the IT Admin to specify the E-mail address under SMTP Setup page!!');
                    // // SenderAddress := SMTPMailSetup."Email Sender Address";
                    // // CustEmail := ProcurementSetup."Head of Supply Chain Email";
                    // CompanyDetails := 'Dear Sir/Madam,';
                    // SenderMessage := '<BR>You are required to attend to the ICT Helpdesk issues: ' + ICTHelpdesk."Job No." + ' _ ' + ICTHelpdesk."Description of the issue" + ' that was assigned to you on' + Format(ICTHelpdesk."Assigned Date") + '</BR>';
                    // SupplierDetails := '';
                    // LoginDetails := 'Regards';
                    // ProcNote := '<BR> If you require any assistance, please contact your system administrator';
                    // //EvaluationRegister.RESET;
                    // //EvaluationRegister.SETRANGE(Code,evaluationHeaader.Code);
                    // //IF EvaluationRegister.FINDSET THEN
                    // //FileDirectory :=  'C:\DOCS\';
                    // //FileName := 'BidEvaluation_'+evaluationHeaader.Code+'.pdf';
                    // // REPORT.SAVEASPDF(70042,FileDirectory+FileName,EvaluationRegister);
                    // if CustEmail = '' then
                    //     exit;
                    // //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                    // emailhdr := 'ICT Helpdesk(' + ICTHelpdesk."Job No." + '::' + ICTHelpdesk."Description of the issue" + ')';
                    // cu400.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                    // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true);
                    // cu400.AddCC(RequesterEmail);
                    // cu400.AppendBody(ProcNote);
                    // //cu400.AddAttachment(FileDirectory+FileName,FileName);
                    // cu400.Send;
                    // SendingDate := Today;
                    // SendingTime := Time;
                    // //SLEEP(1000);
                    // //Window.CLOSE;
                end;
            until ICTHelpdesk.Next = 0;
        end;
        ;
        ReportsForNavPre;

    end;

    var
        InsCoverageLedgerEntry: Record "Ins. Coverage Ledger Entry";
        InsuranceReg: Record "Fixed Asset";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        ProcurementSetup: Record "Procurement Setup";
        NotificationDate: Date;
        NewDate: Date;
        // SMTPMailSetup: Record "SMTP Mail Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        ICTHelpdeskSetup: Record "ICT Helpdesk Global Parameters";

    trigger OnInitReport();
    begin
        ;
        ReportsForNavInit;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //// ReportForNav: Codeunit "ForNAV Report Management";
        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;

    local procedure ReportsForNavInit()
    var
        id: Integer;
        FormatRegion: Text;
    begin
        Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1));
        // ReportForNav.OnInit(id);
    end;

    local procedure ReportsForNavPre()
    begin
    end;

    local procedure ReportForNavSetTotalsCausedBy(value: Integer)
    begin
        ReportForNavTotalsCausedBy := value;
    end;

    local procedure ReportForNavSetShowOutput(value: Boolean)
    begin
        ReportForNavShowOutput := value;
    end;

    local procedure ReportForNavInit(jsonObject: JsonObject)
    begin
        // // ReportForNav.Init(jsonObject, CurrReport.ObjectId);
    end;

    local procedure ReportForNavWriteDataItem(dataItemId: Text; rec: Variant): Text
    var
        values: Text;
        jsonObject: JsonObject;
        currLanguage: Integer;
    begin
        if not ReportForNavInitialized then begin
            ReportForNavInit(jsonObject);
            ReportForNavInitialized := true;
        end;

        case (dataItemId) of
        end;
        // // ReportForNav.AddDataItemValues(jsonObject, dataItemId, rec);
        jsonObject.WriteTo(values);
        exit(values);
    end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
