#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72277 "Final Certificate Header"
{
    PageType = Card;
    SourceTable = "Inspection & Payment Header";
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Inspection Sheet No"; Rec."Inspection Sheet No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Sheet No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Sum field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part(Control20; "Inspection & Payment Line")
            {
                Caption = 'Progress Per Road Activity';
                SubPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Insert line from project planning lines';

                trigger OnAction()
                begin
                    //FnPopulateLines();

                    // JobPlanningLine.RESET;
                    // JobPlanningLine.SETRANGE(JobPlanningLine."Job No.","Project ID");
                    // IF JobPlanningLine.FINDSET THEN
                    // REPEAT
                    //    InspectionPaymentLine.INIT;
                    //    InspectionPaymentLine."Document No":="Document No";
                    //    InspectionPaymentLine."Document Type":="Document Type";
                    //    InspectionPaymentLine.RESET;
                    //    InspectionPaymentLine.SETRANGE(InspectionPaymentLine."Document No","Document No");
                    //    InspectionPaymentLine.SETRANGE(InspectionPaymentLine."Document Type","Document Type");
                    //    IF InspectionPaymentLine.FINDLAST THEN
                    //    InspectionPaymentLine."Line No":=InspectionPaymentLine."Line No"+100;
                    //    InspectionPaymentLine."Bill No":=JobPlanningLine."Road Activity Sub-Category";
                    //    InspectionPaymentLine."Item Code":=JobPlanningLine."No.";
                    //    InspectionPaymentLine."Bid Rate(LCY)":=JobPlanningLine."Unit Cost";
                    //    InspectionPaymentLine."BoQ Quantity":=JobPlanningLine.Quantity;
                    //    InspectionPaymentLine."Bill Item Amount":=InspectionPaymentLine."Bid Rate(LCY)"*InspectionPaymentLine."BoQ Quantity";
                    //    InspectionPaymentLine."Previous Qty":=JobPlanningLine."Qty. to Transfer to Invoice";
                    //    InspectionPaymentLine.VALIDATE("Previous Qty");
                    //    InspectionPaymentLine."This Qty":=0;
                    //    InspectionPaymentLine.VALIDATE("This Qty");
                    //    InspectionPaymentLine.Description:=JobPlanningLine.Description;
                    //    InspectionPaymentLine."Unit Of Measure":=JobPlanningLine."Unit of Measure";
                    //    InspectionPaymentLine.INSERT(TRUE);
                    //   UNTIL JobPlanningLine.NEXT=0;

                    InspectionPaymentLine.Reset;
                    InspectionPaymentLine.SetRange(InspectionPaymentLine."Document No", Rec."Inspection Sheet No");
                    InspectionPaymentLine.SetRange(InspectionPaymentLine."Document Type", InspectionPaymentLine."document type"::"Works Inspection");
                    if InspectionPaymentLine.FindSet then
                        repeat
                            NewInspectionPaymentLine.Init;
                            NewInspectionPaymentLine.TransferFields(InspectionPaymentLine);
                            NewInspectionPaymentLine."Document No" := Rec."Document No";
                            NewInspectionPaymentLine."Document Type" := Rec."Document Type";
                            NewInspectionPaymentLine.Insert(true);
                        until InspectionPaymentLine.Next = 0;
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
                    Message('Success');
                end;
            }
            action("Send Approval Request ")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Approval Request  action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request ")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Approval Request  action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
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
                    Message('Success');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
        }
    }

    var
        JobPlanningLine: Record "Job Planning Line";
        InspectionPaymentLine: Record "Inspection & Payment Line";
        NewInspectionPaymentLine: Record "Inspection & Payment Line";
}

