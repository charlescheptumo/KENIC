page 90443 "Completed Innv Evaluation Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = 80253;
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
            part(ontrol12; 90444)
            {
                SubPageLink = "Document No." = FIELD("Document No");
            }
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
        }
    }

    var
        InnovationEvaluationLine: Record 80255;
}

