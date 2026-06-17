#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69837 "Functional Hand Over Voucher"
{
    PageType = Card;
    SourceTable = "Employee Exit header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Exit Method"; Rec."Exit Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Method field.';
                }
                field("Position Id"; Rec."Position Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position Id field.';
                }
                field("Reasons Code"; Rec."Reasons Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons Code field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate Name field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department Name field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
            }
            group("Important Dates")
            {
                Editable = false;
                field("Date of Join"; Rec."Date of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Join field.';
                }
                field("Last working Date"; Rec."Last working Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last working Date field.';
                }
                field("Notice Date"; Rec."Notice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Date field.';
                }
                field("Employee Exit Date"; Rec."Employee Exit Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Exit Date field.';
                }
            }
            group(Statistics)
            {
                Editable = false;
                field("No of Hand Over Notes"; Rec."No of Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Hand Over Notes field.';
                }
                field("No of Open Hand Over Notes"; Rec."No of Open Hand Over Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Open Hand Over Notes field.';
                }
                field("No of Open Hand Cleared Notes"; Rec."No of Open Hand Cleared Notes")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Open Hand Cleared Notes field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
            }
            action("Confirm Hand Over")
            {
                ApplicationArea = Basic;
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Confirm Hand Over action.';

                trigger OnAction()
                begin
                    HandoverItemLines.Reset;
                    HandoverItemLines.SetRange("Exit Header No", Rec."Document No.");
                    HandoverItemLines.SetRange("Primary Department", Rec."Primary Department");
                    if HandoverItemLines.FindSet then begin
                        repeat
                            if HandoverItemLines.Receiveved = false then
                                Error('each Item must be recieved');
                        until HandoverItemLines.Next = 0;
                    end;
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Approvals action.';
            }
            action("&Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Send Approval Request action.';
            }
            action("&Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the &Cancel Approval Request action.';

                trigger OnAction()
                begin
                    //ApprovalMgt.SendFATRANSFERRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Print action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Document Type" := Rec."document type"::"Hand Over Voucher";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Hand Over Voucher";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Hand Over Voucher";
    end;

    var
        Recruitment: Codeunit Recruitment;
        HandoverItemLines: Record "Hand over Item Lines";
}

