#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56077 "ICT Helpdesk Assign"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Assigned));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Part 1: User Information")
            {
                Editable = false;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                    // Visible = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                    // Visible = false;
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Physical Station field.';
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Nature of Service field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    // Caption = 'Region Name';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    // Caption = 'Constituency Name';
                }
                // field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Department Name';
                // }
                field(EXT; Rec.EXT)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EXT field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                // part("Attached Documents1";Rec."Doc. Attachment List Factbox1")
                //     {
                //         ApplicationArea = All;
                //         Caption = 'Attachment';
                //         SubPageLink = "Table ID" = CONST(56050), "Job No." = FIELD("No.");//, "Document Type" = CONST(0);
                //         // SystemCreatedBy = field(SystemCreatedBy);

                //     }
                field("Level of Priority"; Rec."Level of Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Level of Priority field.', Comment = '%';
                    Editable = true;
                }
                part("Attached Documents1"; "Doc. Attachment List Factbox")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(56050), "No." = FIELD("Job No.");//, "Document Type" = CONST(0);
                                                                                      // SystemCreatedBy = field(SystemCreatedBy);

                }

            }
            group("Please describe the issue here")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
                Enabled = true;
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
            group(Delegation)
            {
                Caption = 'Delegation';
                Enabled = true;
                field("Delegate To"; Rec."Delegate To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delegate To field.';
                }
                field("Delegation Date"; Rec."Delegation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Delegation Date field.';
                }
            }
            group(Diagnosis)
            {
                Caption = 'Diagnosis';
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Describe the action taken to resolve the issue here';
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Describe the action taken to resolve the issue here field.';
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                field("Ascalation Details"; Rec."Ascalation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Escalation Details';
                    ToolTip = 'Specifies the value of the Escalation Details field.';
                }
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
                field("Escalation Levels"; Rec."Escalation Levels")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Assign)
            {
                ApplicationArea = Basic;
                Image = Delegate;
                // Promoted = true;
                // PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Assign action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to assign the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Assigned Date" := Today;
                        Rec."Assigned Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                // Promoted = true;
                // PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SetFilter("Job No.", Rec."Job No.");
                    Report.Run(56238, true, true, Rec);
                end;
            }
            action(Resolve)
            {
                ApplicationArea = Basic;
                Image = Close;
                // Promoted = true;
                // PromotedCategory = Process;
                ToolTip = 'Executes the Resolve action.';

                trigger OnAction()
                begin
                    Rec.TestField("Action Taken");
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        Rec."Attended Date" := Today;
                        Rec."Attended By" := UpperCase(UserId);
                        Rec."Attended Time" := Time;
                        Rec.Status := Rec.Status::Resolved;
                        Rec.Modify;
                    end;

                    //Release the  Officer
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, Rec."Attended By");
                    Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                    //Release the  Officer

                    //Notify the requester that the issue has been closed
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'Issue Resolved' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + Rec."Attended By" + 'and shall be closed after 24 hours. Kinldy login to the system and confirm.';
                    EmailMess.Create(Recipient, Subject, Body, true);
                    Em.Send(EmailMess, "Email Scenario"::Default);
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                // Promoted = true;
                // PromotedCategory = Process;
                ToolTip = 'Executes the Escalate action.';

                trigger OnAction()
                var
                    Success: Boolean;
                    Success2: Boolean;
                begin
                    if Confirm('Are you sure you want to escalate the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin



                        //Notify the requester that the issue has been escalated
                        // ObjComInfo.Get;
                        // SenderEmailAddress := ObjComInfo."Administrator Email";
                        // SenderName := COMPANYNAME;
                        if UserSetup.Get(Rec."Requesting Officer") then
                            Recipient := UserSetup."E-Mail";
                        Subject := 'ICT ISSUE ESCALATION' + ' ' + Rec."Job No.";
                        Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + Rec."Escalated To";
                        EmailMess.Create(Recipient, Subject, Body, true);
                        Success := Em.Send(EmailMess, "Email Scenario"::Default);
                        //  ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                        //Notify the Escalted To that the issue has been escalated
                        // ObjComInfo.Get;
                        // SenderEmailAddress := ObjComInfo."Administrator Email";
                        //SenderName := COMPANYNAME;
                        if UserSetup.Get(Rec."Escalated To") then
                            Recipient := UserSetup."E-Mail";
                        Subject := 'ICT ISSUE ESCALATION' + ' ' + Rec."Job No.";
                        Body := 'Please note that the issue on the subject above has been escalated to you by' + ' ' + Rec."Assigned To";
                        EmailMess.Create(Recipient, Subject, Body);
                        Success2 := Em.Send(EmailMess, "Email Scenario"::Default);
                        // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                        if Success and Success2 then begin
                            Rec."Escalated By" := UpperCase(UserId);
                            Rec."Escalated Date" := Today;
                            Rec."Escalated Time" := Time;
                            Rec."Assigned To" := Rec."Escalated To";
                            Rec.Status := Rec.Status::Escalated;
                            Rec.Modify(true);
                        end

                    end;
                end;
            }
            action("Escalate To Dynasoft")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                // Promoted = true;
                // PromotedCategory = Process;
                ToolTip = 'Executes the Escalate To Dynasoft action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to escalate the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Escalated By" := UpperCase(UserId);
                        Rec."Escalated Date" := Today;
                        Rec."Escalated Time" := Time;
                        Rec."Assigned To" := Rec."Escalated To";
                        Rec.Status := Rec.Status::"Escalated To Vendor";
                        Rec.Modify(true);
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    ObjComInfo.TestField("Administrator Email");
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //IF UserSetup.GET("Requesting Officer") THEN
                    //Dynasoft Email
                    ObjComInfo.TestField("Vendor  Email");
                    Recipient := ObjComInfo."Vendor  Email";
                    Subject := 'KeRRA ICT HELPDESK ISSUE ESCALATION TO DYNASOFT' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue below has been escalated to dynasoft for further action' + '<br> ' + Rec."Description of the issue";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the 'Escalted To' that the issue has been escalated to them
                    ObjComInfo.Get;
                    ObjComInfo.TestField("Administrator Email");
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //IF UserSetup.GET("Escalated To") THEN
                    ObjComInfo.TestField("ICT Email");
                    Recipient := ObjComInfo."ICT Email";
                    Subject := 'ICT ISSUE ESCALATION TO DYNASOFT' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue below has been escalated to Dynasoft Business Solutions Limited for further action' + '<br> ' + Rec."Description of the issue";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                // Promoted = true;
                // PromotedCategory = Process;
                // PromotedIsBig = true;
                ToolTip = 'Executes the Attach Documents action.';

                trigger OnAction()
                begin
                    //DMSManagement.UploadICTHelpDeskDocuments("Job No. 'ICT Helpdesk Issue', RecordId, d,"Global Dimension 1 Code");
                end;
            }
            action("Assignment History")
            {
                ApplicationArea = Basic;
                Image = RelatedInformation;
                // Promoted = true;
                // PromotedCategory = Process;
                // PromotedIsBig = true;
                ToolTip = 'Executes the Assignment History action.';
                RunPageLink = "Document No." = field("Job No.");
                RunObject = page "ICT Helpdesk Assign History";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Home';

                actionref(Resolve_Category; Resolve)
                {
                }
                actionref(Escalate_Category; Escalate)
                {
                }
                actionref(EscalateToDynasoft_Category; "Escalate To Dynasoft")
                {
                }
                actionref(AssignmentHistory_Category; "Assignment History")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Report';

                actionref(Print_Category; Print)
                {
                }
                actionref(AttachDocuments_Category; "Attach Documents")
                {
                }
            }
        }
    }

    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text;
        Subject: Text;
        Body: Text;
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
        DMSManagement: Codeunit "DMS Management";
        Em: Codeunit Email;
        EmailMess: Codeunit "Email Message";
}

