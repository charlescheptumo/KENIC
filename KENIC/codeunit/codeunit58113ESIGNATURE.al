namespace KENIC.KENIC;

using System.Email;
using Microsoft.Foundation.Company;
using System.Security.User;
using System.Automation;

codeunit 58113 "ESIGNATURE"
{
    var
        EBoardSetup: Record "E-Board Setup";
        CompanyInfo: Record "Company Information";

    procedure NotifySignatoriesToSign(ESignHeader: Record "ESign Header")
    var
        ESignLine: Record "ESign Line";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
    begin
        
        if not ESignHeader.Posted then
            exit;

        CompanyInfo.Get();
        GetEBoardSetup(EBoardSetup);

        Subject := StrSubstNo('Document Signature Request – %1', ESignHeader."No.");

        ESignLine.Reset();
        ESignLine.SetRange("Document No.", ESignHeader."No.");
        ESignLine.SetFilter(Email, '<>%1', '');
        ESignLine.SetRange("Notification Sent", false);

        if ESignLine.FindSet(true) then
            repeat
                Body := StrSubstNo('Dear %1,<br><br>', ESignLine."Board Member Name");
                Body += StrSubstNo(
                    'A new document <b>%1</b> has been posted and requires your official electronic signature.<br><br>',
                    ESignHeader."No.");

                Body += '<b>Document Details:</b><br>';
                Body += '<b>Title:</b> ' + ESignHeader.Title + '<br>';

                if ESignHeader.Description <> '' then
                    Body += '<b>Description:</b> ' + ESignHeader.Description + '<br>';

                Body += '<b>Date Posted:</b> ' + Format(Today()) + '<br><br>';

                
                if ESignHeader."Document URL" <> '' then begin
                    Body += StrSubstNo(
                        '<b>Reference Copy:</b> <a href="%1">Click here to preview original document</a><br><br>',
                        ESignHeader."Document URL");
                end;

                
               // Body += '<div style="background-color: #fff4ce; border-left: 4px solid #ffb900; padding: 12px; margin-bottom: 15px;">';
                Body += '<b>Important Notice:</b> Please <b>do not print and physically sign</b> this document. ';
                Body += 'To ensure legal compliance and track your signature, you must log in to the E-Board Portal and complete the signing process online.';
                Body += '</div>';

                if EBoardSetup."E-Board Portal URL" <> '' then begin
                    Body += StrSubstNo(
                        '<a href="%1" style="display:inline-block;padding:10px 20px;background:#0078d4;color:#ffffff;text-decoration:none;border-radius:4px;font-weight:bold;">Log In to E-Board Portal & Sign</a><br><br>',
                        EBoardSetup."E-Board Portal URL");
                end;

                Body += 'Regards,<br>';
                Body += CompanyInfo.Name + '<br><br>';
                Body += '<i>This is a system-generated email notification. Please do not reply directly.</i>';

                Clear(EmailMessage);
                EmailMessage.Create(
                    ESignLine.Email,
                    Subject,
                    Body,
                    true);

                if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then begin
                    ESignLine."Notification Sent" := true;
                    ESignLine.Modify(true);
                end;

            until ESignLine.Next() = 0;
    end;


    // 1. Send Approval Request Notifications
    procedure SendApprovalRequestNotificationsForESignature(DocNo: Code[20])
    var
        ESignHeader: Record "ESign Header";
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
        SenderUserSetup: Record "User Setup";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipient, RecipientName, Subject, Body, ApprovalURL : Text;
        ApprovalPageID: Label '654';
    begin
        CompanyInfo.Get();
        GetEBoardSetup(EBoardSetup);

        ESignHeader.Reset();
        ESignHeader.SetRange("No.", DocNo);
        if ESignHeader.FindFirst() then begin
            ApprovalEntry.Reset();
            ApprovalEntry.SetRange("Document No.", ESignHeader."No.");
            ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);

            if ApprovalEntry.FindFirst() then begin
                if UserSetup.Get(ApprovalEntry."Approver ID") then begin
                    Subject := StrSubstNo('APPROVAL NOTIFICATION: E-Signature Request %1', ESignHeader."No.");

                    RecipientName := UserSetup."Employee Name";
                    if RecipientName = '' then
                        RecipientName := UserSetup."User ID";

                    Recipient := UserSetup."E-Mail";
                    if Recipient = '' then
                        exit;

                    Body := StrSubstNo('Dear %1,<br><br>', RecipientName);
                    Body += StrSubstNo('An E-Signature document request <b>%1</b> (%2) has been submitted for your review.<br>', ESignHeader."No.", ESignHeader.Title);
                    Body += 'Please review the document details and verify that all information is correct before it is released to the signatories for signing.<br><br>';

                  
                    if ESignHeader."Created By" <> '' then begin
                        if SenderUserSetup.Get(ESignHeader."Created By") then
                            Body += '<b>Created By:</b> ' + SenderUserSetup."Employee Name" + '<br>'
                        else
                            Body += '<b>Created By:</b> ' + ESignHeader."Created By" + '<br>';
                    end else if SenderUserSetup.Get(ApprovalEntry."Sender ID") then
                        Body += '<b>Created By:</b> ' + SenderUserSetup."Employee Name" + '<br>';

                   
                    if ESignHeader."Document URL" <> '' then begin
                        Body += '<br><b>Document Link:</b><br>';
                        Body += StrSubstNo(
                            '<a href="%1" target="_blank" style="display:inline-block;padding:8px 16px;background:#2b579a;color:#ffffff;text-decoration:none;border-radius:4px;font-weight:bold;">View Document File</a><br><br>',
                            ESignHeader."Document URL");
                    end;

                  
                    if EBoardSetup."ERP URL" <> '' then begin
                        if EBoardSetup."ERP URL".EndsWith('/') or EBoardSetup."ERP URL".EndsWith('?') then
                            ApprovalURL := EBoardSetup."ERP URL" + 'page=' + ApprovalPageID
                        else if EBoardSetup."ERP URL".Contains('?') then
                            ApprovalURL := EBoardSetup."ERP URL" + '&page=' + ApprovalPageID
                        else
                            ApprovalURL := EBoardSetup."ERP URL" + '?page=' + ApprovalPageID;

                        Body += 'Log in to the ERP to confirm and approve:<br><br>';
                        Body += StrSubstNo(
                            '<a href="%1" style="display:inline-block;padding:10px 20px;background:#0078d4;color:#ffffff;text-decoration:none;border-radius:4px;font-weight:bold;">Open ERP Approvals</a><br><br>',
                            ApprovalURL);
                    end;

                    Body += 'Regards,<br>';
                    Body += CompanyInfo.Name + '<br><br>';
                    Body += '<i>This is a system-generated email. Please do not reply.</i>';

                    Clear(EmailMessage);
                    EmailMessage.Create(Recipient, Subject, Body, true);
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                end;
            end;
        end;
    end;
    // 2. Approved Notification to Initiator
    procedure SendApprovedNotificationToInitiatorForESignature(DocNo: Code[20])
    var
        ESignHeader: Record "ESign Header";
        UserSetup: Record "User Setup";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipient, RecipientName, Subject, Body, CardURL : Text;
        CardPageID: Label '58155'; 
    begin
        CompanyInfo.Get();
        GetEBoardSetup(EBoardSetup);

        ESignHeader.Reset();
        ESignHeader.SetRange("No.", DocNo);
        if ESignHeader.FindFirst() then begin
            if ESignHeader."Approval Status" <> ESignHeader."Approval Status"::Released then
                exit;

            if ESignHeader."Created By" <> '' then begin
                if UserSetup.Get(ESignHeader."Created By") then begin
                    Subject := StrSubstNo('APPROVED: E-Signature Request %1 is Ready for Posting', ESignHeader."No.");

                    RecipientName := UserSetup."Employee Name";
                    if RecipientName = '' then
                        RecipientName := UserSetup."User ID";

                    Recipient := UserSetup."E-Mail";
                    if Recipient = '' then
                        exit;

                    Body := StrSubstNo('Dear %1,<br><br>', RecipientName);
                    Body += StrSubstNo('Your E-Signature request <b>%1</b> (%2) has been <b>FULLY APPROVED</b>.<br><br>', ESignHeader."No.", ESignHeader.Title);
                    Body += 'Please log in to the ERP and click <b>Post</b> to publish the document to the portal for signatories to sign.<br><br>';

                    if EBoardSetup."ERP URL" <> '' then begin
                        if EBoardSetup."ERP URL".EndsWith('/') or EBoardSetup."ERP URL".EndsWith('?') then
                            CardURL := EBoardSetup."ERP URL" + 'page=' + CardPageID
                        else if EBoardSetup."ERP URL".Contains('?') then
                            CardURL := EBoardSetup."ERP URL" + '&page=' + CardPageID
                        else
                            CardURL := EBoardSetup."ERP URL" + '?page=' + CardPageID;

                        Body += StrSubstNo(
                            '<a href="%1" style="display:inline-block;padding:10px 20px;background:#0078d4;color:#ffffff;text-decoration:none;border-radius:4px;font-weight:bold;">Open ERP & Post to Portal</a><br><br>',
                            CardURL);
                    end;

                    Body += 'Regards,<br>';
                    Body += CompanyInfo.Name + '<br><br>';
                    Body += '<i>This is a system-generated email. Please do not reply.</i>';

                    Clear(EmailMessage);
                    EmailMessage.Create(Recipient, Subject, Body, true);
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                end;
            end;
        end;
    end;

    // 3. Rejected Notification to Initiator
    procedure SendRejectedNotificationToInitiatorForESignature(DocNo: Code[20])
    var
        ESignHeader: Record "ESign Header";
        UserSetup: Record "User Setup";
        ApprovalCommentLine: Record "Approval Comment Line";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipient, RecipientName, Subject, Body, RejectionReason : Text;
    begin
        CompanyInfo.Get();

        ESignHeader.Reset();
        ESignHeader.SetRange("No.", DocNo);
        if ESignHeader.FindFirst() then begin
            if ESignHeader."Approval Status" <> ESignHeader."Approval Status"::Rejected then
                exit;

            if ESignHeader."Created By" <> '' then begin
                if UserSetup.Get(ESignHeader."Created By") then begin
                    Recipient := UserSetup."E-Mail";
                    if Recipient = '' then
                        exit;

                    RecipientName := UserSetup."Employee Name";
                    if RecipientName = '' then
                        RecipientName := UserSetup."User ID";

                    ApprovalCommentLine.Reset();
                    ApprovalCommentLine.SetRange("Document No.", DocNo);
                    if ApprovalCommentLine.FindLast() then
                        RejectionReason := ApprovalCommentLine.Comment
                    else
                        RejectionReason := 'No specific reason provided.';

                    Subject := StrSubstNo('REJECTED: E-Signature Request %1', ESignHeader."No.");

                    Body := StrSubstNo('Dear %1,<br><br>', RecipientName);
                    Body += StrSubstNo('Your E-Signature request <b>%1</b> (%2) has been <b>REJECTED</b>.<br><br>', ESignHeader."No.", ESignHeader.Title);
                    Body += StrSubstNo('<b>Reason for Rejection:</b> %1<br><br>', RejectionReason);
                    Body += 'Kindly log in to the ERP to review the comments, make necessary updates, and resubmit if appropriate.<br><br>';
                    Body += 'Regards,<br>';
                    Body += CompanyInfo.Name + '<br><br>';
                    Body += '<i>This is a system-generated email. Please do not reply.</i>';

                    Clear(EmailMessage);
                    EmailMessage.Create(Recipient, Subject, Body, true);
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                end;
            end;
        end;
    end;

    local procedure GetEBoardSetup(var Setup: Record "E-Board Setup")
    begin
        Setup.GetRecordOnce();
    end;
}