#pragma warning disable AA0005, AA0008,AL0603, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72619 "Proj. Mobilization Checklist C"
{
    PageType = Card;
    SourceTable = "Project Mobilization Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract No';
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project No';
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("<Project Description"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Description';
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Default CheckList Template ID"; Rec."Default CheckList Template ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project CheckList Template ID';
                    ToolTip = 'Specifies the value of the Project CheckList Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End  Date"; Rec."Project End  Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End  Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part(Control16; "Mobilization Checklist SubPage")
            {
                Caption = 'Mobilization Checklist';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            group("Contract Summary")
            {
                Caption = 'Contract Summary';
                Editable = false;
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address field.';
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address 2 field.';
                }
                field("Vendor Post Code"; Rec."Vendor Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Post Code field.';
                }
                field("Primary E-mail"; Rec."Primary E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary E-mail field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Invitation For Supply"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
            }
            group("Project Summary")
            {
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer No. field.';
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer Name field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resident Engineer No';
                    ToolTip = 'Specifies the value of the Resident Engineer No field.';
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resident Engineer Name';
                    ToolTip = 'Specifies the value of the Resident Engineer Name field.';
                }
                field("Implementing Agency ID"; Rec."Implementing Agency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Implementing Agency ID field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Award Tend Sum Inc Taxes (LCY)"; Rec."Award Tend Sum Inc Taxes (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Award Tend Sum Inc Taxes (LCY) field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
            }
            group("Site Details")
            {
                field("Project Site Description"; Rec."Project Site Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Site Description field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End  Chainage"; Rec."End  Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End  Chainage field.';
                }
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Point Longitude field.';
                }
                field("Start  Point Latitude"; Rec."Start  Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start  Point Latitude field.';
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Point Latitude field.';
                }
                field("End  Point Longitude"; Rec."End  Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End  Point Longitude field.';
                }
            }
            group(Control40)
            {
                field("Assigned To:"; Rec."Assigned To:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To: field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Site Takeover Instructions")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Insert;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Site Takeover Instructions action.';
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PostBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    if Rec.Posted then
                        Error('Already posted');
                    Rec.TestField(Status, Rec.Status::Released);
                    ObjJob.Reset;
                    ObjJob.SetRange("No.", Rec."Project ID");
                    if ObjJob.FindSet then begin
                        //    ObjJob.Status := ObjJob.Status:"Completed/Under DLP";
                        ObjJob.Modify;

                    end;
                    //Convert to WEP
                    RoadManagementSetup.Get;
                    ProjectMobilizationHeader.Init;
                    ProjectMobilizationHeader.TransferFields(Rec);
                    ProjectMobilizationHeader."Document Type" := ProjectMobilizationHeader."document type"::"Work Execution Programme";
                    ProjectMobilizationHeader."Document No." := NoSeriesManagement.GetNextNo(RoadManagementSetup."Work Execution Plan  Nos", Today, true);
                    ProjectMobilizationHeader."Commencement Order ID" := Rec."Document No.";
                    ProjectMobilizationHeader.Status := ProjectMobilizationHeader.Status::Open;
                    ProjectMobilizationHeader.Insert(true);

                    //Update Project with WEP
                    ObjJob.Reset;
                    ObjJob.SetRange("No.", Rec."Project ID");
                    if ObjJob.FindSet then begin
                        // ObjJob.Status := ObjJob.Status::"Completed/Under DLP";
                        ObjJob."Work Execution Plan ID" := ProjectMobilizationHeader."Document No.";
                        ObjJob.Modify;
                    end;


                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange("Job No.", Rec."Project ID");
                    if JobPlanningLine.FindSet then
                        repeat
                            WEPExecutionSchedule.Init;
                            WEPExecutionSchedule."Document Type" := ProjectMobilizationHeader."Document Type";
                            WEPExecutionSchedule."Document No" := ProjectMobilizationHeader."Document No.";
                            WEPExecutionSchedule."Job No" := JobPlanningLine."Job No.";
                            WEPExecutionSchedule."Line No" := WEPExecutionSchedule.Count + 1;
                            WEPExecutionSchedule."Job Task No" := JobPlanningLine."Job Task No.";
                            WEPExecutionSchedule.Description := JobPlanningLine.Description;
                            WEPExecutionSchedule."Job Task Type" := JobPlanningLine.Type;
                            WEPExecutionSchedule.Insert;
                        until JobPlanningLine.Next = 0;




                    //Create Planned Kick off meeting//Update meeting register
                    PCOPlannedMeeting.Reset;
                    PCOPlannedMeeting.SetRange("Notice No.", Rec."Document No.");
                    if PCOPlannedMeeting.FindSet then begin
                        repeat
                            ProjectMeetingRegister.Init;
                            ProjectMeetingRegister."Meeting ID" := NoSeriesManagement.GetNextNo(RoadManagementSetup."Meeting Register Nos", Today, true);
                            ProjectMeetingRegister."Meeting Type" := PCOPlannedMeeting."Meeting Type";
                            ProjectMeetingRegister."Project ID" := Rec."Project ID";
                            ProjectMeetingRegister.Description := PCOPlannedMeeting.Description;
                            ProjectMeetingRegister."Start Date" := PCOPlannedMeeting."Start Date";
                            ProjectMeetingRegister."End Date" := PCOPlannedMeeting."End Date";
                            ProjectMeetingRegister."Start Time" := PCOPlannedMeeting."Start Time";
                            ProjectMeetingRegister."End Time" := PCOPlannedMeeting."End Time";
                            ProjectMeetingRegister."Created By" := UserId;
                            ProjectMeetingRegister."Created DateTime" := CreateDatetime(Today, Time);
                            ProjectMeetingRegister."Venue/Location" := PCOPlannedMeeting."Venue/Location";
                            ProjectMeetingRegister.Insert(true);

                            //Populate the agenda
                            ProjectMeetingAgendaTemp.Reset;
                            ProjectMeetingAgendaTemp.SetRange("Project Meeting Type", PCOPlannedMeeting."Meeting Type");
                            if ProjectMeetingAgendaTemp.FindSet then
                                repeat
                                    ProjectMeetingAgenda.Init;
                                    ProjectMeetingAgenda."Meeting ID" := ProjectMeetingRegister."Meeting ID";
                                    ProjectMeetingAgenda."Agenda Code" := ProjectMeetingAgendaTemp."Agenda Code";
                                    ProjectMeetingAgenda."Agenda Description" := ProjectMeetingAgendaTemp."Agenda Description";
                                    ProjectMeetingAgenda.Owner := ProjectMeetingAgendaTemp.Owner;
                                    ProjectMeetingAgenda."Estimate Time (Minutes)" := ProjectMeetingAgendaTemp."Estimate Time (Minutes)";
                                    ProjectMeetingAgenda.Insert(true);
                                until ProjectMeetingAgendaTemp.Next = 0;

                            //Insert Agenda Items
                            MeetingAgendaItemTemplate.Reset;
                            MeetingAgendaItemTemplate.SetRange(MeetingAgendaItemTemplate."Project Meeting Type", PCOPlannedMeeting."Meeting Type");
                            if MeetingAgendaItemTemplate.FindSet then
                                repeat
                                    ProjectMeetingSummary.Init;
                                    ProjectMeetingSummary."Meeting ID" := ProjectMeetingRegister."Meeting ID";
                                    ProjectMeetingSummary."Agenda Code" := MeetingAgendaItemTemplate."Agenda Code";
                                    ProjectMeetingSummary."Agenda Item No." := MeetingAgendaItemTemplate."Item Code";
                                    ProjectMeetingSummary."Item Discussed" := MeetingAgendaItemTemplate.Description;
                                    ProjectMeetingSummary.Insert(true);
                                until MeetingAgendaItemTemplate.Next = 0;

                        until PCOPlannedMeeting.Next = 0;
                        PCOPlannedMeeting."Project Meeting ID" := ProjectMeetingRegister."Meeting ID";
                        PCOPlannedMeeting.Modify;
                    end;





                    //Notify the contractor guided by a setup and the contractor has a valid mail
                    RoadManagementSetup.Get;
                    ;
                    SMTPMailSetup.Get;
                    if RoadManagementSetup."PCO Notification Enabled" = true then begin
                        // SMTPMail.CheckValidEmailAddresses("Primary E-mail");
                        if Rec."Primary E-mail" <> '' then begin
                            // //SMTPMail.CreateMessage(COMPANYNAME, SMTPMailSetup."Email Address", "Primary E-mail", 'PROJECT COMMENCEMENT ORDER FOR' + ' ' + "Project ID", '', true);
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('Dear ' + ' ' + "Contractor Name");
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('You are hereby notified to commence with project No ' + ' ' + "Project ID" + '- ' + "Project Name" + ' starting on  ' + Format("Project Start Date") + ' to ' + Format("Project End  Date"));
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('In accordance with the contract sub-clause');
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('Kindly Login to the Contractors Hub and Acknowledge receipt and acceptance of this Order to Commence');
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('Thanks & Regards');
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //          //SMTPMail.AddBodyline(SenderName);
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('<HR>');
                            // //SMTPMail.AddBodyline('This is a system generated mail.Do not reply to it.');
                            // //          //SMTPMail.AddBodyline('<br><br>');
                            // //          //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                            // //          //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.Send;
                        end;
                    end;
                    //Contractor to acknowledge once the PCO has been published
                    //
                    Message('Posted successfully');
                    Rec.Posted := true;
                    Rec.Modify;
                    CurrPage.Close;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    ;
                    Report.Run(72026, true, true, Rec);
                end;
            }
            action("Contract Sub Clauses")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Contract Sub Clauses";
                RunPageLink = "Contract No" = field("Purchase Contract ID"),
                              "Document Type" = filter(PCO);
                ToolTip = 'Executes the Contract Sub Clauses action.';
            }
            action("Print Possession Of Site")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Print Possession Of Site action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    ;
                    Report.Run(Report::"Possession Of Site", true, true, Rec);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    RecVariant := Rec;
                    //RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant, Rec."Project ID", "Document Type", "Document No.", ApprovalEntry."document type"::PCO, 0, RecordId, FnGetTableNo());
                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify(true);
                    // EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry, "Document No.");
                    Message(TXT0001);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                var
                    RecRef: RecordRef;
                    CustomApprovalEntry: Record "Custom Approval Entry";
                    OldStatus: Option;
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    Rec.TestField("Created By", UserId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            OldStatus := ApprovalEntry.Status;
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    //Notify The User
                    // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);

                    Message(TXT0002);
                end;
            }
            action("Project Approvals")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Project Approvals action.';

                trigger OnAction()
                begin
                    //    ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Suite;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                    CustomApprovalEntry: Record "Custom Approval Entry";
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //  //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
                    // ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status, CustomApprovalEntry.Status::Approved);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.", FnGetLargestSequenceNoFromApprovalEntry(Rec."Document No."));
                    Message(Format(FnGetLargestSequenceNoFromApprovalEntry(Rec."Document No.")));
                    if CustomApprovalEntry.FindFirst then begin
                        //ReleaseApprovalDocument.ReleaseSAVReq(Rec);
                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = Suite;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Reject the approval request.';

                trigger OnAction()
                var
                    ApprovalEntry: Record "Custom Approval Entry";
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    currentRecEntryNo: Integer;
                    CustomApprovalEntryChange: Record "Custom Approval Entry History";
                begin
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status, CustomApprovalEntry.Status::Open);
                    if CustomApprovalEntry.FindSet then begin
                        currentRecEntryNo := CustomApprovalEntry."Sequence No.";
                    end;//Added

                    //  ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Rejected;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);

                    //Added part 2
                    if currentRecEntryNo > 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.", currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                            repeat
                                UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Created;
                                CustomApprovalEntry.Modify();
                            until CustomApprovalEntry.Next = 0;
                        end;

                    end;

                    if currentRecEntryNo > 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No.", '<%1', currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                            repeat

                                if (CustomApprovalEntry."Sequence No." = (currentRecEntryNo - 1)) then begin
                                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Open;
                                end
                                else
                                    if (CustomApprovalEntry."Sequence No." > currentRecEntryNo) then begin
                                        CustomApprovalEntry.Status := CustomApprovalEntry.Status::Created;
                                    end else begin
                                        CustomApprovalEntry.Status := CustomApprovalEntry.Status::Approved;
                                    end;
                                UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                                CustomApprovalEntry.Modify();

                            until CustomApprovalEntry.Next = 0;
                        end;
                    end;
                    if currentRecEntryNo = 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Document No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Rejected;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                    end;
                    //Added part 2

                    //EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


                    Rec.Find
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Suite;
                Caption = 'Delegate';
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Delegate the approval to a substitute approver.';

                trigger OnAction()
                var
                    ApprovalEntry: Record "Custom Approval Entry";
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    Selected: Integer;
                    USetup: Record "User Setup";
                    Options: Text;
                    "Count": Integer;
                    SelectedUser: Code[50];
                    Region: Text;
                begin
                    //Added
                    Options := 'Default Substitute,';
                    //Get Region
                    USetup.Reset;
                    USetup.SetRange("User ID", UserId);
                    if USetup.Find('-') then begin
                        Region := SelectedUser;
                    end;

                    USetup.Reset;
                    USetup.SetRange("Region Code", Region);
                    if USetup.Find('-') then begin
                        repeat

                            Options := Options + USetup."User ID" + ',';

                        until USetup.Next = 0;
                    end;


                    Selected := Dialog.StrMenu(Options, 1, 'Select User');

                    USetup.Reset;
                    USetup.SetRange("Region Code", Region);
                    if USetup.Find('-') then begin
                        repeat
                            Count := Count + 1;
                            if Selected = Count + 1 then begin
                                SelectedUser := USetup."User ID";
                            end;
                        until USetup.Next = 0;
                    end;

                    USetup.Reset;
                    USetup.SetRange("User ID", UserId);
                    if USetup.Find('-') then begin
                        USetup."Substitute Selected" := true;
                        USetup."Selected Substitute" := SelectedUser;
                        USetup.Modify();
                    end;
                    //Added

                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //   ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
                    //  EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        acknowledgementtabvisible := false;
        if Rec.Posted = true then begin
            acknowledgementtabvisible := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Mobilization Checklist";
    end;

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        RMS: Codeunit "RMS Management";
        ShowWorkflowStatus: Boolean;
        PRN: Record "Purchase Header";
        ProcCommType: Record "Procurement Committee Types";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
        ProjectStaffAppointment: Record "Project Staff Appointment";
        ProjectStaffAppointList: Page "Project Staff Appoint. List";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectStaffTerminationLine: Record "Project Staff Termination Line";
        ProcurementProcessing: Codeunit "Procurement Processing";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        PCOInternalProjectTeam: Record "PCO Internal Project Team";
        PCORequiredDocument: Record "PCO Required Document";
        ProjectDocumentTemplate: Record "Project Document Template";
        ProjectDocumentTemplateLine: Record "Project Document Template Line";
        ObjJob: Record Job;
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        JobPlanningLine: Record "Job Planning Line";
        NoSeriesManagement: Codeunit "No. Series";
        RoadManagementSetup: Record "Road Management Setup";
        ProjectMeetingRegister: Record "Project Meeting Register";
        PCOPlannedMeeting: Record "PCO Planned Meeting";
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        EmailBody: Text[250];
        acknowledgementtabvisible: Boolean;
        ProjectMeetingAgendaTemp: Record "Project Meeting Agenda Temp";
        MeetingAgendaItemTemplate: Record "Meeting Agenda Item Template";
        ProjectMeetingAgenda: Record "Project Meeting Agenda";
        ProjectMeetingSummary: Record "Project Meeting Summary";
        CompanyInformation: Record "Company Information";
        HumanResourcesSetup: Record "Human Resources Setup";
        Window: Dialog;
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
        SenderAddress: Text[100];
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        CustEmail: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        Vendors: Record Vendor;
        ProjectApprovalSetup: Record "Project Approval Setup";
        ApprovalEntry: Record "Approval Entry";
        InternalProjectResource: Record "Internal Project Resource";
        Employee: Record Employee;
        RMSManagement: Codeunit "RMS Management";
        RecVariant: Variant;
        RecID: RecordID;
        ReleaseApprovalDocument: Codeunit "Release Approval Document";
        UserSetup: Record "User Setup";
        //EmailNotifications: Codeunit "Email Notifications";
        CustomApprovalEntry: Record "Custom Approval Entry";
        TXT0001: label 'An approval request has been sent and approvers notified successfully.';
        TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';

    local procedure FnSuggestProjectTeam()
    begin
        ProjectStaffAppointmentLine.Reset;
        ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", Rec."Staff Appointment Voucher No.");
        if ProjectStaffAppointmentLine.FindSet then
            repeat
                PCOInternalProjectTeam.Init;
                PCOInternalProjectTeam."Commencement Order No." := Rec."Document No.";
                PCOInternalProjectTeam."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                PCOInternalProjectTeam.Name := ProjectStaffAppointmentLine.Name;
                PCOInternalProjectTeam.Email := ProjectStaffAppointmentLine.Email;
                PCOInternalProjectTeam.Designation := ProjectStaffAppointmentLine.Designation;
                PCOInternalProjectTeam."Role Code" := ProjectStaffAppointmentLine."Role Code";
                PCOInternalProjectTeam.Insert(true);
            until ProjectStaffAppointmentLine.Next = 0;
    end;

    local procedure FnGetTableNo(): Integer
    var
        RecID: RecordID;
        RecRef: RecordRef;
    begin
        RecRef.Open(Database::"Project Mobilization Header");
        if RecRef.Find('-') then begin
            RecID := RecRef.RecordId;
        end;
        exit(RecID.TableNo);
    end;

    procedure FnGetLargestSequenceNoFromApprovalEntry(DocumentNo: Code[50]): Integer
    var
        CustomApprovalEntry: Record "Custom Approval Entry";
    begin
        CustomApprovalEntry.Reset;
        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", DocumentNo);
        if CustomApprovalEntry.FindLast then
            exit(CustomApprovalEntry."Sequence No.");
    end;

    local procedure FnNotifyRejectionEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Document No.");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    //EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'REJECTION APROVALS:', 'This approval has been rejected.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure FnNotifyDelegationEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Document No.");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    //EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'DELEGATION APROVALS:', 'This approval has been delegated.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure UpdateCustomApprovalEntryHistory(CustomApprovalEntry: Record "Custom Approval Entry")
    var
        CustomApprovalEntryHistory: Record "Custom Approval Entry History";
    begin
        CustomApprovalEntryHistory.Init;
        CustomApprovalEntryHistory."Entry No." := 0;
        CustomApprovalEntryHistory."Old Entry No" := CustomApprovalEntry."Entry No.";
        CustomApprovalEntryHistory."Table ID" := CustomApprovalEntry."Table ID";
        CustomApprovalEntryHistory."Document Type" := CustomApprovalEntry."Document Type";
        CustomApprovalEntryHistory."Document No." := CustomApprovalEntry."Document No.";
        CustomApprovalEntryHistory."Sender ID" := CustomApprovalEntry."Sender ID";
        CustomApprovalEntryHistory."Date-Time Sent for Approval" := CustomApprovalEntry."Date-Time Sent for Approval";
        CustomApprovalEntryHistory."Last Modified By User ID" := CustomApprovalEntry."Last Modified By User ID";
        CustomApprovalEntryHistory."Last Date-Time Modified" := CustomApprovalEntry."Last Date-Time Modified";
        CustomApprovalEntryHistory."Due Date" := CustomApprovalEntry."Due Date";
        CustomApprovalEntryHistory.Amount := CustomApprovalEntry.Amount;
        CustomApprovalEntryHistory."Record ID to Approve" := CustomApprovalEntry."Record ID to Approve";
        CustomApprovalEntryHistory."Approval Type" := CustomApprovalEntry."Approval Type";
        CustomApprovalEntryHistory."Sequence No." := CustomApprovalEntry."Sequence No.";
        CustomApprovalEntryHistory.Status := CustomApprovalEntry.Status;
        CustomApprovalEntryHistory."Approver ID" := CustomApprovalEntry."Approver ID";
        CustomApprovalEntryHistory.Insert(true);
    end;

    local procedure FnSuggestProjectTeams()
    begin
        ProjectStaffAppointmentLine.Reset;
        ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", Rec."Staff Appointment Voucher No.");
        if ProjectStaffAppointmentLine.FindSet then
            repeat
                PCOInternalProjectTeam.Init;
                PCOInternalProjectTeam."Commencement Order No." := Rec."Document No.";
                PCOInternalProjectTeam."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                PCOInternalProjectTeam.Name := ProjectStaffAppointmentLine.Name;
                PCOInternalProjectTeam.Email := ProjectStaffAppointmentLine.Email;
                PCOInternalProjectTeam.Designation := ProjectStaffAppointmentLine.Designation;
                PCOInternalProjectTeam."Role Code" := ProjectStaffAppointmentLine."Role Code";
                PCOInternalProjectTeam.Insert(true);
            until ProjectStaffAppointmentLine.Next = 0;
    end;
}

