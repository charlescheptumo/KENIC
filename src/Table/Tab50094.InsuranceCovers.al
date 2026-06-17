/// <summary>
/// Table Insurance Covers (ID 50094).
/// </summary>
table 50094 "Insurance Covers"
{
    Caption = 'Insurance Covers';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Insurance No."; Code[20])
        {
            Caption = 'Insurance No.';
            TableRelation = Insurance;

            trigger OnValidate()
            begin
                if Rec."Insurance No." <> '' then begin
                    if Insurance.Get("Insurance No.", "Date Filter") then begin
                        Insurance.CalcFields("Total Value Insured");
                        Rec."Effective Date" := Insurance."Effective Date";
                        Rec."Expiration Date" := Insurance."Expiration Date";
                        Rec."Policy No." := Insurance."Policy No.";
                        Rec."Annual Premium" := Insurance."Annual Premium";
                        Rec."Policy Coverage" := Insurance."Policy Coverage";
                        Rec."Total Value Insured" := Insurance."Total Value Insured";
                        Rec."Insurance Type" := Insurance."Insurance Type";
                        Rec."Insurance Vendor No." := Insurance."Insurance Vendor No.";
                        Rec.Validate("Insurance Vendor No.");
                        Rec."Date Filter" := Insurance."Date Filter";
                        Rec."Global Dimension 1 Code" := Insurance."Global Dimension 1 Code";
                        Rec."Global Dimension 2 Code" := Insurance."Global Dimension 2 Code";
                    end;
                end else begin
                    Rec."Effective Date" := 0D;
                    Rec."Expiration Date" := 0D;
                    Rec."Policy No." := '';
                    Rec."Annual Premium" := 0;
                    Rec."Policy Coverage" := 0;
                    Rec."Total Value Insured" := 0;
                    Rec."Insurance Type" := '';
                    Rec."Insurance Vendor No." := '';
                    Rec.Validate("Insurance Vendor No.");
                    Rec."Date Filter" := Insurance."Date Filter";
                    Rec."Global Dimension 1 Code" := '';
                    Rec."Global Dimension 2 Code" := '';
                end;
            end;
        }
        field(3; "Insurance Description"; Text[100])
        {
            Caption = 'Insurance Description';
            Editable = false;
        }
        field(4; "Insurance Vendor No."; Code[20])
        {
            Caption = 'Insurance Vendor No.';
            TableRelation = Vendor;
            Editable = false;
            trigger OnValidate()
            begin
                if Rec."Insurance Vendor No." <> '' then begin
                    if Vend.Get("Insurance Vendor No.") then begin
                        Rec."Vendor Name" := Vend.Name;
                        Rec."Vendor Contact" := Vend.Contact;
                        Rec."Vendor Email Address" := Vend."E-Mail";
                        Rec."Vendor Phone" := Vend."Phone No.";
                    end;
                end else begin
                    Rec."Vendor Name" := '';
                    Rec."Vendor Contact" := '';
                    Rec."Vendor Email Address" := '';
                    Rec."Vendor Phone" := '';
                end;
            end;
        }
        field(5; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            Editable = false;
        }
        field(6; "Vendor Contact"; Text[80])
        {
            Caption = 'Vendor Contact';
            Editable = false;
        }
        field(7; "Vendor Phone"; Text[80])
        {
            Caption = 'Vendor Phone';
            Editable = false;
        }
        field(8; "Vendor Email Address"; Text[80])
        {
            Caption = 'Vendor Email Address';
            Editable = false;
        }
        field(9; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            Editable = false;
        }
        field(10; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
            Editable = false;
        }
        field(11; "Insurance Type"; Code[10])
        {
            Caption = 'Insurance Type';
            Editable = false;
        }
        field(12; "Policy No."; Text[30])
        {
            Caption = 'Policy No.';
            Editable = false;
        }
        field(13; "Insurance Details"; Text[2000])
        {
            Caption = 'Insurance Details';
            Editable = false;
        }
        field(14; "Annual Premium"; Decimal)
        {
            Caption = 'Annual Premium';
            Editable = false;
        }
        field(15; "Policy Coverage"; Decimal)
        {
            Caption = 'Policy Coverage';
            Editable = false;
        }
        field(16; "Expiry Notification Date"; DateFormula)
        {
            Caption = 'Expiry Notification Date';
        }
        field(17; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(18; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(19; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }
        field(20; "Total Value Insured"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Ins. Coverage Ledger Entry".Amount WHERE("Insurance No." = FIELD("Insurance No."),
                                                                         "Disposed FA" = CONST(false),
                                                                         "Posting Date" = FIELD("Date Filter")));
            Caption = 'Total Value Insured';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(22; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(23; "FA Cover Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Vehicles,Other;
        }
        field(24; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(26; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(27; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }

    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            FASetup.Get;
            FASetup.TestField("Insurance Cover Nos.");
         rec."Document No." := NoSeriesMgt.GetNextNo(FASetup."Insurance Cover Nos.", WorkDate(), true);
        end;

        SetDateTimeModified;
    end;

    trigger OnModify()
    begin
        SetDateTimeModified();
    end;

    trigger OnRename()
    begin
        SetDateTimeModified();
    end;

    trigger OnDelete()
    begin
        // ConferenceLines.Reset();
        // ConferenceLines.SetRange("Document No.", Rec."No.");
        // ConferenceLines.DeleteAll();
    end;

    var
        Insurance: Record Insurance;
        Vend: Record Vendor;
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit "No. Series";

    local procedure SetDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;
}
