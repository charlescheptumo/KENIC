page 80453 "Functional calendar"
{
    Caption = 'Corporate Calendar';
    PageType = Card;
    SourceTable = "Performance Management Plan";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                // field("Quarterly Reporting code";"Quarterly Reporting code")
                // {
                // }
                field("Start Date"; Rec."Start Date")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("HR Performance Template"; Rec."HR Performance Template")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the HR Performance Template field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                // field(Department;Department)
                // {
                //     Visible = false;
                // }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Performance Contract  Template"; Rec."Performance Contract  Template")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Performance Contract  Template field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            // part(part;80455)
            // {
            //     SubPageLink = "Performance Mgt Plan ID"=FIELD(No);
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval")
            {
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Approval action.';

                trigger OnAction()
                begin
                    MESSAGE('Sent Successfully');
                end;
            }
            action("Cancel Approval")
            {
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Cancel Approval action.';

                trigger OnAction()
                begin
                    MESSAGE('Cancelled');
                end;
            }
            action("Post To Corporate")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Post To Corporate action.';

                trigger OnAction()
                begin
                    MESSAGE('Posted');
                end;
            }
            action("Corporate Calender Report")
            {
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ToolTip = 'Executes the Corporate Calender Report action.';

                trigger OnAction()
                begin
                    PerformanceManagementPlan.RESET;
                    PerformanceManagementPlan.SETRANGE(No, Rec.No);
                    IF PerformanceManagementPlan.FINDFIRST THEN
                        REPORT.RUN(80043, TRUE, TRUE, PerformanceManagementPlan);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Corporate;
    end;

    var
        PerformanceManagementPlan: Record "Performance Management Plan";
}

