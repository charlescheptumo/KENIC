table 57111 "Circular Resolution Option"
{
    Caption = 'Circular Resolution Option';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Resolution No."; Code[20])
        {
            Caption = 'Resolution No.';

            //TableRelation = "Circular Resolution Header"."No." on delete cascade;
            TableRelation = "Circular Resolution Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Option Code"; Code[20])
        {
            Caption = 'Option Code';
            NotBlank = true;
        }
        field(4; "Option Description"; Text[100])
        {
            Caption = 'Option Description';
        }
        field(5; "Display Order"; Integer)
        {
            Caption = 'Display Order';
        }
        field(6; "Active"; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }
        field(7; "Vote Count"; Integer)
        {
            Caption = 'Vote Count';
            FieldClass = FlowField;

            CalcFormula = count("Circular Resolution lines" where(
                "Resolution No." = field("Resolution No."),
                "Selected Option Code" = field("Option Code")
            ));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Resolution No.", "Line No.")
        {
            Clustered = true;
        }

        key(UniqueOption; "Resolution No.", "Option Code")
        {
            Unique = true;
        }
    }
    trigger OnInsert()
    var
        ResolutionOption: Record "Circular Resolution Option";
    begin
        if "Line No." = 0 then begin
            ResolutionOption.Reset();
            ResolutionOption.SetRange("Resolution No.", "Resolution No.");

            if ResolutionOption.FindLast() then
                "Line No." := ResolutionOption."Line No." + 1
            else
                "Line No." := 1;
        end;
    end;
}