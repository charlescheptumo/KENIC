page 90437 "Innovation Evaluation Card"
{
    PageType = Card;
    SourceTable = "Innovation Evaluation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    Editable = False;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Invitation ID"; Rec."Invitation ID")
                {
                    ToolTip = 'Specifies the value of the Invitation ID field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Innovation Category"; Rec."Innovation Category")
                {
                    ToolTip = 'Specifies the value of the Innovation Category field.';
                }
                field("Innovation Lead"; Rec."Innovation Lead")
                {
                    ToolTip = 'Specifies the value of the Innovation Lead field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Evaluation Status"; Rec."Evaluation Status")
                {
                    ToolTip = 'Specifies the value of the Evaluation Status field.';
                }
            }
            // part(;90438)
            // {
            //     SubPageLink = Document No.=FIELD(Document No);
            // }
        }
    }

    actions
    {
        area(creation)
        {
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
                    Rec.TESTFIELD(Status, Rec.Status::Open);

                    Rec.Status := Rec.Status::Released;
                    Rec.MODIFY;
                    MESSAGE('Document has been approved Automatically');
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
                    Rec.TESTFIELD(Status, Rec.Status::"Pending Approval");//status must be open.
                                                                          /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                          ApprovalsMgmt.""(Rec);*/
                    Rec.Status := Rec.Status::Open;
                    Rec.MODIFY;
                    MESSAGE('Document has been Re-Opened');

                end;
            }
            // separator()
            // {
            // }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    //REPORT.RUN(80024,TRUE,TRUE,Rec);
                end;
            }
            // separator()
            // {
            // }
            action("Mark As Completed")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Mark As Completed action.';

                trigger OnAction()
                begin
                    InnovationEvaluationLine.RESET;
                    InnovationEvaluationLine.SETRANGE("Document No.", Rec."Document No");
                    IF InnovationEvaluationLine.FIND('-') THEN BEGIN
                        REPEAT
                            InnovationEvaluationLine.TESTFIELD("Final Committee Decision");
                        UNTIL InnovationEvaluationLine.NEXT = 0;
                    END;

                    Rec."Evaluation Status" := Rec."Evaluation Status"::Completed;
                    Rec.MODIFY;
                    MESSAGE('Evaluation Document %1 has been marked as Completed Successfully', Rec."Document No");
                end;
            }
        }
    }

    var
        InnovationEvaluationLine: Record "Innovation Evaluation Line";
}

