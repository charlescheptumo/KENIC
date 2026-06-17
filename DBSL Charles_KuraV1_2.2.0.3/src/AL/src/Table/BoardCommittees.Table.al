#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 55000 "Board Committees"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
            NotBlank = true;
        }
        field(3; Comments; Text[200])
        {
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Active,Disbanded';
            OptionMembers = Active,Disbanded;
        }
        field(7; Mandate; Text[2048])
        {
        }
        field(8; Type; option)
        {
            OptionCaption = 'Board,Committee';
            OptionMembers = Board,Committee;

            trigger OnValidate()
            var
                CommitteeBoardMembers: Record "Committee Board Members";
            begin
                CommitteeBoardMembers.Reset();
                CommitteeBoardMembers.SetRange(Committee, "Code");
                if CommitteeBoardMembers.Find('-') then begin
                    CommitteeBoardMembers.Type := Type;
                end
            end;
        }
        field(20; "No Series"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Rec.Code = '' then begin
            HRSet.Get();
            HRSet.TestField("Committee Nos.");
                       Rec.Code := NoSeriesMgt.GetNextNo(HRSet."Committee Nos.", WorkDate(), true);
        end
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
}

