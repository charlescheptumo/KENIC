#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50080 "General Correspondence Header"
{
    Caption = 'General Correspondences Header';
    // DrillDownPageID = "Daily Patrol Other Activities";
    // LookupPageID = "Daily Patrol Other Activities";

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Memo,Letter';
            OptionMembers = " ",Memo,Letter;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Memo then begin
                    Type := Type::Internal;
                end;
                Validate(Type);
            end;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4; "Sender No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", "Sender No");
                if Employee.FindSet then begin
                    "Sender No" := Employee."No.";
                    "Sender Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Sender Email" := Employee."E-Mail";
                    "Sender Directorate Code" := Employee."Directorate Code";
                    Validate("Sender Directorate Code");
                    "Sender Region Code" := Employee."Global Dimension 1 Code";
                    Validate("Sender Region Code");
                    "Sender Department Code" := Employee."Department Code";
                    Validate("Sender Department Code");
                    "Sender Job ID" := Employee."Job ID";
                    Validate("Sender Job ID");
                    "Signatory User ID" := Employee."User ID";
                end;
            end;
        }
        field(5; "Sender Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Sender Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Recipient No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
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
                end;
            end;
        }
        field(8; "Recipient Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Recipient Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Sender Directorate Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Sender Directorate Code");
                if ResponsibilityCenter.FindSet then begin
                    "Sender Directorate Name" := ResponsibilityCenter.Name;
                    "Sender Directorate Email" := ResponsibilityCenter."E-Mail";
                end;
            end;
        }
        field(11; "Sender Directorate Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Sender Directorate Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Recipient Directorate Code"; Code[20])
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
        field(14; "Recipient Directorate Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Recipient Directorate Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "External Stakeholder Post Code"; Code[20])
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
        field(17; "External Stakeholder Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "External Stakeholder Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "External Stakeholder Address 2"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "External Stakeholder Phone No"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "External Stakeholder Email"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                UserSetup.Reset();
                UserSetup.SetRange("User ID", "Created By");
                if UserSetup.find('-') then begin
                    "Creator No" := UserSetup."Employee No.";
                end;
            end;
        }
        field(23; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved,Signed';
            OptionMembers = Open,"Pending Approval",Approved,Signed;
        }
        field(25; Sent; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "External Reference No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Sender Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Sender Region Code");
                if ResponsibilityCenter.FindSet then begin
                    "Sender Region Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(30; "Communication Subject"; Text[1020])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Recepient Region Code"; Code[20])
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
        field(32; "Recepient Region Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Sender Region Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Communication Content"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Sender Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Sender Department Code");
                if ResponsibilityCenter.FindSet then begin
                    "Sender Department Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(36; "Sender Department Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37; "Recipient Department Code"; Code[20])
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
        field(38; "Recipient Department Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "Sender Job ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange(Positions."Position ID", "Sender Job ID");
                if Positions.FindSet then
                    "Sender Job Title" := Positions."Job Title";
            end;
        }
        field(40; "Sender Job Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41; "Recipient Job ID"; Code[50])
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
        field(42; "Recipient Job Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(43; "To all Staff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*GeneralCorrespondenceLine.RESET;
                GeneralCorrespondenceLine.SETRANGE(GeneralCorrespondenceLine."Document No","Document No");
                GeneralCorrespondenceLine.SETRANGE(GeneralCorrespondenceLine."Document Type","Document Type");
                GeneralCorrespondenceLine.SETRANGE(GeneralCorrespondenceLine.Type,Type);*/
                if "To all Staff" = true then begin
                    GeneralCorrespondenceLine.Init;
                    GeneralCorrespondenceLine."Entry No" := GeneralCorrespondenceLine.Count + 1;
                    GeneralCorrespondenceLine."Document No" := "Document No";
                    GeneralCorrespondenceLine."Document Type" := "Document Type";
                    GeneralCorrespondenceLine.Type := Type;
                    GeneralCorrespondenceLine."Recipient Type" := GeneralCorrespondenceLine."recipient type"::Office;
                    GeneralCorrespondenceLine."Recipient No" := '000';
                    GeneralCorrespondenceLine."Recipient Name" := 'To All Staff';
                    GeneralCorrespondenceLine.Insert(true);
                end;

            end;
        }
        field(44; Approved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "External Stakeholder City"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Rejection Comments"; Text[1020])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Rejected By"; Code[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(48; "Current Approver"; Code[200])
        {
            CalcFormula = lookup("General Correspond Approval"."User ID" where("Document No" = field("Document No"),
                                                                                "Document Type" = field("Document Type"),
                                                                                Type = field(Type),
                                                                                Status = const(Open)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(49; "Signed By"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Recipient Address"; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(51; "Recipient Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(52; "Recipient City"; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(53; "Recipient Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(54; "Communication Content2"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Communication Content3"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Communication Content4"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Communication Content5"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Communication Content6"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Communication Content7"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Communication Content8"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Communication Content9"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Communication Content10"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Creator No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // Editable = false;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", "Sender No");
                if Employee.FindSet then begin
                    "Sender No" := Employee."No.";
                    "Sender Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Sender Email" := Employee."E-Mail";
                    "Sender Directorate Code" := Employee."Directorate Code";
                    Validate("Sender Directorate Code");
                    "Sender Region Code" := Employee."Global Dimension 1 Code";
                    Validate("Sender Region Code");
                    "Sender Department Code" := Employee."Department Code";
                    Validate("Sender Department Code");
                    "Sender Job ID" := Employee."Job ID";
                    Validate("Sender Job ID");
                end;
            end;
        }
        field(64; "Creator Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65; "Creator Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(66; "Creator Directorate Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Sender Directorate Code");
                if ResponsibilityCenter.FindSet then begin
                    "Sender Directorate Name" := ResponsibilityCenter.Name;
                    "Sender Directorate Email" := ResponsibilityCenter."E-Mail";
                end;
            end;
        }
        field(67; "Creator Directorate Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(68; "Creator Directorate Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(69; "Creator Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Sender Region Code");
                if ResponsibilityCenter.FindSet then begin
                    "Sender Region Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(70; "Creator Region Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Creator Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Sender Department Code");
                if ResponsibilityCenter.FindSet then begin
                    "Sender Department Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(72; "Creator Department Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(73; "Creator Job ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange(Positions."Position ID", "Sender Job ID");
                if Positions.FindSet then
                    "Sender Job Title" := Positions."Job Title";
            end;
        }
        field(74; "Creator Job Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(75; Salutation; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Submitted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(77; "Urgency Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Normal,Urgency';
            OptionMembers = Normal,Urgency;
        }
        field(78; "Incoming Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Linked to Incoming Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Authorization Remarks"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(81; "Signatory User ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(82; "Requires Authorization"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(83; "Authorized By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(84; "Authorizaion Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(85; "On behalf Of No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", "On behalf Of No");
                if Employee.FindSet then begin
                    "On behalf Of No" := Employee."No.";
                    "On behalf Of Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "On behalf Of Job ID" := Employee."Job ID";
                    Validate("On behalf Of Job ID");
                end;
            end;
        }
        field(86; "On behalf Of Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(87; "On behalf Of Job ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange(Positions."Position ID", "On behalf Of Job ID");
                if Positions.FindSet then
                    "On behalf Of Job Title" := Positions."Job Title";
            end;
        }
        field(88; "On behalf Of Job Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(89; Delegated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Division Code"; Code[250])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Division/Section"));
        }
        field(91; "Department Code"; Code[250])
        {
            // TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"), "Direct Reports To" = field("Division Code"));
            // TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
            TableRelation = "Memo Departments".Code where("Directorate" = Field("Directorate Code"));
        }
        field(92; "Section Code"; Code[250])
        {
            // TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"), "Direct Reports To" = field("Division Code"));
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Section));
        }
        field(93; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(94; "Type of Memo"; Option)
        {
            OptionCaption = ' ,Internal,EAP';
            OptionMembers = " ",Internal,EAP;
        }
        field(95; "Letter Type"; Option)
        {
            OptionCaption = ' ,Letter EAP,Letter Staff';
            OptionMembers = " ","Letter EAP","Letter Staff";
        }
        field(96; "Rich Text"; Blob)
        {

        }
        field(97; "Department SubType"; Code[2048])
        {
            DataClassification = ToBeClassified;
            // TableRelation = if ("Department Code" = const('ADM')) "Administration Dept Lookup Buf"
            // else if ("Department Code" = const('AUDIT')) "Audit Dept Lookup Buffer"
            // else if ("Department Code" = const('CC')) "Corporate Communication Buffer"
            // else if ("Department Code" = const('CS')) "Corporate Dept Lookup Buffer"
            // else if ("Department Code" = const('EAP')) "EAP Personnel Lookup Buffer"
            // else if ("Department Code" = const('CON')) "Consultancy Dept Lookup Buffer"
            // else if ("Department Code" = const('EB')) "Education Dept Lookup Buffer"
            //  else if ("Department Code" = const('E-L')) "E-Learning Dept Lookup Buffer"
            //   else if ("Department Code" = const('EM')) "Educational Media Dept Lookup"
            //    else if ("Department Code" = const('ER')) "Educational Resources Dept"
            // else if ("Department Code" = const('F&A')) "Finance Dept Lookup Buffer"
            // else if ("Department Code" = const('HRM&D')) "Human Cap Dept Lookup Buffer"
            // else if ("Department Code" = const('ICT')) "ICT Dept Lookup Buffer"
            // else if ("Department Code" = const('LS')) "Legal Dept Lookup Buffer"
            // else if ("Department Code" = const('PL')) "Planning Dept Lookup Buffer"
            // else if ("Department Code" = const('P&P')) "Print & Publishing Dept Lookup"
            // else if ("Department Code" = const('PRE_PRI')) "Pre-Primary Dept Lookup"
            // else if ("Department Code" = const('PRQAS')) "Planning & Research Dept"
            // else if ("Department Code" = const('QA')) "Quality Assurance Dept"
            // else if ("Department Code" = const('RKM')) "Research Knowledge Dept Lookup"
            // else if ("Department Code" = const('SEC')) "Secondary Dept Lookup Buffer"
            // else if ("Department Code" = const('SNE & A')) "Planning Dept Lookup Buffer"
            // else if ("Department Code" = const('TE')) "Teacher Education Dept Lookup"
            // else if ("Department Code" = const('TS')) "Teacher Services Dept Lookup"
            // else if ("Department Code" = const('TVET')) "Tech Voc Dept Lookup"
            // else if ("Department Code" = const('PERSONNEL')) "Personnel Dept Lookup Buffer"
            // else if ("Department Code" = const('PROJECT')) "Project Files Lookup Buffer"
            // else if ("Department Code" = const('SCM')) "SCM Dept Lookup Buffer"
            // else if ("Department Code" = const('STANDARDS')) "Standards Dept Lookup Buffer"
            // else if ("Department Code" = const('TRANSPORT')) "Transport Dept Lookup Buffer"
            // else if ("Letter Type" = filter('Letter EAP')) "EAP Personnel Lookup Buffer"
            // else if ("Letter Type" = filter('Letter Staff')) "Personnel Dept Lookup Buffer";
            TableRelation = "Subtype Categories" where("File Category Code" = field("Department Code"));
        }
        field(98; "Employee Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Open,Confidential,Department;
        }
        field(99; "Directorate Code"; Code[250])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Directorate"));
        }
        field(100; "Sub Category"; Code[250])
        {
            TableRelation = "Memo subtypeII".Subtype where(Code = field("Department Subtype"));
        }

    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No", "Sender Name")
        {

        }
    }

    trigger OnInsert()
    begin
        Status := Status::Open;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);

        // if "Document No" = '' then begin
        //     HumanResourcesSetup.Get();
        //     HumanResourcesSetup.TestField("General Correspondences Nos");
        //     NoSeriesManagement.InitSeries(HumanResourcesSetup."General Correspondences Nos", xRec."No. Series", Today, "Document No", "No. Series");
        // end;
        /*UserSetup.RESET;
        UserSetup.SETRANGE(UserSetup."User ID","Created By");
        IF UserSetup.FINDFIRST THEN BEGIN
          IF NOT UserSetup."Portal User" THEN BEGIN
          UserSetup.TESTFIELD("Employee No.");
          Employee.RESET;
          Employee.SETRANGE(Employee."No.",UserSetup."Employee No.");
          IF Employee.FINDFIRST THEN BEGIN
            "Sender No":=Employee."No.";
            "Sender Name":=Employee."First Name"+' ' +Employee."Middle Name"+' '+Employee."Last Name";
            "Sender Email":=Employee."E-Mail";
            "Sender Directorate Code":=Employee."Directorate Code";
            "Sender Region Code":=Employee."Global Dimension 1 Code";
            "Sender Department Code":=Employee."Department Code";
            "Sender Job ID":=Employee."Job ID";
            "Sender Job Title":=Employee."Job Title";
            END;
            END;
            END;*/

        UserSetup.Reset;
        UserSetup.SetRange(UserSetup."User ID", "Created By");
        if UserSetup.FindFirst() then begin
            if not UserSetup."Portal User" then begin
                UserSetup.TestField("Employee No.");
                Employee.Reset;
                Employee.SetRange(Employee."No.", UserSetup."Employee No.");
                if Employee.FindFirst() then begin
                    "Creator No" := Employee."No.";
                    "Creator Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Creator Email" := Employee."E-Mail";
                    "Creator Directorate Code" := Employee."Directorate Code";
                    "Creator Region Code" := Employee."Global Dimension 1 Code";
                    "Creator Department Code" := Employee."Department Code";
                    "Creator Job ID" := Employee."Job ID";
                    "Creator Job Title" := Employee."Job Title";
                end;
            end;
        end else begin
            UserSetup.Reset;
            UserSetup.SetRange("Portal User", true);
            UserSetup.SetRange("Employee No.", "Sender No");
            if UserSetup.FindFirst() then begin
                begin
                    UserSetup.TestField("Employee No.");
                    Employee.Reset;
                    Employee.SetRange(Employee."No.", UserSetup."Employee No.");
                    if Employee.FindFirst() then begin
                        "Creator No" := Employee."No.";
                        "Creator Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Creator Email" := Employee."E-Mail";
                        "Creator Directorate Code" := Employee."Directorate Code";
                        "Creator Region Code" := Employee."Global Dimension 1 Code";
                        "Creator Department Code" := Employee."Department Code";
                        "Creator Job ID" := Employee."Job ID";
                        "Creator Job Title" := Employee."Job Title";
                    end;
                end;
            end;
            /*GeneralCorrespondenceHeader.RESET;
            GeneralCorrespondenceHeader.SETRANGE(GeneralCorrespondenceHeader."Creator No","Creator No");
            GeneralCorrespondenceHeader.SETRANGE(GeneralCorrespondenceHeader.Status,GeneralCorrespondenceHeader.Status::Open);
            IF GeneralCorrespondenceHeader.FINDSET THEN BEGIN
            ERROR('You have a draft General Correspondence Card Document No %1, Please use all draft documents before creating a new record',GeneralCorrespondenceHeader."Document No");
            END;*/

        end;
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        Stakeholder: Record Stakeholder;
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit "No. Series";
        InternalProjectResource: Record "Internal Project Resource";
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        Positions: Record Positions;
        PostCode: Record "Post Code";
        GeneralCorrespondenceLine: Record "General Correspondence Line";
        GeneralCorrespondenceHeader: Record "General Correspondence Header";

    procedure GetRichText(): Text
    var
        InStream: Instream;
        TextValue: Text;
    begin
        Rec.CalcFields(Rec."Rich Text");
        Rec."Rich Text".CreateInStream(InStream);
        InStream.Read(TextValue);

        exit(TextValue);
    end;

    procedure SaveRichText(RichText: Text)
    var
        OutStream: OutStream;
    begin
        Rec."Rich Text".CreateOutStream(OutStream);
        OutStream.Write(RichText);
        Rec.Modify();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var GeneralCorrespondenceHeader: Record "General Correspondence Header"; xGeneralCorrespondenceHeader: Record "General Correspondence Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEditType(var GeneralCorrespondenceHeader: Record "General Correspondence Header"; xGeneralCorrespondenceHeader: Record "General Correspondence Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;
}

