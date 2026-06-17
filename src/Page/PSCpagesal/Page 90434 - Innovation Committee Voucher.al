page 90434 "Innovation Committee Voucher"
{
    PageType = Card;
    SourceTable = 80257;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Min Required No. of Members"; Rec."Min Required No. of Members")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Min Required No. of Members field.';
                }
                field("Actual No. of Committee Memb"; Rec."Actual No. of Committee Memb")
                {
                    ToolTip = 'Specifies the value of the Actual No. of Committee Members field.';
                }
                field(Duration; Rec.Duration)
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
            }
            // part(Control112;90435)
            // {
            //     SubPageLink = "Document No."=FIELD("Document No.");
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Notify Commitee Members")
            {
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Notify Commitee Members action.';
            }
            // separator()
            // {
            // }
            action(Approvals)
            {
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                end;
            }
            action("Cancel Approval Request")
            {
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    //TESTFIELD(Status,Status::"Pending Approval");//status must be open.
                    /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    ApprovalsMgmt.""(Rec);*/
                    /*Status:=Status::Open;
                    MODIFY;
                      MESSAGE('Document has been Re-Opened');*/

                end;
            }
            // separator()
            // {
            // }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE("Document No.", Rec."Document No.");
                    REPORT.RUN(80032, TRUE, TRUE, Rec)
                end;
            }
        }
    }
}

