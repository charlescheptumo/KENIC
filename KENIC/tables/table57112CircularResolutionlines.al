table 57112 "Circular Resolution lines"
{
    Caption = 'Circular Resolution Vote';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Resolution No."; Code[20])
        {
            Caption = 'Resolution No.';

            TableRelation = "Circular Resolution Header"."No.";

        }


        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Personal No."; Code[20])
        {
            Caption = 'Personal No.';

            TableRelation = "Board Members"."Personal No";
            trigger OnValidate()
            var
                BoardMember: Record "Board Members";
            begin
                // if BoardMember.Get("Personal No.") then begin
                BoardMember.Reset();
                BoardMember.SetRange("Personal No", "Personal No.");
                if BoardMember.FindFirst() then begin
                    "Employee Name" := BoardMember.FullName();
                    Email := BoardMember."Company E-Mail";

                    "Department Code" := '';
                end else begin
                    "Employee Name" := '';
                    Email := '';
                    "Department Code" := '';
                end;
            end;
        }
        field(4; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(5; "Department Code"; Code[20])
        {
            Caption = 'Department Code';

            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Editable = false;
        }
        field(6; "Email"; Text[100])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
            Editable = false;
        }
        field(7; "Vote Status"; Enum "Resolution Vote Status")
        {
            Caption = 'Vote Status';
            Editable = false;
        }
        field(8; "Selected Option Line No."; Integer)
        {

            Caption = 'Selected Option Line No.';
            TableRelation = "Circular Resolution Option"."Line No." where("Resolution No." = field("Resolution No."));

            trigger OnValidate()
            var
                Option: Record "Circular Resolution Option";
                ResolutionHeader: Record "Circular Resolution Header";
                ResolutionMgt: Codeunit "Resolution Management";
            begin
                if "Vote Status" = "Vote Status"::Voted then
                    Error('You have already submitted your vote. Voting is allowed only once.');
                if "Selected Option Line No." <> 0 then begin
                    if not Option.Get("Resolution No.", "Selected Option Line No.") then
                        Error('Invalid voting option selected.');
                    //  Option.Get("Resolution No.", "Selected Option Line No.");
                    "Selected Option Code" := Option."Option Code";
                    "Vote Status" := "Vote Status"::Voted;
                    "Vote DateTime" := CurrentDateTime;


                end else begin
                    "Selected Option Code" := '';
                    "Vote Status" := "Vote Status"::Pending;
                    "Vote DateTime" := 0DT;


                end;

                // Update the current winning option
                if ResolutionHeader.Get("Resolution No.") then
                    ResolutionMgt.UpdateWinningOption(ResolutionHeader);
            end;
        }
        field(9; "Selected Option Code"; Code[20])
        {
            Caption = 'Selected Option Code';
            Editable = false;
        }
        field(10; "Vote DateTime"; DateTime)
        {
            Caption = 'Vote DateTime';
            Editable = false;
        }
        field(11; "Remarks"; Text[250])
        {
            Caption = 'Remarks';
        }
        field(12; "Notification Sent"; Boolean)
        {
            Caption = 'Notification Sent';
            Editable = false;
        }
        field(13; "Notification DateTime"; DateTime)
        {
            Caption = 'Notification DateTime';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Resolution No.", "Line No.")
        {
            Clustered = true;
        }
        key(EmployeeVote; "Resolution No.", "Personal No.")
        {
            Unique = true;
        }
    }
}