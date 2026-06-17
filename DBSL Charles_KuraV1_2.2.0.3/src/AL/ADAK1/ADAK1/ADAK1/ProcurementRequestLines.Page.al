#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70031 "Procurement Request Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Procurement Request Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan field.';
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Item field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Line field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Category field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ordered field.';
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Purchase Order';
                Image = CreateBinContent;
                ToolTip = 'Executes the Generate Purchase Order action.';

                trigger OnAction()
                begin
                    ProcReq.Reset;
                    ProcReq.SetRange(No, Rec."Requisition No");
                    if ProcReq.Find('-') then begin

                        ProcReq.TestField("Requisition No");

                        if ProcReq."Generate Multiple LPO" then begin

                            if Confirm('Are you sure you want to generate Purchase Order for the selected Vendor No ' + Rec."Vendor No" + '?', true) then begin



                                PurchReq.Reset;
                                PurchReq.SetRange("No.", ProcReq."Requisition No");
                                if PurchReq.FindSet then begin

                                    NoOfVendors := 0;
                                    ProcReqLines.Reset;
                                    ProcReqLines.SetRange("Document No.", ProcReq."Requisition No");
                                    //ProcReqLines.SETRANGE(Select,TRUE);
                                    if ProcReqLines.Find('-') then begin
                                        repeat
                                            NoOfVendors := NoOfVendors + 1
                                        until ProcReqLines.Next = 0;
                                    end;

                                    ProcReqLines.Reset;
                                    ProcReqLines.SetRange("Document No.", ProcReq."Requisition No");
                                    //ProcReqLines.SETRANGE(Select,TRUE);
                                    if ProcReqLines.Find('-') then begin
                                        repeat
                                            Rec.TestField("Vendor No");
                                            Rec.TestField("Supplier Category");

                                        // PurchReq.CreatePurchaseOrderProcMethodLines(ProcReqLines,"Requisition No");

                                        until ProcReqLines.Next = 0;
                                    end;
                                end;
                                //END  ELSE ERROR( 'User %1 has not been assigned permission to generate Purchase Order for this requisition',USERID);
                            end else
                                exit;



                        end else
                            Error('This function is only used when Generate LPO is Checked!');
                    end;
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                // trigger OnAction()
                // var
                //     DocumentAttachmentDetails: Page "Document Attachment Details";
                //     RecRef: RecordRef;
                // begin
                //     RecRef.GetTable(Rec);
                //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //     DocumentAttachmentDetails.RunModal;
                // end;
            }
        }
    }

    var
        ProcReq: Record "Procurement Request";
        PurchReq: Record "Purchase Header";
        ProcReqLines: Record "Purchase Line";
        //filecu: Codeunit "File Management";
        filename: Text;
        PURCHSETUP: Record "Purchases & Payables Setup";
        Lineno: Integer;
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text004: label 'Do you want to proceed and perform the selected action on the purchase requisition lines?';
        NoOfVendors: Decimal;
}

