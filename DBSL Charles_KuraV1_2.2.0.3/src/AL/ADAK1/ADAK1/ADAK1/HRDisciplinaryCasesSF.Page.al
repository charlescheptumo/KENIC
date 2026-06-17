#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69203 "HR Disciplinary Cases SF"
{
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case No.';
                    ToolTip = 'Specifies the value of the Case No. field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Reporting';
                    ToolTip = 'Specifies the value of the Date of Reporting field.';
                    trigger OnValidate()
                    var
                    begin
                        Rec."Financial Year" := GetCurrentYear(Rec."Date of Complaint");
                    end;
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Description field.';
                }
                field("Case Discussion"; Rec."Case Discussion")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Case Discussion field.';
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mode of Reporting';
                    ToolTip = 'Specifies the value of the Mode of Reporting field.';
                }
                field("Case Severity"; Rec."Case Severity")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Case Severity field.';
                }
                field("Accuser Is Staff"; Rec."Accuser Is Staff")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reporter is Staff';
                    ToolTip = 'Specifies the value of the Reporter is Staff field.';
                }
                field(Accuser; Rec.Accuser)
                {
                    Caption = 'Reporter';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporter field.';
                }
                field(Witness; Rec.Witness)
                {
                    ApplicationArea = Basic;
                    Caption = 'Witness';
                    ToolTip = 'Specifies the value of the Witness field.';
                }
                field("Date to Respond"; Rec."Date to Respond")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Commitee"; Rec."Disciplinary Commitee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Commitee field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Appeal Date"; Rec."Appeal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appeal Date field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
                field("Action Taken Date"; Rec."Action Taken Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken Date field.';
                }
                field("Response to Show Cause"; Rec."Response to Show Cause")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response to Show Cause field.';
                }
                field("Disciplinary Hearing"; Rec."Disciplinary Hearing")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Hearing field.';
                }
                field("Disciplinary Hearing Date"; Rec."Disciplinary Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Hearing Date field.';
                }
                field(Recomendations; Rec.Recomendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recomendations field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
                field("Recommendation Action Date"; Rec."Recommendation Action Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendation Action Date field.';
                }
                field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Guidlines In Effect field.';
                }
                field("Support Documents"; Rec."Support Documents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Support Documents field.';
                }
                field("HR/Payroll Implications"; Rec."HR/Payroll Implications")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the HR/Payroll Implications field.';
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Legal Case No."; Rec."Legal Case No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Case No. field.';
                }
                field("Legal Case Recommendation"; Rec."Legal Case Recommendation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Case Recommendation field.';
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field("Handled By"; Rec."Handled By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Handled By field.';
                }
                field("Case Created"; Rec."Case Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Created field.';
                }
                field("Financial Year";Rec."Financial Year")
                {
                  ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup4)
            {
                Image = Alerts;
                action("Notify Commitee By Email")
                {
                    ToolTip = 'Executes the Notify Commitee By Email action.';
                    // ApplicationArea = Basic;
                    // Image = Email;
                    // Promoted = true;
                    // PromotedIsBig = true;
                    // PromotedOnly = true;
                    // ToolTip = 'Email all Board Members of this case';

                    // trigger OnAction()
                    // begin
                    //     Cases.SetRange("Case Number","Case Number");
                    //     if "Disciplinary Commitee" <> '' then begin
                    //       HRDiscipMemb.Reset;
                    //       HRDiscipMemb.SetRange(HRDiscipMemb.Committee,"Disciplinary Commitee");
                    //       if HRDiscipMemb.Find('-') then begin
                    //         repeat
                    //           if Employee.Get(HRDiscipMemb.Code) then begin
                    //             Filename:= ObjCompany."HR Document Link"+Employee."First Name"+'_'+Employee."Last Name"+' '+Cases."Case Number"+'.pdf';

                    //             HRCases.Reset;
                    //             HRCases.SetRange(HRCases."Employee No","Employee No");
                    //             HRCases.SetRange(HRCases."Case Number","Case Number");
                    //             // Report.SaveAsPdf(69140,Filename,HRCases);
                    //             Header:='NOTICE OF HRMAC MEETING';

                    // if SMTPSetup.Get() then begin
                    //   SenderEmail:=SMTPSetup."Email Sender Address";
                    //   SenderName:= SMTPSetup."Email Sender Name";
                    // end;
                    // if Employee."E-Mail" <> '' then begin
                    //   //SMTPMail.CreateMessage(SenderName,SenderEmail,Employee."E-Mail",Header,'',true);
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('Dear '+Employee."First Name"+' '+Employee."Last Name"+',');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('This is to invite you for a commitee meeting');// for the month of January 2014');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('Attached is the complete memo on the above subject');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('Thanks & Regards');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline(SenderName);
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('<HR>');
                    //   //SMTPMail.AddBodyline('This is a system generated mail.');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                    //               //SMTPMail.AddBodyline('<br><br>');
                    //               SMTPMail.AddAttachment(Filename,'Memo '+Cases."Case Number"+'.pdf');
                    //               //SMTPMail.Send;
                    //                 //MESSAGE('The email %1 for %2 is invalid',Employee."E-Mail",Employee."No.");

                    //               //IF EXISTS(Filename) THEN
                    //               //ERASE(Filename);
                    //             end;
                    //             //End email
                    //           end;
                    //         until HRDiscipMemb.Next = 0;
                    //       end;
                    //     end;
                    //     Message('Notifications send');
                    // end;
                }
            }
            group("Case Management")
            {
                Caption = 'Case Management';
                Image = BankContact;
                action("Create Court Case")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;
                    ToolTip = 'Executes the Create Court Case action.';

                    trigger OnAction()
                    begin
                        Rec.TestField("Handled By", Rec."handled by"::Court);
                        if Rec."Handled By" = Rec."handled by"::Court then begin
                            Rec.TestField("Case Created", false);
                            if Rec."Case Created" = false then begin
                                if Dialog.Confirm('Are you sure you want to send this case to Legal?', true) then begin
                                    CaseRegister.Reset;
                                    CaseRegister.Init;
                                    CaseRegister.Status := CaseRegister.Status::New;
                                    CaseRegister."Employee No" := Rec."Employee No";
                                    Employee.Get(Rec."Employee No");
                                    CaseRegister."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                                    CaseRegister."From Document Number" := Rec."Case Number";

                                    if CaseRegister.Insert(true) then begin
                                        Rec."Case Created" := true;
                                        Rec."Legal Case No." := CaseRegister."No.";
                                        Rec.Modify;
                                    end;
                                end;
                                Message('%1 Legal case created', CaseRegister."No.");
                                CR.Reset;
                                CR.SetRange(CR."No.", CaseRegister."No.");
                                Page.Run(56098, CR);
                            end else begin
                                CR.Reset;
                                CR.SetRange(CR."No.", CaseRegister."No.");
                                Page.Run(56098, CR);
                            end;
                        end;
                    end;
                }
                 action("Notify Employee")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                    // Promoted = true;
                    // PromotedIsBig = true;
                    Caption = 'Send Employee Case Letter';

                    trigger OnAction()
                    var
                        DocumentCount: integer;
                 
                        Err002: Label 'Attachment is required.';
                        Txt003: Label 'Are you sure you want sent case letter to employee?';
                    begin
                        if confirm(Txt003, true) then begin
                          //  Rec.TestField("Date to Respond");

                            DocAttach.Reset();
                            DocAttach.SetRange(DocAttach."Table ID", Database::"HR Disciplinary Cases");
                            DocAttach.SetRange(DocAttach."No.", Rec."Case Number");
                            DocAttach.FindSet;
                            DocumentCount := DocAttach.Count;

                            if DocumentCount = 0 then
                                Error(Err002);

                            Rec.NotifyEmployeeToRespond(Rec);
                            Rec."Current Step" := Rec."Current Step"::ShowCauseToEmployee;
                            Rec.Modify();
                        end;
                    end;
                }
                action("Notify on Disciplinary Hearing")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                   // Promoted = true;
                    // PromotedIsBig = true;
                    Caption = 'Notify on Disciplinary Hearing';

                    trigger OnAction()
                    var
                        DocumentCount: integer;
                        Err002: Label 'Attachment is required.';
                        Txt004: Label 'Are you sure you want to notify committee members and employee on disciplinary hearing?';
                    begin
                        if Confirm(Txt004, true) then begin
                            Rec.TestField("Disciplinary Hearing", true);
                            Rec.TestField("Disciplinary Commitee");
                            Rec.TestField("Disciplinary Hearing Date");
                            Rec.TestField("Hearing Venue");

                            Rec.NotifyEmployeeAndCommitteeOnDispHearing(Rec);
                            Rec."Current Step" := Rec."Current Step"::DisciplinaryHearing;
                            Rec.Modify();
                        end;
                    end;
                }
                action("Open Court Case")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    ToolTip = 'Executes the Open Court Case action.';

                    trigger OnAction()
                    begin
                        CR.Reset;
                        CR.SetRange(CR."No.", Rec."Legal Case No.");
                        Page.Run(56098, CR);
                    end;
                }
                action("Close Case File")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    ToolTip = 'Executes the Close Case File action.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure want to close this case?', true) then begin
                            EmployeeDisciplinaryStatus.Reset;
                            EmployeeDisciplinaryStatus.SetRange(EmployeeDisciplinaryStatus."Employee No", Rec."Employee No");
                            EmployeeDisciplinaryStatus.SetRange(EmployeeDisciplinaryStatus."Case Number", Rec."Case Number");
                            if EmployeeDisciplinaryStatus.FindSet then begin
                                repeat
                                    EmployeeDisciplinaryStatus.TestField(EmployeeDisciplinaryStatus."Disciplinary Status");
                                until EmployeeDisciplinaryStatus.Next = 0;
                            end;
                            Cases.Get(Rec."Employee No", Rec."Case Number");
                            Cases.Status := Rec.Status::Closed;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Case Closed');
                        end;
                    end;
                }
                action("Reinstate Employee")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    ToolTip = 'Executes the Reinstate Employee action.';

                    trigger OnAction()
                    begin

                        if Confirm('Are you sure want to reinstate Employee?', true) then begin
                            DiscStatus.Reset;
                            DiscStatus.SetRange(DiscStatus."Case Number", Rec."Case Number");
                            DiscStatus.SetRange(DiscStatus."Employee No", Rec."Employee No");
                            if DiscStatus.FindLast then begin
                                if DisciplinaryStatus.Get(DiscStatus."Disciplinary Status") then begin
                                    AssignmentMatrixX.Reset;
                                    AssignmentMatrixX.SetRange(AssignmentMatrixX.Type, AssignmentMatrixX.Type::Deduction);
                                    AssignmentMatrixX.SetRange(AssignmentMatrixX.Code, DisciplinaryStatus."Deduction Code");
                                    AssignmentMatrixX.SetRange(AssignmentMatrixX."Employee No", Rec."Employee No");
                                    AssignmentMatrixX.DeleteAll;
                                end;
                                DiscStatus."Effect on Payroll" := false;
                                DiscStatus.Modify;
                            end;
                            Cases.Get(Rec."Employee No", Rec."Case Number");
                            Cases.Status := Rec.Status::Reinstated;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Employee Reinstated with full pay');
                        end;
                    end;
                }
                action("Appeal Case File")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    ToolTip = 'Executes the Appeal Case File action.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure want to reopen this case?', true) then begin
                            Cases.Get(Rec."Employee No", Rec."Case Number");
                            Cases.Status := Rec.Status::Appeal;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Case Marked as Appeal');
                        end;
                    end;
                }
            }
            group("Employee Disciplinary Status")
            {
                Caption = 'Employee Disciplinary Status';
                Image = BankContact;
                action("Disciplinary Status")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;
                    ToolTip = 'Executes the Disciplinary Status action.';

                    trigger OnAction()
                    begin
                        DiscStatus.Reset;
                        DiscStatus.SetRange(DiscStatus."Employee No", Rec."Employee No");
                        DiscStatus.SetRange(DiscStatus."Case Number", Rec."Case Number");
                        Page.Run(69288, DiscStatus);
                    end;
                }
            }
            group(Attachments)
            {
                Caption = 'Attachments';
                Image = Administration;
                action(DocAttach0)
                {
                    ToolTip = 'Executes the DocAttach0 action.';
                    // ApplicationArea = All;
                    // Caption = 'HR Documents';
                    // Image = Attach;
                    // Promoted = true;
                    // PromotedCategory = Category8;
                    // RunObject = Page "Document Attachment Details";
                    // RunPageLink = "No."=field("Case Number"),
                    //               "Document Type"=filter("HR Case");
                    // RunPageView = where("Document Type"=filter("HR Case"));
                    // ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     // RecRef.GETTABLE(Rec);
                    //     // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     // DocumentAttachmentDetails.RUNMODAL;
                    // end;
                }
            }
        }
    }

    Procedure GetCurrentYear(PostingDate: Date): Integer
    var
        GLBudgetName: Record "HR Leave Periods";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetFilter(Starts, '<=%1', Rec."Date of Complaint");
        GLBudgetName.SetFilter(Ends, '>=%1', Rec."Date of Complaint");
        if GLBudgetName.FindFirst() then
            exit(GLBudgetName.Code);

    end;


    var
        Cases: Record "HR Disciplinary Cases";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        DocAttach: record "Document Attachment";
        SenderName: Text;
        Employee: Record Employee;
        HRDiscipMemb: Record "Disciplinary Committee Members";
        HRCases: Record "HR Disciplinary Cases";
        CaseRegister: Record "Case Register";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        DisciplinaryStatus: Record "Disciplinary Status Table";
        PayPeriod: Record "Payroll PeriodX";
        CR: Record "Case Register";
        AmountDeducted: Decimal;
        Emp: Record Employee;
        AssMatx: Record "Assignment Matrix-X";
        DiscStatus: Record "Employee Disciplinary Status";
        EmployeeDisciplinaryStatus: Record "Employee Disciplinary Status";
}

