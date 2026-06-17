#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60084 "Submitted Reservation Card"
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            part("Submitted Reservation Lines"; "Submitted Reservation Lines")
            {
                Caption = 'Submitted Reservation Lines';
                SubPageLink = No = field(No);
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
                Caption = 'Assign Resource';
                Image = PrintCover;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = corec;
                ToolTip = 'Executes the Assign Resource action.';

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField("Document Status", Rec."document status"::Submitted);
                    Resource.Get(ResourcebookingLines."Allocated Resource No");
                    Resource.SetRange("No.", ResourcebookingLines."Allocated Resource No");
                    if Resource.find('-') then begin
                        Resource.TestField(Locked, false);
                    end;
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
                                ResourcebookingLines.TestField("Allocated Resource No");
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
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posting Time" := Time;
                        Rec."Posting Date" := Today;
                        Resource.Locked := true;
                        CustomFunction.AdditionalItemstoStoreReqfromBoard(Rec);

                        Rec."Document Status" := Rec."document status"::Closed;
                        Rec.Modify(true);
                        Message('Posted Successfully');
                    end else begin
                        Message('Error!, This is Already Posted');
                    end;
                    NotifyApplicant();
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
                Visible = false;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //MESSAGE('Approved Successfully');
                    //IF ApprovalsMgmt.CheckRBMApprovalPossible(Rec) THEN
                    // ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);
                    //MESSAGE('Approved Successfully')
                    //Status:=Status::Released;
                    //"Document Status":="Document Status"::Submitted;
                    //MODIFY(TRUE);
                    //MESSAGE('Approved Successfully');


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
                Visible = false;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    //ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);
                    //WorkflowWebhookMgt.FindAndCancel(RECORDID);
                    //Status:=Status::Open;
                    //"Document Status":="Document Status"::Draft;
                    //MODIFY(TRUE);
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

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
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
                        NotifyApplicantReject();
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
        Resource: Record Resource;
        CustomFunction: Codeunit "Custom Function";

    local procedure CHECKAVAILABILITY(No: Code[30])
    begin
        ResourcebookingLines.Reset;
        ResourcebookingLines.SetRange(No, No);
        if ResourcebookingLines.FindSet then begin
            repeat
                ReservationEntries.Reset;
                ReservationEntries.SetRange("Resource No", ResourcebookingLines."Allocated Resource No");
                ReservationEntries.SetRange(Date, ResourcebookingLines.Date);
                ReservationEntries.SetFilter("Start Time", '%1..%2', ReservationEntries."Start Time", ReservationEntries."End Time");
                if ReservationEntries.FindSet then begin
                    repeat
                        if (ResourcebookingLines."Start Time" >= ReservationEntries."Start Time") and (ResourcebookingLines."Start Time" <= ReservationEntries."End Time")
                         or (ResourcebookingLines."End Time" >= ReservationEntries."Start Time") and (ResourcebookingLines."End Time" <= ReservationEntries."End Time")
                           then begin
                            Error('There is a session for the time %1 to %2', ReservationEntries."Start Time", ReservationEntries."End Time");
                            // NotifyApplicantReject();
                            exit;
                        end;
                    until ReservationEntries.Next = 0;
                end;
            until ResourcebookingLines.Next = 0;
        end;
    end;


    procedure NotifyApplicant()
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
        StartTime: Time;
        Enddate: Time;
        Duration: Integer;
        ReasonRec: Code[100];
    begin

        ObjCompany.Get();
        HumanResourcesSetup.Get();
        if Emp.Get(Rec."Employee No") then begin
            Header := 'Approval Notification Overview  ';
            // if SMTPSetup.Get() then begin
            //     SenderEmail := HumanResourcesSetup."HR E-mail Address";
            //     SenderName := SMTPSetup."Email Sender Name";
            //     ResourcebookingLines.Reset;
            //     ResourcebookingLines.SetRange(No, No);
            //     if ResourcebookingLines.FindSet then begin
            //         Duration := ResourcebookingLines.Duration;
            //         StartTime := ResourcebookingLines."Start Time";
            //         Enddate := ResourcebookingLines."End Time";
            //         ReasonRec := ResourcebookingLines.Reason;
            //     end;

            // end;
            // if Emp."Company E-Mail" <> '' then begin
            //     SMTPMail.CreateMessage(SenderEmail, SenderEmail, Emp."Company E-Mail", Header, '', true);
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Hello, ' + "Employee Name" + ',');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('You are registered to receive notifications related to ' + ObjCompany.Name + '. This is a message to notify you that:');
            //     SMTPMail.AppendBody('<br><br>');
            //     SMTPMail.AppendBody('Your resource booking ' + ' ' + '<b>' + Description + '</b>' + ' has been reserved.');
            //     SMTPMail.AppendBody('<br><br>');
            //     SMTPMail.AppendBody('Duration: ' + '<b>' + Format(Duration) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Start time: ' + '<b>' + Format(StartTime) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('End time: ' + '<b>' + Format(Enddate) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Document Date: ' + '<b>' + Format("Document Date") + '</b>');
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


    procedure NotifyApplicantReject()
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
        StartTime: Time;
        Enddate: Time;
        Duration: Integer;
        ReasonRec: Code[100];
    begin

        ObjCompany.Get();
        HumanResourcesSetup.Get();
        if Emp.Get(Rec."Employee No") then begin
            Header := 'Approval Notification Overview  ';
            // if SMTPSetup.Get() then begin
            //     SenderEmail := HumanResourcesSetup."HR E-mail Address";
            //     SenderName := SMTPSetup."Email Sender Name";
            //     ResourcebookingLines.Reset;
            //     ResourcebookingLines.SetRange(No, No);
            //     if ResourcebookingLines.FindSet then begin
            //         Duration := ResourcebookingLines.Duration;
            //         StartTime := ResourcebookingLines."Start Time";
            //         Enddate := ResourcebookingLines."End Time";
            //         ReasonRec := ResourcebookingLines.Reason;
            //     end;

            // end;
            // if Emp."Company E-Mail" <> '' then begin
            //     SMTPMail.CreateMessage(SenderEmail, SenderEmail, Emp."Company E-Mail", Header, '', true);
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Hello, ' + "Employee Name" + ',');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('You are registered to receive notifications related to ' + ObjCompany.Name + '. This is a message to notify you that:');
            //     SMTPMail.AppendBody('<br><br>');
            //     SMTPMail.AppendBody('Your resource booking ' + ' ' + '<b>' + Description + '</b>' + ' has been Rejected since there is a session.');
            //     SMTPMail.AppendBody('<br><br>');
            //     SMTPMail.AppendBody('Duration: ' + '<b>' + Format(Duration) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Start time: ' + '<b>' + Format(StartTime) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('End time: ' + '<b>' + Format(Enddate) + '</b>');
            //     SMTPMail.AppendBody('<br>');
            //     SMTPMail.AppendBody('Document Date: ' + '<b>' + Format("Document Date") + '</b>');
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
}

