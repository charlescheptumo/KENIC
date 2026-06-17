report 50035 "Clearance Certificate"
{
    Caption = 'Clearance Certificate';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Clearance Certificate.rdlc';
    ApplicationArea = All;
    dataset
    {
        dataitem("Staff Exit"; "Staff Exit")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.";

            column(CompanyLogo; CompInfo.Picture)
            {
            }
            column(CompanyName; CompInfo.Name)
            {
            }
            // column(CompanyAddress; CompInfo.Address)
            // {
            // }
            // column(CompanyAddress2; CompInfo."Address 2")
            // {
            // }
            // column(CompanyPostCode; CompInfo."Post Code")
            // {
            // }
            // column(CompanyCity; CompInfo.City)
            // {
            // }
            // column(CompanyPhone; CompInfo."Phone No.")
            // {
            // }
            // column(CompanyFax; CompInfo."Fax No.")
            // {
            // }
            // column(CompanyEmail; CompInfo."E-Mail")
            // {
            // }
            // column(CompanyWebsite; CompInfo."Home Page")
            // {
            // }
            column(FirstName_Employee; "First Name")
            {
            }
            column(LastName_Employee; "Last Name")
            {
            }
            column(MiddleName_Employee; "Middle Name")
            {
            }
            column(JobTitle_Employee; "Job Title")
            {
            }
            column(IDNumber_Employee; "ID Number")
            {
            }
            // column(CurrentDutyStation_Employee; "Current Duty Station")
            // {
            // }
            // column(DateOfJoin_Employee; "Date Of Join")
            // {
            // }
            // column(Department_Employee; Department)
            // {
            // }
            // column(SeparationType_Employee; "Separation Type")
            // {
            // }
            // column(SeparationType_Employee; SepTypes)
            // {
            // }
            column(SeparationType_Employee; "Staff Exit Description")
            {
            }
            column(DateOfLeaving_Employee; "Date Of Leaving")
            {
            }
            column(NoticePeriod_Employee; "Notice Period")
            {
            }
            column(HODSign; UserSet1.Picture)
            {
            }
            column(HODName; UserSet1."Employee Name")
            {
            }
            // column(HODDesignation; HODDesignation)
            // {
            // }
            column(HODDate; ApproverDate[2])
            {
            }
            column(HODRemarks; Comments[2])
            {
            }
            column(HRMSign; UserSet1.Picture)
            {
            }
            column(HRMName; UserSet1."Employee Name")
            {
            }
            // column(HRMDesignation; HRMDesignation)
            // {
            // }
            column(HRMDate; ApproverDate[3])
            {
            }
            column(HRMRemarks; Comments[3])
            {
            }
            column(ACCSign; UserSet1.Picture)
            {
            }
            column(ACCName; UserSet1."Employee Name")
            {
            }
            // column(ACCDesignation; ACCDesignation)
            // {
            // }
            column(ACCDate; ApproverDate[4])
            {
            }
            column(ACCRemarks; Comments[4])
            {
            }
            column(PROCSign; UserSet1.Picture)
            {
            }
            column(PROCName; UserSet1."Employee Name")
            {
            }
            // column(PROCDesignation; PROCDesignation)
            // {
            // }
            column(PROCDate; ApproverDate[5])
            {
            }
            column(PROCRemarks; Comments[5])
            {
            }
            column(ICTSign; UserSet1.Picture)
            {
            }
            column(ICTName; UserSet1."Employee Name")
            {
            }
            // column(ICTDesignation; ICTDesignation)
            // {
            // }
            column(ICTDate; ApproverDate[6])
            {
            }
            column(ICTRemarks; Comments[6])
            {
            }
            column(CEOSign; UserSet1.Picture)
            {
            }
            column(CEOName; UserSet1."Employee Name")
            {
            }
            // column(CEODesignation; CEODesignation)
            // {
            // }
            column(CEODate; ApproverDate[7])
            {
            }
            column(CEORemarks; Comments[7])
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "No." = field("Employee No.");
                column(CurrentDutyStation_Employee; "Current Duty Station")
                {
                }
                column(DateOfJoin_Employee; "Date Of Join")
                {
                }
                column(Department_Employee; Department)
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
                ApprEntries.Reset();
                ApprEntries.SetRange("Table ID", 50073);
                ApprEntries.SetRange("Document No.", "Staff Exit"."No.");
                ApprEntries.SetRange(Status, ApprEntries.Status::Approved);
                if ApprEntries.Find('-') then begin
                    repeat
                        //i:=i+1;
                        //IF i=2 THEN BEGIN
                        if ApprEntries."Sequence No." = 1 then begin
                            Approver1[1] := ApprEntries."Sender ID";

                            ApproverDate[1] := ApprEntries."Date-Time Sent for Approval";
                            if UserSet1.Get(Approver1[1]) then
                                UserSet1.CalcFields(Picture);
                            Approver1[2] := ApprEntries."Last Modified By User ID";
                            ApproverDate[2] := ApprEntries."Last Date-Time Modified";
                            if ApprEntries.Comment = true then begin
                                ApprComment.Reset();
                                ApprComment.SetRange("Table ID", 50073);
                                ApprComment.SetRange("Document No.", "Staff Exit"."No.");
                                if ApprComment.find('-') then begin
                                    Comments[2] := ApprComment.Comment;
                                end;
                            end;
                            if UserSet1.Get(Approver1[2]) then
                                UserSet1.CalcFields(Picture);
                        end;
                        // IF i=3 THEN
                        // BEGIN
                        if ApprEntries."Sequence No." = 2 then begin
                            Approver1[3] := ApprEntries."Approver ID";

                            ApproverDate[3] := ApprEntries."Last Date-Time Modified";
                            if UserSet2.Get(Approver1[3]) then
                                UserSet2.CalcFields(Picture);
                            if ApprEntries.Comment = true then begin
                                ApprComment.Reset();
                                ApprComment.SetRange("Table ID", 50073);
                                ApprComment.SetRange("Document No.", "Staff Exit"."No.");
                                if ApprComment.find('-') then begin
                                    Comments[3] := ApprComment.Comment;
                                end;
                            end;
                        end;

                        //IF i= 4 THEN
                        if ApprEntries."Sequence No." = 3 then begin
                            Approver1[4] := ApprEntries."Approver ID";

                            ApproverDate[4] := ApprEntries."Last Date-Time Modified";
                            if UserSet3.Get(Approver1[4]) then
                                UserSet3.CalcFields(Picture);
                            if ApprEntries.Comment = true then begin
                                ApprComment.Reset();
                                ApprComment.SetRange("Table ID", 50073);
                                ApprComment.SetRange("Document No.", "Staff Exit"."No.");
                                if ApprComment.find('-') then begin
                                    Comments[4] := ApprComment.Comment;
                                end;
                            end;
                        end;

                        //IF i=5 THEN
                        if ApprEntries."Sequence No." = 4 then begin
                            Approver1[5] := ApprEntries."Approver ID";
                            ApproverDate[5] := ApprEntries."Last Date-Time Modified";
                            if UserSet4.Get(Approver1[5]) then
                                UserSet4.CalcFields(Picture);
                            if ApprEntries.Comment = true then begin
                                ApprComment.Reset();
                                ApprComment.SetRange("Table ID", 50073);
                                ApprComment.SetRange("Document No.", "Staff Exit"."No.");
                                if ApprComment.find('-') then begin
                                    Comments[5] := ApprComment.Comment;
                                end;
                            end;
                        end;

                        //IF i=6 THEN
                        begin
                            Approver1[6] := ApprEntries."Approver ID";
                            ApproverDate[6] := ApprEntries."Last Date-Time Modified";
                            if UserSet5.Get(Approver1[6]) then
                                UserSet5.CalcFields(Picture);
                            if ApprEntries.Comment = true then begin
                                ApprComment.Reset();
                                ApprComment.SetRange("Table ID", 50073);
                                ApprComment.SetRange("Document No.", "Staff Exit"."No.");
                                if ApprComment.find('-') then begin
                                    Comments[6] := ApprComment.Comment;
                                end;
                            end;
                        end;
                        begin
                            Approver1[7] := ApprEntries."Approver ID";
                            ApproverDate[7] := ApprEntries."Last Date-Time Modified";
                            if UserSet5.Get(Approver1[7]) then
                                UserSet5.CalcFields(Picture);
                            if ApprEntries.Comment = true then begin
                                ApprComment.Reset();
                                ApprComment.SetRange("Table ID", 50073);
                                ApprComment.SetRange("Document No.", "Staff Exit"."No.");
                                if ApprComment.find('-') then begin
                                    Comments[7] := ApprComment.Comment;
                                end;
                            end;
                        end;
                    until
                   ApprEntries.Next = 0;
                end;


                // if "Separation Type".Get("Separation Type") then
                // SepTypes := "Separation Type".Names();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnInitReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
        UserSet1: Record "User Setup";
        UserSet2: Record "User Setup";
        UserSet3: Record "User Setup";
        UserSet4: Record "User Setup";
        UserSet5: Record "User Setup";
        UserSet6: Record "User Setup";
        ApprEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        Comments: array[10] of Text[2048];
        Approver1: array[10] of Code[50];
        ApprComment: Record "Approval Comment Line";
    // SepTypes: List of [Text];
}
