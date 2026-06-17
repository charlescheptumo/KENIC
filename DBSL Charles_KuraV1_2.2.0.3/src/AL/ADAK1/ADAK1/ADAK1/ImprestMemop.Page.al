#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AL0603,AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57042 "Imprest Memo-p"
{
    DeleteAllowed = false;
    // Editable = false;
    //InsertAllowed = false;
    // ModifyAllowed = false;
    Editable = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(false));
    ApplicationArea = All;
    Caption = 'Activity Budget';

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ObjText field.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the TORText field.';

                    trigger OnValidate()
                    begin

                        Rec.CalcFields("Terms of Reference");
                        Rec."Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear(Rec."Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            Rec."Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Refernce No"; Rec."Refernce No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Refernce No field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Code: field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                    ToolTip = 'Specifies the value of the Destination Narations field.';
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Subsistence Allowance field.';
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Fuel Costs field.';
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Maintenance Costs field.';
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Casuals Cost field.';
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Other Costs field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job  Task field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Budget field.';
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Remaining Amount field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Project Budget field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Actual Project Costs field.';
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Purchase Order Commitments field.';
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Store Requisition(S11) Commitments field.';
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Imprest Applications Commitments field.';
                }
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Budget Commitments field.';
                }
                part("Attached Documents1"; "Doc. Attachment List Factbox1")
                {
                    ApplicationArea = ALL;
                    Visible = true;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57008), "No." = FIELD("No.");

                }
            }
            group(Reasons)
            {
                Caption = 'Reasons';
                field("Reason to Reopen"; Rec."Reason to Reopen")
                {
                    ApplicationArea = Basic;
                    // Editable = editable1;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Reason to Reopen field.';
                    /////////////
                }
            }
            group("Travel Details")
            {
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
            }
            part(Control1000000020; "Safari Team")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
            }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
                Visible = false;
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
            }
            part(Control1000000022; Casuals)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = ALL;
                Visible = true;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(57008), "No." = FIELD("No.");

            }
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                begin
                    //Daudi
                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Rec.Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    //if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    //Ushindi changes
                    if Rec.Status <> Rec.Status::Released then
                        Error(Text002);
                    if Rec.Status = Rec.Status::Released then begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57001, true, true, Rec);
                        Rec.Reset;
                    end;
                end;
            }
            action(SendNotification)
            {
                ApplicationArea = suite;
                Caption = 'Send E-Mail Notification To Members';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Send E-Mail Notification To Members action.';
                trigger OnAction()
                var
                    SMTPMailSetup: Record "Email Account";
                    SMTPMail: Codeunit "Email Message";
                    HumanResourcesSetup: Record "Human Resources Setup";
                    SenderName: Text[250];
                    SenderEmailAddress: Text[250];
                    Receipients: text[30];///// List of [Text];
                    Subject: Text[1000];
                    Body: Text[1000];
                    Employee: Record Employee;
                    ImprestNotificationsSetup: Record "Imprest Notifications Setup";
                    InsuranceNotifications: Codeunit "Insurance Notifications";
                    Smail: Codeunit EMail;
                    Safari: record "Project Members";


                begin
                    Safari.reset;
                    safari.setrange(safari."Imprest Memo No.", rec."No.");
                    safari.setrange(safari."Imprest Created", true);
                    if Safari.FindSet then begin
                        REPEAT
                            if confirm('Are you sure you want to send notification to all team members?', true) then
                                HumanResourcesSetup.Get;
                            //ImprestNotificationsSetup.GET;
                            SenderName := CompanyProperty.DisplayName;
                            HumanResourcesSetup.TestField("HR E-mail Address");
                            SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
                            if Rec.Status = rec.status::Released then begin
                                Employee.Reset;
                                Employee.SetRange(Employee."No.", Safari."No.");
                                if Employee.FindSet then
                                    Receipients := Employee."Company E-Mail";
                                // Message(Receipients);
                                Subject := 'IMPREST MEMO(S) APPROVED';
                                Body := 'Dear' + ' ' + SAFARI."Name" + '<br>'
                               + 'Please note that you have listed on imprest memo(s)' + ' ' + rec."No." + '<br>'
                               + 'An Imprest Requisition has been created. Please Login to your ESS portal and navigate to open imprest requisitions and send it for approval' + '<BR>''<br>'
                               + 'Kind Regards,' + '<br>''<br>'
                               + CompanyProperty.DisplayName;
                                //////   ///// SMTPMail.Create(SenderName,SenderEmailAddress,Receipients,Subject,Body,true);
                                SMTPMail.Create(Receipients, Subject, Body, true);
                                //SMTPMail.Send();
                                Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);

                            END;
                        UNTIL SAFARI.NEXT = 0;

                        message('Sucessful!');
                    end;
                end;
            }
            action("Create Imprest And Send E-Mail Notification To Members")
            {
                ApplicationArea = Basic;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Create Imprest And Send E-Mail Notification To Members action.';

                trigger OnAction()
                var
                    SMTPMailSetup: Record "Email Account";
                    SMTPMail: Codeunit "Email Message";
                    HumanResourcesSetup: Record "Human Resources Setup";
                    SenderName: Text[250];
                    SenderEmailAddress: Text[250];
                    Receipients: text[30];///// List of [Text];
                    Subject: Text[1000];
                    Body: Text[1000];
                    Employee: Record Employee;
                    ImprestNotificationsSetup: Record "Imprest Notifications Setup";
                    InsuranceNotifications: Codeunit "Insurance Notifications";
                    Smail: Codeunit EMail;
                    Safari: record "Project Members";
                    Safari2: record "Project Members";
                    ImpMemo2: Record "Imprest Memo";
                    RecordLinks: Record "Record Link";
                    RecordLinksTransfer: Record "Record Link";
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, Rec."No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", Rec."No.");
                        if Memoheaders.FindSet() then begin
                            SafariMembers.CalcFields("No. Of Outstanding Imprest");
                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            //SafariMembers.Validate("No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            //SafariMembers.Validate("No.");
                            //SafariMembers.SetFilter("Outstanding Amount", '<=%1', 0); // Commented to Create Multiple Imprest
                            //SafariMembers.SetFilter("No. Of Outstanding Imprest",'<=%1',2);
                            SafariMembers.SetRange("Imprest Created", false);
                            //SafariMembers.SETRANGE(SafariMembers."No.","No.");
                            if SafariMembers.FindSet() then begin
                                repeat
                                    //ERROR('1');
                                    //get the no. series
                                    //  CashMgt.Reset;
                                    if CashMgt.get() then begin
                                        Noseries := CashMgt."Imprest Nos";
                                        Email2 := CashMgt."Imprest Email";
                                        //MESSAGE(Email2);
                                    end;

                                    LineNo := 1000;
                                    Imprestheaders.Init;
                                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                    Imprestheaders.Date := Today;
                                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                                    Imprestheaders."Account No." := SafariMembers."No.";
                                    Imprestheaders.Validate("Account No.");
                                    Imprestheaders."Account Name" := SafariMembers.Name;
                                    //MESSAGE('%1-%2',Imprestheaders."Account Name",Imprestheaders."Account No." );
                                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
                                    Imprestheaders.Payee := SafariMembers.Name;
                                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                                    Imprestheaders.JobNo := Memoheaders.Job;
                                    Imprestheaders.Status := Imprestheaders.Status::Released;
                                    Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                                    Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                                    Imprestheaders.Currency := SafariMembers."Currency Code";
                                    Imprestheaders."Created By" := UserId;
                                    //Imprestheaders."Reference No.":="No.";

                                    Email1 := '';
                                    EMp.Reset;
                                    EMp.SetRange("No.", Imprestheaders."Account No.");
                                    if EMp.FindSet then
                                        Email1 := EMp."Company E-Mail";
                                    //MESSAGE(Email1);

                                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                    Imprestheaders."Destination Narration" := Memoheaders."Imprest Naration";
                                    Imprestheaders.Purpose := Memoheaders.Subject;
                                    Imprestheaders.Description := Memoheaders.Subject;
                                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                                    Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                    Imprestheaders."On behalf of" := SafariMembers.Name;
                                    Imprestheaders.Status := Imprestheaders.Status::Open;//Changed by Fred after a discusion with Finance for involvement of finance in the approval
                                    Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                    Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                                    // Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                    Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Funding Source";
                                    Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
                                    Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                    Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                    Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                    Imprestheaders.Validate("Dimension Set ID");
                                    Imprestheaders."Paying Bank Account" := Memoheaders."Paying Bank Account";
                                    Imprestheaders."Imprest Issue Date" := Today;
                                    Imprestheaders.Validate("Paying Bank Account");
                                    IF Imprestheaders.Insert(true) then begin

                                        //Commented by FRed to effect a directive from Matilda(DDF);
                                        //Check if Employee has another imprest that has not been posted--Fred Requirement from DDF(Matilda);
                                        // Imprestheaders.RESET;
                                        // Imprestheaders.SETRANGE(Imprestheaders."Account No.",SafariMembers."No.");
                                        // Imprestheaders.SETRANGE(Imprestheaders.Posted,FALSE);
                                        // Imprestheaders.SETRANGE(Imprestheaders."Payment Type",Imprestheaders."Payment Type"::Imprest);
                                        // IF NOT Imprestheaders.FINDSET THEN
                                        // Imprestheaders.INSERT(TRUE)
                                        // ELSE
                                        // ERROR('The employee %1 has another unprocessed imprest',SafariMembers."No.");
                                        //End Check if Employee has another imprest that has not been posted--Fred Requirement from DDF(Matilda);


                                        //Start of Imprest lines
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := SafariMembers."G/L Account";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        // Imprestlines.Purpose := SafariMembers."Work Type";
                                        Imprestlines.Purpose := Memoheaders.Subject;
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers.Entitlement;
                                        Imprestlines."Job No." := SafariMembers.Job;
                                        Imprestlines."Job Task No." := SafariMembers."Job  Task";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines.Validate(Amount);
                                        if not Imprestlines.Get(Imprestlines.No, Imprestlines."Line No") then begin
                                            if Imprestlines.Insert(true) then begin
                                                CustomFunction.FnCommitAmount(Imprestlines.Amount, Imprestlines."Account Type", Imprestlines."Account No.", CustomFunction.GetBudgetYear(Imprestheaders.Date), Imprestheaders."No.", CommitmentEntries."Source Type"::Payment, Imprestheaders."Shortcut Dimension 1 Code", Imprestheaders."Shortcut Dimension 2 Code", Imprestheaders."Shortcut Dimension 3 Code", Imprestheaders.Date, CommitmentType::Committed, CopyStr('Posting ' + Imprestheaders.Purpose, 1, 2048));
                                            end;
                                        end;
                                        //THEN
                                        // Imprestlines.MODIFY(TRUE);
                                    end;
                                    //Insert Other costs
                                    LineNo := LineNo + 10;
                                    FnInsertOtherCostsDetails(Rec);
                                    LineNo := LineNo + 10;
                                    FnInsertCasualSDetails(Rec);

                                    LineNo := LineNo + 10;
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        // Imprestlines.Init;
                                        // Imprestlines."Line No" := LineNo;
                                        // Imprestlines.No := Imprestheaders."No.";
                                        // Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        // SafariMembers.CalcFields("G/L Account");
                                        // Imprestlines."Account No." := SafariMembers."G/L Account";
                                        // Imprestlines.Validate(Imprestlines."Account No.");
                                        // Imprestlines.Purpose := 'Transport Allowance';
                                        // Imprestlines.Purpose := Imprestheaders.Purpose;
                                        // Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        // Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        // Imprestlines.Amount := SafariMembers."Transport Costs";
                                        // Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        // Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        // Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        // Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        // Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        // Imprestlines."Job No." := SafariMembers.Job;
                                        // Imprestlines.Project := SafariMembers.Job;
                                        // Imprestlines."Job Task No." := SafariMembers."Job  Task";
                                        // if not Imprestlines.Get(Imprestlines.No, Imprestlines."Line No") then
                                        //     Imprestlines.Insert(true);
                                        // LineNo := LineNo + 10;
                                    end;



                                    Imprestheaders.Validate(Imprestheaders.Status);




                                    //send email to participants
                                    CashMgt.Get;
                                    if CashMgt."Send Email Notification" = true then begin
                                        if Email1 <> '' then begin
                                            Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + Rec."No." +
                                            ' Kindly logon to Microsoft 365 Business Central to confirm and send it for approval.';

                                            HumanResourcesSetup.Get;
                                            //ImprestNotificationsSetup.GET;
                                            SenderName := CompanyProperty.DisplayName;
                                            HumanResourcesSetup.TestField("HR E-mail Address");
                                            SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
                                            if Rec.Status = rec.status::Released then begin
                                                Employee.Reset;
                                                Employee.SetRange(Employee."No.", SafariMembers."No.");
                                                if Employee.FindFirst() then begin
                                                    Receipients := Employee."Company E-Mail";
                                                    // Message(Receipients);
                                                    Subject := 'IMPREST MEMO(S) APPROVED';
                                                    Body := 'Dear' + ' ' + SAFARI."Name" + '<br>'
                                                   + 'Please note that you have listed on imprest memo(s)' + ' ' + rec."No." + '<br>'
                                                   + 'An Imprest Requisition has been created. Please Login to your ESS portal and navigate to open imprest requisitions and send it for approval' + '<BR>''<br>'
                                                   + 'Kind Regards,' + '<br>''<br>'
                                                   + CompanyProperty.DisplayName;
                                                    //////   ///// SMTPMail.Create(SenderName,SenderEmailAddress,Receipients,Subject,Body,true);
                                                    SMTPMail.Create(Receipients, Subject, Body, true);
                                                    //SMTPMail.Send();
                                                    Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
                                                end;
                                            end;
                                            // SMTP.CreateMessage('KERRA',Email2,
                                            // Email1,'Imprest '+'No: '+Imprestheaders."No.",
                                            // 'Dear '+Imprestheaders.Payee+',<BR><BR>'+
                                            // 'Your imprest application no. '+ Imprestheaders."No." + ' with the subject, ' + Memoheaders.Subject + ' of amount '+Format(SafariMembers.Entitlement)+''' has been created from memo no. '+"No."+
                                            // ' and has been fowarded to finance for processing.<BR><BR>',true);

                                            // SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>Finance Department.<BR>'+'<BR>');
                                            // SMTP.Send();

                                        end;
                                    end;
                                    //Message('Imprest requisition %1 created for %2 mail sent to %3', Imprestheaders."No.", Imprestheaders."Account Name", Email1);
                                    SafariMembers."Imprest Created" := true;
                                    SafariMembers."Imprest No." := Imprestheaders."No.";
                                    SafariMembers.Modify;
                                    //recordLinks
                                    RecordLinks.RESET;
                                    //Message('Looking for RecordLinks on RecordID: %1', Memoheaders.RecordId);
                                    RecordLinks.SETRANGE(RecordLinks."Record ID", Memoheaders.RecordId);
                                    IF RecordLinks.FINDSET THEN BEGIN
                                        REPEAT
                                            RecordLinksTransfer.INIT;
                                            RecordLinksTransfer."Link ID" := 0;
                                            RecordLinksTransfer."Record ID" := Imprestheaders.RecordId;
                                            RecordLinksTransfer.URL1 := RecordLinks.URL1;
                                            RecordLinksTransfer.Company := RecordLinks.Company;
                                            RecordLinksTransfer.Created := RecordLinks.Created;
                                            RecordLinksTransfer.Description := RecordLinks.Description;
                                            RecordLinksTransfer."User ID" := USERID;
                                            RecordLinksTransfer.Type := RecordLinks.Type;

                                            RecordLinksTransfer.INSERT(TRUE);
                                        UNTIL RecordLinks.NEXT = 0;
                                    END;

                                until SafariMembers.Next = 0;
                                Message('Imprest Requisition(s) created successfully.');

                            end
                            else
                                error('Could not find safari members within ther filter');

                            SafariMembers.Reset;
                            SafariMembers.SetRange(SafariMembers."Imprest Memo No.", Rec."No.");
                            SafariMembers.SetRange(SafariMembers."Imprest Created", true);
                            TotalChecked := SafariMembers.Count;

                            SafariMembers.Reset;
                            SafariMembers.SetRange(SafariMembers."Imprest Memo No.", Rec."No.");
                            TotalImp := SafariMembers.Count;
                            //MESSAGE('%1-%2',TotalImp,TotalChecked);
                            if TotalImp = TotalChecked then begin
                                Memoheaders."Imprest Created" := true;
                                Memoheaders."Date converted" := Today;
                                Memoheaders."Time converted" := Time;
                                Memoheaders."Converted By" := UserId;
                                Memoheaders.Posted := true;
                                Memoheaders.Modify;
                            end;
                        end;
                        Message('Imprest (s) for the imprest memo No. %1 has been processed', Rec."No.");
                    end else
                        Error('The payment for memo No. %1 has already been processed.', Memoheaders."No.");

                    //cc notify
                    //notification should only be when creating the imprest memo //kk
                    /*  Safari.reset;
                      safari.setrange(safari."Imprest Memo No.", rec."No.");
                      safari.setrange(safari."Imprest Created", true);
                      if Safari.FindSet then begin
                          REPEAT
                              if confirm('Are you sure you want to send notification to all team members?', true) then
                                  HumanResourcesSetup.Get;
                              //ImprestNotificationsSetup.GET;
                              SenderName := CompanyProperty.DisplayName;
                              HumanResourcesSetup.TestField("HR E-mail Address");
                              SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
                              if Rec.Status = rec.status::Released then begin
                                  Employee.Reset;
                                  Employee.SetRange(Employee."No.", Safari."No.");
                                  if Employee.FindSet then
                                      Receipients := Employee."Company E-Mail";
                                  // Message(Receipients);
                                  Subject := 'IMPREST MEMO(S) APPROVED';
                                  Body := 'Dear' + ' ' + SAFARI."Name" + '<br>'
                                 + 'Please note that you have listed on imprest memo(s)' + ' ' + rec."No." + '<br>'
                                 + 'An Imprest Requisition has been created. Please Login to your ESS portal and navigate to open imprest requisitions and send it for approval' + '<BR>''<br>'
                                 + 'Kind Regards,' + '<br>''<br>'
                                 + CompanyProperty.DisplayName;
                                  //////   ///// SMTPMail.Create(SenderName,SenderEmailAddress,Receipients,Subject,Body,true);
                                  SMTPMail.Create(Receipients, Subject, Body, true);
                                  //SMTPMail.Send();
                                  Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);

                              END;
                          UNTIL SAFARI.NEXT = 0;

                          message('Sucessful!');
                      end;*/

                    //Fred Copy Links from Memo to Requisition
                    // RecordLink.Reset;
                    // //RecordLink.SetRange(RecordLink."Document No","No.");
                    // if RecordLink.FindSet then
                    //     repeat
                    //         LinkID := 0;
                    //         if RecordLink.FindLast then begin
                    //             LinkID := RecordLink."Link ID" + 1;
                    //         end;
                    //         ObjRecordLink.Init;
                    //         ObjRecordLink.TransferFields(RecordLink);
                    //         ObjRecordLink.Description := Imprestheaders."No.";
                    //         ObjRecordLink."Link ID" := LinkID;
                    //         if not ObjRecordLink.Insert(true) then
                    //             ObjRecordLink.Modify(true);
                    //     until RecordLink.Next = 0;
                    ImpMemo2.Reset();
                    ImpMemo2.SetRange(Status, ImpMemo2.Status::Open);
                    if ImpMemo2.FindSet() then begin
                        repeat
                            Safari2.Reset();
                            Safari2.SetRange("Imprest Memo No.", ImpMemo2."No.");
                            if Safari2.FindSet() then begin
                                repeat
                                    Safari2.Validate("No.");
                                    Safari2.Modify();
                                until Safari2.next() = 0;
                            end;
                        until ImpMemo2.Next() = 0;
                    end;
                end;
            }

            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
        }
        area(navigation)
        {
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Executes the Re&lease action.';

                trigger OnAction()
                var
                // ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action("Re&open")
            {
                ApplicationArea = Basic;
                Caption = 'Re&open';
                Image = ReOpen;
                ToolTip = 'Executes the Re&open action.';

                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    //added on 20/04/2016
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                    Rec.TestField("Reason to Reopen");
                    ReopenMemo.PerformManualReopen(Rec);

                    //added on 20/04/2016
                    //increase frequency of reopening to be only once
                    if Rec."Frequency of Reopen" > 0 then begin
                        Error('The memo already reopened you can only reopen once');
                    end else begin
                        Rec."Frequency of Reopen" := 1;
                        Rec."Reopened by" := UserId;
                        Rec."Reopened Date" := CurrentDatetime;
                        rec.Status := rec.Status::Open;
                        Rec.Modify(true);
                    end;
                end;
            }
            action("Update Imprest Memo")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report "Update Imprest Memo";
                ToolTip = 'Executes the Update Imprest Memo action.';
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    //   DMSManagement.UploadImprestDocuments(DMSDocuments."document type"::"Imprest Memo", "No.", 'Imprest Memo', RecordId, "Shortcut Dimension 1 Code");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin

        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        // if rec.status = rec.status::Released = true then editable1 := true;
        // ////////////////////////////////////
        // if Rec.Status <> Rec.Status::Open then
        //     CurrPage.Editable(false);
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        // [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        ReopenMemo: Codeunit "Imprest Memo";
        memo: Record "Imprest Memo";
        Releasememo: Codeunit "Imprest Memo";
        Usersetup: Record "User Setup";
        Imprestlines: Record "Imprest Lines";
        Imprestheaders: Record payments;
        Memolines: Record "PV Lines";
        Memoheaders: Record "Imprest Memo";
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        SafariMembers: Record "Project Members";
        Othercost: Record "Other Costs";
        LineNo: Integer;
        Text005: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        // SMTP: Codeunit Mail;
        Body: Text[1024];
        editable1: Boolean;
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Text006: label 'your imprest No %1 of Amount %2 has been created,and is being processed';
        ImprestMessage: Text[80];
        TransportReq: Record "Transport Requisition";
        TransSetup: Record "Fleet Management Setup";
        TravelStaff: Record "Travel Requisition Staff";
        TravelNo: Code[50];
        EMp: Record Employee;
        Casual: Record Casuals;
        WorkType: Record "Work Type";
        TotalImprestAmount: Decimal;
        TotalChecked: Integer;
        TotalImp: Integer;
        RecordLink: Record "Record Link";
        ObjRecordLink: Record "Record Link";
        LinkID: Integer;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        CommitmentEntries: Record "Commitment Entries";
        CustomFunction: Codeunit "Custom Function";
        CommitmentType: Enum "Commitment Type";

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        rec.CalcFields(rec."Total Subsistence Allowance", rec."Total Casuals Cost", rec."Total Other Costs", rec."Total Maintenance Costs");
        rec."Total Imprest Cost" := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs" + rec."Total Maintenance Costs";
        //rec.Modify();
    end;


    procedure FnSendimprestEmail(EmpNo: Code[50]; ImprestAmount: Decimal)
    var
        // SMTPMail: Codeunit Mail;
        // SMTPSetup: Record "Email Account";
        FileName: Text[100];
        Attachment: Text[250];
        CompanyInfo: Record "Company Information";
        Email: Text[250];
        EmpRec: Record Employee;
    begin
        //  SMTPSetup.Get();

        EmpRec.Reset;
        EmpRec.SetRange(EmpRec."No.", EmpNo);
        if EmpRec.Find('-') then begin

            if EmpRec."E-Mail" <> '' then begin
                ImprestMessage := Text006;
                Email := EmpRec."Company E-Mail";

                // //SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address", Email, 'Imprest Application', '', true);
                // //SMTPMail.AddBodyline(StrSubstNo(ImprestMessage, "No.", ImprestAmount, UserId));
                // //SMTPMail.AddBodyline(SMTPSetup."Email Sender Name");
                // //SMTPMail.AddBodyline('<br><br>');
                // SMTPMail.AddAttachment(FileName, Attachment);
                // //SMTPMail.Send;
            end;
        end;
    end;

    local procedure FnGetNoSeries()
    begin
        CashMgt.Reset;
        if CashMgt.Find('-') then begin
            Noseries := CashMgt."Imprest Nos";
            Email2 := CashMgt."Imprest Email";
            //MESSAGE(Email2);
        end;
    end;

    local procedure FnInsertProjectLeadDetails()
    begin
        ProjectTeam.Reset;
        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
        if ProjectTeam.Find('-') then begin
            repeat
                Imprestlines.Init;
                Imprestlines."Line No" := LineNo;
                Imprestlines.No := Imprestheaders."No.";
                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                SafariMembers.CalcFields("G/L Account");
                Imprestlines."Account No." := ProjectTeam."G/L Account";
                Imprestlines.Validate(Imprestlines."Account No.");
                Imprestlines.Purpose := ProjectTeam."Work Type";
                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                Imprestlines."No. of Days" := SafariMembers."Time Period";
                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                Imprestlines.Insert;
                LineNo := LineNo + 10;
            until ProjectTeam.Next = 0;
        end;
    end;

    local procedure FnInsertOtherCostsDetails(ImprestMemo: Record "Imprest Memo")
    begin
        Othercost.Reset;
        Othercost.SetRange(Othercost."Imprest Memo No.", ImprestMemo."No.");
        if Othercost.FindSet() then begin
            repeat
                Imprestlines.Init;
                Imprestlines."Line No" := LineNo;
                Imprestlines.No := Imprestheaders."No.";
                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                Othercost.CalcFields("No.");
                Imprestlines."Account No." := Othercost."No.";
                Imprestlines.Validate(Imprestlines."Account No.");
                Imprestlines.Purpose := Othercost."Required For";

                //  Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                Imprestlines."Daily Rate" := Othercost."Unit Cost";
                // Imprestlines."No. of Days" := SafariMembers."Time Period";
                Imprestlines."No. of Days" := Othercost."No. of Days";
                Imprestlines.Quantity := Othercost."Quantity Required";
                Imprestlines.Amount := Othercost."Line Amount";
                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                Imprestlines."Job No." := SafariMembers.Job;
                Imprestlines."Job Task No." := SafariMembers."Job  Task";
                Imprestlines.Validate(Amount);
                if Othercost."Employee No To Surrender" = SafariMembers."No." then
                    if Imprestlines.Insert(true) then begin
                        CustomFunction.FnCommitAmount(Imprestlines.Amount, Imprestlines."Account Type", Imprestlines."Account No.", CustomFunction.GetBudgetYear(Rec.Date), Rec."No.", CommitmentEntries."Source Type"::Payment, Rec."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 2 Code", Rec."Shortcut Dimension 3 Code", Rec.Date, CommitmentType::Committed, CopyStr('Posting ' + Imprestlines.Purpose, 1, 2048));
                    end;
                LineNo := LineNo + 10;
            until Othercost.Next = 0;
        end;
    end;

    local procedure FnInsertCasualSDetails(ImprestMemo: Record "Imprest Memo")
    begin
        Casual.Reset;
        Casual.SetRange(Casual."Imprest Memo No.", ImprestMemo."No.");
        if Casual.FindSet() then begin
            repeat
                Imprestlines.Init;
                Imprestlines."Line No" := LineNo;
                Imprestlines.No := Imprestheaders."No.";

                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                Imprestlines."Account No." := Casual."G/L Account";
                Imprestlines.Validate(Imprestlines."Account No.");
                Imprestlines.Purpose := Casual.Activity;
                Imprestlines."Daily Rate" := Casual.Rate;
                Imprestlines."No. of Days" := Casual."No. of Days";
                Imprestlines.Amount := Casual.Amount;
                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                if Imprestlines.Insert(true) then begin
                    CustomFunction.FnCommitAmount(Imprestlines.Amount, Imprestlines."Account Type", Imprestlines."Account No.", CustomFunction.GetBudgetYear(Rec.Date), Rec."No.", CommitmentEntries."Source Type"::Payment, Rec."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 2 Code", Rec."Shortcut Dimension 3 Code", Rec.Date, CommitmentType::Committed, CopyStr('Posting ' + Imprestlines.Purpose, 1, 2048));
                end;
                LineNo := LineNo + 10;
            until Casual.Next = 0;
        end;
    end;

    local procedure FnSendEmailAlertToParticipants()
    begin
        CashMgt.Get;
        if CashMgt."Send Email Notification" = true then begin
            if Email1 <> '' then begin
                Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + Rec."No." +
                'Kindly login to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';
                //     SMTP.CreateMessage('KERRA', CashMgt."Imprest Email",
                //     Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
                //    'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                //    'Your imprest application no. ' + Imprestheaders."No." + 'of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
                //    ' and has been fowarded to finance for processing.<BR><BR>', true);
                //     SMTP.AddBodyline('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                //     SMTP.Send();
            end;
        end;
    end;

    local procedure FnModifyMemoHeader()
    begin
        Memoheaders."Imprest Created" := true;
        Memoheaders."Date converted" := Today;
        Memoheaders."Time converted" := Time;
        Memoheaders."Converted By" := UserId;
        Memoheaders.Posted := true;
        Memoheaders.Modify(true);
    end;


}

#pragma implicitwith restore

