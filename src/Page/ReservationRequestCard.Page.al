#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60075 "Reservation Request Card"
{
    SourceTable = "Board Room Management Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Posting Time"; Rec."Posting Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posting Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            part("Reservation Lines"; "Reservation Lines")
            {
                SubPageLink = No = FIELD(No);
            }
            part("Additional Requests"; "Additional Requests")
            {
                SubPageLink = Code = FIELD(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PrintCover;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField("Document Status", Rec."document status"::Submitted);
                    //Procurement.PublishITT(Rec);
                    if Rec.Posted = false then begin
                        CHECKAVAILABILITY(Rec.No);
                        ReservationEntries.Reset;
                        if ReservationEntries.FindLast then begin
                            LineNo := ReservationEntries."Entry No";
                            LineNo := LineNo + 1000;
                        end;
                        ResourcebookingLines.Reset;
                        ResourcebookingLines.SetRange(No, Rec.No);
                        if ResourcebookingLines.FindSet then begin
                            repeat
                                ReservationEntries.Init;
                                ReservationEntries."Entry No" := LineNo;
                                ReservationEntries.No := Rec.No;
                                ReservationEntries.Type := ResourcebookingLines.Type;
                                ReservationEntries."Resource No" := ResourcebookingLines."Allocated Resource No";
                                ReservationEntries.Description := ResourcebookingLines."Allocated Resource Name";
                                ReservationEntries."Start Date/Time" := ResourcebookingLines."Start Date/Time";
                                ReservationEntries."Start Time" := ResourcebookingLines."Start Time";
                                ReservationEntries."End Time" := ResourcebookingLines."End Time";
                                ReservationEntries.Date := ResourcebookingLines.Date;
                                ReservationEntries.Duration := ResourcebookingLines.Duration;
                                ReservationEntries."End Date/Time" := ResourcebookingLines."End Date/Time";
                                ReservationEntries.Reason := ResourcebookingLines.Reason;
                                ReservationEntries.Capacity := ResourcebookingLines.Capacity;
                                ReservationEntries."Requestor ID" := Rec."Requestor ID";
                                ReservationEntries."Requestor Employee No" := Rec."Employee No";
                                ReservationEntries."Requestor Name" := Rec."Employee Name";
                                ReservationEntries.Insert(true);
                            until ResourcebookingLines.Next = 0;
                        end;

                        //Additional Requests
                        AdditionalRequests.Reset();
                        AdditionalRequests.SetRange(Code, Rec.No);
                        if AdditionalRequests.Find('-') then begin
                            // PurchaseHeader.Init();
                            // PurchaseHeader."No." := 
                        end;

                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posting Time" := Time;
                        Rec."Posting Date" := Today;
                        Rec."Document Status" := Rec."document status"::Closed;
                        Rec.Modify(true);
                        CustomFunction.AdditionalItemstoStoreReqfromBoard(Rec);
                        Message('Posted Successfully');
                    end else begin
                        Message('Error!, This is Already Posted');
                    end;

                    // Resources.Reset();
                    // Resources.SetRange("No.",Rec.);
                    // if Resources.Find('-') then begin

                    // end

                    // PurchaseHeader.Reset();
                    // PurchaseHeader.


                    // NotifyApplicant(Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';
                Visible = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // if Status = Status::"Pending Approval" then
                    //     Error('Action Already Done! ');
                    // ResourcebookingLines.Reset();
                    // ResourcebookingLines.SetRange(No, Rec.No);
                    // if not ResourcebookingLines.FindFirst() then
                    //     Error('There are no lines to send for approval');
                    // // IF
                    // CHECKAVAILABILITY(Rec.No);
                    // if ApprovalsMgmt.CheckRBookingApprovalPossible(Rec) then
                    //     ApprovalsMgmt.OnSendRBookingForApproval(Rec);
                    // NotifyHOD(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Cancel the approval request.';
                Visible = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    // ApprovalsMgmt.OnCancelRBookingApprovalRequest(Rec);
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Approval Entries action.';

                trigger OnAction()
                begin
                    DocumentType := Documenttype::"Resource Appointment";
                    // ApprovalEntries.Setfilters(Database::"Resource Booking Header", DocumentType, No);
                    ApprovalEntries.Run;
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Submit Request';
                Enabled = Rec."Document Status" = Rec."Document Status"::Draft;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';
                Visible = false;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Document Status", Rec."document status"::Draft);
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify(true);
                    Message('Submitted Successfully');


                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = corec;
                ToolTip = 'Executes the Reject action.';

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField("Document Status", Rec."document status"::Submitted);
                    //Procurement.PublishITT(Rec);
                    if Rec.Posted = false then begin
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posting Time" := Time;
                        Rec."Posting Date" := Today;
                        Rec."Document Status" := Rec."document status"::Rejected;
                        Rec.Modify(true);
                        // NotifyApplicantReject(Rec);
                        Message('Posted Successfully');
                    end else begin
                        Message('Error!, This is Already Posted');
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        corec := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            corec := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Requestor ID" := UserId;
        Rec."Document Date" := Today;
        Rec."Time Created" := Time;
        Rec.Modify(true);
    end;

    var
        corec: Boolean;
        ReservationEntries: Record "Reservation Entries";
        ResourcebookingLines: Record "Board Room Management Lines";
        LineNo: Integer;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ReservationEntries2: Record "Reservation Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","staff Claims","Payment Voucher","Petty Cash",Imprest,Surrender,Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition",Sclaims,"Salary Voucher","Copyright Registration","Copyright Transfer","Training Need","Inst. Accreditation","Prog. Accreditation","Prog. Evaluation","Data Invitation","Manual Data Entry","Resource Appointment","Resource Verification","Programme Closure",RFI,"Fuel Card","Fuel Maintenance Requisition","Work Ticket",AnnualWorkPlan,PerformanceContract,Plog,Appraisal,"Legal Process",RecruitmentPlan,RecruitmentHeader,VacancyAnnounce,CommAppoint,Absence,sreq,"Resource Booking";
        ApprovalEntries: Page "Approval Entries";
        RBooking: Record "Board Room Management Header";
        ResourceDate: Text;
        Resource: Text;
        HODEmail: Text;
        USERSETUP: Record "User Setup";
        HODNAME: Text;
        HEADER: Text;
        Sendername: Text;
        senderemail: Text;
        // smtpsetup: Record "SMTP Mail Setup";
        // smtpmail: Codeunit UnknownCodeunit400;
        Resources: Record Resource;
        PurchaseHeader: Record "Purchase Header";
        AdditionalRequests: Record "Additional Requests";
        NoSeriesManagement: Codeunit "No. Series";
        CustomFunction: Codeunit "Custom Function";


    procedure CHECKAVAILABILITY(Nos: Code[30])
    begin
        ResourcebookingLines.Reset;
        ResourcebookingLines.SetRange(No, Nos);
        if ResourcebookingLines.FindSet then begin
            repeat
                ReservationEntries.Reset;
                ReservationEntries.SetRange("Resource No", ResourcebookingLines."Allocated Resource No");
                ReservationEntries.SetRange(Date, ResourcebookingLines.Date);
                //ReservationEntries.SETFILTER("Start Time",'%1..%2',ReservationEntries."Start Time",ReservationEntries."End Time");
                if ReservationEntries.FindSet then begin
                    repeat
                        if (ResourcebookingLines."Start Time" >= ReservationEntries."Start Time") and (ResourcebookingLines."Start Time" <= ReservationEntries."End Time")
                         or (ResourcebookingLines."End Time" >= ReservationEntries."Start Time") and (ResourcebookingLines."End Time" <= ReservationEntries."End Time")
                           then begin
                            RBooking.Reset();
                            RBooking.SetRange(No, ResourcebookingLines.No);
                            if RBooking.FindFirst() then
                                NotifyApplicantReject(RBooking);
                            Error('There is a session for the time %1 to %2 for resource %3', ReservationEntries."Start Time", ReservationEntries."End Time", ReservationEntries."Resource No");
                            //EXIT;
                        end;
                    until ReservationEntries.Next = 0;
                end;
            until ResourcebookingLines.Next = 0;
        end;
    end;

    procedure RaiseStoreRequisition(ItemCode: Code[250])
    begin

    end;


    procedure NotifyApplicant(RBooking: Record "Board Room Management Header")
    var
        HRLeaveApp: Record "Payroll Lines";
        Emp: Record Employee;
        Filename: Text;
        // SMTPSetup: Record "SMTP Mail Setup";
        // SMTPMail: Codeunit UnknownCodeunit400;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        CompanyInformation: Record "Company Information";
        JobQueueEntry: Record "Job Queue Entry";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        Employeerec: Record Employee;
        ReleaverMail: Text;
        ResourcebookingLines: Record "Board Room Management Lines";
        StartTime: Text;
        Enddate: Text;
        Duration: Text;
        ReasonRec: Text;
    begin

        ObjCompany.Get();
        HumanResourcesSetup.Get();
        if Emp.Get(RBooking."Employee No") then begin
            Header := 'RESOURCE RESERVE ' + RBooking.No;
            // if SMTPSetup.Get() then begin
            //     SenderEmail := HumanResourcesSetup."HR E-mail Address";
            //     SenderName := SMTPSetup."Email Sender Name";
            //     Duration := '';
            //     StartTime := '';
            //     Enddate := '';
            //     ReasonRec := '';
            //     ResourceDate := '';
            //     Resource := '';
            //     ResourcebookingLines.Reset;
            //     ResourcebookingLines.SetRange(No, RBooking.No);
            //     if ResourcebookingLines.FindSet then begin
            //         repeat
            //             Resource += ResourcebookingLines.Description;
            //             ResourceDate += Format(ResourcebookingLines.Date) + '<br>';
            //             Duration += Format(ResourcebookingLines.Duration) + '<br>';
            //             StartTime += Format(ResourcebookingLines."Start Time") + '<br>';
            //             Enddate += Format(ResourcebookingLines."End Time") + '<br>';
            //             ReasonRec += ResourcebookingLines.Reason + '<br>';
            //         until ResourcebookingLines.Next() = 0;
            //     end;

            // end;
            if Emp."Company E-Mail" <> '' then begin
                // SMTPMail.CreateMessage(SenderEmail, SenderEmail, Emp."Company E-Mail", Header, '', true);
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('Hello, ' + RBooking."Employee Name" + ',');
                // SMTPMail.AppendBody('<br>');
                // //SMTPMail.AppendBody('You are registered to receive notifications related to '+ObjCompany.Name + '. This is a message to notify you that:');
                // // SMTPMail.AppendBody('<br><br>');
                // SMTPMail.AppendBody('Your reservtion for ' + ' ' + '<b>' + Resource + ' ' + Description + '</b>' + ' is successful.');
                // SMTPMail.AppendBody('<br><br>');
                // SMTPMail.AppendBody('Date: ' + '<b>' + ResourceDate + '</b>');
                // // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('Start time: ' + '<b>' + Format(StartTime) + '</b>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('End time: ' + '<b>' + Format(Enddate) + '</b>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('Document Date: ' + '<b>' + Format("Document Date") + '</b>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody(' Purpose: ' + '<b>' + ReasonRec + '</b>');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('Kind Regards');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.AppendBody('HRA Dept');
                // SMTPMail.AppendBody('<br>');
                // //SMTPMail.AppendBody('This is a system generated mail.');
                // SMTPMail.AppendBody('<br>');
                // SMTPMail.Send;
                // Message('Email notification has been sent successfuly!')
            end;
        end;
    end;


    procedure NotifyApplicantReject(RBooking: Record "Board Room Management Header")
    var
        HRLeaveApp: Record "Payroll Lines";
        Emp: Record Employee;
        Filename: Text;
        // SMTPSetup: Record "SMTP Mail Setup";
        // SMTPMail: Codeunit UnknownCodeunit400;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        CompanyInformation: Record "Company Information";
        JobQueueEntry: Record "Job Queue Entry";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        Employeerec: Record Employee;
        ReleaverMail: Text;
        ResourcebookingLines: Record "Board Room Management Lines";
        StartTime: Text;
        Enddate: Text;
        Duration: Text;
        ReasonRec: Text;
    begin

        ObjCompany.Get();
        HumanResourcesSetup.Get();
        if Emp.Get(Rec."Employee No") then begin
            Header := 'RESOURCE RESERVATION FAILED ';
            // if SMTPSetup.Get() then begin
            //     SenderEmail := HumanResourcesSetup."HR E-mail Address";
            //     SenderName := SMTPSetup."Email Sender Name";
            //     Duration := '';
            //     StartTime := '';
            //     Enddate := '';
            //     ReasonRec := '';
            //     ResourceDate := '';
            //     Resource := '';
            //     ResourcebookingLines.Reset;
            //     ResourcebookingLines.SetRange(No, No);
            //     if ResourcebookingLines.FindSet then begin
            //         Resource += ResourcebookingLines.Description;
            //         ResourceDate += Format(ResourcebookingLines.Date) + '<br>';
            //         Duration += Format(ResourcebookingLines.Duration) + '<br>';
            //         StartTime += Format(ResourcebookingLines."Start Time") + '<br>';
            //         Enddate += Format(ResourcebookingLines."End Time") + '<br>';
            //         ReasonRec += ResourcebookingLines.Reason + '<br>';
            //     end;

            // end;
            // if Emp."Company E-Mail" <> '' then begin
            //     SMTPMail.CreateMessage(SenderEmail, SenderEmail, Emp."Company E-Mail", Header, '', true);
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Hello, ' + RBooking."Employee Name" + ',');
            //     SMTPMail.AppendBody('<br>');
            //     //SMTPMail.AppendBody('You are registered to receive notifications related to '+ObjCompany.Name + '. This is a message to notify you that:');
            //     //SMTPMail.AppendBody('<br><br>');
            //     SMTPMail.AppendBody('Your resource booking ' + ' ' + '<b>' + RBooking.Description + '</b>' + ' has been Rejected since there is a session.');
            //     SMTPMail.AppendBody('<br><br>');
            //     SMTPMail.AppendBody('Duration: ' + '<b>' + Format(Duration) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Start time: ' + '<b>' + Format(StartTime) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('End time: ' + '<b>' + Format(Enddate) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Document Date: ' + '<b>' + Format(RBooking."Document Date") + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody(' Reason: ' + '<b>' + ReasonRec + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('<HR>');
            //     SMTPMail.AppendBody('This is a system generated mail.');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.Send;
            //     Message('Email notification has been sent successfuly!')
            // end;
        end;
    end;

    local procedure NotifyHOD(ResourceB: Record "Board Room Management Header")
    begin
        USERSETUP.Reset;
        USERSETUP.SetRange("HOD Human Resource", true);
        if USERSETUP.FindSet then begin
            HODEmail := USERSETUP."E-Mail";
            HODNAME := USERSETUP."Employee Name";
        end;
        if ResourceB.Get(Rec.No) then begin
            HEADER := 'BOOKING APPROVAL NOTIFICATION ' + Rec.No;
            // if smtpsetup.Get() then begin
            //     senderemail := smtpsetup."Email Sender Address";
            //     Sendername := smtpsetup."Email Sender Name";


            //     if HODEmail <> '' then begin
            //         smtpmail.CreateMessage(Sendername, senderemail, HODEmail, HEADER, '', true);
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.AppendBody('Dear ' + HODNAME + ',');
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.AppendBody('Please note that you have pending Approval Request to the above mentioned Reservation.');// for the month of January 2014');
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.AppendBody('Thanks & Regards');
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.AppendBody(Sendername);
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.AppendBody('<HR>');
            //         smtpmail.AppendBody('This is a system generated mail.');
            //         smtpmail.AppendBody('<br><br>');
            //         smtpmail.Send;
            //         Message('HOD NOTIFIED.');
            //     end;
            // end;
        end;
    end;
}

