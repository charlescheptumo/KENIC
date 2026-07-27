page 58119 "E-Board Setup"
{
    ApplicationArea = All;
    Caption = 'E-Board Setup';
    PageType = Card;
    SourceTable = "E-Board Setup";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Primary key for the setup record.';
                    Visible = false;
                }

                // Number Series Fields
                field("Circular Resolution Nos."; Rec."Circular Resolution Nos.")
                {
                    ToolTip = 'Specifies the number series code used to generate numbers for new Circular Resolutions.';
                }
                field("E-Signing Nos."; Rec."E-Signing Nos.")
                {
                    ToolTip = 'Specifies the number series code used for tracking E-Signing requests.';
                }
                field("Compliance Entry Nos."; Rec."Compliance Entry Nos.")
                {
                    ToolTip = 'Specifies the number series code used for tracking Compliance Calendar Entries.';
                }
                field("Board Member Nos."; Rec."Board Member Nos.")
                {
                    ToolTip = 'Specifies the number series code used for board member records, if tracking them via a unique ID.';
                }

                // Voting Settings
                field("Default Voting Duration (Days)"; Rec."Default Voting Duration (Days)")
                {
                    ToolTip = 'Specifies the default number of days a circular resolution remains open for voting before it closes.';
                }
                field("Enable Approval Workflow"; Rec."Enable Approval Workflow")
                {
                    ToolTip = 'Specifies whether circular resolutions must undergo an approval workflow before board members can vote.';
                    Visible = false;
                }
                field("Allow Department Voting"; Rec."Allow Department Voting")
                {
                    ToolTip = 'Specifies if you can target specific organizational departments to vote on a resolution.';
                    Visible = false;
                }
                field("Allow Individual Voting"; Rec."Allow Individual Voting")
                {
                    ToolTip = 'Specifies if you can manually add individual board members to a voting campaign instead of broad categories.';
                    Visible = false;
                }

                // Quorum & Notifications
                field("Default Quorum Percentage"; Rec."Default Quorum Percentage")
                {
                    ToolTip = 'Specifies the default percentage of active voters required to consider a resolution valid.';
                    Visible = false;
                }
                field("Enable Reminders"; Rec."Enable Reminders")
                {
                    ToolTip = 'Specifies whether automated email reminders should be sent to pending voters.';
                }
                // Portal Integration
                field("E-Board Portal URL"; Rec."E-Board Portal URL")
                {
                    ToolTip = 'Specifies the base URL of your external E-Board web portal.';
                    Visible = true;
                }
                field("ERP URL"; Rec."ERP URL")
                {
                    ToolTip = 'Specifies the URL of ERP.';
                    Visible = true;
                }
                // field("Portal Tenant ID"; Rec."Portal Tenant ID")
                // {
                //     ToolTip = 'Specifies the tenant identifier associated with your cloud portal environment.';
                //     Visible = false;
                // }

                // SharePoint Integration
                field("SharePoint Site Link"; Rec."SharePoint Site Link")
                {
                    ToolTip = 'The base SharePoint site URL (e.g., https://company.sharepoint.com/sites/eboard)';
                }
                field("SharePoint Site Main Library"; Rec."SharePoint Site Main Library")
                {
                    ToolTip = 'The main document library name (e.g., "Documents" or "Shared Documents")';
                }
                field("SharePoint Document Library"; Rec."SharePoint Document Library")
                {
                    ToolTip = 'The document library folder for circular resolutions';
                }
                field("Circular Resolution DMS Link"; Rec."Circular Resolution DMS Link")
                {
                    ToolTip = 'The folder name within the document library for circular resolutions';
                }

                group("ComplianceCalendar")
                {
                    Caption = 'Compliance Calendar';
                    field("Compliance Category Nos."; Rec."Compliance Category Nos.")
                    {
                        ToolTip = 'Specifies the number series for regulatory categories (e.g., Tax, HR, Environmental)';
                    }

                    field("Compliance Template Nos."; Rec."Compliance Template Nos.")
                    {
                        ToolTip = 'Specifies the number series for recurring compliance templates.';
                    }

                    field("Compliance Obligation Nos."; Rec."Compliance Obligation Nos.")
                    {
                        ToolTip = 'Specifies the number series for recurring compliance obligations.';
                    }

                    field("Compliance DMS Link"; Rec."Compliance DMS Link")
                    {
                        ToolTip = 'The folder name within SharePoint/DMS designated for storing compliance filing proof.';
                    }
                    field("Enable Compliance Reminders"; Rec."Enable Compliance Reminders")
                    {
                        ToolTip = 'Enables automated email notifications for upcoming and overdue compliance deadlines';
                    }

                    field("CEO Personal No."; Rec."CEO Personal No.")
                    {
                        ToolTip = 'Specifies the CEO who receives overdue compliance escalation notifications.';
                    }

                    field("Board Secretary Personal No."; Rec."Board Secretary Personal No.")
                    {
                        ToolTip = 'Specifies the Board Secretary who receives overdue compliance escalation notifications.';
                    }

                    group("BoardDeclaration")
                    {
                        Caption = 'Board Declaratiom';
                        field("Declaration Nos."; Rec."Declaration Nos.")
                        {
                            ToolTip = 'Specifies the declaration numbers.';
                        }
                    }

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