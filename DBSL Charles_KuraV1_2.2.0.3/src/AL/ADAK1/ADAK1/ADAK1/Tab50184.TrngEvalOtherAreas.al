#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
Table 50184 "Trng Eval Other Areas"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Training Header No"; Code[30])
        {
            TableRelation = "Training Evaluation Header".No;
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Comment on Relevance of Course"; Text[250])
        {
        }
    }

    keys
    {
        key(PK; "Training Header No", "Line No")
        {
            Clustered = true;
        }
    }
}
