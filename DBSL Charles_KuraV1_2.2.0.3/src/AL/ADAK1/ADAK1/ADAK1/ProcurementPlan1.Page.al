#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70005 "Procurement Plan1"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "G/L Budget Name";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Filter field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1000000008; "Procurement Plan Items")
            {
                SubPageLink = "Plan Year" = field(Name),
                              "Department Code" = field("Department Filter");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';
                    Visible = true;
                    ToolTip = 'Executes the Request for Approval action.';

                    trigger OnAction()
                    begin
                        SendForApproval();
                    end;
                }
                action("<Action1000000041>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Send Approval Request action.';

                    trigger OnAction()
                    var
                    //   ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // IF ApprovalMgt.SendPrcmntPlanApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1000000042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                    trigger OnAction()
                    var
                    //   ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelPrcmntPlaApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Copy Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Procurement Plan';
                    ToolTip = 'Executes the Copy Procurement Plan action.';
                    //   RunObject = Report "Vendor Statement New";
                }
                action("Import Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = XMLport "Import Procurement Plan";
                    ToolTip = 'Executes the Import Procurement Plan action.';
                }
            }
        }
    }

    var
        Approval: Record "G/L Budget Name";
    // ApprovalMgt: Codeunit "Approvals Mgmt.";


    procedure SendForApproval()
    begin

        if Rec.Status = Rec.Status::New then begin
            Approval.Reset;
            //Approval.SETRANGE(Approval."No.",Rec."No.");
            Rec.Status := Rec.Status::Approved;
            // Rec."Document Type":=Rec."Document Type"::"Approval Form";
            // "Prepared By":=DATABASE.USERID;
            //"Procurement Plan"."Department Code":="G/L Budget Name"."Department Filter" ;
            Rec.Modify;
            Message('Document Successfully sent for Approval');

        end;
    end;
}

