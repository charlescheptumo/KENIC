#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
Table 50183 "Trng Eval Areas Addressed"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Training Header No"; Code[30])
        {
            TableRelation = "Training Evaluation Header".No;
        }
        field(2; "Course Title"; Text[100])
        {
            TableRelation = "Training Evaluation Header"."Course Title";
        }
        field(3; "Course Methodology"; Text[100])
        {
            TableRelation = "Training Evaluation Header"."Course Methodology";
        }
        field(4; "Line No"; Integer)
        {
        }
        field(5; "Comment on Relevance of Course"; Text[250])
        {
            TableRelation = "Training Needs Dev Objective".Competency;
        }
    }

    keys
    {
        key(PK; "Training Header No", "Line No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; "Training Header No", "Course Title", "Course Methodology", "Comment on Relevance of Course")
        {
        }
    }
}
