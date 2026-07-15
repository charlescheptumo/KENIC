namespace KENIC.KENIC;

using System.Email;
using Microsoft.Foundation.Company;
using System.Security.User;
using System.Automation;
using Microsoft.HumanResources.Employee;

codeunit 50048 "Resolution Management"
{
    var
        EBoardSetup: Record "E-Board Setup";
        CompanyInfo: Record "Company Information";

    /// <summary>
    /// Generates voting lines for all active employees/board members under this resolution.
    /// </summary>
    /// <param name="ResolutionNo">The header No. to link lines to</param>
    procedure RunGenerator(ResolutionNo: Code[20])
    var
        Employee: Record Employee;
        ResolutionLine: Record "Circular Resolution lines";
        LineNo: Integer;
    begin
        if ResolutionNo = '' then
            exit;

        // Find the next Line No. starting point
        ResolutionLine.Reset();
        ResolutionLine.SetRange("Resolution No.", ResolutionNo);
        if ResolutionLine.FindLast() then
            LineNo := ResolutionLine."Line No."
        else
            LineNo := 0;


        Employee.Reset();
     
        if Employee.FindSet() then begin
            repeat

                ResolutionLine.Reset();
                ResolutionLine.SetRange("Resolution No.", ResolutionNo);
                ResolutionLine.SetRange("Employee No.", Employee."No.");
                if ResolutionLine.IsEmpty then begin
                    LineNo += 10000;
                    
                    ResolutionLine.Init();
                    ResolutionLine."Resolution No." := ResolutionNo;
                    ResolutionLine."Line No." := LineNo;
                    
      
                    ResolutionLine.Validate("Employee No.", Employee."No.");
                    
                    ResolutionLine."Vote Status" := ResolutionLine."Vote Status"::Pending;
                    ResolutionLine.Insert(true);
                end;
            until Employee.Next() = 0;
            
            Message('Voting lines have been successfully generated.');
        end else
            Error('No employees were found to generate voting lines.');
    end;

    /// <summary>
    /// Triggered when a Circular Resolution is approved.
    /// Sends a voting notification email to each employee assigned to the lines.
    /// </summary>
    /// <param name="CircularResolution">The Circular Resolution Record that has been approved</param>
    procedure NotifyMembersToVote(CircularResolution: Record "Circular Resolution Header")
    var
        ResolutionLine: Record "Circular Resolution lines";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        DisplayDeadline: Text;
    begin
        CompanyInfo.Get();
        GetEBoardSetup(EBoardSetup);

        if CircularResolution."Voting Deadline" <> 0DT then
            DisplayDeadline := Format(CircularResolution."Voting Deadline")
        else
            DisplayDeadline := 'Not Set';

        Subject := StrSubstNo('Action Required: Vote on Circular Resolution – %1', CircularResolution."No.");

       
        ResolutionLine.Reset();
        ResolutionLine.SetRange("Resolution No.", CircularResolution."No.");
        ResolutionLine.SetFilter("Email", '<>%1', '');
        if ResolutionLine.FindSet(true) then
            repeat
              
                Body := StrSubstNo('Dear %1,<br><br>', ResolutionLine."Employee Name");
                Body += StrSubstNo('Circular Resolution <b>%1</b> has been formally approved and is open for voting.<br><br>', CircularResolution."No.");
                Body += '<b>Subject:</b> ' + CircularResolution.Title + '<br>';
                Body += '<b>Date Opened:</b> ' + Format(Today()) + '<br>';
                Body += '<b>Voting Deadline:</b> <b>' + DisplayDeadline + '</b><br>';
                
                if EBoardSetup."E-Board Portal URL" <> '' then begin
                    Body += '<br>You can log in to the E-Board Portal to cast your vote:<br>';
                    Body += StrSubstNo('<a href="%1" style="display:inline-block;padding:10px 20px;color:#fff;background-color:#0078d4;text-decoration:none;border-radius:4px;">Access E-Board Portal</a><br><br>', EBoardSetup."E-Board Portal URL");
                end;

                if EBoardSetup."Reminder Frequency (Days)" > 0 then
                    Body += StrSubstNo('<i>Note: Automatic voting reminders will be sent every %1 days until your vote is cast.</i><br><br>', EBoardSetup."Reminder Frequency (Days)");

                Body += 'Regards,<br>' + CompanyInfo.Name + '<br>';
                Body += '<i>This is a system-generated mail. Please do not reply to it.</i>';

                Clear(EmailMessage);
                EmailMessage.Create(ResolutionLine."Email", Subject, Body, true);
                
                if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then begin
                    
                    ResolutionLine."Notification Sent" := true;
                    ResolutionLine."Notification DateTime" := CurrentDateTime;
                    ResolutionLine.Modify();
                end;
            until ResolutionLine.Next() = 0;
    end;

    /// <summary>
    /// Event Subscriber: Listens to approval entries when they are approved.
    /// If the approved record is a Circular Resolution Header, it triggers the email notification.
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    local procedure OnApproveCircularResolution(var ApprovalEntry: Record "Approval Entry")
    var
        CircularResolution: Record "Circular Resolution Header";
    begin
        if ApprovalEntry."Table ID" = Database::"Circular Resolution Header" then begin
            if CircularResolution.Get(ApprovalEntry."Document No.") then begin
                NotifyMembersToVote(CircularResolution);
            end;
        end;
    end;

    procedure GetUserEmail(UserID: Code[100]): Text
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", UserID);
        if UserSetup.FindFirst() then
            exit(UserSetup."E-Mail");
    end;

    local procedure GetEBoardSetup(var Setup: Record "E-Board Setup")
    begin
        Setup.GetRecordOnce();
    end;
}