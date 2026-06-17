#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57220 "Agency Notice"
{
    PageType = Card;
    SourceTable = "Agency Notice Header";
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
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Notice Date"; Rec."Notice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Date field.';
                }
                field("Contractor PIN"; Rec."Contractor PIN")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor PIN field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
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
                field(Lifted; Rec.Lifted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lifted field.';
                }
                field("Date Lifted"; Rec."Date Lifted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Lifted field.';
                }
                field("Payment Registration Number"; Rec."Payment Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Registration Number field.';
                }
                field("PRN Expiry Date"; Rec."PRN Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PRN Expiry Date field.';
                }
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
                field("Bill Discounting No."; Rec."Bill Discounting No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Discounting No. field.';
                }
                field("Discounted Amount"; Rec."Discounted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discounted Amount field.';
                }
                field("Discountable Amount"; Rec."Discountable Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discountable Amount field.';
                }
                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligation WHT field.';
                }
                field("Obligation VAT"; Rec."Obligation VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligation VAT field.';
                }
                field("Obligation Income Tax"; Rec."Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Obligation PAYE';
                    ToolTip = 'Specifies the value of the Obligation PAYE field.';
                }
                field("Obligation Total Amount"; Rec."Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Obligation Total Amount field.';
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin

                    Rec.TestField("Accountants Notified");
                    Rec.Posted := true;
                    Rec.Modify;
                    Message('Agency notice %1 posted successfully', Rec."Document No");
                end;
            }
            action(Lift)
            {
                ApplicationArea = Basic;
                Image = Lock;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Lift action.';

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    if UserSetup.Get(UserId) then begin
                        if not UserSetup."Principal Accountant" = true then begin
                            Error('You do not have permission to lift the agency notice.Please contact your system administrator');
                        end;
                    end;

                    Rec.Lifted := true;
                    Rec."Date Lifted" := Today;
                    Rec.Modify;
                    Message('The agency notice %1 has been lifted successfully', Rec."Document No");
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
                Visible = true;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    Rec.TestField("Global Dimension 1 Code");
                    DMSManagement.UploadPaymentsDocuments(Rec."Document No", Format(Rec."Document Type"), Rec.RecordId, Rec."Global Dimension 1 Code");
                end;
            }
            action(Unlift)
            {
                ApplicationArea = Basic;
                Image = Lock;
                Promoted = false;
                ToolTip = 'Executes the Unlift action.';
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    if UserSetup.Get(UserId) then begin
                        if not UserSetup."Amend Bank Account Details" = true then begin
                            Error('You do not have permission to unlift the agency notice.\\Please contact your system administrator');
                        end;
                    end;

                    Rec.Lifted := false;
                    Rec."Date Lifted" := Today;
                    Rec.Modify;
                    Message('The agency notice %1 has been Unlifted successfully', Rec."Document No");
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Agency notice %1 has been approved successfully', Rec."Document No");
                end;
            }
            action("Notify Accountant")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Notify Accountant action.';

                trigger OnAction()
                begin
                    // IF Status=Status::Open THEN
                    //  ERROR('The document must be approved');


                    //Notify the contractor
                    Rec.TestField(Status, Rec.Status::Released);
                    ProcurementProcessing.FnNotifyAgencyNotice(Rec);
                    Rec."Accountants Notified" := true;
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        UserSetup: Record "User Setup";
        ProcurementProcessing: Codeunit "Procurement Processing";
}

