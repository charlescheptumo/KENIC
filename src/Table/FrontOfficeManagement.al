#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60025 "Front Office Management"
{
    // DrillDownPageID = UnknownPage60045;
    // LookupPageID = UnknownPage60045;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document Type" = "Document type"::Complaints then begin
                    if "No." <> xRec."No." then
                        NoseriesMgt.TestManual(CRMSetup."Complaints No.");
                end;

                if "Document Type" = "Document type"::Complements then begin
                    if "No." <> xRec."No." then
                        NoseriesMgt.TestManual(CRMSetup."Compliments No.");

                end;

                if "Document Type" = "Document type"::Feedback then begin
                    if "No." <> xRec."No." then
                        NoseriesMgt.TestManual(CRMSetup."Feedback No.");
                end;

                if "Document Type" = "Document type"::Enquiries then begin
                    if "No." <> xRec."No." then
                        NoseriesMgt.TestManual(CRMSetup."Enquiries No.");
                end;
                // if "Document Type" = "Document type"::Whistle then begin
                //     if "No." <> xRec."No." then
                //         NoseriesMgt.TestManual(CRMSetup."Whistle No.");
                // end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Complaints,Complements,Feedback,Enquiries,Whistle';
            OptionMembers = " ",Complaints,Complements,Feedback,Enquiries,Whistle;
        }
        field(3; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Time; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Received From"; Text[1000])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "User Setup"."User Id";

            // trigger OnValidate()
            // var
            //     UserSet: Record "User Setup";
            //     Emp: Record Employee;
            // begin
            //     UserSet.Get(UserId);
            //     "Received From" := UserId;
            //     Email := UserSet."E-Mail";

            //     Emp.Reset();
            //     Emp.SetRange("User ID", Emp."User ID");
            //     if Emp.Find('-') then begin
            //         "Phone Number" := Emp."Phone No.";
            //         Gender := Emp.Gender1;
            //         Location := Emp.Address;
            //     end;
            // end;

        }
        field(6; Email; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Phone Number"; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Customer Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Group &  Mode";
        }
        field(9; "Mode of Lodging"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Lodge Modes".Code;
        }
        field(10; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
            Description = '// Amos --> Increased Field to allow more text';
        }
        field(11; "Services Sought"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Services Sought"."Service Name";
        }
        field(12; "Case Location"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Court,DCI,EACC,AG,ODPP,OMBD,Other Agencies';
            OptionMembers = " ",Court,DCI,EACC,AG,ODPP,OMBD,"Other Agencies";
        }
        field(13; Recommendations; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Follow up Actions"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Assigned,Resolved,Closed,Escalated';
            OptionMembers = Open,Assigned,Resolved,Closed,Escalated;
        }
        field(16; "Assigned Officer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Assign To" = filter(Staff)) Employee."No." where("Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                                 "Chief Executive Officer" = const(false),
                                                                                 HOD = const(false))
            else if ("Assign To" = filter(CEO)) Employee."No." where("Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                                                                                         "Chief Executive Officer" = const(true))
            else if ("Assign To" = filter(HOD)) Employee."No." where("Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                                                                                                                                                 HOD = const(true));

            trigger OnValidate()
            begin
                if UserSetup.Get("Assigned Officer No.") then begin
                    "Assigned Officer Email" := UserSetup."E-Mail";
                    "Assigned Officer Name" := UserSetup."Employee Name";
                end;
                if Employee.Get("Assigned Officer No.") then begin
                    "Assigned Officer Email" := Employee."E-Mail";
                    if Employee."E-Mail" = '' then
                        "Assigned Officer Email" := Employee."Company E-Mail";
                    "Assigned Officer Name" := Employee.FullName;
                end;
            end;
        }
        field(17; "Assigned Officer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Assigned Officer Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Level of Priority"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,High,Normal,Low';
            OptionMembers = " ",High,Normal,Low;
        }
        field(20; "Submitted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Date Submitted"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Time Submitted"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(25; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Turn Around Time"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Entity Involved"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Receive Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Resolved User"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(30; "Resolved Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Resolved Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Date of Escalation"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Time of Escalation"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Date Resolved"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Turn Around Time" := "Date Resolved" - Date;
            end;
        }
        field(35; "Time Resolved"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Escalated User Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(37; UserNo; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38; Comments; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            // Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(40; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            // Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                Employee.Reset;

                Emp.Reset;
                Emp.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                if "Assign To" = "assign to"::HOD then
                    Emp.SetRange(Emp.HOD, true);
                if Emp.FindFirst then begin
                    "Assigned Officer No." := Emp."No.";
                    "Assigned Officer Name" := Emp.FullName;
                    "Assigned Officer Email" := Emp."Company E-Mail";
                end;
            end;
        }
        field(41; "Assigned to Department"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Assigned to Staff"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43; Subject; Text[55])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Assign To"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '....,Staff,HOD,CEO,Legal';
            OptionMembers = "....",Staff,HOD,CEO,Legal;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Whistle then begin
                    if not (("Assign To" = "assign to"::CEO) or ("Assign To" = "assign to"::Legal)) then
                        Error('Whistle Blowing can only be assigned to CEO and/or Head of legal');
                end;
                if "Assign To" = "assign to"::CEO then begin
                    Emp.Reset;
                    Emp.SetRange(Emp."Chief Executive Officer", true);
                    if Emp.FindFirst then begin
                        "Assigned Officer No." := Emp."No.";
                        "Assigned Officer Name" := Emp.FullName;
                        "Assigned Officer Email" := Emp."Company E-Mail";
                        "Global Dimension 2 Code" := 'CEO';
                        Validate("Global Dimension 2 Code");
                    end;
                end;
                if "Assign To" = "assign to"::Legal then begin
                    "Global Dimension 2 Code" := 'LE';
                    Validate("Global Dimension 2 Code");
                    Emp.Reset;
                    Emp.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                    Emp.SetRange(Emp.HOD, true);
                    if Emp.FindFirst then begin
                        "Assigned Officer No." := Emp."No.";
                        "Assigned Officer Name" := Emp.FullName;
                        "Assigned Officer Email" := Emp."Company E-Mail";
                    end;
                end;
            end;
        }
        field(45; "Currently Assigned Officer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin

                if Employee.Get("Currently Assigned Officer No.") then begin
                    "Current Assigned Officer Name" := Employee.FullName;
                end;
            end;
        }
        field(46; "Current Assigned Officer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Currently Assign To"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '....,Staff,HOD,CEO,Legal';
            OptionMembers = "....",Staff,HOD,CEO,Legal;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Whistle then begin
                    if not (("Assign To" = "assign to"::CEO) or ("Assign To" = "assign to"::Legal)) then
                        Error('Whistle Blowing can only be assigned to CEO and/or Head of legal');
                end;
                if "Assign To" = "assign to"::CEO then begin
                    Emp.Reset;
                    Emp.SetRange(Emp."Chief Executive Officer", true);
                    if Emp.FindFirst then begin
                        "Assigned Officer No." := Emp."No.";
                        "Assigned Officer Name" := Emp.FullName;
                        "Assigned Officer Email" := Emp."Company E-Mail";
                        "Global Dimension 2 Code" := 'CEO';
                        Validate("Global Dimension 2 Code");
                    end;
                end;
                if "Assign To" = "assign to"::Legal then begin
                    "Global Dimension 2 Code" := 'LE';
                    Validate("Global Dimension 2 Code");
                    Emp.Reset;
                    Emp.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                    Emp.SetRange(Emp.HOD, true);
                    if Emp.FindFirst then begin
                        "Assigned Officer No." := Emp."No.";
                        "Assigned Officer Name" := Emp.FullName;
                        "Assigned Officer Email" := Emp."Company E-Mail";
                    end;
                end;
            end;
        }
        field(48; Gender; Option)
        {
            OptionMembers = "",Male,Female;
            OptionCaption = ',Male,Female';
        }
        field(49; Location; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "No. Series"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('Error! Kindly note that you are  not allowed to delete this document');
    end;

    trigger OnInsert()
    begin
        CRMSetup.Get;
        case "Document Type" of
            "document type"::Complaints:
                begin
                    CRMSetup.TestField("Complaints No.");
                    "No." := NoSeriesMgt.GetNextNo(CRMSetup."Complaints No.", Today, true);
                end;
            "document type"::Complements:
                begin
                    CRMSetup.TestField("Compliments No.");
                    "No." := NoSeriesMgt.GetNextNo(CRMSetup."Compliments No.", Today, true);
                end;
            "document type"::Enquiries:
                begin
                    CRMSetup.TestField("Enquiries No.");
                    "No." := NoSeriesMgt.GetNextNo(CRMSetup."Enquiries No.", Today, true);
                end;
            "document type"::Feedback:
                begin
                    CRMSetup.TestField("Feedback No.");
                    "No." := NoSeriesMgt.GetNextNo(CRMSetup."Feedback No.", Today, true);
                end;
            else begin
                CRMSetup.TestField("Feedback No.");
                "No." := NoSeriesMgt.GetNextNo(CRMSetup."Feedback No.", Today, true);
            end;
        end;
        "Date Created" := Today;
        Date := Today;
        "Time Created" := DT2Time(CurrentDateTime);
        Time := DT2Time(CurrentDateTime);
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        CRMSetup: Record "CRM Setups";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        DimMgt: Codeunit DimensionManagement;
        Emp: Record Employee;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Front Office Management", "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure AssistEdit() Result: Boolean
    var
        IsHandled: Boolean;
    begin
        // IsHandled := false;
        // OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        // if IsHandled then
        //     exit(Result);

        // CRMSetup.Get();
        // // CRMSetup.TestField("Employee Nos.");
        // case "Document Type" of
        //     "document type"::Complaints:
        //         begin
        //             CRMSetup.TestField("Complaints No.");
        //             if NoSeriesMgt.SelectSeries(CRMSetup."Complaints No.", xRec."No. Series", "No. Series") then begin
        //                 NoSeriesMgt.SetSeries("No.");
        //                 exit(true);
        //             end;
        //         end;
        //     "document type"::Complements:
        //         begin
        //             CRMSetup.TestField("Compliments No.");
        //             if NoSeriesMgt.SelectSeries(CRMSetup."Compliments No.", xRec."No. Series", "No. Series") then begin
        //                 NoSeriesMgt.SetSeries("No.");
        //                 exit(true);
        //             end;
        //         end;
        //     "document type"::Enquiries:
        //         begin
        //             CRMSetup.TestField("Enquiries No.");
        //             if NoSeriesMgt.SelectSeries(CRMSetup."Enquiries No.", xRec."No. Series", "No. Series") then begin
        //                 NoSeriesMgt.SetSeries("No.");
        //                 exit(true);
        //             end;
        //         end;
        //     "document type"::Feedback:
        //         begin
        //             CRMSetup.TestField("Feedback No.");
        //             if NoSeriesMgt.SelectSeries(CRMSetup."Feedback No.", xRec."No. Series", "No. Series") then begin
        //                 NoSeriesMgt.SetSeries("No.");
        //                 exit(true);
        //             end;
        //         end;
        //     else begin
        //         CRMSetup.TestField("Feedback No.");
        //         if NoSeriesMgt.SelectSeries(CRMSetup."Feedback No.", xRec."No. Series", "No. Series") then begin
        //             NoSeriesMgt.SetSeries("No.");
        //             exit(true);
        //         end;
        //     end;
        // end;

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var FrontOfficeManagement: Record "Front Office Management"; xFrontOfficeManagement: Record "Front Office Management"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;
}

