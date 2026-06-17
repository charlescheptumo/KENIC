report 50046 "Move Leave Plans to Archive"
{
    Caption = 'Move Leave Plans to Archive';
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem("Leave Plan Header"; "Leave Plan Header")
        {
            RequestFilterFields = "No.", "Starting Date";

            trigger OnAfterGetRecord()
            begin
                Counter := Counter + 1;
                if GuiAllowed then begin
                    Window.Update(1, "No.");
                    Window.Update(2, Round(Counter / CounterTotal * 10000, 1));
                end;
                LeavePlanMgt.MoveLeavePlanToArchive("Leave Plan Header");
            end;

            trigger OnPostDataItem()
            begin
                if GuiAllowed then begin
                    Window.Close();
                    Message(Text002, Counter);
                end;
            end;

            trigger OnPreDataItem()
            begin
                OnBeforePreDataItemLeavePlanHeader("Leave Plan Header");

                CounterTotal := Count;
                if GuiAllowed then
                    Window.Open(Text001);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LeavePlanMgt: Codeunit "Leave Plan Management";
        Window: Dialog;
        Counter: Integer;
        Text001: Label 'Moving Leave Plans to archive  #1########## @2@@@@@@@@@@@@@';
        Text002: Label '%1 Leave Plans have been moved to the archive.';
        CounterTotal: Integer;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePreDataItemLeavePlanHeader(var LeavePlanHeader: Record "Leave Plan Header")
    begin
    end;
}
