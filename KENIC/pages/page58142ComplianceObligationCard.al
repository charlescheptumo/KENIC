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
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the compliance category code.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the user responsible for this compliance obligation.';
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
                }
            }

            group(Scheduling)
            {
                Caption = 'Scheduling & Tracking';

                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how often this obligation recurs.';
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
                field("Reminder Days"; Rec."Reminder Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many days prior to the due date reminders should be triggered.';
                }
                field("Evidence Required"; Rec."Evidence Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if supporting proof/documents must be attached upon completion.';
                }
            }

            group(Details)
            {
                Caption = 'Details & Remarks';

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies a detailed description of the obligation.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies any additional operational remarks.';
                }
            }

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
}