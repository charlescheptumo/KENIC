/// <summary>
/// Table EmpTrainingAttended (ID 50023).
/// </summary>
table 50023 EmpTrainingAttended
{
    Caption = 'EmpTrainingAttended';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; Course; Code[250])
        {
            Caption = 'Course';
        }
        field(4; "Course Name"; Text[250])
        {
            Caption = 'Course Name';
        }
        field(5; "Duration Type"; Option)
        {
            Caption = 'Course Duration';
            OptionMembers = ,"Short-term","Long-term";
        }
        field(6; "With Support"; Option)
        {
            Caption = 'With ADAK Support';
            OptionCaption = 'Self Sponsored, ADAK Sponsored';
            OptionMembers = "Self Sponsored","ADAK Sponsored";
        }
        field(7; Institution; Text[250])
        {
            TableRelation = Vendor;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Courses: Record EmpTrainingAttended;
    begin
        Courses.Reset();
        Courses.SetRange("Document No.", Rec."Document No.");
        if Courses.FindLast() then begin
            "Line No." := Courses."Line No." + 1;
        end;
    end;
}
