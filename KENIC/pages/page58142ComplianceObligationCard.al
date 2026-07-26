page 58142 "Compliance Obligation Card"
{
    PageType = Card;
    SourceTable = "Compliance Obligation";
    Caption = 'Compliance Obligation Card';


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = PageIsEditable;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the compliance obligation.';

                    trigger OnAssistEdit()
                    var
                        EBoardSetup: Record "E-Board Setup";
                        NoSeries: Codeunit "No. Series";
                    begin
                        if Rec."No." = '' then begin
                            EBoardSetup.GetRecordOnce();
                            EBoardSetup.TestField("Compliance Obligation Nos.");
                            if NoSeries.LookupRelatedNoSeries(EBoardSetup."Compliance Obligation Nos.", Rec."No.", Rec."No.") then
                                Rec.Validate("No.");
                        end;
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the short title or requirement summary.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies a detailed description of the obligation.';
                }

                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the compliance category code.';
                }
                field("Legislation Code"; Rec."Legislation Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the governing legislation code (e.g., ACT-01).';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Legislation Name");
                        CurrPage.Update(true);
                    end;
                }

                field("Legislation Name"; Rec."Legislation Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the full title/description of the selected governing legislation.';
                    Editable = false;
                }
                field("Primary Employee No."; Rec."Primary Employee No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the primary employee responsible for this compliance obligation.';
                    Visible = false;
                }
                field("Primary Employee Name"; Rec."Primary Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the primary assigned employee.';
                    Visible = false;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the priority level of the obligation.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this obligation is active.';
                    Visible = false;
                }

                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the recurrence of the compliance obligation.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of this obligation.';
                    Editable = false;
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this obligation cycle starts.';
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the next due date for compliance.';
                }

                field("Posted By Employee No."; Rec."Assigned By Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee number of the person who assigned this compliance obligation.';
                    Editable = false;
                }

                field("Posted By Employee Name"; Rec."Assigned By Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the person who assigned this compliance obligation.';
                    Editable = false;
                }

                field("Posted By Email"; Rec."Assigned By Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the e-mail address of the person who assigned this compliance obligation.';
                    Editable = false;
                }

            }

            group(Assignment)
            {
                Caption = 'Responsible Officer(S)';

                part(AssignedEmployees; "ComplianceObligationEmployees")
                {
                    ApplicationArea = All;
                    SubPageLink = "Obligation No." = field("No.");
                    Editable = PageIsEditable;
                }
            }


            // group(Details)
            // {
            //     Caption = 'Details & Remarks';

            //     field(Description; Rec.Description)
            //     {
            //         ApplicationArea = All;
            //         MultiLine = true;
            //         ToolTip = 'Specifies a detailed description of the obligation.';
            //     }
            //     field(Remarks; Rec.Remarks)
            //     {
            //         ApplicationArea = All;
            //         MultiLine = true;
            //         ToolTip = 'Specifies any additional operational remarks.';
            //     }
            // }

            group(SystemInfo)
            {
                Caption = 'Audit Trail';
                Editable = false;

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                }
                field("Last Modified By"; Rec."Last Modified By")
                {
                    ApplicationArea = All;
                }
                field("Last Modified DateTime"; Rec."Last Modified DateTime")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Caption = 'Post';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Enabled = not Rec.Posted;
                Visible = not Rec.Posted;
                ToolTip = 'Posts the compliance obligation, generates calendar entries, sets status to In Progress, and notifies assigned employees.';

                trigger OnAction()
                begin
                    Rec.PostObligation();
                    CurrPage.Update(false);
                end;
            }
        }
    }
    var
        PageIsEditable: Boolean;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetControlAppearance();
    end;

    local procedure SetControlAppearance()
    begin
        PageIsEditable := not Rec.Posted;
    end;
}