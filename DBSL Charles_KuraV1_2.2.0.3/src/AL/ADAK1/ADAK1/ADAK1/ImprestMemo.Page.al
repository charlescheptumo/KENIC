#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57033 "Imprest Memo"
{
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = "Imprest Memo";
    ///Permissions =
    //  tabledata "Imprest Memo" = RIM,
    // tabledata "Project Members" = R;
    Permissions = TableData "Approval Entry" = RIMD;
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices and Discounts,Navigate,Customer';
    ApplicationArea = All;
    Caption = 'Activity Budget';

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
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
                    Editable = not OpenApprovalEntriesExist;
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
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Destination Narations field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Date';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of days field.';
                    //  Numeric = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Mode of Transport"; Rec."Mode of Transport")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Transport field.';
                }
                field("Number of Drivers"; Rec."Number of Drivers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Drivers field.';
                }
                field("International Travel"; Rec."International Travel")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the International Travel field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Code: field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
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
                    Visible = true;
                    ToolTip = 'Specifies the value of the Total Casuals Cost field.';
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Other Costs field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Constituency field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Project Budget field.';
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
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
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
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Commitments field.';
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Remaining Amount field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }

                field("Total Imprest Cost"; Rec."Total Imprest Cost")
                {
                    ApplicationArea = all;
                    Visible = true;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Imprest Cost field.';
                    // trigger OnValidate()
                    // var

                    // begin
                    //     rec.CalcFields(rec."Total Subsistence Allowance", rec."Total Casuals Cost", rec."Total Other Costs");
                    //     rec."Total Imprest Cost" := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs";
                    // end;

                }
                // part("Attached Documents1"; "Doc. Attachment List Factbox")
                part("Attached Documents1"; "Doc. Attachment List Factbox")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57008), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                                                                                  // SystemCreatedBy = field(SystemCreatedBy);

                }
            }
            group("Travel Details")
            {
                Visible = false;
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
            part(Control43; "Safari Team")
            {
                UpdatePropagation = Both;
                Caption = 'Team';
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
            }
            part("Fuel/Maintenance"; Fuel)
            {
                UpdatePropagation = Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
                Visible = false;
            }
            part(Control1000000021; "Execution Plan")
            {
                UpdatePropagation = Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
            }
            part(Control1000000022; Casuals)
            {
                UpdatePropagation = Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = true;
            }
            part(Control1000000023; "Other Costs")
            {
                UpdatePropagation = Both;
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = Basic;
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1000000020; Links)
            {
            }
            // part("Attached Documents"; "Doc. Attachment List Factbox1")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachment';
            //     SubPageLink = "Table ID" = CONST(57008), "No." =
            //     FIELD("No.");


            // }
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
                PromotedCategory = Category6;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin

                    //Check if the header has lines
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                    if not ProjectTeam.FindLast then
                        Error('Please make sure you have atleast one line');
                    editTransport := false;
                    Rec.TestField(Status, Rec.Status::Open);//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    Rec.TestField(Objective);
                    Rec.TestField(Subject);
                    Rec.TestField(Date);
                    Rec.TestField("Imprest Naration");
                    Rec.TestField(Job);
                    Rec.TestField("Job  Task");
                    rec.TestField(rec."Shortcut Dimension 1 Code");
                    rec.TestField("Responsibility Center");
                    //cc//  Rec.Status := Rec.Status::Released;
                    //   cc/// Rec.Modify(TRUE);
                    //IF "Vote Amount"<"Total Subsistence Allowance" THEN
                    //ERROR('Budgeted Amount is less than the Amount requested');

                    //check if the requester is part of the team


                    //****Commented by Morris*****//
                    /*ProjectTeam.RESET;
                    ProjectTeam.SETRANGE(ProjectTeam."No.",Requestor);
                    IF ProjectTeam.FINDFIRST= FALSE THEN
                      ERROR(Text001);*/
                    //****Commented by Morris*****//
                    /*IF Status=Status::"Pending Approval" THEN BEGIN
                          IF "User ID"='DYNASOFT' THEN
                            editTransport:=TRUE;
                    
                            END ELSE BEGIN
                            editTransport:=FALSE;
                            END;*/

                    /*
                    CALCFIELDS("Total Subsistence Allowance","Total Fuel Costs","Total Maintenance Costs","Total Casuals Cost","Total Other Costs");
                    TotalImprestAmount:="Total Subsistence Allowance"+"Total Fuel Costs"+"Total Maintenance Costs"+"Total Casuals Cost"+"Total Other Costs";
                    */
                    /*IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                       ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");
                    
                    "Total Cost":=TotalImprestAmount;
                    MODIFY;
                    *//*
                    CALCFIELDS("Total Subsistence Allowance","Total Fuel Costs","Total Maintenance Costs","Total Casuals Cost","Total Other Costs");
                    TotalImprestAmount:="Total Subsistence Allowance"+"Total Fuel Costs"+"Total Maintenance Costs"+"Total Casuals Cost"+"Total Other Costs";
                     // CashMgmtSetup.GET;
                     // IF (CashMgmtSetup."Check Budget Vailability"=TRUE) THEN BEGIN
                      IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                         ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");
                     // END;
                     */
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                Visible = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Imprest Memo", true, true, Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalMgt.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
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
                    Rec.TestField("Reason to Reopen");
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //    ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(SendNotification)
                {
                    ApplicationArea = suite;
                    Caption = 'Send E-Mail Notification To Members';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Send E-Mail Notification To Members action.';
                    trigger OnAction()
                    var
                        SMTPMailSetup: Record "Email Account";
                        SMTPMail: Codeunit "Email Message";
                        HumanResourcesSetup: Record "Human Resources Setup";
                        SenderName: Text[250];
                        SenderEmailAddress: Text[250];
                        Receipients: text[30];///// List of [Text];
                        Subject: Text[300];
                        Body: Text[300];
                        Employee: Record Employee;
                        ImprestNotificationsSetup: Record "Imprest Notifications Setup";
                        InsuranceNotifications: Codeunit "Insurance Notifications";
                        Smail: Codeunit EMail;
                        Safari: record "Project Members";


                    begin
                        rec.testfield(Rec.status, Rec.status::Released);
                        Safari.reset;
                        safari.setrange(Safari."Imprest Memo No.", rec."No.");
                        if Safari.FindSet then begin
                            REPEAT
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
                                    Message(Receipients);
                                    Subject := 'IMPREST MEMO(S) APPROVED';
                                    Body := 'Dear' + ' ' + SAFARI."Name" + '<br>'
                                   + 'Please note that you have listed on imprest memo(s)' + rec."No." + '<br>'
                                   + 'An Imprest Requisition has been created. Please Login to your ESS portal and navigate to open imprest requisitions and send it for approval' + '<BR>'
                                   + 'Kind Regards,' + '<br>'
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
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
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
                    Visible = false;
                    ToolTip = 'Executes the Attach Document action.';

                    trigger OnAction()
                    begin
                        //        DMSManagement.UploadImprestDocuments(DMSDocuments."document type"::"Imprest Memo", "No.", 'Imprest Memo', RecordId, "Shortcut Dimension 1 Code");
                    end;
                }
                // action(DocAttach)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Attachments';
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                //     Visible = true;

                //     trigger OnAction()
                //     var
                //         DocumentAttachmentDetails: Page "Document Attachment Details";
                //         RecRef: RecordRef;
                //     begin
                //         RecRef.GetTable(Rec);
                //         DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //         DocumentAttachmentDetails.RunModal;
                //     end;
                // }
            }
            // action(Attachments1)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Upload Documents';
            //     Image = Attach;
            //     Promoted = true;
            //     Visible = false;
            //     PromotedCategory = Category9;
            //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

            //     trigger OnAction()
            //     var
            //         DocumentAttachmentDetails: Page "Document Attachment Details";
            //         RecRef: RecordRef;
            //         Doc: Record "Document Attachment";

            //     begin

            //         RecRef.GetTable(Rec);
            //         DocumentAttachmentDetails.OpenForRecRef(RecRef);
            //         DocumentAttachmentDetails.RunModal;
            //     end;

            // }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;
        DocType := DocType::"Imprest Memo";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin
        TotalCost := 0;
        Rec.CalcFields("Total Subsistence Allowance", "Total Casuals Cost", "Total Other Costs", "Total Maintenance Costs");
        TotalCost := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs" + rec."Total Maintenance Costs";
        Rec."Total Imprest Cost" := TotalCost;
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);

        impmemo.Reset();
        impmemo.SetRange("No.", impmemo."No.");
        if impmemo.FindSet() then begin
            if impmemo.Requestor = Rec.Requestor then begin
                Error('Submit your previously requested petty cash voucher');
                exit
            end;

        end;

        //UpdateEmployeeTotalCost(Rec."No.");

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        // rec."Total Imprest Cost" := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs";
        //SetControlAppearance;
    end;

    procedure UpdateEmployeeTotalCost(MemoNo: Code[20])
    var
        TeamCostsRec: Record "Project Members";
        OtherCostsRec: Record "Other Costs";
        EmployeeID: Code[20];
        TotalCost: Decimal;
    begin
        TeamCostsRec.Reset();
        TeamCostsRec.SetRange("Imprest Memo No.", MemoNo);
        if TeamCostsRec.FindSet() then begin
            repeat
                EmployeeID := TeamCostsRec."No.";
                TotalCost := TeamCostsRec."Total Entitlement";
                OtherCostsRec.SetRange("Employee No To Surrender", EmployeeID);
                if OtherCostsRec.FindSet() then begin
                    repeat
                        TotalCost += OtherCostsRec."Line Amount";
                    until OtherCostsRec.Next() = 0;
                end;
                TeamCostsRec."Total per Employee" := TotalCost;
                TeamCostsRec.Modify();

            until TeamCostsRec.Next() = 0;
        end;
        Message('Total costs updated successfully.');
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        // [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        PendindApproval: Boolean;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        Text003: label 'You do no have rights to post Imprest memo surrender. Please Seek Assistance from Accounts';
        usersetup: Record "User Setup";
        Releasememo: Codeunit "Imprest Memo";
        pteam: Record "Project Members";
        impmemo: Record "Imprest Memo";
        exeplan: Record "Execution Plan";
        editTransport: Boolean;
        //safariteam: Page "Safari Team";
        TotalImprestAmount: Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        TotalCost: Decimal;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //   OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(v: Record  temporary;);
        //   OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(rec:RecordId);
        // rec.CalcFields(rec."Total Subsistence Allowance", rec."Total Casuals Cost", rec."Total Other Costs",rec."Total Maintenance Costs");
        // rec."Total Imprest Cost" := rec."Total Subsistence Allowance" + rec."Total Casuals Cost" + rec."Total Other Costs" + rec."Total Maintenance Costs";
        // rec.Modify();
    end;
}



