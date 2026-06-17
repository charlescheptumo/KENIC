table 50063 "Leave Plan Comment Line"
{
    Caption = 'Leave Plan Comment Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Leave Plan Line No."; Integer)
        {
            Caption = 'Leave Plan Line No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "No.", "Leave Plan Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure SetUpNewLine()
    var
        LeavePlanCommentLine: Record "Leave Plan Comment Line";
    begin
        LeavePlanCommentLine.SetRange("No.", "No.");
        LeavePlanCommentLine.SetRange("Leave Plan Line No.", "Leave Plan Line No.");
        LeavePlanCommentLine.SetRange(Date, WorkDate());
        if LeavePlanCommentLine.IsEmpty() then
            Date := WorkDate();

        OnAfterSetUpNewLine(Rec, LeavePlanCommentLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetUpNewLine(var LeavePlanCommentLineRec: Record "Leave Plan Comment Line"; var LeavePlanCommentLineFilter: Record "Leave Plan Comment Line")
    begin
    end;
}
