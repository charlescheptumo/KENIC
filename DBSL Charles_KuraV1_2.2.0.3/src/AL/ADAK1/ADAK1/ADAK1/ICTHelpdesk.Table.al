#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56050 "ICT Helpdesk"
{

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Issue No.';

            trigger OnValidate()
            begin

                Employee.RESET;
                // Employee.SETFILTER(Employee."User ID", "Requesting Officer");
                Employee.SetRange("No.", "Employee No");

                IF Employee.FIND('-') THEN BEGIN
                    "Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Last Name";
                    Department := Employee."Department Code";
                    Email := Employee."Company E-Mail";
                    Phone := Employee."Phone No.";
                    EXT := Employee."Ext."

                END;

                DimValue.RESET;
                DimValue.SETFILTER(DimValue.Code, Department);
                DimValue.SETFILTER(DimValue."Global Dimension No.", '2');
                IF DimValue.FIND('-') THEN BEGIN
                    "Department Name" := DimValue.Name
                END;


            end;
        }
        field(2; "Assigned To"; Code[50])
        {
            // TableRelation = "ICT Officers Category Mapping".UserName;

            // trigger OnValidate()
            // begin
            //     //UserMngt.ValidateUserID("Assigned To");
            //     //UserMngt.LookupUserID("Assigned To");

            //     if UserSetup.Get("Assigned To") then begin
            //         HrLeave.Reset;
            //         HrLeave.SetRange(HrLeave."Employee No", UserSetup."Employee No.");
            //         HrLeave.SetFilter(HrLeave."Start Date", '<=%1', Today);
            //         //HrLeave.SETRANGE(HrLeave.Status,HrLeave.Status::Released);
            //         HrLeave.SetFilter(HrLeave."End Date", '>%1', Today);
            //         if HrLeave.FindSet then begin
            //             Error('%1 is on leave until %2 please select another Employee', "Assigned To", HrLeave."End Date");
            //         end;
            //     end;
            // end;
        }
        field(3; "Assigned Date"; Date)
        {
        }
        field(4; "Assigned Time"; Time)
        {
        }
        field(5; Department; Code[10])
        {
            Editable = true;
            TableRelation = "Responsibility Center"."Operating Unit Type" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(6; "Department Name"; Text[50])
        {
        }
        field(7; "Physical Station"; Text[30])
        {
        }
        field(8; "Nature of Service"; Text[50])
        {
        }
        field(9; EXT; Code[10])
        {
        }
        field(10; "Requesting Officer"; Code[50])
        {
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            Editable = false;
        }
        field(11; "Requesting Officer Name"; Text[50])
        {
        }
        field(12; Phone; Code[30])
        {
        }
        field(13; Email; Text[100])
        {
        }
        field(14; "Request Date"; Date)
        {
        }
        field(15; "Request Time"; Time)
        {
        }
        field(16; "Computer not Starting up"; Boolean)
        {
        }
        field(17; "Keyboard, Mouse Failure"; Boolean)
        {
        }
        field(18; "Printer Failure"; Boolean)
        {
        }
        field(19; "UPS Failure"; Boolean)
        {
        }
        field(20; "LCD /Monitor Failure"; Boolean)
        {
        }
        field(21; "Storage Device Failure"; Boolean)
        {
        }
        field(22; "Hardware Installation"; Boolean)
        {
        }
        field(23; "Others, specify HW"; Text[200])
        {
        }
        field(24; "Computer Running /Loading Slow"; Boolean)
        {
        }
        field(25; "Network Access Problems"; Boolean)
        {
        }
        field(26; "Antivirus Inefficiency"; Boolean)
        {
        }
        field(27; Applications; Boolean)
        {
        }
        field(28; "Software Installation"; Boolean)
        {
        }
        field(29; "Others, specify SW"; Text[200])
        {
        }
        field(30; Diagnosis; Text[250])
        {
        }
        field(31; "Action Taken"; Text[250])
        {
        }
        field(32; "Attended By"; Code[50])
        {
        }
        field(33; "Attended Date"; Date)
        {
        }
        field(34; "Attended Time"; Time)
        {
        }
        field(35; "Technical Staff Remarks"; Text[200])
        {
        }
        field(36; "Requesting Officer Remarks"; Text[200])
        {
        }
        field(37; "Attended by Name"; Text[50])
        {
        }
        field(38; Status; Option)
        {
            OptionCaption = ' ,Open,Pending,Assigned,Attended,Resolved,Closed,Escalated,Escalated To Vendor';
            OptionMembers = " ",Open,Pending,Assigned,Attended,Resolved,Closed,Escalated,"Escalated To Vendor";
        }
        field(39; "No. Series"; Code[20])
        {
        }
        field(40; "ICT Issue Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category".Code where("Issue Category Department Code" = field("Issue Category Department"));
        }
        field(41; "Escalated To"; Code[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "ICT Officers Category Mapping".UserName;
            TableRelation = "User Setup"."User ID" where("System Admin" = const(true));

            trigger OnValidate()
            begin
                //UserMngt.ValidateUserID("Escalated To");
                UserSet.Reset();
                UserSet.SetRange("User ID", "Escalated To");
                if UserSet.Find('-') then begin
                    "Escalated To Email" := UserSet."E-Mail";
                end;
            end;
        }
        field(42; "Escalated By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Escalated Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Escalated Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Requester Feedback"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(46; Reopened; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Reopened By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Feed Back Given"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(51; "Shortcut Dimension 1 Code"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Region Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Constituency Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Description of the issue"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Global Dimension 1 Code" := Employee.Region;
                    "Department Name" := Employee."Department Name";
                end;
            end;
        }
        field(56; "Ascalation Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Assigned To EmpNo"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Escalated To EmpNo"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Solved Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Ict Head Escalation"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category"."Category Head";
        }
        field(61; "IT Escalation Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "IT Escalation Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Issue Category Department"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category"."Issue Category Department Code";
        }
        field(64; "Closed By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65; "HelpDesk Category"; Code[30])
        {
            TableRelation = "ICT Helpdesk Category".Code;

            trigger OnValidate()
            var
                ICTHelpCat: Record "ICT Helpdesk Category";
                UserSetup: Record "User Setup";
            begin
                ICTHelpCat.Reset();
                ICTHelpCat.SetRange(Code, "HelpDesk Category");
                if ICTHelpCat.Find('-') then begin

                    "Assigned To" := ICTHelpCat."Category Head";
                    "Assign To Email" := ICTHelpCat.Email;
                    // "Assigned To EmpNo" := ICTHelpCat.
                    UserSetup.Reset();
                    UserSetup.SetRange("User ID", "Assigned To");
                    if UserSetup.FindFirst() then
                        "Assigned To EmpNo" := UserSetup."Employee Name";

                end;
            end;

        }
        field(66; "Asset Type"; Option)
        {
            OptionMembers = Assigned,General;
        }
        field(67; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Asset Type" = CONST(Assigned)) "ICT Inventory".Code WHERE(Blocked = CONST(false), "Current Assigned Employee" = FIELD("Employee No")) ELSE IF ("Asset Type" = CONST(General)) "ICT Inventory".Code WHERE(Blocked = CONST(false));
            trigger OnValidate()
            var
                ICTInventory: Record "ICT Inventory";
            begin
                ICTInventory.RESET;
                ICTInventory.SETRANGE(Code, "ICT Inventory");
                IF ICTInventory.FINDSET THEN
                    "ICT Inventory Name" := ICTInventory.Description;
            end;
        }
        field(68; "Sub Category"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Sub Category".Code WHERE("Category Code" = FIELD("HelpDesk Category"));
        }
        field(69; "ICT Inventory"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70; "ICT Inventory Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(71; Type; Option)
        {
            OptionMembers = Internal,External;
        }
        field(72; "Expected Resolution"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(73; "Has Attachment"; Boolean)
        {

        }
        field(74; "Assign To Email"; Text[2048])
        {

        }
        field(75; "Escalated To Email"; Text[2048])
        {

        }
        field(76; "Level of Priority"; Enum "ICT Level of Priority")
        {
            DataClassification = ToBeClassified;
        }
        field(77; "Escalation Levels"; text[200])
        {

        }
        field(78; "Delegate To"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup" where("System Admin" = const(true));

            trigger OnValidate()
            var
                Txt001: Label 'Are you sure you want to delegate this issue?';
                Recepient, Sub, Body : Text;
                Email2: Text[250];
                Em: Codeunit Email;
                EmMess: Codeunit "Email Message";
                EmailScen: Enum "Email Scenario";
                AssignHistory: Record "ICT Helpdesk Assign History";
            begin
                if confirm(Txt001, true) then begin
                    UserSet.Reset();
                    UserSet.SetRange("User ID", "Delegate To");
                    if UserSet.Find('-') then begin
                        UserSet.TestField("E-Mail");
                        "Delegate To E-Mail" := UserSet."E-Mail";
                        "Delegation Date" := Today;
                        "Delegation DateTime" := CurrentDateTime;

                        Recepient := "Delegate To E-Mail";
                        Sub := 'ICT Request';
                        Body += 'Dear ' + UserSet."Employee Name" + ',';
                        Body += '<br>You have received a ICT request. <br> Kindly log in to the system to view the request. <br>';

                        AssignHistory.Init();
                        AssignHistory."Document No." := Rec."Job No.";
                        AssignHistory."Assigned To" := "Delegate To";
                        AssignHistory."Assined To E-Mail" := UserSet."E-Mail";
                        AssignHistory."Assigned By" := UserId;
                        AssignHistory."Assigned Date" := Today;
                        AssignHistory."Assigned DateTime" := CurrentDateTime;
                        if AssignHistory.Insert(true) then begin
                            EmMess.Create(Recepient, Sub, Body, true);
                            Em.Send(EmMess, EmailScen::Default);
                        end;
                    end;
                end;
            end;
        }
        field(79; "Delegate To E-Mail"; Code[80])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(80; "Delegation Date"; Date)
        {
        }
        field(81; "Delegation DateTime"; DateTime)
        {
        }

    }

    keys
    {
        key(Key1; "Job No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Job No." = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."ICT Helpdesk Nos.");
                   rec."Job No."  := NoSeriesMgt.GetNextNo(SalesSetup."ICT Helpdesk Nos.", WorkDate(), true);
        end;
        // Amos --> Commented this. I'm feeding Requesting officer and employeeNo from the portal
        // "Requesting Officer" := UPPERCASE(USERID);
        UserSetup.Get(UserId);

        if UserSetup."Portal User" = false then begin

            UserSetup.Reset;
            UserSetup.SetRange(UserSetup."User ID", UpperCase(UserId));
            if UserSetup.Find('-') then begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", UserSetup."Employee No.");
                if Employee.Find('-') then begin
                    // "Employee No" := Employee."No.";
                    "Requesting Officer" := UpperCase(UserId);
                    "Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                    "Employee No" := Employee."No.";
                    if ObjRespCenter.Get(Employee."Department Code") then
                        "Shortcut Dimension 1 Code" := ObjRespCenter.Name;
                    Email := Employee."E-Mail";
                    //MESSAGE(Email);
                    Phone := Employee."Phone No.";
                    EXT := Employee."Ext.";
                    //"Physical Station":=Employee.Station;
                    "Request Date" := Today;
                    "Request Time" := Time;
                end;
            end;
        end;



        // DimValue.RESET;
        // DimValue.SETFILTER(DimValue.Code,Department);
        // DimValue.SETFILTER(DimValue."Global Dimension No.",'1');
        // IF DimValue.FIND('-') THEN
        // BEGIN
        //  "Region Name":=DimValue.Name
        // END;
        //
        // DimValue.RESET;
        // DimValue.SETFILTER(DimValue.Code,Department);
        // DimValue.SETFILTER(DimValue."Global Dimension No.",'2');
        // IF DimValue.FIND('-') THEN
        // BEGIN
        //  "Constituency Name":=DimValue.Name
        // END;
        //
        // DimValue.RESET;
        // DimValue.SETFILTER(DimValue.Code,Department);
        // DimValue.SETFILTER(DimValue."Global Dimension No.",'3');
        // IF DimValue.FIND('-') THEN
        // BEGIN
        //  "Department Name":=DimValue.Name;
        // END;
    end;

    var
        Employee: Record Employee;
        DimValue: Record "Dimension Value";
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        "user id": Record User;
        UserMngt: Codeunit "User Management";
        UserSetup: Record "User Setup";
        ObjRespCenter: Record "Responsibility Center";
        HrLeave: Record "HR Leave Applications";
        UserSet: Record "User Setup";
}

