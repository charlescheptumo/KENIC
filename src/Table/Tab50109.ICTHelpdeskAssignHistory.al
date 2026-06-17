table 50109 "ICT Helpdesk Assign History"
{
    Caption = 'ICT Helpdesk Assign History';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; "Assigned To"; Code[50])
        {
            Caption = 'Assigned To';
            TableRelation = "User Setup";
        }
        field(4; "Assined To E-Mail"; Code[80])
        {
            Caption = 'Assined To E-Mail';
        }
        field(5; "Assigned By"; Code[50])
        {
            Caption = 'Assigned By';
        }
        field(6; "Assigned Date"; Date)
        {
            Caption = 'Assigned Date';
        }
        field(7; "Assigned DateTime"; DateTime)
        {
            Caption = 'Assigned DateTime';
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        AssignHistory.Reset();
        AssignHistory.SetRange("Document No.", "Document No.");
        if AssignHistory.FindLast() then
            "Line No." := AssignHistory."Line No." + 1
        else
            "Line No." := 1;
        
        "Assigned By" := UserId;
        "Assigned Date" := Today;
        "Assigned DateTime" := CurrentDateTime;
    end;

    var
        AssignHistory: Record "ICT Helpdesk Assign History";
}
