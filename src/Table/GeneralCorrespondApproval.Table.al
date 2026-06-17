#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50085 "General Correspond Approval"
{
    Caption = 'General Correspondence Approvals';
    DrillDownPageID = "Consolidated Work Program Line";
    LookupPageID = "Consolidated Work Program Line";

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Memo,Letter';
            OptionMembers = " ",Memo,Letter;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange(UserSetup."User ID", "User ID");
                if UserSetup.FindSet then begin
                    UserSetup.TestField("Employee No.");
                    "Employee No" := UserSetup."Employee No.";
                    "Employee Email" := UserSetup."E-Mail";
                    Validate("Employee No");

                    //Get UserID position
                    if Employee.Get("Employee No") then
                        Position := Employee."Job Title";


                end;
            end;
        }
        field(5; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", "Employee No");
                if Employee.FindSet then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Employee Email" := Employee."E-Mail";
                end;
            end;
        }
        field(6; "Employee Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        // field(7; Sequence; Integer)
        // {
        //     DataClassification = ToBeClassified;
        //     trigger OnValidate()
        //     Var
        //     UserSetup: Record "User Setup";
        //     begin
        //     if Rec.Sequence = 1 then
        //     begin
        //     if UserSetup.Get(Rec."User ID") then begin
        //     if not UserSetup."Registrar Approval" = true then
        //         Error('The first Approver should be from registry Office');
        //     end;    
        //     end;

        //     end;
        // }
       field(7; Sequence; Integer)
{
    DataClassification = ToBeClassified;
    
    trigger OnValidate()
    var
        ApprovalLine: Record "General Correspond Approval";
        UserSetup: Record "User Setup";
        xSequence: Integer;
    begin
        TestField("User ID");
        TestField("Document No");
        
        xSequence := xRec.Sequence;
        
        if (xSequence = 1) and (Rec.Sequence <> 1) then begin
            ApprovalLine.Reset();
            ApprovalLine.SetRange("Document No", Rec."Document No");
            ApprovalLine.SetRange("Document Type", Rec."Document Type");
            ApprovalLine.SetRange(Type, Rec.Type);
            ApprovalLine.SetRange(Sequence, 1);
            ApprovalLine.SetFilter("Line No", '<>%1', Rec."Line No");
            
            if ApprovalLine.IsEmpty then
                Error('You cannot change Sequence 1 to %1 because the document must have at least one approver with Sequence 1 (Registry Office user).', Rec.Sequence);
        end;
        
        if Rec.Sequence = 1 then begin
            if not UserSetup.Get(Rec."User ID") then
                Error('User Setup not found for User ID: %1. Please configure the user in User Setup.', Rec."User ID");
            
            if not UserSetup."Registrar Approval" then
                Error('The first Approver (Sequence 1) must be from the Registry Office. User %1 is not authorized as a Registry approver.', Rec."User ID");
        end;

        if Rec.Sequence > 1 then begin
            ApprovalLine.Reset();
            ApprovalLine.SetRange("Document No", Rec."Document No");
            ApprovalLine.SetRange("Document Type", Rec."Document Type");
            ApprovalLine.SetRange(Type, Rec.Type);
            ApprovalLine.SetRange(Sequence, Rec.Sequence - 1);
            
            if not ApprovalLine.FindFirst() then
                Error('You cannot enter Sequence %1 before Sequence %2 exists for Document %3. Please add approvers in sequential order.', 
                    Rec.Sequence, Rec.Sequence - 1, Rec."Document No");
        end;
        
        ApprovalLine.Reset();
        ApprovalLine.SetRange("Document No", Rec."Document No");
        ApprovalLine.SetRange("Document Type", Rec."Document Type");
        ApprovalLine.SetRange(Type, Rec.Type);
        ApprovalLine.SetRange(Sequence, Rec.Sequence);
        ApprovalLine.SetFilter("Line No", '<>%1', Rec."Line No");
        
        if not ApprovalLine.IsEmpty then
            Error('Sequence %1 already exists for Document %2. Please use a different sequence number.', 
                Rec.Sequence, Rec."Document No");
    end;
}
        field(8; "Employee Email"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            ExtendedDatatype = EMail;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending,Rejected,Cancelled,Approved';
            OptionMembers = " ",Open,Pending,Rejected,Cancelled,Approved;
        }
        field(10; "DateTime Modified"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Date Sent Approval"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Forwarded; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Comments; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Position; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", Type, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
}

