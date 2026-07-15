page 58119 "E-Board Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "E-Board Setup";
    Caption = 'E-Board Setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Default Voting Duration (Days)"; Rec."Default Voting Duration (Days)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default number of days a circular resolution remains open for voting before it closes.';
                }
                field("Enable Approval Workflow"; Rec."Enable Approval Workflow")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether circular resolutions must undergo an approval workflow before board members can vote.';
                }
            }

            group("Number Series")
            {
                Caption = 'Number Series';

                field("Circular Resolution Nos."; Rec."Circular Resolution Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series code used to generate numbers for new Circular Resolutions.';
                }
                field("E-Signing Nos."; Rec."E-Signing Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series code used for tracking E-Signing requests.';
                }
                field("Compliance Entry Nos."; Rec."Compliance Entry Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series code used for tracking Compliance Calendar Entries.';
                }
                field("Board Member Nos."; Rec."Board Member Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series code used for board member records, if tracking them via a unique ID.';
                }
            }

            group("Voting Restrictions")
            {
                Caption = 'Voting Eligibility & Target Options';

                field("Allow Department Voting"; Rec."Allow Department Voting")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if you can target specific organizational departments to vote on a resolution.';
                }
                field("Allow Individual Voting"; Rec."Allow Individual Voting")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if you can manually add individual board members to a voting campaign instead of broad categories.';
                }
            }

            group("Portal Integration")
            {
                Caption = 'Portal Integration';

                field("E-Board Portal URL"; Rec."E-Board Portal URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the base URL of your external E-Board web portal.';
                     Visible = false;
                }
                field("Portal Tenant ID"; Rec."Portal Tenant ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the tenant identifier associated with your cloud portal environment.';
                    Visible = false;
                }
            }

            group("Notifications & Quorums")
            {
                Caption = 'Notifications & Quorums';

                field("Default Quorum Percentage"; Rec."Default Quorum Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default percentage of active voters required to consider a resolution valid.';
                }
                field("Reminder Frequency (Days)"; Rec."Reminder Frequency (Days)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how often automated email/portal reminders should be sent to pending voters (set to 0 to disable).';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}