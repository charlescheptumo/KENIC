table 99213 "TUE Application Header"
{
    Caption = 'TUE Application Form';
    DataClassification = CustomerContent;
    LookupPageId = "TUE Application List";
    DrillDownPageId = "TUE Application List";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Athlete No.';
            TableRelation = Customer."No." where("Customer Type" = const(Athlete));
            trigger OnValidate()
            Var
                Cust: Record Customer;
            begin
                if Cust.Get(Rec."Customer No.") then begin
                    Rec.Telephone := Cust."Phone No.";
                    Rec."E-Mail" := Cust."E-Mail";
                    Rec.Validate(Sport, Cust.Sport);
                end;
            end;
        }
        field(3; "First Name"; Text[50])
        {
            Caption = 'First Name';
            FieldClass = FlowField;
            Calcformula = lookup(Customer."First Name" where("No." = field("Customer No.")));
            Editable = false;
        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Full Name';
            FieldClass = FlowField;
            Calcformula = lookup(Customer."Last Name" where("No." = field("Customer No.")));
            Editable = false;
        }
        field(5; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
            FieldClass = FlowField;
            Calcformula = lookup(Customer."Date of Birth" where("No." = field("Customer No.")));
            Editable = false;
        }
        field(6; Address; Text[100])
        {
            Caption = 'Address';
            FieldClass = FlowField;
            Calcformula = lookup(Customer.Address where("No." = field("Customer No.")));
            Editable = false;
        }
        field(7; City; Text[100])
        {
            Caption = 'City';
            FieldClass = FlowField;
            Calcformula = lookup(Customer.City where("No." = field("Customer No.")));
            Editable = false;
        }
        field(8; "Country/Region Code"; Code[50])
        {
            Caption = 'Country';
            FieldClass = FlowField;
            Calcformula = lookup(Customer."Country/Region Code" where("No." = field("Customer No.")));
            Editable = false;
        }
        field(9; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            FieldClass = FlowField;
            Calcformula = lookup(Customer."Post Code" where("No." = field("Customer No.")));
            Editable = false;
        }
        field(10; Telephone; Text[30])
        {
            Caption = 'Telephone';
        }
        field(11; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
        }
        field(12; Sport; Code[50])
        {
            Caption = 'Sport';
            TableRelation = Sport."Sport Code";
            trigger OnValidate()
            var
                sprts: Record Sport;
            begin
                sprts.Reset();
                sprts.SetRange("Sport Code", Sport);
                if sprts.FindFirst() then
                    Discipline := sprts.Discipline;
            end;
        }
        field(13; Discipline; Code[50])
        {
            Caption = 'Discipline';
            TableRelation = "Sport Discipline";
        }
        field(14; "Previous Application?"; Boolean)
        {
            Caption = 'Previous Application?';
            //FieldClass= FlowField;
            // CalcFormula = Exist("TUE Application Header" where("No." = filter(<> "No."),"Customer No."=field("Customer No.")));
        }
        field(15; "RetroActive Application?"; Boolean)
        {
            Caption = 'RetroActive Application?';
        }
        field(16; "RetroActive Start Date"; Date)
        {
            Caption = 'RetroActive Start Date';
        }
        field(17; Gender; Enum "Employee Gender")
        {
            FieldClass = FlowField;
            Calcformula = lookup(Customer.Gender where("No." = field("Customer No.")));
            Editable = false;
        }
        field(18; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(19; Physician; Code[20])
        {
            // TableRelation = Vendor."No." where("vendor Type" = const(Physician));
            TableRelation = Resource."No." where("Resource Type" = const(Physician));
            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset();
                Resource.SetRange("No.", Physician);
                if Resource.FindFirst() then begin
                    Rec."Medical Practitioner Name" := Resource.Name;
                    Rec."Medical Specialty" := Resource."Medical Specialty";
                    Rec."License Body" := Resource."Licensing Body";
                    Rec."License Number" := Resource."License Number";
                    Rec."MP E-Mail" := Resource.Email;
                end;
            end;
        }
        field(20; "Approval Status"; Enum "App Status")
        {

        }
        field(21; "Document Date"; Date)
        {

        }
        field(22; "Approval Date"; Date)
        {

        }
        field(23; "Medical Practitioner Name"; Text[100])
        {

        }
        field(24; "Medical Specialty"; Code[70])
        {

        }
        field(25; "License Body"; Code[50])
        {
            TableRelation = "Licensing Bodies"."Licensing Body";
        }
        field(26; "License Number"; Code[50])
        {

        }
        field(27; "MP Address"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Address where("No." = field(Physician)));
            Editable = false;
        }
        field(28; "MP Post Code"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Post Code" where("No." = field(Physician)));
            Editable = false;
        }
        field(29; "MP City"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.City where("No." = field(Physician)));
            Editable = false;
        }
        field(30; "MP Country"; Code[10])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Country/Region Code" where("No." = field(Physician)));
            Editable = false;
        }
        field(31; "MP E-Mail"; Text[100])
        {

        }
        field(32; "MP Declaration Date"; Date)
        {

        }
        field(33; "Athlete Declaration Date"; Date)
        {

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        TUESetup.Get();
        TUESetup.TestField("TUE Application Nos");
    //    NoSeriesMgmt.InitSeries(TUESetup."TUE Application Nos", xRec."No. Series", 0D, "No.", "No. Series");
                  "No." := NoSeriesMgmt.GetNextNo(TUESetup."TUE Application Nos", WorkDate(), true);

        Rec."Document Date" := Today;
    end;

    var
        TUESetup: Record "TUE Setup";
        NoSeriesMgmt: Codeunit "No. Series";

    Procedure PreviousApplication(DocNo: Code[20]): Boolean
    var
        TUEHeader: Record "TUE Application Header";
        TUEHeader1: Record "TUE Application Header";
    begin
        TUEHeader.Reset();
        TUEHeader.SetRange("No.", DocNo);
        if TUEHeader.FindFirst() then begin
            TUEHeader1.Reset();
            TUEHeader1.SetFilter("No.", '<>%1', TUEHeader."No.");
            TUEHeader1.SetRange("Customer No.", TUEHeader."Customer No.");
            if TUEHeader1.FindFirst() then
                exit(true)
            else
                exit(false);
        end;
    end;
}
