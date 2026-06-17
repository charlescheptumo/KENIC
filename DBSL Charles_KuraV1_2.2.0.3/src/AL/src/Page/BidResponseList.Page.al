#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75257 "Bid Response List"
{
    ApplicationArea = Basic;
    CardPageID = "Bid Response Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote));//,
                                                             // "Document Status" = filter(Draft), 
                                                             //  "Bid Seal Type" = filter(Unsealed));
    UsageCategory = Lists;
    PopulateAllFields = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the vendor who delivers the products.';
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor sending the invoice.';
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Description field.';
                }
                field("Invitation For Supply No"; Rec."Invitation For Supply No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation For Supply No field.';
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
                }
                field("Bid Envelope Type"; Rec."Bid Envelope Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelope Type field.';
                }
                field("PP Procurement Method"; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Procurement Method field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Bid Seal Type"; Rec."Bid Seal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Seal Type field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the related sales invoice must be paid.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        // UserSetup.Get(UserId);
        //SETRANGE("Assigned User ID",USERID);
        //IF UserSetup."Procurement officer"=TRUE THEN
        // BEGIN
        //SETFILTER("Requester ID",USERID);
        // FILTERGROUP(2);
        //SETFILTER("Assigned User ID",USERID);
        //FILTERGROUP(0);
        //END;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN
        //     Rec.SetFilter("Location Code", '=%1', UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

