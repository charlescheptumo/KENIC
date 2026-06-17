Page 56076 "ICT Helpdesk Request"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(<> " "));
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
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';

                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';

                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
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
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the ICT Issue Category field.';
                }
                field("Level of Priority"; Rec."Level of Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Level of Priority field.', Comment = '%';
                }
                // field("Institution No";Rec."Institution No")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Institution Name";Rec."Institution Name")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Has Attachment"; Rec."Has Attachment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Has Attachment field.';
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            // group("Part 2:1 Hardware Issues")
            // {
            //     Visible = false;
            //     field("Computer not Starting up";Rec."Computer not Starting up")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Keyboard, Mouse Failure";Rec."Keyboard, Mouse Failure")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Printer Failure";Rec."Printer Failure")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("UPS Failure";Rec."UPS Failure")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("LCD /Monitor Failure";Rec."LCD /Monitor Failure")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Storage Device Failure";Rec."Storage Device Failure")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Hardware Installation";Rec."Hardware Installation")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Others, specify HW";Rec."Others, specify HW")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
            // group("Part 2:2 Software Issues")
            // {
            //     Visible = false;
            //     field("Computer Running /Loading Slow";Rec."Computer Running /Loading Slow")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Network Access Problems";Rec."Network Access Problems")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Antivirus Inefficiency";Rec."Antivirus Inefficiency")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field(Applications; Applications)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
            //     }
            //     field("Software Installation";Rec."Software Installation")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Others, specify SW";Rec."Others, specify SW")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
            group("Please describe the issue here:")
            {
                field("HelpDesk Category"; Rec."HelpDesk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HelpDesk Category field.';
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Category field.';
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Type field.';
                }
                field("ICT Inventory"; Rec."ICT Inventory")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Involved';
                    ToolTip = 'Specifies the value of the Asset Involved field.';
                }
                field("ICT Inventory Name"; Rec."ICT Inventory Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ICT Inventory Name field.';
                }
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned To EmpNo"; Rec."Assigned To EmpNo")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Assigned To EmpNo field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
                field("Expected Resolution"; Rec."Expected Resolution")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Expected Resolution field.';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Request action.';

                trigger OnAction()
                var
                Email: Text;
                RequestingOfficerName: Text;
                Success: Boolean;
                begin
                    // TestField("HelpDesk Category");
                    Rec.TestField("Description of the issue");
                    if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin

                        Recepient := Rec."Assign To Email";
                        Sub := 'ICT Request';
                        Body += 'Dear ' + Rec."Assigned To EmpNo" + ',';
                        Body += '<br>You have received a ICT request. <br> Kindly log in to the system to view the request. <br>';

                        EmMess.Create(Recepient, Sub, Body, true);
                        Success := Em.Send(EmMess, EmailScen::Default);

                         if Success then begin
                         Message('ICT Issue notification sent successfully.');
                         end else begin
                          Message('Failed to send the ICT Issue notification.');
                          end;

                        Rec."Request Date" := Today;
                        Rec."Request Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;
                        // SMTPMailSetup.Get;
                        // Employee.Reset;
                        // Employee.SetRange("No.", "Assigned To EmpNo");
                        // if Employee.Find('-') then begin
                        //     Employee.TestField("Company E-Mail");
                        //     Email2 := Employee."Company E-Mail";


                        //     CInfo.Get;


                        //     SetUp.Get();
                        //     ICTHelpdeskCategory.Reset;
                        //     // ICTHelpdeskCategory.SetRange(Code, "HelpDesk Category");
                        //     if ICTHelpdeskCategory.FindSet then
                        //         Email := SetUp."ICT Email";
                        //     Body := '<br>Kindly login to the ERP System and attend to the ICT Issue ' + "Description of the issue" + ' from ' + "Requesting Officer Name" + '.' + '</br>';
                        //     Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        //     Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        //     SMTP.CreateMessage(COMPANYNAME, SMTPMailSetup."Email Sender Address", ICTHelpdeskCategory.Email, 'ICT Heldesk', Body, true);
                        //     // Message(ICTHelpdeskCategory.Email);
                        //     SMTP.AddCC(Email2);
                        //     // SMTP.AddBCC(ICTHelpdeskCategory.Email);
                        //     SMTP.Send();
                        //     Message('ICT Issue notification sent successfully.');
                        // end;

                        
                        if Rec.Email <> '' then begin
                            //MESSAGE("Assigned To");
                            Email := Rec.Email;
                            RequestingOfficerName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            Subject := 'ICT Request';
                            Body1 += 'Dear ' + RequestingOfficerName + ',';
                            Body1 += '<br>Your issue has been received by ICT department Issue No. ' + Rec."Job No." + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                            Body1 += '<br>' + Body1 + ' ' + 'Best Regards,' + '</br>';
                            EmMess.Create(Email, Subject, Body1, true);
                            Success:= Em.Send(EmMess, EmailScen::Default);
                            if Success then begin
                             Message('Email notification sent to the requesting officer.');
                            end else begin
                            Message('Failed to send the notification to the requesting officer.');
                          end;
                        end else 
                        Error('Email Address for Employee %1 is Missing on the HelpDesk Request', Rec."Requesting Officer");

                        
                        // Email2 := CInfo."E-Mail";
                        // Body := '<br>Your issue has been received by ICT department Issue No. ' + Rec."Job No." + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                        // Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        // Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        // SMTP.CreateMessage(COMPANYNAME, SMTPMailSetup."Email Sender Address", Email, 'Heldesk Notifications', Body, true);
                        // Message(Email);
                        //SMTP.Send();
                        Message('ICT Issue notification sent successfully.');
                    end;

                    CurrPage.Close;
                end;
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
        // Type := Type::Internal;
    end;

    var
        Employee: Record Employee;
        Recepient, Sub, Body, Subject,Body1 : Text;
        // SMTP: Codeunit "Email Message";
        Email2: Text[250];
        Em: Codeunit Email;
        EmMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        SetUp: Record "ICT Helpdesk Global Parameters";
        ICTHelpdeskCategory: Record "ICT Helpdesk Category";
    // SMTPMailSetup: Record Email;
}




// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 56076 "ICT Helpdesk Request"
// {
//     PageType = Card;
//     SourceTable = "ICT Helpdesk";
//     SourceTableView = where(Status = filter(<> " "));

//     layout
//     {
//         area(content)
//         {
//             group("Part 1: User Information.")
//             {
//                 Editable = true;
//                 field("Job No.";Rec."Job No.")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Region Name";Rec."Region Name")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Region Name';
//                     Editable = false;
//                 }
//                 field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Constituency Name';
//                     Editable = false;
//                 }
//                 field("Constituency Name";Rec."Constituency Name")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 1 Code";Rec."Shortcut Dimension 1 Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Department Name';
//                     Editable = false;
//                 }
//                 field("Department Name";Rec."Department Name")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Requesting Officer";Rec."Requesting Officer")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Requesting Officer Name";Rec."Requesting Officer Name")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field(Phone; Phone)
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field(Email; Email)
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field(EXT; EXT)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Extension No';
//                     Editable = false;
//                 }
//                 field("Issue Category Department";Rec."Issue Category Department")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("ICT Issue Category";Rec."ICT Issue Category")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = true;
//                 }
//                 field("Request Date";Rec."Request Date")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Request Time";Rec."Request Time")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field(Status; Status)
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Others, specify SW";Rec."Others, specify SW")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//             }
//             group("Please describe the issue here:")
//             {
//                 field("Description of the issue";Rec."Description of the issue")
//                 {
//                     ApplicationArea = Basic;
//                     MultiLine = true;
//                     ShowMandatory = true;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control3; Links)
//             {
//             }
//             systempart(Control4; MyNotes)
//             {
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("Send Request")
//             {
//                 ApplicationArea = Basic;
//                 Image = SendApprovalRequest;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     //TESTFIELD("ICT Issue Category");
//                     TestField("Description of the issue");
//                     if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin
//                         "Request Date" := Today;
//                         "Request Time" := Time;
//                         Status := Status::Assigned;
//                         Modify;

//                         Category.RESET;
//                         Category.SETRANGE(Category.Code, "ICT Issue Category");
//                         IF Category.FINDSET THEN BEGIN
//                             Mapping.RESET;
//                             Mapping.SETRANGE(Mapping."Help Desk Category", "ICT Issue Category");
//                             Mapping.SETRANGE(Mapping.Assigned, FALSE);
//                             IF Mapping.FINDSET THEN BEGIN
//                                 "Assigned To" := Mapping.UserName;
//                                 "Assigned Date" := TODAY;
//                                 "Assigned Time" := TIME;
//                                 IF Rec.MODIFY(TRUE) THEN BEGIN
//                                     Mapping.Assigned := TRUE;
//                                     Mapping.MODIFY;
//                                 END;
//                             END;
//                         END;


//                         /*
//                           Employee.RESET;
//                           Employee.SETRANGE(Employee.Position,'JOB002');
//                           IF Employee.FIND('-')THEN
//                           BEGIN
//                             Email2:=Employee."Company E-Mail";
//                           END;
//                           */
//                         // CInfo.Get;


//                         // SetUp.Get();
//                         // Email2 := CInfo."Administrator Email";
//                         // Email := SetUp."ICT Email";
//                         // Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + "Job No." + ' from ' + "Requesting Officer Name" + '.' + '</br>';
//                         // Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
//                         // Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
//                         // SMTP.CreateMessage(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
//                         // Message(Email);
//                         // SMTP.Send();
//                         // Message('ICT Issue notification sent successfully.');

//                         // Employee.Reset;
//                         // Employee.SetRange(Employee."User ID", "Requesting Officer");
//                         // if Employee.Find('-') then begin
//                         //     //MESSAGE("Assigned To");
//                         //     Email := Employee."E-Mail";
//                         //     "Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
//                         // end;
//                         // Email2 := CInfo."Administrator Email";
//                         // Body := '<br>Your issue has been received by ICT department Issue No. ' + "Job No." + ' from ' + "Requesting Officer Name" + '.' + '</br>';
//                         // Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
//                         // Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
//                         // SMTP.CreateMessage(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
//                         // Message(Email);
//                         // SMTP.Send();
//                         Message('ICT Issue notification sent successfully.');
//                     end;

//                     CurrPage.Close;

//                 end;
//             }
//             action("Attach Documents")
//             {
//                 ApplicationArea = Basic;
//                 Image = Attach;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     //   DMSManagement.UploadICTHelpDeskDocuments("Job No.", 'ICT Helpdesk Issue', RecordId, d,"Global Dimension 1 Code");
//                 end;
//             }
//         }
//     }

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         Validate("Job No.");
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         Status := Status::Open;
//     end;

//     var
//         Employee: Record Employee;
//         Body: Text[250];
//         //SMTP: Codeunit Mail;
//         Email2: Text[250];
//         CInfo: Record "Company Information";
//         Category: Record "ICT Helpdesk Category";
//         Mapping: Record "ICT Officers Category Mapping";
//         UserSetup: Record "User Setup";
//         SetUp: Record "ICT Helpdesk Global Parameters";
//         DMSManagement: Codeunit "DMS Management";
// }

