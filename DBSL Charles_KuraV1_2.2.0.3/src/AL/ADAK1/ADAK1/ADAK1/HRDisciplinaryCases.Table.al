#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
Table 69200 "HR Disciplinary Cases"
{
    DrillDownPageID = "Disciplinary Committee";
    LookupPageID = "Disciplinary Committee";

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Caption = 'Case No.';
        }
        field(3; "Date of Complaint"; Date)
        {
            Caption = 'Date of Reporting';
        }
        field(4; "Type of Disciplinary Case"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Case"));

            trigger OnValidate()
            begin
                Status := Status::Ongoing;
                Modify;
            end;
        }
        field(5; "Recommended Action"; Code[20])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
        }
        field(6; "Case Description"; Text[250])
        {
        }
        field(7; Accuser; Code[10])
        {
            TableRelation = if ("Accuser Is Staff" = const(true)) "Company Positions";
            Caption = 'Reporter';
        }
        field(8; Witness; Code[20])
        {
            TableRelation = if ("Witness Is Staff" = const(true)) "Company Positions";
        }
        field(9; "Witness #2"; Code[20])
        {
            TableRelation = if ("Witness#2 Staff" = const(true)) Employee."No.";
        }
        field(10; "Action Taken"; Code[100])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
        }
        field(11; "Date To Discuss Case"; Date)
        {
        }
        field(12; "Document Link"; Text[200])
        {
        }
        field(13; "Disciplinary Remarks"; Code[50])
        {
        }
        field(14; Comments; Text[250])
        {
        }
        field(15; "Case Discussion"; Boolean)
        {
        }
        field(16; "Body Handling The Complaint"; Code[10])
        {
        }
        field(17; Recomendations; Text[250])
        {
        }
        field(18; "HR/Payroll Implications"; Integer)
        {
        }
        field(19; "Support Documents"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(20; "Policy Guidlines In Effect"; Code[10])
        {
        }
        field(21; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Ongoing,Court Case,Closed,Appeal,"Internal Appeal","External Appeal",Reinstated';
            OptionMembers = Open,Ongoing,"Court Case",Closed,Appeal,"Internal Appeal","External Appeal",Reinstated;
        }
        field(22; "Mode of Lodging the Complaint"; Text[30])
        {
            Caption = 'Mode of Reporting';
        }
        field(23; "No. Series"; Code[20])
        {
        }
        field(24; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(25; Selected; Boolean)
        {
        }
        field(26; "Closed By"; Code[100])
        {
        }
        field(27; "Case Severity"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Minor,Major';
            OptionMembers = " ",Minor,Major;
        }
        field(28; "Handled By"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,HOD,HR, Commitee,Court';
            OptionMembers = " ",HOD,HR," Commitee",Court;

            trigger OnValidate()
            begin
                if "Handled By" = "handled by"::Court then begin
                    Status := Status::"Court Case";
                    Modify;
                end;
            end;
        }
        field(29; "Disciplinary Commitee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disciplinary Committees".Code;
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center";
        }
        field(3964; "Accuser Is Staff"; Boolean)
        {
            Caption = 'Reporter is Staff';
        }
        field(3965; "Witness#1 Staff"; Boolean)
        {
        }
        field(3966; "Witness#2 Staff"; Boolean)
        {
        }
        field(3967; "Disciplinary status"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Disciplinary Status"."Disciplinary Status" where("Employee No" = field("Employee No"),
                                                                                        "Case Number" = field("Case Number"));

            trigger OnValidate()
            begin
                if Confirm('Are you sure you want to change disciplinary status, please note that this change will have implications on the payroll?', true) then begin
                    "Disciplinary status" := "Disciplinary status";
                    Modify;
                end else begin
                    "Disciplinary status" := xRec."Disciplinary status";
                    Modify;
                end;
            end;
        }
        field(3968; "Case Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3969; "Legal Case No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Register"."No.";
        }
        field(3970; "Legal Case Recommendation"; Text[2000])
        {
            CalcFormula = lookup("Case Register"."Verdict Summary" where("No." = field("Legal Case No.")));
            FieldClass = FlowField;
        }
        field(3971; "Inserted to Payroll"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3972; "Action Taken Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3973; "Disciplinary Hearing Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(3974; "Recommendation Action Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3975; "Disciplinary Hearing"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3976; "Appeal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3977; "Response to Show Cause"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3978; "Area of Incident"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3979; "Other Persons Involved"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Other Persons Is Staff" = const(true)) "Company Positions";
        }
        field(3980; "HOD Comments"; Text[550])
        {
            DataClassification = ToBeClassified;
        }
        field(3981; "Date to Respond"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date to Respond';
        }
        field(3982; "Hearing Venue"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3983; "DG Response"; Text[600])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "DG Response" <> '' then
                    "DG Response Date" := Today;
            end;
        }
        field(3984; "DG Response Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3985; "HRAC"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'HRAC Committee';
            TableRelation = if ("HRAC Hearing" = const(true)) "Disciplinary Committees".Code;
        }
        field(3986; "HRAC Hearing"; Boolean)
        {
        }
        field(3987; "HRAC Hearing Date"; Date)
        {
        }
        field(3988; "HRAC Hearing Venue"; Text[200])
        {
        }
        field(3989; "Document Attachment Type"; Option)
        {
            OptionMembers = " ",FromHODToHR,ShowCauseToEmployee,ShowCauseReplyFromEmployee,FromHRAC,FromInvestigationCommittee,ToDGAfterHearing,DGOutcomeToEmployee,DGOutcomeToHR,DisciplinaryHearing;
            OptionCaption = ' From HOD to HR ,Show Cause to Employee,Show Cause Reply from Employee,From HRAC,From Investigation Committee,To DG After Hearing,DG Outcome to Employee,DGOutcomeToHR,DisciplinaryHearing';
        }
        field(3990; "Current Step"; Option)
        {
            OptionMembers = FromHODToHR,ShowCauseToEmployee,ShowCauseReplyFromEmployee,FromHRAC,FromInvestigationCommittee,ToDGAfterHearing,DGOutcomeToEmployee,DGOutcomeToHR,DisciplinaryHearing;
            OptionCaption = 'From HOD to HR ,Show Cause to Employee,Show Cause Reply from Employee,From HRAC,From Investigation Committee,To DG After Hearing,DG Outcome to Employee,DGOutcomeToHR,DisciplinaryHearing';
        }
        field(3991; "Witness Is Staff"; Boolean)
        {
            Caption = 'Witness is Staff';
        }
        field(3992; "Other Persons Is Staff"; Boolean)
        {
            Caption = 'Other Persons is Staff';
        }
        field(3993; "Displinary Hearing Time"; Time)
        {
        }
        field(3994; "HRAC Hearing Time"; Time)
        {
        }
        field(3995; "Financial Year"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Case Number" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
            "Case Number" := NoSeriesMgt.GetNextNo(HRSetup."Disciplinary Cases Nos.", workdate, true);
        end;
    end;

    trigger OnModify()
    begin
        if Status = Status::Closed then
            Error('You cannot modify a closed case');
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";

    procedure NotifyHROnCaseFile(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
        HRSetups: Record "Human Resources Setup";
    begin
        HRSetups.Get();
        HRSetups.TestField("CEO Email");
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();
        EmailRecepient.Add(HRSetups."CEO Email");
        EmailSubject := 'Disciplinary Case';
        EmailBody := 'This is to notify you that a report has been filed against <B>' + Emp.FullName + '</B.';
        EmailBody += '<BR>Please log on to your account to view the details of <B>Case No.' + DispCase."Case Number" + '</B> reported.';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);
    end;

    procedure NotifyEmployeeToRespond(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", Database::"HR Disciplinary Cases");
        DocAttach.SetRange("No.", DispCase."Case Number");
        if DocAttach.FindFirst() then begin
            if DocAttach."Document Reference ID".HasValue then begin
                Clear(TempBlob);
                TempBlob.CreateOutStream(FileOutStream);
                TempBlob.CreateInStream(FileInStream);
                DocAttach."Document Reference ID".ExportStream(FileOutStream);

                EmailRecepient.Add(Emp."E-Mail");
                EmailSubject := 'Disciplinary Case';
                EmailBody := 'Dear ' + Emp."First Name" + ',';
                EmailBody += '<BR><BR>PFA your letter for <B>Case No.' + DispCase."Case Number" + '</B> reported on date: <B>' + Format(DispCase."Date of Complaint") + '</B>.';
                EmailBody += '<BR>You are hereby required to respond to show cause by date: <B>' + Format(DispCase."Date to Respond") + '</B>.';

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                EmailMessage.AddAttachment(
                    DocAttach."File Name" + '.' + DocAttach."File Extension",
                    DocAttach."File Extension",
                    FileInStream
                );

                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            end;
        end;

        Message(Txt001);
    end;

    procedure NotifyHROnResponseToShowCause(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", Database::"HR Disciplinary Cases");
        DocAttach.SetRange("No.", DispCase."Case Number");
        if DocAttach.FindLast() then begin
            if DocAttach."Document Reference ID".HasValue then begin
                Clear(TempBlob);
                TempBlob.CreateOutStream(FileOutStream);
                TempBlob.CreateInStream(FileInStream);
                DocAttach."Document Reference ID".ExportStream(FileOutStream);

                EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
                EmailSubject := 'Response To Show Cause';
                EmailBody := 'This is to inform you that <B>' + Emp.FullName + '</B> has responded according to the <B>Case No.' + DispCase."Case Number" + '</B> reported on date: <B>' + Format(DispCase."Date of Complaint") + '</B>.';

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                EmailMessage.AddAttachment(
                    DocAttach."File Name" + '.' + DocAttach."File Extension",
                    DocAttach."File Extension",
                    FileInStream
                );

                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            end;
        end;

        Message(Txt001);
    end;

    procedure NotifyDGOnDispHearing(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        CommitteeMembers: Record "Disciplinary Committee Members";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailMessage1: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailBody1: Text;
        EmailRecepient: List of [Text];
        EmailRecepient1: List of [Text];
        Txt001: Label 'DG notified successfully.';
        Attach: Record "Document Attachment";
        EmailScenario: Enum "Email Scenario";
        FileName: Text;
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
        EmailSubject := 'Disciplinary Hearing Recommendations';
        EmailBody := '<BR><BR>This is to inform you that a disciplinary hearing for Case No: <B>'
         + DispCase."Case Number" + '</B> was conducted on date: <B>'
         + Format(DispCase."Disciplinary Hearing Date") + '</B> at <B>'
         + DispCase."Hearing Venue" + '</B>.'
         + '<BR><BR><B>Remarks:</B> ' + DispCase."Disciplinary Remarks"
         + '<BR><B>Recommendation:</B> ' + DispCase.Recomendations
         + '<BR><B>Recommendation Date:</B> ' + Format(DispCase."Recommendation Action Date") + '<BR><BR>';

        EmailBody += '<BR><BR>We hereby await your response in order to proceed with the recommended action.';

        EmailMessage.Create(EmailRecepient, EmailSubject, EmailBody, true);
        Attach.Reset();
        Attach.SetRange("Table ID", Database::"HR Disciplinary Cases");
        Attach.SetRange("No.", DispCase."Case Number");
        if Attach.FindSet() then
            repeat
                if Attach."Document Reference ID".HasValue then begin
                    TempBlob.CreateOutStream(OutStr);
                    Attach."Document Reference ID".ExportStream(OutStr);
                    TempBlob.CreateInStream(InStr);
                    EmailMessage.AddAttachment(Attach."File Name", '', InStr);
                end;
            until Attach.Next() = 0;
        Email.Send(EmailMessage);

        Message(Txt001);
    end;

    procedure NotifyEmployeeAndCommitteeOnDispHearing(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        CommitteeMembers: Record "Disciplinary Committee Members";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailMessage1: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailBody1: Text;
        EmailRecepient: List of [Text];
        EmailRecepient1: List of [Text];
        Txt001: Label 'Members notified successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add(Emp."E-Mail");
        EmailSubject := 'Disciplinary Hearing';
        EmailBody := 'Dear ' + Emp."First Name" + ',';
        EmailBody += '<BR><BR>This is to inform you on your disciplinary hearing for Case No: <B>' + DispCase."Case Number" + '</B> which has been set on date: <B>' + Format(DispCase."Disciplinary Hearing Date") + '</B> at <B>' + DispCase."Hearing Venue" + '</B>.';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);

        CommitteeMembers.Reset();
        CommitteeMembers.SetRange(Committee, DispCase."Disciplinary Commitee");
        if CommitteeMembers.FindSet() then
            repeat
                Emp.Reset();
                Emp.SetRange("No.", CommitteeMembers.Code);
                if Emp.FindFirst() then
                    EmailRecepient1.Add(Emp."E-Mail");
            until CommitteeMembers.Next() = 0;

        EmailBody1 := 'You are hereby invited to a disciplinary hearing for Case No: <B>' + DispCase."Case Number" + '</B> which has been set on date: <B>' + Format(DispCase."Disciplinary Hearing Date") + '</B> at <B>' + DispCase."Hearing Venue" + '</B>.';

        EmailMessage1.Create(
            EmailRecepient1,
            EmailSubject,
            EmailBody1,
            true
        );

        Email.Send(EmailMessage1);

        Message(Txt001);
    end;

    procedure NotifyHROnDGResponse(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'HR notified successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
        EmailSubject := 'DG Response to Case No: ' + DispCase."Case Number";
        EmailBody += '<BR><BR>This is to inform you that the Director General has provided his response regarding Case No: <B>'
        + DispCase."Case Number" + '</B>.'
        + '<BR><B>DG Response:</B> ' + DispCase."DG Response" + '<BR><BR>';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);
        Message(Txt001);
    end;

    procedure NotifyHROnCaseAppeal(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
        Attach: Record "Document Attachment";
        EmailScenario: Enum "Email Scenario";
        FileName: Text;
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
        EmailSubject := 'Case File Appeal';
        EmailBody := 'This is to inform you that <B>' + Emp.FullName + '</B> has made an appeal for <B>Case No.'
        + DispCase."Case Number" + '</B> reported on date: <B>' + Format(DispCase."Date of Complaint") + '</B>.';
        EmailMessage.Create(EmailRecepient, EmailSubject, EmailBody, true);
        Attach.Reset();
        Attach.SetRange("Table ID", Database::"HR Disciplinary Cases");
        Attach.SetRange("No.", DispCase."Case Number");
        if Attach.FindSet() then
            repeat
                if Attach."Document Reference ID".HasValue then begin
                    TempBlob.CreateOutStream(OutStr);
                    Attach."Document Reference ID".ExportStream(OutStr);
                    TempBlob.CreateInStream(InStr);
                    EmailMessage.AddAttachment(Attach."File Name", '', InStr);
                end;
            until Attach.Next() = 0;
        Email.Send(EmailMessage, EmailScenario::Default);
    end;

    procedure NotifyEMPOnDGResponse(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add(Emp."E-Mail");
        EmailSubject := 'Director Generals Response to Case File: ' + DispCase."Case Number";
        EmailBody := 'This is to inform you that the Director General has made a response after the hearing for <B>Case No.' +
              DispCase."Case Number" +
              '</B> reported on date: <B>' +
              Format(DispCase."Date of Complaint") +
              '</B>.<br/><br/>Director General Remarks: <B>' +
              DispCase."DG Response" +
              '</B>.';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);
    end;

    procedure NotifyDisciplinaryCommitte(CaseFile: Record "HR Disciplinary Cases")
    var
        DisciplinaryCommittees: Record "Disciplinary Committees";
        DisciplinaryCommitteeMembers: Record "Disciplinary Committee Members";
        CompanyInfo: Record "Company Information";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
        HREmp: Record Employee;
        Recipient, RecipientName, Subject, Body : Text;
        EmailScenario: Enum "Email Scenario";
        FileName: Text;
        DocumentAttachment: Record "Document Attachment";
        AttachmentCount: Integer;
        ContentType: Text;
        Emp: Record Employee;
    begin
        CompanyInfo.Get();
        Recipient := '';
        DisciplinaryCommittees.Reset();
        DisciplinaryCommittees.SetRange(Code, CaseFile."Disciplinary Commitee");
        if DisciplinaryCommittees.FindFirst() then begin
            DisciplinaryCommitteeMembers.Reset();
            DisciplinaryCommitteeMembers.SetRange("Committee", DisciplinaryCommittees.Code);
            if DisciplinaryCommitteeMembers.FindSet() then begin
                repeat
                    Emp.Reset();
                    Emp.SetRange("No.", DisciplinaryCommitteeMembers.Code);
                    if Emp.FindFirst() then begin
                        Recipient := Emp."Company E-Mail";
                        RecipientName := DisciplinaryCommitteeMembers.Names;
                    end;
                    TempBlob.CreateInStream(InStr);
                    FileName := 'Case File_' + CaseFile."Case Number" + '.pdf';
                    Subject := CaseFile."Case Description";
                    Body := 'Hello ' + RecipientName + ',';
                    Body += '<br><br>';
                    Body += 'You are registered to receive notifications related to Kenya Urban Roads Authority.<br>';
                    Body += 'This is a message to notify you that:<br><br><hr>';
                    Body += 'You have been nominated as one of the disciplinary commiteee for case ' + CaseFile."Case Number" + '  Case Description:' + CaseFile."Case Description" + '.<br><br>';
                    Body += 'Attached is the document attached.<br><br>';
                    Body += 'Thanks and Regards<br><br>';
                    Body += CompanyInfo.Name + '<br><br>';
                    Body += 'This is a system generated mail. Please do not reply to it.';
                    Clear(EmailMessage);
                    EmailMessage.Create(Recipient, Subject, Body, true);
                    DocumentAttachment.Reset();
                    DocumentAttachment.SetRange("Table ID", Database::"HR Disciplinary Cases");
                    DocumentAttachment.SetRange("No.", CaseFile."Case Number");
                    if DocumentAttachment.FindSet() then begin
                        repeat
                            Clear(InStr);
                            Clear(TempBlob);
                            Clear(OutStr);
                            if DocumentAttachment."Document Reference ID".HasValue then begin
                                TempBlob.CreateOutStream(OutStr);
                                DocumentAttachment."Document Reference ID".ExportStream(OutStr);
                                TempBlob.CreateInStream(InStr);
                                ContentType := GetMimeType(DocumentAttachment."File Extension");
                                FileName := DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension";
                                EmailMessage.AddAttachment(FileName, ContentType, InStr);
                                AttachmentCount += 1;
                            end;
                        until DocumentAttachment.Next() = 0;
                    end;
                    if Email.Send(EmailMessage, EmailScenario::Default) then
                        Message('Email sent successfully!')
                    else
                        Message('Email failed to send.');
                until DisciplinaryCommitteeMembers.Next() = 0;
            end;
        end;
    end;

    procedure NotifyHRAC(CaseFile: Record "HR Disciplinary Cases")
    var
        DisciplinaryCommittees: Record "Disciplinary Committees";
        DisciplinaryCommitteeMembers: Record "Disciplinary Committee Members";
        CompanyInfo: Record "Company Information";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
        HREmp: Record Employee;
        Recipient, RecipientName, Subject, Body : Text;
        EmailScenario: Enum "Email Scenario";
        FileName: Text;
        DocumentAttachment: Record "Document Attachment";
        AttachmentCount: Integer;
        ContentType: Text;
        Emp: Record Employee;
    begin
        CompanyInfo.Get();
        Recipient := '';
        DisciplinaryCommittees.Reset();
        DisciplinaryCommittees.SetRange(Code, CaseFile.HRAC);
        if DisciplinaryCommittees.FindFirst() then begin
            DisciplinaryCommitteeMembers.Reset();
            DisciplinaryCommitteeMembers.SetRange("Committee", DisciplinaryCommittees.Code);
            if DisciplinaryCommitteeMembers.FindSet() then begin
                repeat
                    Emp.Reset();
                    Emp.SetRange("No.", DisciplinaryCommitteeMembers.Code);
                    if Emp.FindFirst() then begin
                        Recipient := Emp."Company E-Mail";
                        RecipientName := DisciplinaryCommitteeMembers.Names;
                        TempBlob.CreateInStream(InStr);
                        FileName := 'Case File_' + CaseFile."Case Number" + '.pdf';
                        Subject := CaseFile."Case Description";
                        Clear(Body);
                        Body := 'Hello ' + RecipientName + ',';
                        Body += '<br><br>';
                        Body += 'You are registered to receive notifications related to Kenya Urban Roads Authority.<br>';
                        Body += 'This is a message to notify you that:<br><br><hr>';
                        Body += 'You have been nominated as one of the advisory commiteee for case ' + CaseFile."Case Number" + '  Case Description:' + CaseFile."Case Description" + '.<br><br>';
                        Body += 'Venue :' + CaseFile."HRAC Hearing Venue" + ',';
                        Body += 'Date :' + Format(CaseFile."HRAC Hearing Date") + ',';
                        Body += 'Attached is the document attached.<br><br>';
                        Body += 'Thanks and Regards<br><br>';
                        Body += CompanyInfo.Name + '<br><br>';
                        Body += 'This is a system generated mail. Please do not reply to it.';
                        Clear(EmailMessage);
                        EmailMessage.Create(Recipient, Subject, Body, true);
                        DocumentAttachment.Reset();
                        DocumentAttachment.SetRange("Table ID", Database::"HR Disciplinary Cases");
                        DocumentAttachment.SetRange("No.", CaseFile."Case Number");
                        if DocumentAttachment.FindSet() then begin
                            repeat
                                Clear(InStr);
                                Clear(TempBlob);
                                Clear(OutStr);
                                if DocumentAttachment."Document Reference ID".HasValue then begin
                                    TempBlob.CreateOutStream(OutStr);
                                    DocumentAttachment."Document Reference ID".ExportStream(OutStr);
                                    TempBlob.CreateInStream(InStr);
                                    ContentType := GetMimeType(DocumentAttachment."File Extension");
                                    FileName := DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension";
                                    EmailMessage.AddAttachment(FileName, ContentType, InStr);
                                    AttachmentCount += 1;
                                end;
                            until DocumentAttachment.Next() = 0;
                        end;
                        if Email.Send(EmailMessage, EmailScenario::Default) then
                            Message('Email sent successfully!');
                    end;
                until DisciplinaryCommitteeMembers.Next() = 0;
            end;
        end;
    end;

    local procedure GetMimeType(FileExtension: Text): Text
    begin
        case LowerCase(FileExtension) of
            'pdf':
                exit('application/pdf');
            'doc':
                exit('application/msword');
            'docx':
                exit('application/vnd.openxmlformats-officedocument.wordprocessingml.document');
            'xls':
                exit('application/vnd.ms-excel');
            'xlsx':
                exit('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            'png':
                exit('image/png');
            'jpg', 'jpeg':
                exit('image/jpeg');
            'txt':
                exit('text/plain');
            else
                exit('application/octet-stream');
        end;
    end;
}
