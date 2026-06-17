#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50034 "tableextension50034" extends "Standard Vendor Purchase Code"
{
    fields
    {
        modify("Vendor No.")
        {
            TableRelation = if ("Supplier Type" = const("Prequalified Supplier")) "Vendor Prequalification Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("Registered Supplier")) "Vendor Registration Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("External Supplier")) "Vendor External  Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"));


            trigger OnAfterValidate()
            begin

                Vend.RESET;
                Vend.SETRANGE("No.", "Vendor No.");
                IF Vend.FINDSET THEN BEGIN
                    Vend.TESTFIELD("E-Mail");
                    "Vendor Name" := Vend.Name;
                    "Primary Email" := Vend."E-Mail";
                END;

                IF "Code" = '' THEN
                    //      EXIT;
                    //   StdPurchCode.GET(Code);
                    //  Description := StdPurchCode.Description;
                    "IFS Code" := Code;

            end;

        }
        modify(Code)
        {
            trigger OnAfterValidate()
            var
                StandardPurchaseCode: Record "Standard Purchase Code";
            begin
                StandardPurchaseCode.Reset();
                StandardPurchaseCode.SetRange(Code, Rec.Code);
                if StandardPurchaseCode.FindFirst() then
                    Rec.Validate("Procurement Category", StandardPurchaseCode."Procurement Category ID");
            end;
        }

        field(50000; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(50001; "Bid No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Vendor Name"; Text[100])
        {
        }
        field(50003; "Primary Email"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(50004; "Positive Intent To Bid"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is updated based on the invited bidder''s acknowledgement of their intent to participate in the IFS';
        }
        field(50005; "Invitation Email Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "No. of Posted Addendum Notices"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50008; "Posted Addendum Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Last Posted Addendum Notice No.';
        }
        field(50009; "Bid Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(50010; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Prebid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(50013; "Prebid Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Bid Opening Register No."; Code[10])
        {
            Caption = 'Bid Opening Register No.  (Technical)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Technical)';
            TableRelation = "Bid Opening Register".Code;
        }
        field(50015; "Bid Opening Date (Technical)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Withdrawn Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Bid Withdrawal Notice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Modified Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Bid Opening Result"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Bid Opening Committee Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            DataClassification = ToBeClassified;
            Description = 'Preliminary Evaluation Register No.';
        }
        field(50023; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "Preliminary Evaluation Outcome"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Preminary Evaluation Committee"; Text[100])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(50026; "Technical Evaluation Reg"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Technical Evaluation Register No.';
        }
        field(50027; "Technical Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Min Weighted Tech Pass Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum Weighted Tech Pass Score %';
        }
        field(50029; "Weighted Technical  Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Technical Evaluation  Outcome"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50031; "Evaluation Committee Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Technical Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Technical Evaluation)';
        }
        field(50032; "Technical Evaluation Committee"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50033; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(50034; "Bid Opening Date (Financial)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50035; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            DataClassification = ToBeClassified;
            Description = 'Financial Evaluation Register No';
        }
        field(50036; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50038; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50039; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50041; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = ToBeClassified;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(50042; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = ToBeClassified;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(50043; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50044; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50045; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(50046; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50048; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(50049; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50050; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(50051; "Final Evaluation Report"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50052; "Final Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50053; "Professional Opion ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code;
        }
        field(50054; "Professional Opion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50055; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50056; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(50057; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(50058; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50059; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Prequalified Supplier,Registered Supplier,External Supplier';
            OptionMembers = " ","Prequalified Supplier","Registered Supplier","External Supplier";
        }
        field(50060; "Procurement Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
        }
        field(50061; "Passed Tech Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50062; "Passed Preliminary  Evaluation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50063; "Responsive Bid"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50064; "Tech Evaluation Ranking"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50065; "Valid Bid Security Provided"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(50066; "Bid Security Issuer"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(50067; "Bid Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(50068; "Bid Security Amount Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Uneditable field where the system checks whether the submitted bid meets the Bid amount requirements. If bid amount submitted is less than the expected amount, the system shall mark this entry as Fail';
        }
        field(50069; "Complete Bid Doc Submitted"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Completenesss is checked in terms of No. of copies submitted, Separation of proposals etc';
        }
        field(50070; "Late Bid Submission Time"; Time)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is only completed for bids marked as LATE.';
        }
        field(50071; "Bid Opening Ranking"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50072; "Assigned Bid No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50073; "Bid Sum 1(LCY)"; Decimal)
        {
        }
        field(50074; "Bid Sum 2(LCY)"; Decimal)
        {
        }
        field(50075; Responded; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50076; "Supplier No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Supplier Type" = const("Prequalified Supplier")) "Vendor Prequalification Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("Registered Supplier")) "Vendor Registration Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"))
            else
            if ("Supplier Type" = const("External Supplier")) "Vendor External  Entry"."Vendor No." where("Procurement Category Code" = field("Procurement Category"));


            trigger OnValidate()
            begin

                Vend.RESET;
                Vend.SETRANGE("No.", "Vendor No.");
                IF Vend.FINDSET THEN BEGIN
                    Vend.TESTFIELD("E-Mail");
                    "Vendor Name" := Vend.Name;
                    "Primary Email" := Vend."E-Mail";
                END;

                IF rec."Code" = '' THEN
                    //   CC  //     EXIT;
                    // StdPurchCode.GET(Code);
                    //   Description := StdPurchCode.Description;
                    "IFS Code" := rec.Code;

            end;

        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Vendor No.",Code(Key)".
        // 
        // key(Key1;"Vendor No.","Code","Procurement Category","Supplier Type")
        // {
        // Clustered = true;
        // }
    }

    var
        Vend: Record Vendor;
        StdPurchCode: Record 175;
}

