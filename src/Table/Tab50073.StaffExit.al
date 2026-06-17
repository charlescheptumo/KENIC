/// <summary>
/// Table Staff Exit (ID 50073).
/// </summary>
table 50073 "Staff Exit"
{
    Caption = 'Staff Exit';
    DataClassification = ToBeClassified;
    LookupPageId = "Staff Exits";
    DrillDownPageId = "Staff Exits";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Staff Exit Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;

            trigger OnValidate()
            var
                Employee: Record Employee;
                StaffClearanceSetup: Record "Staff Clearance Setup";
                StaffClearance: Record "Staff Clearance";
                FA: Record "Fixed Asset";
            begin
                Employee.Reset();
                Employee.SetRange("No.", Rec."Employee No.");
                if Employee.FindFirst then begin
                    Employee.CalcFields(Balance, "Leave Balance", "Leave Outstanding Bal");
                    Rec."Employee Name" := Employee.FullName();
                    Rec."First Name" := Employee."First Name";
                    Rec."Middle Name" := Employee."Middle Name";
                    Rec."Last Name" := Employee."Last Name";
                    Rec."Job Title" := Employee."Job Title";
                    Rec.Address := Employee.Address;
                    Rec."Address 2" := Employee."Address 2";
                    Rec."Phone No." := Employee."Phone No.";
                    Rec."E-Mail" := Employee."E-Mail";
                    Rec."Department Name" := Employee."Department Name";
                    Rec."Region Name" := Employee."Region Name";
                    // Rec."Department Code" := Employee."Shortcut Dimension 3";
                    // Rec."Region Code" := Employee."Global Dimension 1 Code";
                    // Rec."Shortcut Dimension 3" := Employee."Shortcut Dimension 3";
                    Rec."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    Rec."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                    Rec.Workstation := Employee.Workstation;
                    Rec.Gender := Employee.Gender;
                    Rec."Date Of Leaving" := Employee."Date Of Leaving";
                    Rec."Date Of Birth" := Employee."Date Of Birth";
                    Rec.Age := Employee.Age;
                    Rec."Employment Date" := Employee."Employment Date";
                    Rec."Retirement Date" := Employee."Retirement Date";
                    Rec."Employee Category" := Employee."Employee Category";
                    Rec."Exit Interview Date" := Employee."Exit Interview Date";
                    Rec."Exit Interview Conducted" := Employee."Exit Interview Conducted";
                    Rec."ID Number" := Employee."ID Number";
                    Rec."Social Security No." := Employee."Social Security No.";
                    Rec."N.H.I.F No" := Employee."N.H.I.F No";
                    Rec."Leave Balance" := Employee."Leave Balance";
                    Rec."Leave Outstanding Bal" := Employee."Leave Outstanding Bal";
                    Rec.Balance := Employee.Balance;
                    Rec."Salary Scale" := Employee."Salary Scale";
                    Rec."P.I.N" := Employee."P.I.N";
                    Rec.Position := Employee."Job ID";
                    Rec."Notice Period" := Employee."Notice Period";
                end;

                FA.Reset();
                FA.SetRange("Responsible Employee", Rec."Employee No.");
                if FA.FindSet() then
                    repeat
                        StaffClearance.Init();
                        StaffClearance."Document No." := Rec."No.";
                        StaffClearance."Line No." := FnGetLastLineNoStaffClearance + 1;
                        StaffClearance."Employee No" := Rec."Employee No.";
                        StaffClearance."Staff Clearance Code" := StaffClearanceSetup."Exit Code";
                        StaffClearance."FA Code" := FA."No.";
                        StaffClearance."FA Description" := FA.Description;
                        StaffClearance.Insert();
                    until FA.Next() = 0;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
        }
        field(5; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
        }
        field(6; Position; Code[20])
        {
            Caption = 'Position';
        }
        field(7; "Job Title"; Text[100])
        {
            Caption = 'Job Title';
        }
        field(8; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Approval Status"; Enum "App Status")
        {
            Caption = 'Approval Status';
            Editable = false;
        }
        field(11; "Notice Period"; DateFormula)
        {
            Caption = 'Notice Period';

            trigger OnValidate()
            begin
                if "Notice Start Date" <> 0D then begin
                    "Last Working Date" := CalcDate(Rec."Notice Period", "Notice Start Date");
                    "Date of Leaving" := "Last Working Date";
                end;
            end;
        }
        field(12; "Use Leave Days"; Boolean)
        {
            Caption = 'Use Leave Days';
        }
        field(13; "E-Mail"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Region Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Workstation; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "No of Leave Days to Use"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Date of Leaving"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Staff Exit Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Exit Setup";

            trigger OnValidate()
            var
                StaffExitSetup: Record "Staff Exit Setup";
                ExitTermiGrounds: Record "Exit Termination Grounds";
                StaffClearance: Record "Staff Clearance";
                StaffClearanceSetup: Record "Staff Clearance Setup";
                InterviewQns: Record "Staff Exit Interview Questions";
                QnTempLines: Record "Exit Interview Qns Temp Lines";
            begin
                if "Staff Exit Code" <> '' then begin
                    StaffExitSetup.Get("Staff Exit Code");
                    Rec."Staff Exit Description" := StaffExitSetup.Description;
                    Rec."Requires Exit Interview" := StaffExitSetup."Requires Exit Interview";
                    Rec."Requires Clearance" := StaffExitSetup."Requires Clearance";
                    Rec."Requires Notice" := StaffExitSetup."Requires Notice";
                    Rec."Has Terminal Benefits" := StaffExitSetup."Has Terminal Benefits";
                    Rec."Has Termination Grounds" := StaffExitSetup."Has Termination Grounds";
                end else begin
                    Rec."Staff Exit Description" := '';
                    Rec."Requires Exit Interview" := false;
                    Rec."Requires Clearance" := false;
                    Rec."Requires Notice" := false;
                    Rec."Has Terminal Benefits" := false;
                    Rec."Has Termination Grounds" := false;
                end;

                if xRec."Staff Exit Code" <> Rec."Staff Exit Code" then begin
                    IF NOT Rec.RequiresClearance() THEN BEGIN
                        StaffClearance.Reset();
                        StaffClearance.SetRange("Document No.", xRec."No.");
                        if StaffClearance.FindSet() then begin
                            StaffClearance.DeleteAll();
                        end;
                    END;

                    IF NOT Rec.HasTerminationGrounds() THEN BEGIN
                        ExitTermiGrounds.Reset();
                        ExitTermiGrounds.SetRange("Document No.", xRec."No.");
                        if ExitTermiGrounds.FindSet() then begin
                            ExitTermiGrounds.DeleteAll();
                        end;
                    END;
                end;

                HRSetup.Get();

                QnTempLines.Reset();
                QnTempLines.SetRange("Document No.", HRSetup."Exit Qns Template");
                if QnTempLines.FindSet() then
                    repeat
                        InterviewQns.Init();
                        InterviewQns.Code := Rec."No.";
                        InterviewQns."Line No." := FnGetLastLineNoInterviewQns + 1;
                        InterviewQns."Interview Scoresheet Template" := HRSetup."Exit Qns Template";
                        InterviewQns."Question ID" := QnTempLines."Question ID";
                        InterviewQns."Question Type" := QnTempLines."Question Type";
                        InterviewQns.Description := QnTempLines.Description;
                        InterviewQns.Insert();
                    until QnTempLines.Next() = 0;
            end;
        }
        field(20; "Staff Exit Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Allow Re-Employment In Future"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Age; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Employment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Retirement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Employee Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Permanent,Casual';
            OptionMembers = " ",Permanent,Casual;
        }
        field(27; "Exit Interview Conducted"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(28; "Exit Interview Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Exit Interview Comments"; Text[550])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "ID Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "P.I.N"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "N.H.I.F No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Social Security No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Salary Scale"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Leave Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Exit Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Address; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Middle Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //Rec.ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(45; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //Rec.ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(46; "Division Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(49; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50; "Leave Outstanding Bal"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Requires Exit Interview"; Boolean)
        {
            Caption = 'Requires Exit Interview';
        }
        field(52; "Requires Clearance"; Boolean)
        {
            Caption = 'Requires Clearance';
        }
        field(53; "Requires Notice"; Boolean)
        {
            Caption = 'Requires Notice';
        }
        field(54; "Has Terminal Benefits"; Boolean)
        {
            Caption = 'Has Terminal Benefits';
        }
        field(55; "Has Termination Grounds"; Boolean)
        {
            Caption = 'Requires Termination Grounds';
        }
        field(56; "Document Type"; Enum "Employee Doc Type")
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(58; "Last Working Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(59; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(60; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Exit Question Template"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exit Interview Qns Templates";

            trigger OnValidate()
            var
                QnTempLines: Record "Exit Interview Qns Temp Lines";
            begin
                QnTempLines.Reset();
                QnTempLines.SetRange("Document No.", Rec."Exit Question Template");
                if QnTempLines.FindSet() then
                    repeat
                        InterviewQns.Init();
                        InterviewQns.Code := Rec."No.";
                        InterviewQns."Line No." := FnGetLastLineNoInterviewQns + 1;
                        InterviewQns."Interview Scoresheet Template" := Rec."Exit Question Template";
                        InterviewQns."Question ID" := QnTempLines."Question ID";
                        InterviewQns."Question Type" := QnTempLines."Question Type";
                        InterviewQns.Description := QnTempLines.Description;
                        InterviewQns.Insert();
                    until QnTempLines.Next() = 0;
            end;
        }
        field(62; "Notice Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Last Working Date" := CalcDate(Rec."Notice Period", "Notice Start Date");
                "Date of Leaving" := "Last Working Date";
            end;
        }
        field(63; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Closed By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
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
        if "No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Staff Exit Nos");
              rec."No." := NoSeriesMgt.GetNextNo(HRSetup."Staff Exit Nos", WorkDate(), true);
        end;

        "Document Date" := Today;
        "Posting Date" := Today;
    end;

    trigger OnDelete()
    begin
        ExitClearanceHeader.Reset();
        ExitClearanceHeader.SetRange("Document No.", Rec."No.");
        if ExitClearanceHeader.FindFirst() then
            ExitClearanceHeader.DeleteAll();

        StaffClearance.Reset();
        StaffClearance.SetRange("No.", Rec."No.");
        if StaffClearance.FindSet() then
            StaffClearance.DeleteAll();

        InterviewQns.Reset();
        InterviewQns.SetRange(Code, Rec."No.");
        if InterviewQns.FindSet() then
            InterviewQns.DeleteAll();
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        InterviewQns: Record "Staff Exit Interview Questions";
        StaffClearance: Record "Staff Clearance";
        ExitClearanceHeader: Record "Staff Exit Clearance Header";

    procedure RequiresInterview(): Boolean
    begin
        exit(Rec."Requires Exit Interview" = true);
    end;

    procedure RequiresClearance(): Boolean
    begin
        exit(Rec."Requires Clearance" = true);
    end;

    procedure RequiresNotice(): Boolean
    begin
        exit(Rec."Requires Notice" = true);
    end;

    procedure HasTerminalBenefits(): Boolean
    begin
        exit(Rec."Has Terminal Benefits" = true);
    end;

    procedure HasTerminationGrounds(): Boolean
    begin
        exit(Rec."Has Termination Grounds" = true);
    end;

    procedure CheckIfDocStatusApproved(): Boolean
    begin
        if Rec."Approval Status" = Rec."Approval Status"::Approved then begin
            exit(true);
        end;
    end;

    procedure FnSuggestClearanceLines()
    var
        StaffClearanceSetup: Record "Staff Clearance Setup";
        StaffClearance: Record "Staff Clearance";
        FA: Record "Fixed Asset";
    begin
        FA.Reset();
        FA.SetRange("Responsible Employee", Rec."Employee No.");
        if FA.FindSet() then
            repeat
                StaffClearance.Init();
                StaffClearance."Document No." := Rec."No.";
                StaffClearance."Employee No" := Rec."Employee No.";
                StaffClearance."Staff Clearance Code" := StaffClearanceSetup."Exit Code";
                StaffClearance."FA Code" := FA."No.";
                StaffClearance."FA Description" := FA.Description;
                StaffClearance.Insert();
            until FA.Next() = 0;
        // StaffClearanceSetup.Reset();
        // StaffClearanceSetup.SetRange("Position ID", Rec.Position);
        // if StaffClearanceSetup.FindSet() then begin
        //     repeat
        //         StaffClearance.Init();
        //         StaffClearance."Document No." := Rec."No.";
        //         StaffClearance."Employee No" := Rec."Employee No.";
        //         StaffClearance."Staff Clearance Code" := StaffClearanceSetup."Exit Code";
        //         StaffClearance."Item Code" := StaffClearanceSetup."Item Code";
        //         StaffClearance."Item Description" := StaffClearanceSetup."Item Description";
        //         StaffClearance.Insert();
        //     until StaffClearanceSetup.Next = 0;
        // end;
    end;

    local procedure FnGetLastLineNoInterviewQns() LineNumber: Integer
    var
        InterviewQns: Record "Staff Exit Interview Questions";
    begin
        InterviewQns.Reset;
        if InterviewQns.Find('+') then
            LineNumber := InterviewQns."Line No."
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoStaffClearance() LineNumber: Integer
    var
        StaffClearanceLines: Record "Staff Clearance";
    begin
        StaffClearanceLines.Reset;
        if StaffClearanceLines.Find('+') then
            LineNumber := StaffClearanceLines."Line No."
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    procedure CreateClearanceDocument(StaffExit: Record "Staff Exit")
    var
        ExitClearanceHeader: Record "Staff Exit Clearance Header";
    begin
        ExitClearanceHeader.Reset();
        ExitClearanceHeader.SetRange("Document No.", StaffExit."No.");
        ExitClearanceHeader.DeleteAll();

        ExitClearanceHeader.Init();
        ExitClearanceHeader."Document No." := StaffExit."No.";
        ExitClearanceHeader."Employee No." := StaffExit."Employee No.";
        ExitClearanceHeader.Validate("Employee No.");
        ExitClearanceHeader.Insert();
    end;
}
