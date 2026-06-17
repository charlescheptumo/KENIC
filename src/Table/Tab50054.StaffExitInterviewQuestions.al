table 50054 "Staff Exit Interview Questions"
{
    Caption = 'Staff Exit Interview Questions';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[100])
        {

        }
        field(2; "Interview Scoresheet Template"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(4; "Question ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            // TableRelation = "Exit Question Temp"."Question Id" where("Template ID" = field("Interview Scoresheet Template"));

            // trigger OnValidate()
            // var
            //     ExitTemp: Record "Exit Question Temp";
            // begin
            //     ExitTemp.Reset();
            //     ExitTemp.SetRange("Question Id", Rec."Question Id");
            //     if ExitTemp.Find('-') then begin
            //         Description := ExitTemp.Description;
            //     end
            // end;
        }
        field(5; Description; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Question Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-Ended,Closed-Ended,Number';
            OptionMembers = "Open-Ended","Closed-Ended",Number;
        }
        field(7; "Close Ended Qn Subtype"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Evaluation Comments"; Text[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Remarks';
        }
        field(11; Answer; Text[600])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code, "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        StaffExit.Reset();
        StaffExit.SetRange(Code, Rec.Code);
        if StaffExit.FindLast() then begin
            "Line No." := StaffExit."Line No." + 1;
        end;
    end;

    var
        StaffExit: Record "Staff Exit Interview Questions";
}
