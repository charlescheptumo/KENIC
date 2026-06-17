#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50030 eboard
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


    procedure Testconnection()
    begin
    end;

    procedure fnLogin(dirEmail: Text[100]; password: Text) status: Text
    var
        iExists: Boolean;
    begin
        //status := 'danger*Customer does not exist';
        objPortalUser.Reset;
        objPortalUser.SetRange(objPortalUser.Email, dirEmail);
        if objPortalUser.Find('-') then begin
            //the user exists on portal user tables
            if objPortalUser.Password = password then begin
                status := 'success*Login*' + objPortalUser."customer No";
                //for Debug testing
                Message(status);
                //for Debug testing
            end else begin
                status := 'danger*Wrong password!';
                //for Debug testing
                Message(status);
                //for Debug testing
            end
        end
        else begin
            status := 'danger*Username does not exist!';
            //for Debug testing
            Message(status);
            //for Debug testing
        end;
        exit(status);
    end;



    // [scope('OnPrem')]
    procedure generateDirectorPayslip(director: Code[100]; payperiod: Date; directorNo: Text) status: Text
    begin
        if objVendor.Get(director) then begin
            objVendor.Reset;
            objVendor.SetRange("No.", director);
            if objVendor.FindFirst then begin
                //AL
                // objVendor.SetRange("Pay Period Filter", payperiod);
                //   if FILE.Exists(FILESPATH+Format(directorNo)+'.pdf') then begin
                //     FILE.Erase(FILESPATH+Format(directorNo)+'.pdf');
                //     Report.SaveAsPdf(89033,FILESPATH+directorNo+'.pdf' ,objVendor);
                //     status:='success*Downloads'+directorNo+'.pdf';
                //     end else begin
                //       Report.SaveAsPdf(89033,FILESPATH+directorNo+'.pdf' ,objVendor);
                //       status:='success*Downloads'+directorNo+'.pdf';
                //             end
            end
        end else begin
            status := 'danger*The director number does not exist';
        end;
        Message(Format(status));
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

    procedure fnRegisterBoard(idNumber: Code[30]) status: Text
    begin
        objVendor.Reset;
        objVendor.SetRange(objVendor.SystemId, idNumber);
        if objVendor.Find('-') then begin
            //user is a director but not in portal users table
            //check user has email
            if objVendor."E-Mail" = '' then begin
                status := 'danger*Your account does not have a valid email address. Please contact the head office to have your details captured in the system';
            end
            else begin
                //create account in portal users
                objPortalUser.Init;
                objPortalUser."customer No" := idNumber;
                objPortalUser.validated := false;
                objPortalUser.changedPassword := 0;
                objPortalUser.usertype := 1;
                if objPortalUser.Insert then begin
                    //send mail with activation link
                    status := 'success*Board';
                    //for Debug testing
                    Message(status);
                    //for Debug testing

                end
                else begin
                    status := 'danger*Your account could not be created. Please try again later';

                    //for Debug testing
                    Message(status);
                    //for Debug testing
                end
            end
        end;
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
}
