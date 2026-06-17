#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50195 "Incoming Correspondences Card"
{
    PageType = Card;
    SourceTable = "Incoming Correspondence Header";
    Caption = 'Memo';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';

                    trigger OnAssistEdit()
                    begin
                        // IF AssistEdit(xRec) THEN
                        //  CurrPage.UPDATE();
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("External Reference No"; Rec."External Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Reference No field.';
                }
                field("Urgency Status"; Rec."Urgency Status")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = Rec."Urgency Status" = Rec."Urgency Status"::Urgent;
                    ToolTip = 'Specifies the value of the Urgency Status field.';
                }
                field("Internal Reference No"; Rec."Internal Reference No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registry Reference No';
                    ToolTip = 'Specifies the value of the Registry Reference No field.';
                }
                field("Project Correspondence?"; Rec."Project Correspondence?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Correspondence? field.';
                }
                group("Project Details")
                {
                    Caption = 'Project Details';
                    Visible = Rec."Project Correspondence?" = true;
                    field("Project No"; Rec."Project No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Project No field.';
                    }
                    field("Project Name"; Rec."Project Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Project Name field.';
                    }
                }
                field("Correspondence Source"; Rec."Correspondence Source")
                {
                    ApplicationArea = Basic;
                    Caption = 'Correspondence Type';
                    ToolTip = 'Specifies the value of the Correspondence Type field.';
                }
                field("Correspondence Source Name"; Rec."Correspondence Source Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Correspondence Type Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Correspondence Type Description field.';
                }
                field("Communication Summary"; Rec."Communication Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Communication Subject';
                    ToolTip = 'Specifies the value of the Communication Subject field.';
                }
                field("Sender No"; Rec."Sender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender No field.';
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Name field.';
                }
                field("Sender Email"; Rec."Sender Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Email field.';
                }
                field("Sender Address"; Rec."Sender Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Address field.';
                }
                field("Sender Address 2"; Rec."Sender Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Address 2 field.';
                }
                field("Sender Phone No"; Rec."Sender Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Phone No field.';
                }
                field("Sender Contact Person Title"; Rec."Sender Contact Person Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Contact Person Title field.';
                }
                field("Sender Contact Person Name"; Rec."Sender Contact Person Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Contact Person Name field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control22; "Incoming Correspondence Lines")
            {
                SubPageLink = "Document No" = field("Document No");
            }
            group("Assignment Details")
            {
                Caption = 'Assignment Details';
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign To field.';
                }
                field("Assignment Remarks"; Rec."Assignment Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Assignment Remarks field.';
                }
            }
            group("Notification Details")
            {
                Caption = 'Notification Details';
                Editable = false;
                field("Notifications Sent"; Rec."Notifications Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notifications Sent field.';
                }
                field("Notification DateTime"; Rec."Notification DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification DateTime field.';
                }
                field("Response Created"; Rec."Response Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Created field.';
                }
                field("Response DateTime"; Rec."Response DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response DateTime field.';
                }
                field("Response No"; Rec."Response No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response No field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
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
                    //TESTFIELD("Shortcut Dimension 1 Code");
                    //MESSAGE("Shortcut Dimension 1 Code");
                    //DMSManagement.UploadPaymentsDocuments("No.",'Payment Vouchers',RECORDID,"Shortcut Dimension 1 Code");
                    DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Payment Voucher", Rec."Document No", 'Incoming Correspondence', Rec.RecordId, 'R48');
                end;
            }
            action("Notify Recipients")
            {
                ApplicationArea = Basic;
                Caption = 'Dispatch Correspondence';
                Enabled = Rec."Notifications Sent" = false;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Dispatch Correspondence action.';

                trigger OnAction()
                begin
                    Rec.TestField("Notifications Sent", false);
                    IncomingCorrespondenceLine.Reset;
                    IncomingCorrespondenceLine.SetRange(IncomingCorrespondenceLine."Document No", Rec."Document No");
                    if IncomingCorrespondenceLine.FindSet then begin
                        repeat
                            IncomingCorrespondenceLine.TestField("Recipient No");
                            IncomingCorrespondenceLine.TestField("Recipient Email");
                        until IncomingCorrespondenceLine.Next = 0;

                        RMSManagement.FnNotifyRecipientsOnIncomingCorrespondences(Rec);
                        Message('Recipients Notified Successfully');

                        Rec."Notifications Sent" := true;
                        Rec."Notification DateTime" := CurrentDatetime;
                        Rec.Modify();
                    end
                    else
                        Message('Please Select at least one recipient');
                end;
            }
            action("Create Response")
            {
                ApplicationArea = Basic;
                Enabled = Rec."Response Created" = false;
                Image = CreditCard;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Rec."Notifications Sent" = true;
                ToolTip = 'Executes the Create Response action.';

                trigger OnAction()
                begin
                    GeneralCorrespondenceHeader."Document Type" := GeneralCorrespondenceHeader."document type"::Letter;
                    GeneralCorrespondenceHeader.Type := GeneralCorrespondenceHeader.Type::External;
                    GeneralCorrespondenceHeader."Document No" := '';
                    GeneralCorrespondenceHeader."Created By" := UserId;
                    Rec.Validate("Created By");
                    GeneralCorrespondenceHeader."Document Date" := Today;
                    Rec."Created DateTime" := CurrentDatetime;
                    GeneralCorrespondenceHeader.Status := GeneralCorrespondenceHeader.Status::Open;

                    GeneralCorrespondenceHeader.Insert(true);

                    GeneralCorrespondenceLine.Init;
                    GeneralCorrespondenceLine."Document No" := GeneralCorrespondenceHeader."Document No";
                    GeneralCorrespondenceLine."Document Type" := GeneralCorrespondenceHeader."Document Type";
                    GeneralCorrespondenceLine.Type := GeneralCorrespondenceHeader.Type;
                    GeneralCorrespondenceLine."Recipient Type" := Rec."Sender Type";
                    GeneralCorrespondenceLine."Recipient No" := Rec."Sender No";
                    GeneralCorrespondenceLine.Validate("Recipient No");
                    GeneralCorrespondenceLine."Notification Type" := GeneralCorrespondenceLine."notification type"::Receipient;
                    GeneralCorrespondenceLine.Insert(true);

                    // GeneralCorrespondenceHeader.Salutation:="Document No";
                    // GeneralCorrespondenceHeader."Submitted On":=TRUE;
                    // GeneralCorrespondenceHeader.MODIFY;

                    Rec."Response Created" := true;
                    Rec."Response DateTime" := CurrentDatetime;
                    Rec."Response No" := GeneralCorrespondenceHeader."Document No";
                    Rec.Modify();
                    Message('Correspondence Response Created Successfully');
                    Page.Run(72084, GeneralCorrespondenceHeader);
                end;
            }
            action("View Response")
            {
                ApplicationArea = Basic;
                Enabled = Rec."Response Created" = true;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "General Correspondence Card-2";
                RunPageLink = "Document No" = field("Response No");
                ToolTip = 'Executes the View Response action.';
            }
            action("Assign Correspondence")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Work';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Assign Work action.';

                trigger OnAction()
                begin
                    Message('%1 Notified Successfully', Rec."Assign To");
                end;
            }
            action("Assignment Completion")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Assignment';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Submit Assignment action.';

                trigger OnAction()
                begin
                    Message('%1 Notified Successfully', Rec."Assigned By");
                end;
            }
        }
    }

    var
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        IncomingCorrespondenceLine: Record "Incoming Correspondence Line";
        RMSManagement: Codeunit "RMS Management";
        GeneralCorrespondenceHeader: Record "General Correspondence Header";
        GeneralCorrespondenceLine: Record "General Correspondence Line";
}

