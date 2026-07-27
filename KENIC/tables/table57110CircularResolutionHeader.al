
table 57110 "Circular Resolution Header"
{
    Caption = 'Circular Resolution Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                EBoardSetup: Record "E-Board Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    GetEBoardSetup(EBoardSetup);
                    EBoardSetup.TestField("Circular Resolution Nos.");
                    NoSeries.TestManual(EBoardSetup."Circular Resolution Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Title"; Text[250])
        {
            Caption = 'Title';
        }
        field(3; "Description"; Text[2048])
        {
            Caption = 'Description';
        }
        field(4; "Resolution Type"; Enum "Resolution Type")
        {
            Caption = 'Resolution Type';
        }
        field(5; "Status"; Enum "Resolution Status")
        {
            Caption = 'Status';
        }
        field(6; "Approval Status"; Enum "Resolution Approval Status")
        {
            Caption = 'Approval Status';
        }
        field(7; "Voting Deadline"; DateTime)
        {
            Caption = 'Voting Deadline';

            trigger OnValidate()
            begin
                if "Voting Deadline" < CurrentDateTime then
                    Error('Voting deadline cannot be in the past. Please select a current or future date and time.');
            end;
        }
        field(8; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
        }
        field(9; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }
        field(10; "Last Modified By"; Code[50])
        {
            Caption = 'Last Modified By';
            Editable = false;
        }
        field(11; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
            Editable = false;
        }
        field(12; "Total Members"; Integer)
        {
            Caption = 'Total Members';
            FieldClass = FlowField;
            CalcFormula = count("Circular Resolution lines" where("Resolution No." = field("No.")));
            Editable = false;
        }
        field(13; "Total Votes Cast"; Integer)
        {
            Caption = 'Total Votes Cast';
            FieldClass = FlowField;
            CalcFormula = count("Circular Resolution lines" where("Resolution No." = field("No."), "Vote Status" = const(Voted)));
            Editable = false;
        }
        field(14; "Winning Option"; Code[20])
        {
            Caption = 'Winning Option';
            TableRelation = "Circular Resolution Option"."Option Code" where("Resolution No." = field("No."));
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }

        field(16; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1)); // Maps to your primary Department Dimension (Shortcut Dimension 1)
        }
        field(18; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(19; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(20; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
            DataClassification = CustomerContent;
            Editable = false;
        }

        // field(21; "Employee No."; Code[20])
        // {
        //     Caption = 'Initiator No.';
        //     TableRelation = Employee."No.";
        //     ToolTip = 'The employee initiating this resolution.';

        //     trigger OnValidate()
        //     var
        //         Emp: Record Employee;
        //     begin
        //         if "Employee No." <> '' then begin
        //             Emp.SetRange("No.", "Employee No.");
        //             if Emp.FindFirst() then begin
        //                 "Department Code" := Emp."Department Code";
        //                 "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
        //                 "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        //             end;
        //         end;
        //     end;
        // }
        field(22; "Initiator Name"; Text[100])
        {
            Caption = 'Initiator Name';
            Editable = true;
        }

        field(23; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(24; "24H Reminder Sent"; Boolean)
        {
            Caption = '24H Reminder Sent';
            Editable = false;
        }
        field(25; "30M Reminder Sent"; Boolean)
        {
            Caption = '30M Reminder Sent';
            Editable = false;
        }

        field(26; "Majority Type"; Enum "Majority Type")
        {
            Caption = 'Majority Type';
        }

        field(27; "Resolution Outcome"; Enum "Resolution Outcome")
        {
            Caption = 'Resolution Outcome';
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        ResolutionOption: Record "Circular Resolution Option";
        ResolutionVote: Record "Circular Resolution lines";
    begin
        // Only documents still in Open status can be deleted.
        TestField("Approval Status", "Approval Status"::Open);

        ResolutionOption.SetRange("Resolution No.", "No.");
        if not ResolutionOption.IsEmpty() then
            ResolutionOption.DeleteAll(true);

        ResolutionVote.SetRange("Resolution No.", "No.");
        if not ResolutionVote.IsEmpty() then
            ResolutionVote.DeleteAll(true);
    end;

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
        DaysDuration: Duration;
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        ResolutionMgt: Codeunit "Resolution Management";
    begin
        if "No." = '' then begin
            GetEBoardSetup(EBoardSetup);
            EBoardSetup.TestField("Circular Resolution Nos.");
            "No." := NoSeries.GetNextNo(EBoardSetup."Circular Resolution Nos.", WorkDate(), true);
            "No. Series" := EBoardSetup."Circular Resolution Nos.";

            if EBoardSetup."Default Voting Duration (Days)" > 0 then begin
                DaysDuration := EBoardSetup."Default Voting Duration (Days)" * 24 * 60 * 60 * 1000;
                "Voting Deadline" := CurrentDateTime + DaysDuration;
            end;
        end;

        "Created By" := UserId;
        "Created DateTime" := CurrentDateTime;

        // Auto-populate Department Code from User Setup's Employee
        if "Department Code" = '' then begin
            if UserSetup.Get(UserId) and (UserSetup."Employee No." <> '') then begin
                Emp.SetRange("No.", UserSetup."Employee No.");
                if Emp.FindFirst() then
                    "Department Code" := Emp."Department Code";
            end;
        end;
        ResolutionMgt.CreateDefaultVotingOptions("No.");
    end;

    trigger OnModify()
    begin
        "Last Modified By" := UserId;
        "Last Modified DateTime" := CurrentDateTime;
    end;

    procedure AssistEdit(OldRec: Record "Circular Resolution Header"): Boolean
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        GetEBoardSetup(EBoardSetup);
        EBoardSetup.TestField("Circular Resolution Nos.");

        if NoSeries.LookupRelatedNoSeries(EBoardSetup."Circular Resolution Nos.", OldRec."No. Series", "No. Series") then begin
            "No." := NoSeries.GetNextNo("No. Series", WorkDate(), true);
            exit(true);
        end;
    end;

    local procedure GetEBoardSetup(var EBoardSetup: Record "E-Board Setup")
    begin

        EBoardSetup.GetRecordOnce();

        // Alternatively, if it utilizes standard setup patterns, fallback to:
        // if not EBoardSetup.Get() then begin
        //     EBoardSetup.Init();
        //     EBoardSetup.Insert();
        // end;
    end;

    procedure UpdateStatusBasedOnDeadline()
    begin

        if ("Voting Deadline" <> 0DT) and ("Voting Deadline" <= CurrentDateTime) then begin


            if (Status = Status::"Pending Approval") or
               (Status = Status::Approved) or
               (Status = Status::Voting) then begin
                Status := Status::Closed;
                Modify(true);
            end;
        end;
    end;
}