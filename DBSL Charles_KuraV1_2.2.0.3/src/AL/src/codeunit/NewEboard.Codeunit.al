#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50032 NewEboard
{

    trigger OnRun()
    begin

        //fnDeleteTestID('29501445');
        //Message(generateP9('KNTC-VN/DIR/036', 'KNTC-VN_DIR_036'));
        //MESSAGE(FnMeetConfStatus('MEETING_043', 'DIR0001'));
        //MESSAGE(FORMAT(fnCountBoardMeetings('SFB')))
        //GetItemImage('DIR0010');
        //MESSAGE(FORMAT(fnMeetingsToday()));
        //generateDirectorPayslip('DIR0001', 20190801D)
        //MESSAGE(fnLogin('jnyamwaya@kntc.go.ke', '7570'));
        //MESSAGE(fnSendRegistrationEmail('brayohorina@gmail.com'));
        //MESSAGE(FnConfirmMeeting('MEET0052','KNTC-VN/AD-496',1));
        //MESSAGE(generateBoardMeetingResolutions('MEET0057'));
    end;

    var
        objCustomer: Record Customer;
        // objCopyright: Record UnknownRecord56022;
        objNoSeriesLine: Record "No. Series Line";
        objNoSeries: Record "No. Series";
        objPortalUser: Record portalusers;
        obj: BigText;
        objInstream: InStream;
        objOutstream: OutStream;
        objText: Text;
        objValidation: Record emailvalidations;
        objServiceItems: Record "Service Item";
        Authentication: Record "Authentication Device Applicat";
        objVendor: Record Vendor;
        objCommittee: Record "Board Committees";
        objCommMembers: Record "Committee Board Members";
        objVoters: Record "Agenda Item Voters";
        objVoteItems: Record "Agenda vote items";
        objContact: Record Contact;
        objLanguage: Record Language;
        Leg: BigText;
        LegInstr: InStream;
        LegOutStr: OutStream;
        LegText: Text;
        fileManager: Codeunit "File Management";
        // tempBlob: Record TempBlob;
        successful: Boolean;
        salesHeader: Record "Sales Header";
        salesLines: Record "Sales Line";
        ResolutionHeader: Record "Circular Resolution Header";
        ResolutionMgt: Codeunit "Resolution Management";
        //AL
        // SMTPMailSet: Record "SMTP Mail Setup";
        // Notification1: Codeunit UnknownCodeunit400;
        FILESPATH1: label '\\41.89.63.253\Downloads\';
        IMAGEPATH: label '\\41.89.63.253\images\';
        objVendors: Record Vendor;
        objBoardMeetings: Record "board meetings1";
        objBoardMeetingsAttendance: Record "board meeting attendance";
        objDeclareInterest: Record "Board Meeting Comments";
        objCommiteeMeeting: Record "Board Meetings";
        objBlogPost: Record board_blog;
        objBlogReply: Record Blog_Replies;
        //AL
        objMeetingComments: Record "Board Meeting Comments";
        smtpCodeunit: Codeunit Email;
        FILESPATH: label 'C:\inetpub\wwwroot\EBoard\Documents\';
        FILESPATH2: label 'C:\inetpub\wwwroot\EBoard\Documents\Resolutions\BoardResolutions\';
        FILESPATH3: label 'C:\inetpub\wwwroot\EBoard\Documents\Resolutions\CommitteResolutions\';
        Employee: Record Employee;
        FILESPATH4: label 'C:\inetpub\wwwroot\EBoard\Downloads\P9\';
        objBoardMembers: Record "Board Members";
        TempBlob_lRec: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        FileManagement_lCdu: Codeunit "File Management";
        Base64Convert: Codeunit "Base64 Convert";

    procedure Testconnection()
    begin
    end;

    procedure fnLogin(dirEmail: Text[100]; password: Text) CustomerNumber: Code[20]
    var
        iExists: Boolean;
    begin
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser.Email, dirEmail);
        if objPortalUser.FindSet() then begin
            //the user exists on portal user tables
            if objPortalUser.Password = password then begin
                CustomerNumber := objPortalUser."customer No";
            end;
        end;
        exit(CustomerNumber);
    end;

    procedure InsertAgreementDocument(documentNumber: Code[20]; agreementID: Text[2048]) status: Text
    var
        AgreementDocument: Record "Document Agreement";
    begin
        AgreementDocument.Init();

        AgreementDocument."Document Number" := documentNumber;
        AgreementDocument."Agreement ID" := agreementID;
        AgreementDocument.Status := 'Not Signed';

        if AgreementDocument.Insert(true) then begin
            status := 'success*Record successfully created*' + Format(documentNumber);
        end else begin
            status := 'error*An error occured during the process of creating record';
        end
    end;

    procedure addSignedSharepointLinks(agreementID: Text[2048]; sharepointlink: Text) status: Text
    var
        AgreementDocument: Record "Document Agreement";
        esignapplication: Record "ESign Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        DocumentNumber: Code[50];
    begin

        AgreementDocument.Reset();
        AgreementDocument.SetRange("Agreement ID", agreementID);

        if AgreementDocument.FindFirst() then begin
            DocumentNumber := AgreementDocument."Document Number";

            AgreementDocument.Status := 'Signed';
            AgreementDocument.Modify(true);

            RecordLink.Reset();
            RecordLink.Init();

            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := 'Signed Copy';
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := DocumentNumber;
            RecordLink.Created := CreateDateTime(Today, Time);


            esignapplication.Reset();
            esignapplication.SetRange("No.", DocumentNumber);

            if esignapplication.FindFirst() then begin
                RecordIDNumber := esignapplication.RecordId;
                RecordLink."Record ID" := RecordIDNumber;


                if RecordLink.Insert(true) then begin
                    status := 'success*Link successfully created*' + Format(RecordLink."Link ID");
                end else begin
                    status := 'error*An error occurred during the process of creating link';
                end;
            end else begin
                status := 'error*ESign Header not found for document number: ' + DocumentNumber;
            end;
        end else begin
            status := 'error*Agreement ID not found: ' + agreementID;
        end;
    end;

    procedure checkSharePointLinksStatus() status: Text
    var
        AgreementDocument: Record "Document Agreement";
        NotSignedCount: Integer;
        DocumentList: Text;
        DocEntry: Text;
        StatusMessage: Text;
    begin

        NotSignedCount := 0;
        DocumentList := '';

        AgreementDocument.Reset();
        AgreementDocument.SetRange("Status", 'Not Signed');

        if AgreementDocument.FindSet() then begin
            repeat

                status += Format(AgreementDocument."No.") + '*' +
                          AgreementDocument."Document Number" + '*' +
                          AgreementDocument."Agreement ID" + '*' +
                          AgreementDocument."Status" + '::::';
            until AgreementDocument.Next() = 0;
        end;

        if status = '' then
            status := 'danger*No records with status "Not Signed" found';
    end;

    procedure fnLogin2(dirEmail: Text[100]; password: Text) status: Text
    var
        iExists: Boolean;
    begin
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser.Email, dirEmail);
        if objPortalUser.FindSet() then begin
            if objPortalUser.Password = password then begin

                status := 'success*' + objPortalUser."customer No" + '*' + objPortalUser.Email + '*' + objPortalUser.Name + '*' + objPortalUser."Job Title" + '*' + objPortalUser.Department + '*' + objPortalUser.EmployeeNo;
                exit(status);
            end else begin

                status := 'danger*Invalid password';
                exit(status);
            end;
        end;
        // User not found
        status := 'danger*User not found';
    end;

    procedure fnGetBoardMembers() status: Text
    var
    //iExists: Boolean;
    begin
        objBoardMembers.Reset();
        if objBoardMembers.findset() then begin
            repeat
                status += objBoardMembers."Personal No" + '*' + objBoardMembers."Last Name" + '*' + objBoardMembers."First Name" + '*' + objBoardMembers."Phone No." + '*' + objBoardMembers."Company E-Mail" + '*' + objBoardMembers."Designation/Role" + '::::';
            until objBoardMembers.Next() = 0;
        end;
        exit(status);
    end;

    procedure fnGetCategoryCodes() status: Text
    var
        //iExists: Boolean;
        objCategoryCodes: Record "Compliance Category";
    begin
        objCategoryCodes.Reset();
        if objCategoryCodes.findset() then begin
            repeat
                status += objCategoryCodes.Code + '*' + objCategoryCodes.Description + '*' + objCategoryCodes."Responsible User ID" + '*' + Format(objCategoryCodes.Active) + '*' + objCategoryCodes.Remarks + '::::';
            until objCategoryCodes.Next() = 0;
        end;
        exit(status);
    end;

    procedure fnGetEmployees() status: Text
    var
        //iExists: Boolean;
        objEmployees: Record "Employee";
    begin
        objEmployees.Reset();
        if objEmployees.findset() then begin
            repeat
                status += objEmployees."No." + '*' + objEmployees."Last Name" + '*' + objEmployees."First Name" + '*' + objEmployees."Phone No." + '*' + objEmployees."Company E-Mail" + '*' + objEmployees."Job Title" + '::::';
            until objEmployees.Next() = 0;
        end;
        exit(status);
    end;

    procedure fnGetEmployeeSpecific(empNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        objEmployees: Record "Employee";
    begin
        objEmployees.Reset();
        objEmployees.SetRange("No.", empNo);
        if objEmployees.findset() then begin
            repeat
                status += objEmployees."No." + '*' + objEmployees."Last Name" + '*' + objEmployees."First Name" + '*' + objEmployees."Phone No." + '*' + objEmployees."Company E-Mail" + '*' + objEmployees."Job Title" + '::::';
            until objEmployees.Next() = 0;
        end;
        exit(status);
    end;

    procedure fnGetBoardMembersSpecific(personalNo: Code[100]) status: Text
    var
    //iExists: Boolean;
    begin
        objBoardMembers.Reset();
        objBoardMembers.SetRange("Personal No", personalNo);
        if objBoardMembers.FindSet() then begin
            repeat
                status += objBoardMembers."Personal No" + '*' + objBoardMembers."Last Name" + '*' + objBoardMembers."First Name" + '*' + objBoardMembers."Phone No." + '*' + objBoardMembers."Company E-Mail" + '*' + objBoardMembers."Designation/Role" + '::::';
            until objBoardMembers.Next() = 0;
        end;
        exit(status);
    end;

    procedure fnGetCircularResolutions(dirEmail: Text[100]; password: Text) status: Text
    var
        objCircularResolutionHeader: Record "Circular Resolution Header";
    begin
        objBoardMembers.Reset();
        if objBoardMembers.findset() then begin
            repeat
                status += objBoardMembers."Personal No" + '*' + objBoardMembers."Last Name" + objBoardMembers."Phone No." + objBoardMembers."Company E-Mail" + objBoardMembers."Designation/Role" + '::::';
            until objBoardMembers.Next() = 0;
        end;
        exit(status);
    end;

    procedure fnGetCircularResolution(bmName: Text) status: Text
    var
        //iExists: Boolean;
        objCircularResolutionHeader: Record "Circular Resolution Header";
    begin
        objCircularResolutionHeader.Reset();
        objCircularResolutionHeader.SetRange("Initiator Name", bmName);
        if objCircularResolutionHeader.findset() then begin
            repeat
                status += objCircularResolutionHeader."No." + '*' + objCircularResolutionHeader."Initiator Name" + '*' +
                objCircularResolutionHeader.Title + '*' + objCircularResolutionHeader.Description + '*' +
                FORMAT(objCircularResolutionHeader."Voting Deadline") + '*' + FORMAT(objCircularResolutionHeader."Approval Status") + '*' +
                FORMAT(objCircularResolutionHeader.Status) + '*' + format(objCircularResolutionHeader.Posted) + '*' + Format(objCircularResolutionHeader."Resolution Type") + '::::';
            until objCircularResolutionHeader.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnEsignerDocuments(bmName: Text) status: Text
    var
        //iExists: Boolean;
        objEsignerHeader: Record "ESign Header";
    begin
        objEsignerHeader.Reset();
        objEsignerHeader.SetRange("Initiator Name", bmName);
        if objEsignerHeader.findset() then begin
            repeat
                status += objEsignerHeader."No." + '*' + objEsignerHeader."Initiator Name" + '*' +
                objEsignerHeader.Title + '*' + objEsignerHeader.Description + '*' +
                FORMAT(objEsignerHeader."Document URL") + '*' + FORMAT(objEsignerHeader."Approval Status") + '*' +
                FORMAT(objEsignerHeader.Status) + '*' + format(objEsignerHeader.Posted) + '*' + Format(objEsignerHeader."Board Member Code") + '::::';
            until objEsignerHeader.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnEsignerbyDocNo(docNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        objEsignerHeader: Record "ESign Header";
    begin
        objEsignerHeader.Reset();
        objEsignerHeader.SetRange("No.", docNo);
        if objEsignerHeader.findset() then begin
            repeat
                status += objEsignerHeader."No." + '*' + objEsignerHeader."Initiator Name" + '*' +
                objEsignerHeader.Title + '*' + objEsignerHeader.Description + '*' +
                FORMAT(objEsignerHeader."Document URL") + '*' + FORMAT(objEsignerHeader."Approval Status") + '*' +
                FORMAT(objEsignerHeader.Status) + '*' + format(objEsignerHeader.Posted) + '*' + Format(objEsignerHeader."Board Member Code") + '::::';
            until objEsignerHeader.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetComplianceObligations(empNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        objComplianceObligationHeader: Record "Compliance Obligation";
    begin
        objComplianceObligationHeader.Reset();
        objComplianceObligationHeader.SetRange("Primary Employee No.", empNo);
        if objComplianceObligationHeader.findset() then begin
            repeat
                status += objComplianceObligationHeader."No." + '*' + objComplianceObligationHeader."Title" + '*' +
                objComplianceObligationHeader."Category Code" + '*' + objComplianceObligationHeader.Description + '*' +
                FORMAT(objComplianceObligationHeader.Status) + '*' + FORMAT(objComplianceObligationHeader.Frequency) + '*' +
                FORMAT(objComplianceObligationHeader."Start Date") + '*' + format(objComplianceObligationHeader."Next Due Date") + '*' +
                FORMAT(objComplianceObligationHeader.Priority) + '*' + FORMAT(objComplianceObligationHeader."Reminder Days") + '*' +
                FORMAT(objComplianceObligationHeader.Active) + '*' + FORMAT(objComplianceObligationHeader."Evidence Required") + '*' +
                objComplianceObligationHeader.Remarks + '*' + Format(objComplianceObligationHeader.Posted) + '::::';
            until objComplianceObligationHeader.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetComplianceObligationNo(docNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        objComplianceObligationHeader: Record "Compliance Obligation";
    begin
        objComplianceObligationHeader.Reset();
        objComplianceObligationHeader.SetRange("No.", docNo);
        if objComplianceObligationHeader.findset() then begin
            repeat
                status += objComplianceObligationHeader."No." + '*' + objComplianceObligationHeader."Title" + '*' +
                objComplianceObligationHeader."Category Code" + '*' + objComplianceObligationHeader.Description + '*' +
                FORMAT(objComplianceObligationHeader.Status) + '*' + FORMAT(objComplianceObligationHeader.Frequency) + '*' +
                FORMAT(objComplianceObligationHeader."Start Date") + '*' + format(objComplianceObligationHeader."Next Due Date") + '*' +
                FORMAT(objComplianceObligationHeader.Priority) + '*' + FORMAT(objComplianceObligationHeader."Reminder Days") + '*' +
                FORMAT(objComplianceObligationHeader.Active) + '*' + FORMAT(objComplianceObligationHeader."Evidence Required") + '*' +
                objComplianceObligationHeader.Remarks + '::::';
            until objComplianceObligationHeader.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetCircularResolutionNo(docNo: Text) status: Text
    var
        //iExists: Boolean;
        objCircularResolutionHeader: Record "Circular Resolution Header";
    begin
        objCircularResolutionHeader.Reset();
        objCircularResolutionHeader.SetRange("No.", docNo);
        if objCircularResolutionHeader.findset() then begin
            repeat
                status += objCircularResolutionHeader."No." + '*' + objCircularResolutionHeader."Initiator Name" + '*' +
                objCircularResolutionHeader.Title + '*' + objCircularResolutionHeader.Description + '*' +
                FORMAT(objCircularResolutionHeader."Voting Deadline") + '*' + FORMAT(objCircularResolutionHeader."Approval Status") + '*' +
                FORMAT(objCircularResolutionHeader.Status) + '*' + format(objCircularResolutionHeader.Posted) + '*' + Format(objCircularResolutionHeader."Resolution Type") + '::::';
            until objCircularResolutionHeader.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetCircularResolutionLines(docNo: Text[50]) status: Text
    var
        //iExists: Boolean;
        //objCircularResolutionHeader: Record "Circular Resolution Header";
        objCircularResolutionLines: Record "Circular Resolution lines";
    begin
        objCircularResolutionLines.Reset();
        objCircularResolutionLines.SetRange("Resolution No.", docNo);
        if objCircularResolutionLines.findset() then begin
            repeat
                status += objCircularResolutionLines."Resolution No." + '*' + Format(objCircularResolutionLines."Line No.") + '*' +
                objCircularResolutionLines."Personal No." + '*' + objCircularResolutionLines."Employee Name" + '*' +
                objCircularResolutionLines."Department Code" + '*' + objCircularResolutionLines.Email + '::::';
            until objCircularResolutionLines.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetComplianceObligationLines(docNo: Text[50]) status: Text
    var
        //iExists: Boolean;
        //objCircularResolutionHeader: Record "Circular Resolution Header";
        //objCircularResolutionLines: Record "Circular Resolution lines";
        objComplianceObligationLines: Record "Compliance Obligation Employee";
    begin
        objComplianceObligationLines.Reset();
        objComplianceObligationLines.SetRange("Obligation No.", docNo);
        if objComplianceObligationLines.findset() then begin
            repeat
                status += objComplianceObligationLines."Obligation No." + '*' + objComplianceObligationLines."Employee No." + '*' +
                objComplianceObligationLines."Employee Name" + '*' + objComplianceObligationLines."Employee Email" + '*' +
                Format(objComplianceObligationLines."Status") + '*' + Format(objComplianceObligationLines.Completed) + '*' +
                 Format(objComplianceObligationLines."Completed DateTime") + '*' + Format(objComplianceObligationLines.Remarks) + '::::';
            until objComplianceObligationLines.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetEsignerLines(docNo: Text[50]) status: Text
    var
        //iExists: Boolean;
        //objCircularResolutionHeader: Record "Circular Resolution Header";
        //objCircularResolutionLines: Record "Circular Resolution lines";
        objEsignerLines: Record "ESign Line";
    begin
        objEsignerLines.Reset();
        objEsignerLines.SetRange("Document No.", docNo);
        if objEsignerLines.findset() then begin
            repeat
                status += objEsignerLines."Document No." + '*' + objEsignerLines."Board Member No." + '*' + Format(objEsignerLines."Line No.") + '*' +
                objEsignerLines."Board Member Name" + '*' + objEsignerLines."Email" + '*' +
                Format(objEsignerLines."Status") + '*' + Format(objEsignerLines."Signed/Declined Date") + '*' +
                 Format(objEsignerLines."Signing Order") + '*' + Format(objEsignerLines."Notification Sent") + '::::';
            until objEsignerLines.Next() = 0;
        end;
        exit(status);

    end;

    procedure addEsignerSharepointLinks(leaveno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        esignapplication: Record "ESign Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            // RecordLink."User ID" := UserId;
            RecordLink."User ID" := leaveno;
            RecordLink.Created := CreateDatetime(Today, Time);
            esignapplication.Reset;
            esignapplication."No." := leaveno;
            if esignapplication.Find('=') then
                RecordIDNumber := esignapplication.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created*' + Format(RecordLink."Link ID");
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure fnGetComplianceObligationLinesSpecific(empNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        objComplianceObligationHeader: Record "Compliance Obligation";
        //objCircularResolutionLines: Record "Circular Resolution lines";
        objComplianceObligationLines: Record "Compliance Obligation Employee";
    begin
        objComplianceObligationLines.Reset();
        objComplianceObligationLines.SetRange("Employee No.", empNo);

        if objComplianceObligationLines.findset() then begin
            //objCircularResolutionHeader.Reset();
            //objCircularResolutionHeader.SetRange("No.", objComplianceObligationLines."Obligation No.");
            repeat
                // status += objComplianceObligationLines."Obligation No." + '*' + objComplianceObligationLines."Employee No." + '*' +
                // objComplianceObligationLines."Employee Name" + '*' + objComplianceObligationLines."Employee Email" + '*' +
                // Format(objComplianceObligationLines."Status") + '*' + Format(objComplianceObligationLines.Completed) + '*' +
                //  Format(objComplianceObligationLines."Completed DateTime") + '*' + Format(objComplianceObligationLines.Remarks) + '*' +
                //   objCircularResolutionHeader.Title + '*' + objCircularResolutionHeader.Description + '::::';

                objComplianceObligationHeader.Reset();
                objComplianceObligationHeader.SetRange("No.", objComplianceObligationLines."Obligation No.");


                if objComplianceObligationHeader.FindFirst() then begin
                    status += objComplianceObligationLines."Obligation No." + '*' +
                             objComplianceObligationLines."Employee No." + '*' +
                             objComplianceObligationLines."Employee Name" + '*' +
                             objComplianceObligationLines."Employee Email" + '*' +
                             Format(objComplianceObligationLines."Status") + '*' +
                             Format(objComplianceObligationLines.Completed) + '*' +
                             Format(objComplianceObligationLines."Completed DateTime") + '*' +
                             Format(objComplianceObligationLines.Remarks) + '*' +
                             objComplianceObligationHeader.Title + '*' +
                             objComplianceObligationHeader.Description + '::::';
                end else begin

                    status += objComplianceObligationLines."Obligation No." + '*' +
                             objComplianceObligationLines."Employee No." + '*' +
                             objComplianceObligationLines."Employee Name" + '*' +
                             objComplianceObligationLines."Employee Email" + '*' +
                             Format(objComplianceObligationLines."Status") + '*' +
                             Format(objComplianceObligationLines.Completed) + '*' +
                             Format(objComplianceObligationLines."Completed DateTime") + '*' +
                             Format(objComplianceObligationLines.Remarks) + '*' +
                             '' + '*' + '' + '::::';
                end;



            until objComplianceObligationLines.Next() = 0;
        end;
        exit(status);

    end;

    procedure fnGetCircularResolutionLinesSpecific(email: Text[150]) status: Text
    var
        //iExists: Boolean;
        objCircularResolutionHeader: Record "Circular Resolution Header";
        //objComplianceObligationHeader: Record "Compliance Obligation";
        objCircularResolutionLines: Record "Circular Resolution lines";
    begin
        objCircularResolutionLines.Reset();
        //objCircularResolutionLines.SetRange("Resolution No.", docNo);
        objCircularResolutionLines.SetRange(Email, email);
        if objCircularResolutionLines.findset() then begin
            repeat

                objCircularResolutionHeader.Reset();
                objCircularResolutionHeader.SetRange("No.", objCircularResolutionLines."Resolution No.");
                if objCircularResolutionHeader.FindFirst() then begin
                    status += objCircularResolutionLines."Resolution No." + '*' + Format(objCircularResolutionLines."Line No.") + '*' +
                            objCircularResolutionLines."Personal No." + '*' + objCircularResolutionLines."Employee Name" + '*' +
                            objCircularResolutionLines."Department Code" + '*' + objCircularResolutionLines.Email + '*' +
                             Format(objCircularResolutionLines."Vote Status") + '*' +
                             objCircularResolutionHeader.Title + '*' +
                             objCircularResolutionHeader."Initiator Name" + '::::';
                end else begin
                    status += objCircularResolutionLines."Resolution No." + '*' + Format(objCircularResolutionLines."Line No.") + '*' +
                            objCircularResolutionLines."Personal No." + '*' + objCircularResolutionLines."Employee Name" + '*' +
                            objCircularResolutionLines."Department Code" + '*' + objCircularResolutionLines.Email + '*' +
                            Format(objCircularResolutionLines."Vote Status") + '*' +
                             '' + '*' + '' + '::::';
                end;

            until objCircularResolutionLines.Next() = 0;
        end;
        exit(status);

    end;

    procedure updateBoardMemberLines(docNo: Text; id: Integer; voteId: Integer) status: Text
    var
        //iExists: Boolean;
        objCircularResolutionHeader: Record "Circular Resolution Header";
        objCircularResolutionLines: Record "Circular Resolution lines";
    begin


        if not ResolutionHeader.Get(docNo) then
            exit;

        //     ResolutionHeader.UpdateStatusBasedOnDeadline(); 
        //     if (ResolutionHeader."Voting Deadline" <> 0DT) and
        //    (CurrentDateTime >= ResolutionHeader."Voting Deadline") then
        //         Error('Voting has already closed.');
        //     if ResolutionHeader.Status <> ResolutionHeader.Status::Voting then
        //         Error('Voting is not currently open for this Circular Resolution.');
        objCircularResolutionLines.RESET;
        objCircularResolutionLines.SETRANGE("Resolution No.", docNo);
        objCircularResolutionLines.SETRANGE("Line No.", id);

        IF objCircularResolutionLines.FindFirst() THEN BEGIN
            //objCircularResolutionLines.DELETE(TRUE);
            //objCircularResolutionLines."Selected Option Line No." := voteId;
            objCircularResolutionLines.Validate("Selected Option Line No.", voteId);
            objCircularResolutionLines.Modify(true);
            ResolutionMgt.UpdateWinningOption(ResolutionHeader);
            ResolutionMgt.SendVoteConfirmation(objCircularResolutionLines, ResolutionHeader);

            status := 'success*Your vote has been successfully submitted';
        END else begin
            status := 'danger*Your vote has not been recorded, kindly try again';
        end;

    end;

    procedure deleteBoardMemberLines(docNo: Text; id: Integer) status: Text
    var
        //iExists: Boolean;
        //objCircularResolutionHeader: Record "Circular Resolution Header";
        objCircularResolutionLines: Record "Circular Resolution lines";
    begin
        objCircularResolutionLines.RESET;
        objCircularResolutionLines.SETRANGE("Resolution No.", docNo);
        objCircularResolutionLines.SETRANGE("Line No.", id);

        IF objCircularResolutionLines.FindFirst() THEN BEGIN
            objCircularResolutionLines.DELETE(TRUE);
            status := 'success*Record deleted successfully';
        END else begin
            status := 'danger*Record deletion failed';
        end;

    end;

    procedure deleteEmployeeLines(docNo: Text; empNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        //objCircularResolutionHeader: Record "Circular Resolution Header";
        //objCircularResolutionLines: Record "Circular Resolution lines";
        objComplianceObligationLines: Record "Compliance Obligation Employee";
    begin
        objComplianceObligationLines.RESET;
        objComplianceObligationLines.SETRANGE("Obligation No.", docNo);
        objComplianceObligationLines.SETRANGE("Employee No.", empNo);

        IF objComplianceObligationLines.FindFirst() THEN BEGIN
            objComplianceObligationLines.DELETE(TRUE);
            status := 'success*Record deleted successfully';
        END else begin
            status := 'danger*Record deletion failed';
        end;

    end;

    procedure deleteEsignerLines(docNo: Text; empNo: Code[50]) status: Text
    var
        //iExists: Boolean;
        //objCircularResolutionHeader: Record "Circular Resolution Header";
        //objCircularResolutionLines: Record "Circular Resolution lines";
        objEsignerLines: Record "ESign Line";
    begin
        objEsignerLines.RESET;
        objEsignerLines.SETRANGE("Document No.", docNo);
        objEsignerLines.SETRANGE("Board Member No.", empNo);

        IF objEsignerLines.FindFirst() THEN BEGIN
            objEsignerLines.DELETE(TRUE);
            status := 'success*Record deleted successfully';
        END else begin
            status := 'danger*Record deletion failed';
        end;

    end;


    procedure fnCreateCircularResolution(docNo: Text[50]; bmName: Text; title: Text; description: Text; resolutionType: Integer; votingDeadline: DateTime) status: Text
    var
        //iExists: Boolean;
        objCircularResolutionHeader: Record "Circular Resolution Header";
    begin
        objCircularResolutionHeader.Reset;
        objCircularResolutionHeader.SetRange("No.", docNo);

        if objCircularResolutionHeader.FindSet then begin

            objCircularResolutionHeader."Initiator Name" := bmName;
            objCircularResolutionHeader.Title := title;
            objCircularResolutionHeader.Description := description;
            objCircularResolutionHeader."Resolution Type" := Enum::"Resolution Type".FromInteger(resolutionType);
            //objCircularResolutionHeader."Resolution Type":=resolutionType;
            objCircularResolutionHeader."Voting Deadline" := votingDeadline;
            if objCircularResolutionHeader.Modify(true) then begin

                status := 'success*' + objCircularResolutionHeader."No." + ' *Your circular resolution was successfully updated';
            end else begin
                status := 'danger*Your circular resolution could not be updated';
            end;
        end else begin
            objCircularResolutionHeader.Init;
            objCircularResolutionHeader."No." := '';
            objCircularResolutionHeader."Initiator Name" := bmName;
            objCircularResolutionHeader.Title := title;
            objCircularResolutionHeader.Description := description;
            objCircularResolutionHeader."Resolution Type" := Enum::"Resolution Type".FromInteger(resolutionType);
            //objCircularResolutionHeader."Resolution Type":=resolutionType;
            objCircularResolutionHeader."Voting Deadline" := votingDeadline;
            if objCircularResolutionHeader.Insert(true) then begin

                status := 'success*' + objCircularResolutionHeader."No." + ' *Your circular resolution was successfully created';
            end else begin
                status := 'danger*Your circular resolution could not be created';
            end;
        end;

    end;

    procedure fnCreateComplianceObligation(docNo: Text[50]; bmCode: Code[100]; bmName: Text; title: Text; description: Text; priority: Integer; startdate: Date; nextduedate: Date; categorycode: Code[50]) status: Text
    var
        //iExists: Boolean;
        objComplianceObligationHeader: Record "Compliance Obligation";
    begin
        objComplianceObligationHeader.Reset;
        objComplianceObligationHeader.SetRange("No.", docNo);

        if objComplianceObligationHeader.FindSet then begin

            // objCircularResolutionHeader."Initiator Name" := bmName;
            objComplianceObligationHeader.Title := title;
            objComplianceObligationHeader.Description := description;
            objComplianceObligationHeader."Priority" := Enum::"Compliance Priority".FromInteger(priority);
            objComplianceObligationHeader."Start Date" := startdate;
            objComplianceObligationHeader."Next Due Date" := nextduedate;
            objComplianceObligationHeader."Category Code" := categorycode;
            objComplianceObligationHeader."Primary Employee No." := bmCode;
            objComplianceObligationHeader.Validate("Primary Employee No.");

            if objComplianceObligationHeader.Modify(true) then begin

                status := 'success*' + objComplianceObligationHeader."No." + ' *Your compliance obligation was successfully updated';
            end else begin
                status := 'danger*Your compliance obligation could not be updated';
            end;
        end else begin
            objComplianceObligationHeader.Init;
            objComplianceObligationHeader."No." := '';
            objComplianceObligationHeader.Title := title;
            objComplianceObligationHeader.Description := description;
            objComplianceObligationHeader."Priority" := Enum::"Compliance Priority".FromInteger(priority);
            objComplianceObligationHeader."Start Date" := startdate;
            objComplianceObligationHeader."Next Due Date" := nextduedate;
            objComplianceObligationHeader."Category Code" := categorycode;
            objComplianceObligationHeader."Primary Employee No." := bmCode;
            objComplianceObligationHeader.Validate("Primary Employee No.");
            if objComplianceObligationHeader.Insert(true) then begin

                status := 'success*' + objComplianceObligationHeader."No." + ' *Your compliance obligation was successfully created';
            end else begin
                status := 'danger*Your compliance obligation could not be created';
            end;
        end;

    end;

    procedure fnCreateEsignDocument(docNo: Text[50]; bmCode: Code[100]; bmName: Text; title: Text; description: Text) status: Text
    var
        //iExists: Boolean;
        objEsignHeader: Record "ESign Header";
    begin
        objEsignHeader.Reset;
        objEsignHeader.SetRange("No.", docNo);

        if objEsignHeader.FindSet then begin

            // objCircularResolutionHeader."Initiator Name" := bmName;
            objEsignHeader.Title := title;
            objEsignHeader.Description := description;
            objEsignHeader."Initiator Name" := bmName;
            objEsignHeader."Board Member Code" := bmCode;


            if objEsignHeader.Modify(true) then begin

                status := 'success*' + objEsignHeader."No." + ' *Your e-sign document was successfully updated';
            end else begin
                status := 'danger*Your e-sign document could not be updated';
            end;
        end else begin
            objEsignHeader.Init;
            objEsignHeader."No." := '';
            objEsignHeader.Title := title;
            objEsignHeader.Description := description;
            objEsignHeader."Initiator Name" := bmName;
            objEsignHeader."Board Member Code" := bmCode;

            if objEsignHeader.Insert(true) then begin

                status := 'success*' + objEsignHeader."No." + ' *Your e-sign document was successfully created';
            end else begin
                status := 'danger*Your e-sign document could not be created';
            end;
        end;

    end;

    procedure fnCreateCircularResolutionLines(docNo: Text[50]; personalNo: Code[100]) status: Text
    var
        objCircularResolutionLines: Record "Circular Resolution lines";
        LastLine: Record "Circular Resolution lines";
    begin
        //Check duplicate employee
        objCircularResolutionLines.Reset();
        objCircularResolutionLines.SetRange("Resolution No.", docNo);
        objCircularResolutionLines.SetRange("Personal No.", personalNo);

        if objCircularResolutionLines.FindFirst() then begin
            status := 'danger*Member already exists';
            exit;
        end;

        objCircularResolutionLines.Init();
        objCircularResolutionLines."Resolution No." := docNo;
        objCircularResolutionLines."Personal No." := personalNo;
        objCircularResolutionLines.Validate("Personal No.");

        LastLine.Reset();
        LastLine.SetRange("Resolution No.", docNo);

        if LastLine.FindLast() then
            objCircularResolutionLines."Line No." := LastLine."Line No." + 1
        else
            objCircularResolutionLines."Line No." := 1;

        if objCircularResolutionLines.Insert(true) then begin
            status := 'success*Member successfully added';
        end else begin
            status := 'danger*Your line has not been added';
        end;
    end;

    procedure fnCreateEsignerLines(docNo: Text[50]; personalNo: Code[100]) status: Text
    var
        objEsignerLines: Record "ESign Line";
        LastLine: Record "ESign Line";
    begin
        //Check duplicate employee
        objEsignerLines.Reset();
        objEsignerLines.SetRange("Document No.", docNo);
        objEsignerLines.SetRange("Board Member No.", personalNo);

        if objEsignerLines.FindFirst() then begin
            status := 'danger*Member already exists';
            exit;
        end;

        objEsignerLines.Init();
        objEsignerLines."Document No." := docNo;
        objEsignerLines."Board Member No." := personalNo;
        objEsignerLines.Validate("Board Member No.");

        LastLine.Reset();
        LastLine.SetRange("Document No.", docNo);

        if LastLine.FindLast() then
            objEsignerLines."Signing Order" := LastLine."Line No." + 1
        else
            objEsignerLines."Signing Order" := 1;

        if objEsignerLines.Insert(true) then begin
            status := 'success*Member successfully added';
        end else begin
            status := 'danger*Your line has not been added';
        end;
    end;

    procedure fnCreateComplianceObligationLines(docNo: Text[50]; empNo: Code[100]) status: Text
    var
        objComplianceObligationLines: Record "Compliance Obligation Employee";
        LastLine: Record "Compliance Obligation Employee";
    begin
        //Check duplicate employee
        objComplianceObligationLines.Reset();
        objComplianceObligationLines.SetRange("Obligation No.", docNo);
        objComplianceObligationLines.SetRange("Employee No.", empNo);

        if objComplianceObligationLines.FindFirst() then begin
            status := 'danger*Employee already exists';
            exit;
        end;

        objComplianceObligationLines.Init();
        objComplianceObligationLines."Obligation No." := docNo;
        objComplianceObligationLines."Employee No." := empNo;
        objComplianceObligationLines.Validate("Employee No.");

        // LastLine.Reset();
        // LastLine.SetRange("Resolution No.", docNo);

        // if LastLine.FindLast() then
        //     objCircularResolutionLines."Line No." := LastLine."Line No." + 1
        // else
        //     objCircularResolutionLines."Line No." := 1;

        if objComplianceObligationLines.Insert(true) then begin
            status := 'success*Employee successfully added';
        end else begin
            status := 'danger*Your line has not been added';
        end;
    end;

    procedure fnSendCircularResolutionForApproval(docNo: Text[50]) status: Text
    var
    //objCircularResolutionLines: Record "Circular Resolution lines";
    begin

        status := 'success*Successfully approved';


    end;

    procedure fnCancelCircularResolutionForApproval(docNo: Text[50]) status: Text
    var
    //objCircularResolutionLines: Record "Circular Resolution lines";
    begin

        status := 'success*Successfully canceled';

    end;

    procedure fnSendComplianceObligationForApproval(docNo: Text[50]) status: Text
    var
    //objCircularResolutionLines: Record "Circular Resolution lines";
    begin

        status := 'success*Successfully approved';


    end;

    procedure fnCancelComplianceObligationApproval(docNo: Text[50]) status: Text
    var
    //objCircularResolutionLines: Record "Circular Resolution lines";
    begin

        status := 'success*Successfully canceled';

    end;

    procedure fnSendEsignerForApproval(docNo: Text[50]) status: Text
    var
    //objCircularResolutionLines: Record "Circular Resolution lines";
    begin

        status := 'success*Successfully approved';


    end;

    procedure fnCancelEsignerApproval(docNo: Text[50]) status: Text
    var
    //objCircularResolutionLines: Record "Circular Resolution lines";
    begin

        status := 'success*Successfully canceled';

    end;

    // [scope('OnPrem')]
    // procedure generateDirectorPayslip(director: Code[100]; payperiod: Date; directorNo: Text) status: Text
    // begin
    //     if objVendor.Get(director) then begin
    //         objVendor.Reset;
    //         objVendor.SetRange("No.", director);
    //         if objVendor.FindFirst then begin
    //             //AL
    //             // objVendor.SetRange("Pay Period Filter", payperiod);
    //             //   if FILE.Exists(FILESPATH+Format(directorNo)+'.pdf') then begin
    //             //     FILE.Erase(FILESPATH+Format(directorNo)+'.pdf');
    //             //     Report.SaveAsPdf(89033,FILESPATH+directorNo+'.pdf' ,objVendor);
    //             //     status:='success*Downloads'+directorNo+'.pdf';
    //             //     end else begin
    //             //       Report.SaveAsPdf(89033,FILESPATH+directorNo+'.pdf' ,objVendor);
    //             //       status:='success*Downloads'+directorNo+'.pdf';
    //             //             end
    //         end
    //     end else begin
    //         status := 'danger*The director number does not exist';
    //     end;
    //     Message(Format(status));
    // end;

    procedure generateDirectorPayslip(director: Code[100]; payperiod: DateTime; directorNo: Text) status: Text
    var
        RecRef: RecordRef;
        BaseImage: Text;
    begin
        if objVendor.Get(director) then begin
            objVendor.Reset;
            objVendor.SetRange("No.", director);
            objVendor.SetRange("Pay Period Filter", DT2Date(payperiod));
            if objVendor.FindFirst then begin
                TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
                RecRef.GetTable(objVendor);
                Report.SaveAs(Report::"1 Director Page Payslip", '', ReportFormat::Pdf, OutStr, RecRef);
                FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('%1.Pdf', directorNo), true);
                TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
                BaseImage := Base64Convert.ToBase64(InStr);
                status := 'success*' + BaseImage;
            end else begin
                status := 'danger*No payslip found for the selected pay period';
            end;
        end else begin
            status := 'danger*The director number does not exist';
        end;
    end;

    procedure forgotPass(registrationNo: Code[10]) status: Text
    var
        email: Text;
    begin
        objContact.Reset;
        objContact.SetRange(objContact."Company No.", registrationNo);
        if objContact.Find('-') then begin
            email := objContact."E-Mail";
            if email = '' then begin
                status := 'danger*The customer does not have a valid email address';
            end else begin
                status := 'success*Reseting your password*' + email;
            end;
        end else begin
            status := 'danger*Customer with the specified id/registration number does not exist';
        end;
        exit(status);
    end;

    procedure changePassword(customerNo: Code[10]; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    begin
        status := 'danger*user not found';
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser."customer No", customerNo);
        if objPortalUser.Find('-') then begin
            if objPortalUser.Password = currentPassword then begin
                if newPassword = confirmNewPassword then begin
                    objPortalUser.Password := newPassword;
                    if objPortalUser.Modify then begin
                        status := 'success*Your password was successfully changed';
                    end else begin
                        status := 'danger*Your password could not be reset';
                    end;
                end else begin
                    status := 'danger*New password and confirm new password do not match';
                end;
            end else begin
                status := 'danger*Wrong current password';
            end;
        end else begin
            status := 'danger*The specified customer does not exist';
        end;
    end;


    procedure fnIForgotMyPassword(CustomerNo: Code[50]; ResetPasswordIs: Text[50]) status: Text
    begin
        status := 'danger*Account not found!';
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser."customer No", CustomerNo);
        if objPortalUser.Find('-') then begin
            objPortalUser.Password := ResetPasswordIs;
            if objPortalUser.Modify then begin
                status := 'success*Your password was successfully changed, Kindly check your Email for the new password!';
            end
            else begin
                status := 'danger*Your password could not be reset';
            end;
        end
        else begin
            //When the user exists in customer table but not a portal user
            objCustomer.Reset;
            objCustomer.SetRange(objCustomer."ID. No.", CustomerNo);
            if objCustomer.Find('-') then begin
                objPortalUser."customer No" := CustomerNo;
                objPortalUser.validated := true;
                objPortalUser.changedPassword := 0;
                if objPortalUser.Insert(true) then begin
                    status := 'success* You account password has been set. Please click <a href="Login.aspx"> here</a> to login';
                end
                else begin
                    status := 'danger*Unknown Error Occured while resetting password, contact Admin!';
                end
            end
            else begin
                status := 'danger*Unknown Error Occured, kindly conduct System Admin!';
            end
        end;
    end;

    procedure GetItemImage(custNo: Code[50]) photo: Text
    begin
        photo := 'avatar.png';
        objVendors.Reset;
        objVendors.SetRange(objVendors."No.", custNo);
        if objVendors.FindSet then begin
            //AL
            // objVendors.Image.ExportFile(IMAGEPATH+custNo+'.png');
            // if FILE.Exists(IMAGEPATH+custNo+'.png') then
            //   photo:=custNo+'.png';
            // Message('photo saved to '+IMAGEPATH);
        end;
    end;

    // procedure fnRegisterBoard(idNumber: Code[30]) status: Text
    // begin
    //     objVendor.Reset;
    //     objVendor.SetRange(objVendor.SystemId, idNumber);
    //     if objVendor.Find('-') then begin
    //         //user is a director but not in portal users table
    //         //check user has email
    //         if objVendor."E-Mail" = '' then begin
    //             status := 'danger*Your account does not have a valid email address. Please contact the head office to have your details captured in the system';
    //         end
    //         else begin
    //             //create account in portal users
    //             objPortalUser.Init;
    //             objPortalUser."customer No" := idNumber;
    //             objPortalUser.validated := false;
    //             objPortalUser.changedPassword := 0;
    //             objPortalUser.usertype := 1;
    //             if objPortalUser.Insert then begin
    //                 //send mail with activation link
    //                 status := 'success*Board';
    //                 //for Debug testing
    //                 Message(status);
    //                 //for Debug testing

    //             end
    //             else begin
    //                 status := 'danger*Your account could not be created. Please try again later';

    //                 //for Debug testing
    //                 Message(status);
    //                 //for Debug testing
    //             end
    //         end
    //     end;
    // end;

    procedure fnRegisterBoard(idNumber: Code[30]) status: Text
    var
        objBoardMember: Record "Board Members";
    begin
        objBoardMember.Reset();
        objBoardMember.SetRange("ID Number", idNumber);
        if objBoardMember.FindFirst() then begin
            if objBoardMember."E-Mail" = '' then begin
                status := 'danger*Your account does not have a valid email address. Please contact the head office to have your details captured in the system';
                exit;
            end;

            objPortalUser.Reset();
            objPortalUser.SetRange("customer No", objBoardMember."Personal No");
            if objPortalUser.FindFirst() then begin
                status := 'danger*An account already exists for this ID number. Use Forgot Password if you cannot log in.';
                exit;
            end;

            objPortalUser.Init();
            objPortalUser."customer No" := objBoardMember."Personal No";
            objPortalUser.Email := objBoardMember."E-Mail";
            objPortalUser.Name := objBoardMember."First Name" + ' ' + objBoardMember."Last Name";
            objPortalUser."Job Title" := objBoardMember."Designation/Role";
            objPortalUser.IDNoorRegNo := idNumber;
            objPortalUser.validated := false;
            objPortalUser.changedPassword := 0;
            objPortalUser.usertype := 1;
            objPortalUser.isFirstlogin := true;
            objPortalUser.Password := Format(Random(899999) + 100000);

            if objPortalUser.Insert(true) then
                status := 'success*' + objBoardMember."Personal No" + '*' + objBoardMember."E-Mail"
            else
                status := 'danger*Your account could not be created. Please try again later';
        end else
            status := 'danger*We could not find a board member record matching that ID number. Please contact the head office.';
    end;

    procedure fnMeetingsToday() countMeetings: Integer
    begin
        objBoardMeetings.Reset;
        objBoardMeetings.SetRange("Start date", Today);
        if objBoardMeetings.Find('-') then begin
            countMeetings := objBoardMeetings.Count;
            // MESSAGE(FORMAT(countMeetings));
        end
        else begin
            countMeetings := 0;
            //MESSAGE(FORMAT(countMeetings));
        end;
        exit(countMeetings);
    end;

    procedure FnInsertComment(meetingCode: Code[30]; directorNo: Code[30]; commentText: Text) isInserted: Text
    begin
        objMeetingComments.Init;
        objMeetingComments."Meeting Code" := meetingCode;
        objMeetingComments."Member No" := directorNo;
        objMeetingComments.Comment := commentText;
        objMeetingComments."Date Created" := Today;
        objMeetingComments."Time Created" := Time;

        if objMeetingComments.Insert = true then begin
            isInserted := 'success*Your Comment saved successfully!';
        end
        else begin
            isInserted := 'danger*Error occured, comment could not be saved!';
        end
    end;

    procedure generateMeetingResolutions(meetingCode: Code[20]) status: Text
    var
        BoardMeetings: Record "Board Meetings";
    begin
        objBoardMeetings.Reset;
        objBoardMeetings.SetRange(No, meetingCode);
        if objBoardMeetings.FindFirst then begin
            // if FILE.Exists(FILESPATH+'\Resolutions\'+Format(meetingCode)+'.pdf') then
            //   FILE.Erase(FILESPATH+'\Resolutions\'+Format(meetingCode)+'.pdf');
            //   Report.SaveAsPdf(56004,FILESPATH+'\Resolutions\'+meetingCode+'.pdf');
            //   status:='success*Downloads\Resolutions\'+meetingCode+'.pdf';
        end
        else begin
            status := 'danger*The meeting does not exist';
        end;
        Message(Format(status));
    end;

    // procedure FnGenerateP9(dirNumber: Code[20];startDate: Date;endDate: Date) status: Text
    // begin
    //       objVendor.Reset;
    //       objVendor.SetRange(objVendor."No.", dirNumber);
    //       if objVendor.FindSet then begin
    //          objVendor.SetFilter("Date Filter", Format(Format(startDate)  +'..'+ Format(endDate)));

    //           if FILE.Exists(FILESPATH+'\P9\'+dirNumber+'.pdf') then begin
    //             FILE.Erase(FILESPATH+'\P9\'+dirNumber+'.pdf');
    //             Report.SaveAsPdf(69021, FILESPATH+'\P9\'+dirNumber+'.pdf',objVendor);
    //             status:='success*Downloads\P9\'+dirNumber+'.pdf';
    //           end
    //           else begin
    //              status:='danger*Error generating P9 Report!';
    //           end
    //       end
    //       else  begin
    //         status:='danger*Director number not found!';
    //      end;
    // end;

    //     procedure FnGenerateP9(dirNumber: Code[20]; startDate: Date; endDate: Date) status: Text
    // var
    //     objVendor: Record Vendor;
    //     Report: Report "Housing Levy";
    //     TempBlob: Codeunit "Temp Blob";
    //     FileManagement: Codeunit "File Management";
    //     FilePath: Text;
    //     ReportStream: InStream;
    // begin
    //     objVendor.Reset;
    //     objVendor.SetRange(objVendor."No.", dirNumber);

    //     if objVendor.FindSet then begin
    //         objVendor.SetFilter("Date Filter", Format(startDate) + '..' + Format(endDate));

    //         FilePath := FILESPATH + '\P9\' + dirNumber + '.pdf';

    //         // Check if the file already exists
    //         if FileManagement.ServerFileExists(FilePath) then begin
    //             // Delete the existing file
    //             if not FileManagement.DeleteServerFile(FilePath) then begin
    //                 status := 'danger*Error deleting existing P9 Report!';
    //                 exit;
    //             end;
    //         end;

    //         // Save the report as a PDF in the TempBlob
    //         Report.SaveAsPdf(69021, ReportStream, objVendor);

    //         // Save the PDF from TempBlob to the desired location
    //         TempBlob.CreateOutStream(ReportStream);
    //         if FileManagement.BLOBExportToServerFile(TempBlob, FilePath) then begin
    //             status := 'success*Downloads\P9\' + dirNumber + '.pdf';
    //         end else begin
    //             status := 'danger*Error generating P9 Report!';
    //         end;
    //     end else begin
    //         status := 'danger*Director number not found!';
    //     end;
    // end;

    // procedure FnGenerateP9(dirNumber: Code[20]; startDate: Date; endDate: Date) status: Text
    // var
    //     objVendor: Record Vendor;
    //     TempBlob: Codeunit "Temp Blob";
    //     FileManagement: Codeunit "File Management";
    //     OutStream: OutStream;
    //     InStream: InStream;
    //     Report: Report "Sales - Invoice";
    //     ReportSelection: Record "Report Selection";
    //     FileName: Text;
    //     FilePath: Text;
    // begin
    //     objVendor.Reset;
    //     objVendor.SetRange(objVendor."No.", dirNumber);

    //     if objVendor.FindSet then begin
    //         objVendor.SetFilter("Date Filter", Format(startDate) + '..' + Format(endDate));

    //         // Set the output file name and path
    //         FileName := dirNumber + '.pdf';
    //         FilePath := 'P9\' + FileName;

    //         // Generate the report
    //         TempBlob.CreateOutStream(OutStream);
    //         Report.SaveAs(OutStream, Report.ReportId::"Your Report ID", ReportFormat::Pdf);

    //         // Upload the generated report to the server's temp folder
    //         if FileManagement.UploadFile(FilePath, FileName, '', '', InStream) then begin
    //             TempBlob.CreateInStream(InStream);
    //             TempBlob.ReadAsText(InStream, FilePath);
    //             status := 'success*Downloads\P9\' + dirNumber + '.pdf';
    //         end else begin
    //             status := 'danger*Error generating P9 Report!';
    //         end;
    //     end else begin
    //         status := 'danger*Director number not found!';
    //     end;
    // end;

    //  [Scope('OnPrem')]
    procedure generateCommitteeResolutions(meetingCode: Code[20]) status: Text
    var
        Filemgmt: Codeunit "File Management";

    begin
        objCommiteeMeeting.Reset;
        objCommiteeMeeting.SetRange(No, meetingCode);
        if objCommiteeMeeting.FindFirst then begin
            // if (Filemgmt.ServerFileExists(FILESPATH+'\Resolutions\'+Format(meetingCode)+'.pdf')) then begin
            //   Filemgmt.DeleteServerFile(FILESPATH+'\Resolutions\'+Format(meetingCode)+'.pdf');
            //  // Report.SaveAsPdf(56004,FILESPATH+'\Resolutions\'+meetingCode+'.pdf');
            //   status:='success*Downloads\Resolutions\'+meetingCode+'.pdf';
            // end 

        end
        else begin
            status := 'danger*The meeting does not exist';
        end;
        Message(Format(status));
    end;

    procedure FnInsertBlog(blogTitle: Text[250]; blogBody: Text[250]; dirNo: Code[20]; dirName: Text) insertStatus: Text
    begin
        objBlogPost.Reset;
        objBlogPost.SetRange("Blog Title", blogTitle);
        if objBlogPost.Find('+') then begin
            insertStatus := 'danger*The forum Title already exists, kindly reply on it!';
        end
        else begin
            objBlogPost.Init;
            objBlogPost."Blog Title" := blogTitle;
            objBlogPost."Blog Body" := blogBody;
            objBlogPost."Created ByDirNo" := dirNo;
            objBlogPost."Created ByDirName" := dirName;
            objBlogPost."Date Created" := Today;
            objBlogPost."Time Created" := Time;

            if objBlogPost.Insert = true then begin
                insertStatus := 'success*Forum created successfully, kindly follow up on replies';
            end else begin
                insertStatus := 'danger*Error occured, forum could not be created!';
            end
        end
    end;

    procedure FnInsertBlogReply(blogReply: Text[250]; dirNo: Code[20]; dirName: Text; blogId: Integer) insertStatus: Text
    begin
        objBlogReply.Init;
        objBlogReply.BlogIdCode := blogId;
        objBlogReply."Blog Reply" := blogReply;
        objBlogReply."Replier DirNo" := dirNo;
        objBlogReply."Replier Name" := dirName;
        objBlogReply."Date Replied" := Today;
        objBlogReply."Time Replied" := Time;

        if objBlogReply.Insert = true then begin
            insertStatus := 'success*Your reply successfully send';
        end else begin
            insertStatus := 'danger*Error occured, reply could not be created!';
        end
    end;

    procedure FnResetPassword(dirEmail: Text; newPassword: Text) passChangestatus: Text
    begin
        objPortalUser.Reset;
        objPortalUser.SetRange(Email, dirEmail);

        if objPortalUser.FindSet then begin
            objPortalUser.Password := newPassword;
            if objPortalUser.Modify(true) then begin
                passChangestatus := 'success*Your password was reset and sent to your email, kindly check your email!';
            end
            else begin
                passChangestatus := 'danger*Error changing Password!';
            end
        end
        else begin
            passChangestatus := 'danger*That director email does not exist';
        end
    end;

    procedure FnConfirmMeeting(meetingNo: Code[30]; dirNo: Code[30]; confirmStatus: Integer) statusConfirmed: Text
    begin
        //Find the member first
        objBoardMeetingsAttendance.Reset;
        objBoardMeetingsAttendance.SetRange("Member No", dirNo);
        if objBoardMeetingsAttendance.FindSet then begin
            //after member found, find the meeting
            //objBoardMeetingsAttendance.RESET;
            objBoardMeetingsAttendance.SetRange("Meeting Code", meetingNo);
            if objBoardMeetingsAttendance.FindSet then begin
                if confirmStatus = 1 then
                    objBoardMeetingsAttendance."Attendance Confirmation" := objBoardMeetingsAttendance."attendance confirmation"::Confirmed;
                if confirmStatus = 2 then
                    objBoardMeetingsAttendance."Attendance Confirmation" := objBoardMeetingsAttendance."attendance confirmation"::"Apologetic Decline";
                // objBoardMeetingsAttendance."Attendance Confirmation":=confirmStatus;
                if objBoardMeetingsAttendance.Modify then begin
                    statusConfirmed := 'success*Successfully reacted to the meeting confirmation!';
                end
                else begin
                    statusConfirmed := 'danger*Unknown error occured, could not save your confirmation!';
                end
            end
            else begin
                statusConfirmed := 'danger*Meeting not found!';
            end
        end
        else begin
            statusConfirmed := 'danger*You are not in attendance list for this meeting!';
        end
    end;

    procedure FnMeetConfStatus(meetCode: Code[30]; dirCode: Code[30]) confirmationStatus: Text
    begin
        objBoardMeetingsAttendance.Reset;
        objBoardMeetingsAttendance.SetRange("Meeting Code", meetCode);
        objBoardMeetingsAttendance.SetRange("Member No", dirCode);

        if objBoardMeetingsAttendance.FindSet then begin
            confirmationStatus := Format(objBoardMeetingsAttendance."Attendance Confirmation");
        end
        else begin
            confirmationStatus := 'Not found!';
        end
    end;

    procedure fnCountBoardMeetings(meetingCode: Code[30]) meetCount: Integer
    begin
        objBoardMeetings.Reset;
        objBoardMeetings.SetRange("Meeting group Code", meetingCode);
        objBoardMeetings.SetRange(Status, objBoardMeetings.Status::Completed);

        if objBoardMeetings.FindSet then begin
            meetCount := objBoardMeetings.Count;
        end
        else begin
            meetCount := 0;
        end
    end;

    procedure fnCountCommitteeMeetings(meetingCode: Code[30]) meetCount: Integer
    begin
        objCommiteeMeeting.Reset;
        objCommiteeMeeting.SetRange("Meeting group Code", meetingCode);
        objCommiteeMeeting.SetRange(Status, objCommiteeMeeting.Status::Completed);

        if objCommiteeMeeting.FindSet then begin
            meetCount := objCommiteeMeeting.Count;
        end
        else begin
            meetCount := 0;
        end
    end;

    procedure FnInsertInterest(meetingCode: Code[30]; directorNo: Code[30]; interesttText: Text) isInserted: Text
    begin

        objDeclareInterest.Reset;
        objDeclareInterest.SetRange("Meeting Code", meetingCode);
        objDeclareInterest.SetRange("Member No", directorNo);
        if objDeclareInterest.FindSet then begin

            objDeclareInterest.Comment := interesttText;
            objDeclareInterest."Date Created" := Today;
            objDeclareInterest."Time Created" := Time;

            if objDeclareInterest.Modify = true then begin
                isInserted := 'success*Your Interest successfully Updated!';
            end
        end else begin
            objDeclareInterest.Init;
            objDeclareInterest."Meeting Code" := meetingCode;
            objDeclareInterest."Member No" := directorNo;
            objDeclareInterest.Comment := interesttText;
            objDeclareInterest."Date Created" := Today;
            objDeclareInterest."Time Created" := Time;

            if objDeclareInterest.Insert = true then begin
                isInserted := 'success*Your Interest saved successfully!';
            end
            else begin
                isInserted := 'danger*Error occured, interest could not be saved!';
            end
        end
    end;

    procedure fnSubmitAgendaItemVote(directorCode: Code[30]; voteItemCode: Code[30]; directorName: Code[100]; voteDecision: Option) voteResults: Text
    begin
        objVoteItems.Reset;
        objVoteItems.SetRange(objVoteItems."Item No", voteItemCode);
        if objVoteItems.Find('-') then begin
            objVoters.Reset;
            objVoters.SetRange(objVoters."Voter ID", directorCode);
            objVoters.SetRange(objVoters."Agenda Vote Item code", voteItemCode);
            if objVoters.Find('-') then begin
                //cannot vote twice
                voteResults := 'danger*You have already voted on this Item!!';
            end else begin
                //now u can vote
                objVoters.Reset;
                objVoters."Voter ID" := directorCode;
                objVoters.Name := directorName;
                objVoters."Agenda Vote Item code" := voteItemCode;
                objVoters.Voted := true;
                objVoters."Vote decision" := voteDecision;
                objVoters.Insert;
                if voteDecision = 1 then begin
                    objVoteItems."Yes Count" := objVoteItems."Yes Count" + 1;
                end else if voteDecision = 2 then begin
                    objVoteItems."No Count" := objVoteItems."No Count" + 1;
                end else if voteDecision = 3 then begin
                    objVoteItems."Abstain Count" := objVoteItems."Abstain Count" + 1;
                end;
                objVoteItems.Modify;
                voteResults := 'success*You have successfully submitted your Vote, Thank you!';

            end;
        end else begin
            voteResults := 'danger*Unknown error occured while voting!';
        end;
    end;

    procedure fnSendEmail(recipientEmail: Text; emailBody: Text; recepientName: Text) emailSendResults: Text
    begin
        if recipientEmail = '' then
            Error('Please specify the Director Email address on Vendor Card before sending email!!');

        if recipientEmail <> '' then begin
            // smtpCodeunit.CreateMessage('KNTC E-BOARD','kntcerp@kntc.co.ke',
            // recipientEmail,'KNTC E-BOARD LOGIN CREDENTIALS',emailBody,true);
            // smtpCodeunit.AppendBody(
            // '<BR><BR>Thank You,'+
            // '<BR><BR>Kenya National Trading Corporation.<BR>');
            // smtpCodeunit.Send;
        end
    end;

    procedure fnSendRegistrationEmail(email: Text) status: Text
    var
        portalusers: Record portalusers;
        SMTP: Codeunit Email;
        subject: Text;
        mailBody: Text;
        emailSignature: Text;
    begin
        portalusers.Reset;
        portalusers.SetRange(Email, email);
        status := 'sending';
        if portalusers.FindSet then begin
            subject := 'E-BOARD LOGIN - One Time Password';
            mailBody := 'Dear Sir/Madam, ' + 'Your account was successfully created, your One Time Password is:<b> ' + portalusers.Password + '</b> <br>';
            emailSignature := '<br> Kindly use the password for your first Login, thereafter, you will be prompted to change it to your preferred passcode.<br> <br> Warm regards, <br>Kenya National Trade Coorporation. <br> [THIS IS AN AUTOMATED' +
            ' MESSAGE, KINDLY DO NOT REPLY TO IT]';
            // SMTP.CreateMessage('E-BOARD', 'erp@kntc.go.ke', portalusers.Email,subject, mailBody, true);
            // //SMTP.AppendBody(emailSignature);
            // SMTP.Send();
            Message('Email Sent Succesfully');
        end else begin
            Error('User not found');
        end
    end;

    procedure generateBoardMeetingResolutions(meetingCode: Code[20]) status: Text
    var
        BoardCommitteMeetings: Record "board meetings";
    begin
        BoardCommitteMeetings.Reset;
        BoardCommitteMeetings.SetRange(No, meetingCode);
        if BoardCommitteMeetings.FindFirst then begin
            // if FILE.Exists(FILESPATH2+'\BoardResolutions\'+Format(meetingCode)+'.pdf') then begin
            //   FILE.Erase(FILESPATH2+Format(meetingCode)+'.pdf');
            //   Report.SaveAsPdf(55003,FILESPATH2+Format(meetingCode)+'.pdf');
            //   status:='success*Documents\Resolutions\BoardResolutions\'+Format(meetingCode)+'.pdf';
            //   end  else begin
            //      Report.SaveAsPdf(55003,FILESPATH2+Format(meetingCode)+'.pdf');
            //     status:='success*Documents\Resolutions\BoardResolutions\'+Format(meetingCode)+'.pdf';
            //     end
        end
        else begin
            status := 'danger*The meeting does not exist';
        end;
        //MESSAGE(FORMAT(status));
    end;

    procedure generateCommMeetingResolutions(meetingCode: Code[20]) status: Text
    var
        BoardCommitteMeetings: Record "Board Meetings";
    begin
        BoardCommitteMeetings.Reset;
        BoardCommitteMeetings.SetRange(No, meetingCode);
        if BoardCommitteMeetings.FindFirst then begin
            // if FILE.Exists(FILESPATH3+'\CommitteResolutions\'+Format(meetingCode)+'.pdf') then begin
            //   FILE.Erase(FILESPATH3+Format(meetingCode)+'.pdf');
            //   Report.SaveAsPdf(55003,FILESPATH3+Format(meetingCode)+'.pdf');
            //   status:='success*Documents\Resolutions\CommitteResolutions\'+Format(meetingCode)+'.pdf';
            //   end  else begin
            //      Report.SaveAsPdf(55003,FILESPATH3+Format(meetingCode)+'.pdf');
            //     status:='success*Documents\Resolutions\CommitteResolutions\'+Format(meetingCode)+'.pdf';
            //     end
        end
        else begin
            status := 'danger*The meeting does not exist';
        end;
        //MESSAGE(FORMAT(status));
    end;

    procedure fnEditAgendaItemVote(directorCode: Code[30]; voteItemCode: Code[30]; directorName: Code[100]; voteDecision: Option) voteResults: Text
    begin
        objVoteItems.Reset;
        objVoteItems.SetRange(objVoteItems."Item No", voteItemCode);
        if objVoteItems.Find('-') then begin
            objVoters.Reset;
            objVoters.SetRange(objVoters."Voter ID", directorCode);
            objVoters.SetRange(objVoters."Agenda Vote Item code", voteItemCode);
            if objVoters.Find('-') then begin

                if objVoters."Vote decision" = objVoters."vote decision"::Yes then begin
                    objVoteItems."Yes Count" := objVoteItems."Yes Count" - 1;
                end else if objVoters."Vote decision" = objVoters."vote decision"::No then begin
                    objVoteItems."No Count" := objVoteItems."No Count" - 1;
                end else if objVoters."Vote decision" = objVoters."vote decision"::Abstain then begin
                    objVoteItems."Abstain Count" := objVoteItems."Abstain Count" - 1;
                end;

                if voteDecision = 1 then begin
                    objVoteItems."Yes Count" := objVoteItems."Yes Count" + 1;
                end else if voteDecision = 2 then begin
                    objVoteItems."No Count" := objVoteItems."No Count" + 1;
                end else if voteDecision = 3 then begin
                    objVoteItems."Abstain Count" := objVoteItems."Abstain Count" + 1;
                end;
                objVoteItems.Modify;

                if voteDecision = 1 then begin
                    objVoters."Vote decision" := objVoters."vote decision"::Yes;
                end else if voteDecision = 2 then begin
                    objVoters."Vote decision" := objVoters."vote decision"::No;
                end else if voteDecision = 3 then begin
                    objVoters."Vote decision" := objVoters."vote decision"::Abstain;
                end;


                objVoters.Modify();

                voteResults := 'success*You have successfully edited your Vote to ' + Format(objVoters."Vote decision") + ' , Thank you!';
            end else begin
                //now u can vote
                //      objVoters.RESET;
                //      objVoters."Voter ID":= directorCode;
                //      objVoters.Name:=directorName;
                //      objVoters."Agenda Vote Item code" :=voteItemCode;
                //      objVoters.Voted:=TRUE;
                //      objVoters."Vote decision":= voteDecision;
                //      objVoters.INSERT;
                //      IF voteDecision=1 THEN BEGIN
                //      objVoteItems."Yes Count":=objVoteItems."Yes Count"+1;
                //        END ELSE IF voteDecision=2 THEN BEGIN
                //          objVoteItems."No Count":=objVoteItems."No Count"+1;
                //          END ELSE IF voteDecision=3 THEN BEGIN
                //            objVoteItems."Abstain Count":=objVoteItems."Abstain Count"+1;
                //            END;
                //            objVoteItems.MODIFY;
                voteResults := 'danger*You cannot change vote before you have made your initial vote, Thank you!';

            end;
        end else begin
            voteResults := 'danger*Unknown error occured while voting!';
        end;
    end;

    procedure FnInsertMeetinParticulars(meetingCode: Code[30]; directorNo: Code[30]; confirmStatus: Integer; interesttText: Text; commentText: Text) status: Text
    var
        objDeclareInterest: Record "Board Meeting Comments";
        objBoardMeetingsAttendance: Record "Board Meeting Attendance";
        objMeetingComments: Record "Board Meeting Comments";
    begin
        objDeclareInterest.Reset;
        objDeclareInterest.SetRange("Meeting Code", meetingCode);
        objDeclareInterest.SetRange("Member No", directorNo);
        if objDeclareInterest.FindSet then begin

            objDeclareInterest.Comment := interesttText;
            objDeclareInterest."Date Created" := Today;
            objDeclareInterest."Time Created" := Time;

            if objDeclareInterest.Modify = true then begin
                status := 'success*Your Interest successfully Updated!';
            end
        end else begin
            objDeclareInterest.Init;
            objDeclareInterest."Meeting Code" := meetingCode;
            objDeclareInterest."Member No" := directorNo;
            objDeclareInterest.Comment := interesttText;
            objDeclareInterest."Date Created" := Today;
            objDeclareInterest."Time Created" := Time;

            if objDeclareInterest.Insert = true then begin
                status := 'success*Your Interest saved successfully!';
            end
            else begin
                status := 'danger*Error occured, interest could not be saved!';
            end
        end;

        //Find the member first
        objBoardMeetingsAttendance.Reset;
        objBoardMeetingsAttendance.SetRange("Member No", directorNo);
        if objBoardMeetingsAttendance.FindSet then begin
            //after member found, find the meeting
            //objBoardMeetingsAttendance.RESET;
            objBoardMeetingsAttendance.SetRange("Meeting Code", meetingCode);

            if objBoardMeetingsAttendance.FindSet then begin
                if confirmStatus = 1 then
                    objBoardMeetingsAttendance."Attendance Confirmation" := objBoardMeetingsAttendance."attendance confirmation"::Confirmed;
                if confirmStatus = 2 then
                    objBoardMeetingsAttendance."Attendance Confirmation" := objBoardMeetingsAttendance."attendance confirmation"::"Apologetic Decline";
                // objBoardMeetingsAttendance."Attendance Confirmation":=confirmStatus;
                if objBoardMeetingsAttendance.Modify then begin
                    status := 'success*Successfully reacted to the meeting confirmation!';
                end
                else begin
                    status := 'danger*Unknown error occured, could not save your confirmation!';
                end
            end
            else begin
                status := 'danger*Meeting not found!';
            end
        end
        else begin
            status := 'danger*You are not in attendance list for this meeting!';
        end;



        objMeetingComments.Init;
        objMeetingComments."Meeting Code" := meetingCode;
        objMeetingComments."Member No" := directorNo;
        objMeetingComments.Comment := commentText;
        objMeetingComments."Date Created" := Today;
        objMeetingComments."Time Created" := Time;

        if objMeetingComments.Insert = true then begin
            status := 'success*Your Meeting Declaration Details have been saved successfully!';
        end
        else begin
            status := 'danger*Error occured, comment could not be saved!';
        end
    end;

    procedure generateP9(employeeNumber: Code[50]; drNo: Code[50]) status: Text
    var
        Vendor: Record Vendor;
    begin
        status := 'danger*could not generate your statement';
        Vendor.Reset;
        Vendor.SetRange("No.", employeeNumber);
        if Vendor.FindSet then begin
            // if FILE.Exists(FILESPATH4+drNo+'.pdf') then begin
            //   FILE.Erase(FILESPATH4+drNo+'.pdf');
            //   Report.SaveAsPdf(304, FILESPATH4+drNo+'.pdf',Vendor);
            //   status:='success*Generated1*Downloads\P9\'+drNo+'.pdf';
            // end else begin
            //   Report.SaveAsPdf(304, FILESPATH4+drNo+'.pdf',Vendor);
            //   status:='success*Generated*Downloads\P9\'+drNo+'.pdf';
            // end;
        end else begin
            status := 'danger*Board Member could not found';
        end;
    end;

    procedure generateP9new(employeeNumber: Code[20]; startDate: DateTime; endDate: DateTime) BaseImage: Text
    var
        RecRef: RecordRef;
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        Employee.SetFilter(Employee."Date Filter", Format(Format(DT2DATE(startDate)) + '..' + Format(DT2DATE(endDate))));
        Employee.SetFilter("Pay Period Filter", Format(Format(DT2DATE(startDate)) + '..' + Format(DT2DATE(endDate))));
        if Employee.FindSet then begin
            RecRef.GetTable(Employee);
            Report.SaveAs(Report::"P9A Report", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('P9_%1.Pdf', Employee."No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
        end;
    end;

    procedure fnGetOpenMeetingPlans(directorNo: Code[20]) status: Text
    var
        CommitteeMember: Record "Committee Board Members";
        MeetingPlan: Record "Meeting Plans";
    begin
        CommitteeMember.Reset();
        CommitteeMember.SetRange("Director No", directorNo);
        if CommitteeMember.FindSet() then
            repeat
                MeetingPlan.Reset();
                MeetingPlan.SetRange("Committee Id", CommitteeMember.Committee);
                MeetingPlan.SetRange("Voting Status", MeetingPlan."Voting Status"::Open);
                if MeetingPlan.FindSet() then
                    repeat
                        status += MeetingPlan."Id" + '*' + MeetingPlan.Title + '*' + MeetingPlan."Committee Description" + '*' + Format(MeetingPlan.Year) + '*' + Format(MeetingPlan.Quarter) + '::::';
                    until MeetingPlan.Next() = 0;
            until CommitteeMember.Next() = 0;
    end;

    procedure fnGetMeetingDateOptions(meetingPlanId: Code[20]; memberNo: Code[20]) status: Text
    var
        DateOption: Record "Meeting Date Options";
        DatePoll: Record "Meeting Date Polls";
        hasVoted: Boolean;
    begin
        DateOption.Reset();
        DateOption.SetRange("Meeting Plan Id", meetingPlanId);
        if DateOption.FindSet() then
            repeat
                DateOption.CalcFields("Vote Count");
                hasVoted := false;
                DatePoll.Reset();
                DatePoll.SetRange("Meeting Plan Id", meetingPlanId);
                DatePoll.SetRange("Meeting Date Option Id", DateOption."Id");
                DatePoll.SetRange("Member No.", memberNo);
                if DatePoll.FindFirst() then
                    hasVoted := DatePoll."Has Voted";

                status += Format(DateOption."Id") + '*' + Format(DateOption."Proposed Date") + '*' + Format(DateOption."Start Time") + '*' + Format(DateOption."End Time") + '*' + DateOption.Venue + '*' + Format(DateOption."Vote Count") + '*' + Format(hasVoted) + '::::';
            until DateOption.Next() = 0;
    end;

    procedure fnCastMeetingDateVote(meetingPlanId: Code[20]; optionId: Integer; memberNo: Code[20]) status: Text
    var
        MeetingPlan: Record "Meeting Plans";
        DatePoll: Record "Meeting Date Polls";
    begin
        status := 'danger*Could not record your vote';

        if not MeetingPlan.Get(meetingPlanId) then begin
            status := 'danger*Meeting plan not found';
            exit(status);
        end;

        if MeetingPlan."Voting Status" <> MeetingPlan."Voting Status"::Open then begin
            status := 'danger*Voting is not currently open for this meeting plan';
            exit(status);
        end;

        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", meetingPlanId);
        DatePoll.SetRange("Meeting Date Option Id", optionId);
        DatePoll.SetRange("Member No.", memberNo);
        if DatePoll.FindFirst() then begin
            DatePoll.Validate("Has Voted", true);
            if DatePoll.Modify(true) then begin
                status := 'success*Your vote has been recorded';
            end else begin
                status := 'danger*Could not save your vote';
            end;
        end else begin
            status := 'danger*You are not eligible to vote on this option';
        end;
    end;

    procedure fnRemoveMeetingDateVote(meetingPlanId: Code[20]; optionId: Integer; memberNo: Code[20]) status: Text
    var
        DatePoll: Record "Meeting Date Polls";
    begin
        status := 'danger*Could not remove your vote';

        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", meetingPlanId);
        DatePoll.SetRange("Meeting Date Option Id", optionId);
        DatePoll.SetRange("Member No.", memberNo);
        if DatePoll.FindFirst() then begin
            DatePoll.Validate("Has Voted", false);
            if DatePoll.Modify(true) then begin
                status := 'success*Your vote has been removed';
            end else begin
                status := 'danger*Could not remove your vote';
            end;
        end else begin
            status := 'danger*Vote record not found';
        end;
    end;

    procedure fnGetConfirmedMeetingDate(meetingPlanId: Code[20]) status: Text
    var
        MeetingPlan: Record "Meeting Plans";
    begin
        if MeetingPlan.Get(meetingPlanId) then begin
            MeetingPlan.CalcFields("Selected Meeting Date");
            if MeetingPlan."Voting Status" = MeetingPlan."Voting Status"::Closed then begin
                if MeetingPlan."Selected Meeting Date Option Id" <> 0 then begin
                    status := 'success*' + Format(MeetingPlan."Selected Meeting Date") + '*' + MeetingPlan."Meeting Code";
                end else begin
                    status := 'warning*Voting closed with a tie - awaiting manual selection';
                end;
            end else begin
                status := 'pending*Voting is still open';
            end;
        end else begin
            status := 'danger*Meeting plan not found';
        end;
    end;

    procedure fnIsMeetingConvener(meetingCode: Code[200]; directorNo: Code[50]) status: Boolean
    var
        BoardMeeting: Record "Board Meetings";
    begin
        if BoardMeeting.Get(meetingCode) then
            exit(BoardMeeting."Convener No." = directorNo);
        exit(false);
    end;

    procedure fnSetMeetingOnlineLink(meetingCode: Code[200]; directorNo: Code[50]; provider: Integer; link: Text[500]) status: Text
    var
        BoardMeeting: Record "Board Meetings";
    begin
        status := 'danger*Could not set the meeting link';

        if not BoardMeeting.Get(meetingCode) then begin
            status := 'danger*Meeting not found';
            exit(status);
        end;

        if BoardMeeting."Convener No." <> directorNo then begin
            status := 'danger*Only the meeting convener can attach a meeting link';
            exit(status);
        end;

        if not BoardMeeting."Date Confirmed" then begin
            status := 'danger*The meeting date must be confirmed before a link can be attached';
            exit(status);
        end;

        BoardMeeting."Online Meeting Provider" := provider;
        BoardMeeting.Validate("Online Meeting Link", link);

        if BoardMeeting.Modify(true) then begin
            status := 'success*Online meeting link saved successfully';
        end else begin
            status := 'danger*Could not save the meeting link';
        end;
    end;

    procedure fnRecordMeetingAttendance(meetingCode: Code[200]; directorNo: Code[50]; memberNo: Code[50]; attendance: Integer; attendanceMode: Integer) status: Text
    var
        BoardMeeting: Record "Board Meetings";
        BoardAttendance: Record "Board Meeting Attendance";
    begin
        status := 'danger*Could not record attendance';

        if not BoardMeeting.Get(meetingCode) then begin
            status := 'danger*Meeting not found';
            exit(status);
        end;

        if BoardMeeting."Convener No." <> directorNo then begin
            status := 'danger*Only the meeting convener can record attendance';
            exit(status);
        end;

        BoardAttendance.Reset();
        BoardAttendance.SetRange("Meeting Code", meetingCode);
        BoardAttendance.SetRange("Member No", memberNo);
        if BoardAttendance.FindFirst() then begin
            BoardAttendance.Validate(Attendance, attendance);
            BoardAttendance."Attendance Mode" := attendanceMode;

            if BoardAttendance.Modify(true) then begin
                status := 'success*Attendance recorded successfully';
            end else begin
                status := 'danger*Could not save attendance record';
            end;
        end else begin
            status := 'danger*This member is not on the attendance list for this meeting';
        end;
    end;

    procedure fnGetMeetingAttendanceReport(meetingCode: Code[200]) status: Text
    var
        BoardAttendance: Record "Board Meeting Attendance";
    begin
        BoardAttendance.Reset();
        BoardAttendance.SetRange("Meeting Code", meetingCode);
        if BoardAttendance.FindSet() then
            repeat
                status += BoardAttendance."Member No" + '*' + BoardAttendance."Member Name" + '*' +
                          Format(BoardAttendance.Attendance) + '*' + Format(BoardAttendance."Attendance Mode") + '*' +
                          Format(BoardAttendance."Has Attended") + '*' + Format(BoardAttendance."Attendance Confirmation") +
                          '::::';
            until BoardAttendance.Next() = 0;
    end;

    procedure fnHasGivenDataConsent(directorNo: Code[50]) status: Boolean
    var
        BoardMember: Record "Board Members";
    begin
        BoardMember.Reset();
        BoardMember.SetRange("Personal No", directorNo);
        if BoardMember.FindFirst() then
            exit(BoardMember."Data Consent Given");
        exit(false);
    end;

    procedure fnRecordDataConsent(directorNo: Code[50]) status: Text
    var
        BoardMember: Record "Board Members";
    begin
        status := 'danger*Could not record your consent';

        BoardMember.Reset();
        BoardMember.SetRange("Personal No", directorNo);
        if not BoardMember.FindFirst() then begin
            status := 'danger*Member record not found';
            exit(status);
        end;

        BoardMember."Data Consent Given" := true;
        BoardMember."Data Consent Date" := Today;

        if BoardMember.Modify(true) then begin
            status := 'success*Consent recorded successfully';
        end else begin
            status := 'danger*Could not save your consent';
        end;
    end;

    procedure fnCreateBoardTrainingNeed(directorNo: Code[50]; memberName: Text[300]; trainingTitle: Text[250]; justification: Text[500]) status: Text
    var
        TrainingNeed: Record "Board Training Needs";
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
    begin
        status := 'danger*Could not submit training need';

        TrainingNeed.Init();
        HRSetup.Get();
        if HRSetup."Training Application Nos." <> '' then
            TrainingNeed."Application No." := NoSeriesMgt.GetNextNo(HRSetup."Training Application Nos.", WorkDate(), true)
        else
            TrainingNeed."Application No." := 'BTN' + Format(Random(999999));

        TrainingNeed."Member No." := directorNo;
        TrainingNeed."Member Name" := memberName;
        TrainingNeed."Training Title" := trainingTitle;
        TrainingNeed.Justification := justification;
        TrainingNeed."Date Submitted" := Today;
        TrainingNeed.Status := TrainingNeed.Status::"Pending Approval";

        if TrainingNeed.Insert(true) then begin
            status := 'success*' + TrainingNeed."Application No." + '*Training need submitted successfully';
        end else begin
            status := 'danger*Could not save training need';
        end;
    end;

    procedure fnGetMyBoardTrainingNeeds(directorNo: Code[50]) status: Text
    var
        TrainingNeed: Record "Board Training Needs";
    begin
        TrainingNeed.Reset();
        TrainingNeed.SetRange("Member No.", directorNo);
        if TrainingNeed.FindSet() then
            repeat
                status += TrainingNeed."Application No." + '*' + TrainingNeed."Training Title" + '*' +
                          Format(TrainingNeed."Date Submitted") + '*' + Format(TrainingNeed.Status) + '*' +
                          TrainingNeed."Approver Comments" + '::::';
            until TrainingNeed.Next() = 0;
    end;

    procedure fnCreateBoardFacilitationRequest(directorNo: Code[50]; memberName: Text[300]; trainingNeedNo: Code[20]; requestType: Integer; amount: Decimal; description: Text[250]) status: Text
    var
        TrainingNeed: Record "Board Training Needs";
        FacilitationReq: Record "Board Facilitation Request";
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
    begin
        status := 'danger*Could not submit facilitation request';

        if not TrainingNeed.Get(trainingNeedNo) then begin
            status := 'danger*Training need not found';
            exit(status);
        end;

        if TrainingNeed."Member No." <> directorNo then begin
            status := 'danger*This training need does not belong to you';
            exit(status);
        end;

        if TrainingNeed.Status <> TrainingNeed.Status::Approved then begin
            status := 'danger*This training need has not been approved yet';
            exit(status);
        end;

        FacilitationReq.Init();
        HRSetup.Get();
        if HRSetup."Training Application Nos." <> '' then
            FacilitationReq."Request No." := NoSeriesMgt.GetNextNo(HRSetup."Training Application Nos.", WorkDate(), true)
        else
            FacilitationReq."Request No." := 'BFR' + Format(Random(999999));

        FacilitationReq."Training Need No." := trainingNeedNo;
        FacilitationReq."Member No." := directorNo;
        FacilitationReq."Member Name" := memberName;
        FacilitationReq."Request Type" := requestType;
        FacilitationReq."Amount Requested" := amount;
        FacilitationReq.Description := description;
        FacilitationReq."Date Submitted" := Today;
        FacilitationReq.Status := FacilitationReq.Status::"Pending Approval";

        if FacilitationReq.Insert(true) then begin
            status := 'success*' + FacilitationReq."Request No." + '*Facilitation request submitted successfully';
        end else begin
            status := 'danger*Could not save facilitation request';
        end;
    end;

    procedure fnGetMyBoardFacilitationRequests(directorNo: Code[50]) status: Text
    var
        FacilitationReq: Record "Board Facilitation Request";
    begin
        FacilitationReq.Reset();
        FacilitationReq.SetRange("Member No.", directorNo);
        if FacilitationReq.FindSet() then
            repeat
                status += FacilitationReq."Request No." + '*' + FacilitationReq."Training Need No." + '*' +
                          Format(FacilitationReq."Request Type") + '*' + Format(FacilitationReq."Amount Requested") + '*' +
                          Format(FacilitationReq."Date Submitted") + '*' + Format(FacilitationReq.Status) + '*' +
                          FacilitationReq."Approver Comments" + '::::';
            until FacilitationReq.Next() = 0;
    end;

    procedure fnAddBoardPackDocument(meetingCode: Code[200]; directorNo: Code[50]; fileName: Text[250]; sharepointLink: Text[500]) status: Text
    var
        BoardMeeting: Record "Board Meetings";
        BoardPackDoc: Record "Board Pack Document";
    begin
        status := 'danger*Could not upload document';

        if not BoardMeeting.Get(meetingCode) then begin
            status := 'danger*Meeting not found';
            exit(status);
        end;

        if BoardMeeting."Convener No." <> directorNo then begin
            status := 'danger*Only the meeting convener can upload board pack documents';
            exit(status);
        end;

        BoardPackDoc.Init();
        BoardPackDoc."Meeting Code" := meetingCode;
        BoardPackDoc."File Name" := fileName;
        BoardPackDoc."SharePoint Link" := sharepointLink;
        BoardPackDoc."Uploaded By" := directorNo;
        BoardPackDoc."Date Uploaded" := Today;

        if BoardPackDoc.Insert(true) then begin
            status := 'success*Document uploaded successfully';
        end else begin
            status := 'danger*Could not save document record';
        end;
    end;

    procedure fnGetBoardPackDocuments(meetingCode: Code[200]) status: Text
    var
        BoardPackDoc: Record "Board Pack Document";
    begin
        BoardPackDoc.Reset();
        BoardPackDoc.SetRange("Meeting Code", meetingCode);
        if BoardPackDoc.FindSet() then
            repeat
                status += Format(BoardPackDoc."Entry No.") + '*' + BoardPackDoc."File Name" + '*' +
                          BoardPackDoc."SharePoint Link" + '*' + Format(BoardPackDoc."Date Uploaded") +
                          '::::';
            until BoardPackDoc.Next() = 0;
    end;

    procedure fnRemoveBoardPackDocument(meetingCode: Code[200]; directorNo: Code[50]; entryNo: Integer) status: Text
    var
        BoardMeeting: Record "Board Meetings";
        BoardPackDoc: Record "Board Pack Document";
    begin
        status := 'danger*Could not remove document';

        if not BoardMeeting.Get(meetingCode) then begin
            status := 'danger*Meeting not found';
            exit(status);
        end;

        if BoardMeeting."Convener No." <> directorNo then begin
            status := 'danger*Only the meeting convener can remove board pack documents';
            exit(status);
        end;

        BoardPackDoc.Reset();
        BoardPackDoc.SetRange("Meeting Code", meetingCode);
        BoardPackDoc.SetRange("Entry No.", entryNo);
        if BoardPackDoc.FindFirst() then begin
            if BoardPackDoc.Delete(true) then begin
                status := 'success*Document removed successfully';
            end else begin
                status := 'danger*Could not remove document';
            end;
        end else begin
            status := 'danger*Document not found';
        end;
    end;

    procedure fnRaiseResolution(directorNo: Code[50]; committeeId: Code[20]; title: Text[250]; description: Text[2048]; resolutionType: Integer; majorityType: Integer; specialMajorityPct: Decimal) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        status := 'danger*Could not raise resolution';

        Resolution.Init();
        Resolution."Committee Id" := committeeId;
        Resolution.Title := title;
        Resolution.Description := description;
        Resolution."Resolution Type" := resolutionType;
        Resolution.Insert(true);

        Resolution."Majority Type" := majorityType;
        if majorityType = Resolution."Majority Type"::"Special Majority" then
            Resolution."Special Majority Percentage" := specialMajorityPct;
        Resolution.Modify(true);

        status := 'success*' + Resolution."No." + '*Resolution raised successfully';
    end;

    procedure fnGetCommitteeResolutions(committeeId: Code[20]) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        Resolution.Reset();
        Resolution.SetRange("Committee Id", committeeId);
        if Resolution.FindSet() then
            repeat
                status += Resolution."No." + '*' + Resolution.Title + '*' + Format(Resolution."Resolution Type") + '*' +
                          Format(Resolution."Resolution Status") + '*' + Format(Resolution."Voting Status") + '::::';
            until Resolution.Next() = 0;
    end;

    procedure fnGetResolutionDetail(resolutionNo: Code[20]) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        if not Resolution.Get(resolutionNo) then begin
            status := 'danger*Resolution not found';
            exit(status);
        end;

        Resolution.CalcFields("For Votes", "Against Votes", "Abstain Votes", "Eligible Voters");

        status := 'success*' + Resolution.Title + '*' + Resolution.Description + '*' + Format(Resolution."Resolution Type") + '*' +
                   Format(Resolution."Resolution Status") + '*' + Format(Resolution."Voting Status") + '*' +
                   Format(Resolution."Majority Type") + '*' + Format(Resolution."For Votes") + '*' +
                   Format(Resolution."Against Votes") + '*' + Format(Resolution."Abstain Votes") + '*' +
                   Format(Resolution."Eligible Voters") + '*' + Format(Resolution.Outcome) + '*' + Resolution."Created By";
    end;

    procedure fnGetMyResolutionVote(resolutionNo: Code[20]; directorNo: Code[50]) status: Text
    var
        ResolutionVote: Record "Resolution Votes";
    begin
        if ResolutionVote.Get(resolutionNo, directorNo) then begin
            status := 'success*' + Format(ResolutionVote.Vote);
        end else begin
            status := 'danger*You are not eligible to vote on this resolution';
        end;
    end;

    procedure fnCastResolutionVote(resolutionNo: Code[20]; directorNo: Code[50]; vote: Integer) status: Text
    var
        ResolutionVote: Record "Resolution Votes";
    begin
        status := 'danger*Could not record your vote';

        if not ResolutionVote.Get(resolutionNo, directorNo) then begin
            status := 'danger*You are not eligible to vote on this resolution';
            exit(status);
        end;

        ResolutionVote.Validate(Vote, vote);
        if ResolutionVote.Modify(true) then begin
            status := 'success*Your vote has been recorded';
        end else begin
            status := 'danger*Could not save your vote';
        end;
    end;

    procedure fnEscalateResolution(resolutionNo: Code[20]; directorNo: Code[50]; fullBoardMeetingCode: Code[20]) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        status := 'danger*Could not escalate resolution';

        if not Resolution.Get(resolutionNo) then begin
            status := 'danger*Resolution not found';
            exit(status);
        end;

        if Resolution."Created By" <> directorNo then begin
            status := 'danger*Only the member who raised this resolution can escalate it';
            exit(status);
        end;

        Resolution.EscalateToBoard(fullBoardMeetingCode);
        status := 'success*Resolution escalated to the Full Board for voting';
    end;

    procedure fnCloseResolutionVoting(resolutionNo: Code[20]; directorNo: Code[50]) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        status := 'danger*Could not close voting';

        if not Resolution.Get(resolutionNo) then begin
            status := 'danger*Resolution not found';
            exit(status);
        end;

        if Resolution."Created By" <> directorNo then begin
            status := 'danger*Only the member who raised this resolution can close voting';
            exit(status);
        end;

        Resolution.CloseVoting();
        status := 'success*Voting closed and outcome recorded';
    end;

    procedure fnWithdrawResolution(resolutionNo: Code[20]; directorNo: Code[50]) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        status := 'danger*Could not withdraw resolution';

        if not Resolution.Get(resolutionNo) then begin
            status := 'danger*Resolution not found';
            exit(status);
        end;

        if Resolution."Created By" <> directorNo then begin
            status := 'danger*Only the member who raised this resolution can withdraw it';
            exit(status);
        end;

        Resolution.Withdraw();
        status := 'success*Resolution withdrawn';
    end;

    procedure fnMarkResolutionNoted(resolutionNo: Code[20]; directorNo: Code[50]) status: Text
    var
        Resolution: Record "Meeting Resolutions";
    begin
        status := 'danger*Could not mark resolution as noted';

        if not Resolution.Get(resolutionNo) then begin
            status := 'danger*Resolution not found';
            exit(status);
        end;

        if Resolution."Created By" <> directorNo then begin
            status := 'danger*Only the member who raised this resolution can mark it as noted';
            exit(status);
        end;

        Resolution.MarkNoted();
        status := 'success*Resolution marked as noted';
    end;

    procedure fnGetMyConvenedMeetings(directorNo: Code[50]) status: Text
    var
        BoardMeeting: Record "Board Meetings";
    begin
        BoardMeeting.Reset();
        BoardMeeting.SetRange("Convener No.", directorNo);
        if BoardMeeting.FindSet() then
            repeat
                status += BoardMeeting.No + '*' + BoardMeeting.Title + '*' + Format(BoardMeeting."Start date") + '*' +
                          Format(BoardMeeting."Start time") + '*' + Format(BoardMeeting.Status) + '::::';
            until BoardMeeting.Next() = 0;
    end;

}
