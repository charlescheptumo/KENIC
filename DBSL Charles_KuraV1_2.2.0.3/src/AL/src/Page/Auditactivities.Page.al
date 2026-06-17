#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57122 "Audit activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Finance Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Payments)
            {
                Caption = 'Payments';
                field("Posted Payment Vouchers"; Rec."Posted Payment Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Payment Vouchers';
                    DrillDownPageID = "Posted Payment Vouchers";
                    ToolTip = 'Specifies the value of the Posted Payment Vouchers field.';
                }
            }
            cuegroup(Receivables)
            {
                Caption = 'Receivables';
                field("Posted Surrenders"; Rec."Posted Surrenders")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Posted Direct Voucher List";
                    ToolTip = 'Specifies the value of the Posted Surrenders field.';
                }
            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                // field("Requests Sent for Approval";"Requests Sent for Approval")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Approval Entries";
                // }
                // field("Requests to Approve";"Requests to Approve")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Requests to Approve";
                // }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("Due Date Filter", '<=%1', WorkDate);
        Rec.SetFilter("Overdue Date Filter", '<%1', WorkDate);
        // SetFilter("User ID Filter",UserId);
    end;
}

