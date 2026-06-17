table 50010 "Microsoft Graphs"
{
    Caption = 'Microsoft Graphs';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Type"; Enum "Graph API types")
        {
            Caption = 'Type';
        }
        field(3; "Client ID"; Text[2048])
        {
            Caption = 'Client ID';
        }
        field(4; "Client Secret"; Text[2048])
        {
            Caption = 'Client Secret';
        }
        field(5; Scope; Text[2048])
        {
            Caption = 'Scope';
        }
        field(6; URL; Text[2048])
        {
            Caption = 'URL';
        }
        field(7; "Tenant ID"; Text[2048])
        {

        }
        field(8; Host; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Microsoft Graph Outlook Events URL"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Microsoft Graph Token"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Assertion; Code[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Microsoft Graph UserId"; Text[2048])
        {

        }
        field(13; "Authorization Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(14; "Expires In"; Integer)
        {
            Caption = 'Expires In';
            // Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(15; "Ext. Expires In"; Integer)
        {
            Caption = 'Ext. Expires In';
            // Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(16; "Access Token"; Blob)
        {
            Caption = 'Access Token';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(17; "Refresh Token"; Blob)
        {
            Caption = 'Refresh Token';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(18; "Authorization URL"; Text[250])
        {
            Caption = 'Authorization URL';

            trigger OnValidate()
            var
                WebRequestHelper: Codeunit "Web Request Helper";
            begin
                if "Authorization URL" <> '' then
                    WebRequestHelper.IsSecureHttpUrl("Authorization URL");
            end;
        }
        field(19; "Access Token URL"; Text[250])
        {
            Caption = 'Access Token URL';

            trigger OnValidate()
            var
                WebRequestHelper: Codeunit "Web Request Helper";
            begin
                if "Access Token URL" <> '' then
                    WebRequestHelper.IsSecureHttpUrl("Access Token URL");
            end;
        }
        field(20; "Redirect URL"; Text[250])
        {
            Caption = 'Redirect URL';
        }
        field(21; "Authorization Scope"; Text[250])
        {
            Caption = 'Authorization Scope';
        }
    }
    keys
    {
        key(PK; "Type", "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Graph: Record "Microsoft Graphs";
    begin
        Graph.Reset();
        Graph.SetRange(Type, Rec.Type);
        if Graph.findlast() then
            Rec."Entry No." := Graph."Entry No." + 1;
    end;
}
