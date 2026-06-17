#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Table 70043 "Annual Disposal plan Header"
{

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created By"; Code[1000])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,New,Pending Approval,Approved,Rejected';
            OptionMembers = Open,New,"Pending Approval",Approved,Rejected;
            Editable = false;
        }
        field(10; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approved,Revised,Sublimentary';
            OptionMembers = Approved,Revised,Sublimentary;
        }
        field(11; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Budget Plan Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Echequer Job ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(15; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                financialYear.Reset;
                financialYear.SetRange(financialYear.Code, "Financial Year Code");
                if financialYear.FindSet then begin
                    "Start Date" := financialYear."Starting Date";
                    "End Date" := financialYear."Ending Date";
                end
            end;
        }
        field(16; "Disposal Catetory"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Functional Disposal,Consolidated Disposal';
            OptionMembers = "Functional Disposal","Consolidated Disposal";
        }
        field(17; "Consolidate Disposal Plan"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Disposal plan Header".No where("Disposal Catetory" = const("Consolidated Disposal"));
        }
        field(18; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(21; "Disposal Committee"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Disposal Committee';
            TableRelation = "IFS Tender Committee"."Document No.";

            trigger OnValidate()
            begin

                BidCommitte.Reset();
                BidCommitte.SetRange("Document No.", Rec."No");
                if BidCommitte.FindSet() then begin
                    BidCommitte.DeleteAll();
                end;

                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", "Disposal Committee");
                if IFSTenderCommitte.FindSet then begin
                    repeat
                        BidCommitte.Init;
                        BidCommitte."Document No." := IFSTenderCommitte."Document No.";
                        BidCommitte."Line No" := IFSTenderCommitte."Line No";
                        BidCommitte."Appointed Bid Opening Com" := "Disposal Committee";
                        BidCommitte."Role Type" := IFSTenderCommitte.Role;
                        BidCommitte."Member No." := IFSTenderCommitte."Member No.";
                        BidCommitte."Member Name" := IFSTenderCommitte."Member Name";
                        BidCommitte.Designation := IFSTenderCommitte.Designation;
                        BidCommitte."ID/Passport No" := IFSTenderCommitte."ID/Passport No";
                        BidCommitte."Tax Registration (PIN) No." := IFSTenderCommitte."Tax Registration (PIN) No.";
                        BidCommitte.Email := IFSTenderCommitte."Member Email";
                        BidCommitte."Telephone No." := IFSTenderCommitte."Telephone No.";
                        BidCommitte."Staff  No." := IFSTenderCommitte."Staff  No.";
                        BidCommitte."IFS Code" := IFSTenderCommitte."IFS Code";
                        BidCommitte.Insert(true);

                    until IFSTenderCommitte.Next = 0;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Disposal Catetory" = "disposal catetory"::"Consolidated Disposal" then begin
            if No = '' then begin
                ProcurementSetup.Get;
                ProcurementSetup.TestField("Disposal Plan Nos");
                 rec."No" := NoSeriesMgt.GetNextNo(ProcurementSetup."Disposal Plan Nos", WorkDate(), true);
            end;
        end;

        if "Disposal Catetory" = "disposal catetory"::"Functional Disposal" then begin
            if No = '' then begin
                ProcurementSetup.Get;
                ProcurementSetup.TestField("Functional Disposal Plan Nos");
                  rec."No" := NoSeriesMgt.GetNextNo(ProcurementSetup."Functional Disposal Plan Nos", WorkDate(), true);
            end;
        end;

        "Created By" := UserId;
        "Time Created" := Time;
        "Date Created" := Today;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        ProcurementSetup: Record "Procurement Setup";
        financialYear: Record "Financial Year Code";
        IFSTenderCommitte: Record "IFS Tender Committee Member";
        BidCommitte: Record "Bid Opening Tender Committee";
}
