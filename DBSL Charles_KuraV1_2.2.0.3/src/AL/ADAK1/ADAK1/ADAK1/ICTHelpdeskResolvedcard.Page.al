#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56221 "ICT Helpdesk Resolved card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Resolved));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Part 1: User Information.")
            {
                Editable = true;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Region Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Constituency Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(EXT; Rec.EXT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extension No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Extension No field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Time field.';
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Attended Time field.';
                }
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ICT Issue Category field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Level of Priority"; Rec."Level of Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Level of Priority field.', Comment = '%';
                }
                field("Requester Feedback"; Rec."Requester Feedback")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Requester Feedback field.';
                }
            }
            group("Please describe the issue here:")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                Editable = false;
                field("Escalated To"; Rec."Escalated To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated To field.';
                }
                field("Escalated By"; Rec."Escalated By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalated By field.';
                }
                field("Escalated Date"; Rec."Escalated Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalated Date field.';
                }
                field("Escalated Time"; Rec."Escalated Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Escalated Time field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Links)
            {
            }
            systempart(Control1; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Feedback")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Feedback action.';

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Requester Feedback");
                    Recepient := Rec."Assign To Email";
                    Sub := 'Sent Feedback for ' + Rec."Job No.";
                    Body += 'Dear ' + Rec."Escalated To" + ',';
                    Body += '<br> Kindly log in to the system to check on the Feedback received before closure of the help desk ticket.<br>';
                    EmMess.Create(Recepient, Sub, Body, true);
                    Em.Send(EmMess, EmailScen::Default);
                end;
            }
            action("Close Request")
            {

                //     ApplicationArea = Basic;
                //     Image = SendApprovalRequest;
                //     Promoted = true;
                //     PromotedCategory = Process;

                //     trigger OnAction()
                //     begin
                //         TestField("ICT Issue Category");
                //         TestField("Description of the issue");
                // //         if Confirm('Are you sure you want to send ICT helpdesk issue?' true then begin
                //             "Request Date" := Today;
                //             "Request Time" := Time;
                //             Status := s:=Status::Assigned;
                // //          Modify;

                //         Category.Reset;
                //             Category.SetRange(Category.Co de,"ICT Issue Category");
                //             if Category.FindSet then begin
                //                 Mapping.Reset;
                //                 Mapping.SetRange(Mapping."Help Desk Categor y","ICT Issue Category");
                //                 if Mapping.FindSet then begin
                //                  "Assigned To" := ":=Mapping.UserName;
                //                  "Assigned Date" := Today;
                //         "Assigned Time" := Time;
                //         Modify;
                //     end;
                // end;

                /*
                  Employee.RESET;
                  Employee.SETRANGE(Employee.Position,'JOB002');
                  IF Employee.FIND('-')THEN
                  BEGIN
                    Email2:=Employee."Company E-Mail";
                  END;
    //               */
                //   //           CInfo.Get;
                // //             Employee.Reset;
                // //             Employee.SetRange(Employee."User I D","Assigned To");
                // //             if Employee.Find(' then begin
                //                 //MESSAGE("Assigned To");
                //                 Email := mail:=Employee."E-Mail";
                // //         /    "Requesting Officer Name" := ame":=Employee."First + ' ' + "+' '+Employee."Middle + ' ' + "+' '+Employee."Last Name";
                // //          end;


                //             Email2 := CInfo."Administrator Email";
                //             Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + "Job No." + ' from ' + "Requesting Officer Name" + '.' + '</br>';
                //             Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                //             Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                //             SMTP.CreateMessage(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                //             SMTP.Send();
                //             Message('ICT Issue notification sent successfully.');
                //         end;

                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Close Request action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you ascertaining that your request' + ' ' + Rec."Job No." + ' ' + 'has been resolved?') then
                        exit;
                    Rec.TestField("Requester Feedback");
                    Rec.Status := Rec.Status::Closed;
                    Rec.Modify(true);

                    // Recepient := Rec.Email;
                    // Sub := 'Closed ICT Ticket for ' + Rec."Job No.";
                    // Body += 'Dear ' + Rec."Escalated To" + ',';
                    // Body += '<br> This is a confirmation that you have closed your ticket.<br>';
                    // EmMess.Create(Recepient, Sub, Body, true);
                    // Em.Send(EmMess, EmailScen::Default);

                    Recepient := Rec.Email;
                    Sub := 'Closed ICT Ticket for ' + Rec."Job No.";
                    Body += 'Dear ' + Rec."Requesting Officer Name" + ',';
                    Body += '<br> This is a confirmation that your Ticket No' + Rec."Job No." + 'has been closed.<br>';
                    EmMess.Create(Recepient, Sub, Body, true);
                    Em.Send(EmMess, EmailScen::Default); 

                    //Release the Officer + ' ' + "Job No." + ' ' + 
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, Rec."Assigned To");
                    Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                End; //Release the Officer 
                //end; 
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Reopen action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to reopen this ICT Helpdesk issue?' + ' ' + Rec."Job No.") then
                        exit;
                    Rec.TestField("Requester Feedback");
                    Rec.Status := Rec.Status::Open;
                    Rec.Reopened := true;
                    Rec."Reopened By" := UpperCase(UserId);
                    Rec."Assigned To" := ''; //?/+ ' ' + 
                    Rec."Attended By" := '';
                    // "Assigned Date":=0D;
                    // "Assig := d Time":=0T;
                    // "Attende := by Name":='';
                    // "Attended Dat := :=0D;
                    // "Attended Tim := :=0T;
                    Rec.Modify; //:= 
                end; //:= 
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Validate("Job No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Open;
    end;

    var
        Employee: Record Employee;
        Recepient, Sub, Body : Text;
        // SMTP: Codeunit Mail;
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        Em: Codeunit Email;
        EmMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
}

