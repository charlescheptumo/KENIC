#pragma warning disable AA0005,AL0603, AA0008, AA0018,AL0432, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

page 50139 "Leave Plan List"
{
    ApplicationArea = All;
    Caption = 'Leave Plan List';
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    CardPageID = "Leave Plan Card";
    SourceTable = "Leave Plan Header";
    SourceTableView = sorting("Employee No.", "Starting Date") order(descending);
    UsageCategory = Tasks;
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the starting date for a Leave Plan.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the ending date for a Leave Plan.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the description for a Leave Plan.';
#if not CLEAN22
                    Visible = LeavePlanV2Enabled;
#endif
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the Employee for the Leave Plan.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the name of the Employee for the Leave Plan.';
                    Visible = false;
                }
                //                 field("Quantity"; Rec."Quantity")
                //                 {
                //                     ApplicationArea = Jobs;
                //                     Caption = 'Total';
                //                     ToolTip = 'Specifies the total number of hours that are registered on the Leave Plan.';
                // #if not CLEAN22
                //                     Visible = LeavePlanV2Enabled;
                // #endif
                //                 }
                //                 field("Quantity Open"; Rec."Quantity Open")
                //                 {
                //                     ApplicationArea = Jobs;
                //                     Caption = 'Open';
                //                     ToolTip = 'Specifies the number of hours for the Leave Plan with status Open.';
                // #if not CLEAN22
                //                     Visible = LeavePlanV2Enabled;
                // #endif
                //                 }
                //                 field("Quantity Submitted"; Rec."Quantity Submitted")
                //                 {
                //                     ApplicationArea = Jobs;
                //                     Caption = 'Submitted';
                //                     ToolTip = 'Specifies the number of hours for the Leave Plan with status Submitted.';
                // #if not CLEAN22
                //                     Visible = LeavePlanV2Enabled;
                // #endif
                //                 }
                //                 field("Quantity Approved"; Rec."Quantity Approved")
                //                 {
                //                     ApplicationArea = Jobs;
                //                     Caption = 'Approved';
                //                     ToolTip = 'Specifies the number of hours for the Leave Plan with status Approved.';
                // #if not CLEAN22
                //                     Visible = LeavePlanV2Enabled;
                // #endif
                //                 }
                //                 field("Quantity Rejected"; Rec."Quantity Rejected")
                //                 {
                //                     ApplicationArea = Jobs;
                //                     Caption = 'Rejected';
                //                     ToolTip = 'Specifies the number of hours for the Leave Plan with status Rejected.';
                // #if not CLEAN22
                //                     Visible = LeavePlanV2Enabled;
                // #endif
                //                 }
                //                 field(Comment; Rec.Comment)
                //                 {
                //                     ApplicationArea = Comments;
                //                     ToolTip = 'Specifies that a comment about this document has been entered.';
                //                 }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Leave Plans")
            {
                ApplicationArea = Jobs;
                Caption = 'Create Leave Plans';
                Image = NewTimesheet;
                RunObject = Report "Create Leave Plans";
                ToolTip = 'Create new Leave Plans for resources.';
                Visible = LeavePlanAdminActionsVisible;
            }
#if not CLEAN22
            action(EditLeavePlan)
            {
                ApplicationArea = Jobs;
                Caption = '&Edit Leave Plan';
                Image = OpenJournal;
                ShortCutKey = 'Return';
                ToolTip = 'Open the Leave Plan in edit mode.';
                Visible = not LeavePlanV2Enabled;
                ObsoleteReason = 'Removed as part of old Leave Plan UI.';
                ObsoleteState = Pending;
                ObsoleteTag = '22.0';

                trigger OnAction()
                begin
                    OpenLeavePlanPage();
                end;
            }
#endif
            action(MoveLeavePlansToArchive)
            {
                ApplicationArea = Jobs;
                Caption = 'Move Leave Plans to Archive';
                Image = Archive;
                RunObject = Report "Move Leave Plans to Archive";
                ToolTip = 'Archive Leave Plans.';
                Visible = LeavePlanAdminActionsVisible;
            }
        }
        area(navigation)
        {
            group("&Leave Plan")
            {
                Caption = '&Leave Plan';
                Image = PlanningWorksheet;
                action(Comments)
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Leave Plan Comment Sheet";
                    RunPageLink = "No." = field("No."),
                                  "Leave Plan Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

#if not CLEAN22
                actionref(EditLeavePlan_Promoted; EditLeavePlan)
                {
                    ObsoleteReason = 'Removed as part of old Leave Plan UI.';
                    ObsoleteState = Pending;
#pragma warning disable AS0072
                    ObsoleteTag = '22.0';
#pragma warning restore AS0072
                }
#endif
                actionref("Create Leave Plans_Promoted"; "Create Leave Plans")
                {
                }
                actionref(MoveLeavePlansToArchive_Promoted; MoveLeavePlansToArchive)
                {
                }
                actionref(Comments_Promoted; Comments)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
#if not CLEAN22
        LeavePlanV2Enabled := LeavePlanMgt.LeavePlanV2Enabled();
#endif
        LeavePlanAdminActionsVisible := true;
        if UserSetup.Get(UserId) then
            CurrPage.Editable := UserSetup."Leave Plan Admin.";
#if not CLEAN22
        if LeavePlanV2Enabled then
#endif
        LeavePlanAdminActionsVisible := UserSetup."Leave Plan Admin.";

        LeavePlanMgt.FilterLeavePlans(Rec, Rec.FieldNo("Owner User ID"));
        OnAfterOnOpenPage(Rec);
    end;

    var
        UserSetup: Record "User Setup";
        LeavePlanMgt: Codeunit "Leave Plan Management";
#if not CLEAN22
        LeavePlanV2Enabled: Boolean;
#endif
        LeavePlanAdminActionsVisible: Boolean;

#if not CLEAN22
    local procedure OpenLeavePlanPage()
    var
        LeavePlanLine: Record "Leave Plan Lines";
    begin
        if not LeavePlanV2Enabled then begin
            LeavePlanMgt.SetLeavePlanNo(Rec."No.", LeavePlanLine);
            Page.Run(Page::"Leave Plan", LeavePlanLine);
            exit;
        end;
        Page.Run(Page::"Leave Plan Card", Rec)
    end;
#endif

    [IntegrationEvent(true, false)]
    local procedure OnAfterOnOpenPage(var LeavePlanHeader: Record "Leave Plan Header")
    begin
    end;
}
