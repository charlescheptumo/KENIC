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
            CalcFormula = count("Circular Resolution Vote" where("Resolution No." = field("No.")));
            Editable = false;
        }
        field(13; "Total Votes Cast"; Integer)
        {
            Caption = 'Total Votes Cast';
            FieldClass = FlowField;
            CalcFormula = count("Circular Resolution Vote" where("Resolution No." = field("No."), "Vote Status" = const(Voted)));
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
        ResolutionVote: Record "Circular Resolution Vote";
    begin
       
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
}