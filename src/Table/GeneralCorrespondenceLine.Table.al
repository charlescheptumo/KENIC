#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50084 "General Correspondence Line"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Memo,Letter';
            OptionMembers = " ",Memo,Letter;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Recipient No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Recipient Type" = const("Actioning officer"),
                                Type = const(Internal)) Employee."No." where(Status = const(Active))
            else if ("Recipient Type" = const(Office),
                                         Type = const(Internal)) "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate | "Department/Center" | Region))
            else if (Type = const(External),
                                                  "Recipient Type" = const("Actioning officer")) "Correspondence Contact".No where(Type = const(Individual))
            else if (Type = const(External),
                                                           "Recipient Type" = const(Office)) "Correspondence Contact".No where(Type = const(Company));

            trigger OnValidate()
            begin
                if Type = Type::Internal then begin
                    if "Recipient Type" = "recipient type"::"Actioning officer" then begin
                        Employee.Reset;
                        Employee.SetRange(Employee."No.", "Recipient No");
                        if Employee.FindSet then begin
                            "Recipient No" := Employee."No.";
                            "Recipient Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            "Recipient Email" := Employee."E-Mail";
                            "Recipient Directorate Code" := Employee."Directorate Code";
                            Validate("Recipient Directorate Code");
                            "Recepient Region Code" := Employee."Global Dimension 1 Code";
                            Validate("Recepient Region Code");
                            "Recipient Department Code" := Employee."Department Code";
                            Validate("Recipient Department Code");
                            "Recipient Job ID" := Employee."Job ID";
                            Validate("Recipient Job ID");
                            "Recipient Address" := Employee.Address;
                            "Recipient Address 2" := Employee."Address 2";
                            "Recipient City" := Employee.City;
                            "Recipient Post Code" := Employee."Post Code";
                            Position := Employee."Job Title";
                        end;
                    end
                    else begin
                        ResponsibilityCenter.Reset;
                        ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recipient No");
                        if ResponsibilityCenter.FindSet then begin
                            "Recipient No" := ResponsibilityCenter.Code;
                            "Recipient Name" := ResponsibilityCenter.Name;
                            "Recipient Email" := ResponsibilityCenter."E-Mail";
                            "Recipient Address" := ResponsibilityCenter.Address;
                            "Recipient Address 2" := ResponsibilityCenter."Address 2";
                            "Recipient Post Code" := ResponsibilityCenter."Post Code";
                            "Recipient Job ID" := ResponsibilityCenter."Headed By (Title)";
                            Validate("Recipient Job ID");
                        end;
                    end;
                end;
                if Type = Type::External then begin
                    CorrespondenceContact.Reset;
                    CorrespondenceContact.SetRange(CorrespondenceContact.No, "Recipient No");
                    if CorrespondenceContact.FindSet then begin
                        "Recipient No" := CorrespondenceContact.No;
                        "External Stakeholder Name" := CorrespondenceContact."Company Name";
                        "External Contact Person" := CorrespondenceContact."Contact PersonTitle";
                        "External Stakeholder Email" := CorrespondenceContact."E-mail";
                        "External Stakeholder Address" := CorrespondenceContact.Address;
                        "External Stakeholder Address 2" := CorrespondenceContact."Address 2";
                        "External Stakeholder Phone No" := CorrespondenceContact."Phone No";
                        "External Stakeholder City" := CorrespondenceContact.City;
                        "External Stakeholder Post Code" := CorrespondenceContact."Post Code";
                    end;
                end;
                //END;
            end;
        }
        field(6; "Recipient Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Recipient Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(8; "Recipient Directorate Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recipient Directorate Code");
                if ResponsibilityCenter.FindSet then begin
                    "Recipient Directorate Name" := ResponsibilityCenter.Name;
                    "Recipient Directorate Email" := ResponsibilityCenter."E-Mail";
                end;
            end;
        }
        field(9; "Recipient Directorate Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Recipient Directorate Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Recepient Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recepient Region Code");
                if ResponsibilityCenter.FindSet then begin
                    "Recepient Region Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(12; "Recepient Region Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Recipient Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recipient Department Code");
                if ResponsibilityCenter.FindSet then begin
                    "Recipient Department Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(14; "Recipient Department Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Recipient Job ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange(Positions."Position ID", "Recipient Job ID");
                if Positions.FindSet then
                    "Recipient Job Title" := Positions."Job Title";
            end;
        }
        field(16; "Recipient Job Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Recipient Address"; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(18; "Recipient Address 2"; Text[500])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(19; "Recipient City"; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(20; "Recipient Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(21; "External Stakeholder Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code".Code;

            trigger OnValidate()
            begin
                PostCode.Reset;
                PostCode.SetRange(PostCode.Code, "External Stakeholder Post Code");
                if PostCode.FindSet then begin
                    "External Stakeholder City" := PostCode.City;
                end;
            end;
        }
        field(22; "External Stakeholder Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "External Stakeholder Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "External Stakeholder Address 2"; Code[500])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "External Stakeholder Phone No"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "External Stakeholder Email"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "External Stakeholder City"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Recipient Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Actioning officer,Office';
            OptionMembers = "Actioning officer",Office;
        }
        field(29; "Sender Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Communication Subject"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "External Reference No"; Code[500])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "External Contact Person"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(33; Status; Option)
        {
            CalcFormula = lookup("General Correspondence Header".Status where("Document No" = field("Document No"),
                                                                               "Document Type" = field("Document Type"),
                                                                               Type = field(Type)));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Editable = false;
        }
        field(34; "Notification Type"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Receipient;
            OptionCaption = 'Receipient,CC';
            OptionMembers = Receipient,CC;
        }
        field(35; Position; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", Type, "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        GeneralCorrespondenceHeader.Reset;
        GeneralCorrespondenceHeader.SetRange(GeneralCorrespondenceHeader."Document No", "Document No");
        GeneralCorrespondenceHeader.SetRange(GeneralCorrespondenceHeader."Document Type", "Document Type");
        GeneralCorrespondenceHeader.SetRange(GeneralCorrespondenceHeader.Type, Type);
        if GeneralCorrespondenceHeader.FindSet then begin
            "Sender Name" := GeneralCorrespondenceHeader."Sender Name";
            "Communication Subject" := GeneralCorrespondenceHeader."Communication Subject";
            "External Reference No" := GeneralCorrespondenceHeader."External Reference No";
        end;
    end;

    var
        Employee: Record Employee;
        ResponsibilityCenter: Record "Responsibility Center";
        Contact: Record Contact;
        Positions: Record Positions;
        PostCode: Record "Post Code";
        CorrespondenceContact: Record "Correspondence Contact";
        GeneralCorrespondenceHeader: Record "General Correspondence Header";
}

