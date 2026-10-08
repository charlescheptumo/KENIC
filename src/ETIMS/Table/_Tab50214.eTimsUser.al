/// <summary>
/// Stores eTIMS device/portal user credentials (auto-populating name/id from the linked Business Central User record on validate) along with contact info, auth code and sync status.
/// </summary>
table 50214 "eTims-User"
{
    Caption = 'eTims-User';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; UserId; Code[50])
        {
            Caption = 'UserId';
            TableRelation = User."User Security ID";
            trigger OnValidate()
            var
                User: Record User;
            begin
                User.Reset();
                User.SetRange(User."User Security ID", UserId);
                if User.FindFirst() then begin
                    "User Name" := User."Full Name";
                    "User Id" := User."User Name";
                end;
            end;
        }
        field(8; "User Id"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "User Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Password; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Address; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Contact; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Remark; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; useYn; Option)
        {
            Caption = 'UseYN';
            OptionMembers = "","Y","N";
        }
        field(9; "Auth Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Synched; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; UserId)
        {
            Clustered = true;
        }
    }
}
