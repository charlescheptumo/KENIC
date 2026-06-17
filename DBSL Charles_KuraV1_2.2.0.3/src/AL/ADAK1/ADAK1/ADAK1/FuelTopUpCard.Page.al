#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59078 "Fuel Top Up Card"
{
    PageType = Card;
    SourceTable = "Fuel Topup Request";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Card No."; Rec."Card No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Card No. field.';
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration No. field.';
                }
                field("Last Top Up"; Rec."Last Top Up")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Top Up field.';
                }


                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Requested by"; Rec."Requested by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested by field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(59027),
                              "No." = field(No);
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    VarVariant := Rec;
                    //cc//18072023
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Cancel Approval Request action.';

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
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
            action(Post)
            {
                ApplicationArea = All;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Post the Document';

                trigger OnAction()
                var

                begin
                    if not Confirm('Are you sure you want to Post the Document', true) then
                        Error('Document not Posted');
                    Rec.TestField(Posted, False);
                    FnInsertFuelEntries(Rec);
                    Rec.Posted := true;
                end;
            }
        }
    }

    local procedure FnInsertFuelEntries(FuelTopupRequest: Record "Fuel Topup Request")
    var
        FuelEntry: Record "Fuel TopUp Entries";
    begin
        FuelEntry.init();
        FuelEntry."Document No." := FuelTopupRequest.No;
        FuelEntry."Card No" := FuelTopupRequest."Card No.";
        FuelEntry."Vehicle Registration No." := FuelTopupRequest."Vehicle Registration No.";
        FuelEntry."Vendor No" := FuelTopupRequest."Vendor No";
        FuelEntry."Posting Date" := Today();
        FuelEntry.Amount := FuelTopupRequest.Amount;
        if FuelEntry.Insert() then
            Message('Fuel Topup successfully posted.')
        else
            Message('Fuel Topup not posted.');
    end;

    var
        // ApprovalMgt: Codeunit "Approvals Mgmt.";
        DocAtt: Record "Document Attachment";
        Attachments: Integer;
}

#pragma implicitwith restore

