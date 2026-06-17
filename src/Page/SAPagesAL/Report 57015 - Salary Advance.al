#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
report 57015 "Salary Advance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Salary Advance.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(DataItem1; 57000)
        {
            column(Name; CompanyInfo.Name)
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(Remarks_Rec; Remarks)
            {
            }
            column(Comments_Rec; Comments)
            {
            }
            column(AmountApproved_Rec; "Amount Approved")
            {
            }
            column(EffectivefromMonth_Rec; "Effective from Month")
            {
            }
            column(SalaryAdvance_Rec; "Salary Advance")
            {
            }
            column(SalaryLastDrawn_Rec; "Salary Last Drawn")
            {
            }
            column(DateofJoining_Rec; "Date of Joining")
            {
            }
            column(Noofmonthsdeducted_Rec; "No of months deducted")
            {
            }
            column(AmountPending_Rec; "Amount Pending")
            {
            }
            column(RecoveryStartMonth_Rec; "Recovery Start Month")
            {
            }
            column(MonthlyInstallment_Rec; "Monthly Installment")
            {
            }
            column(Purpose_Rec; Purpose)
            {
            }
            column(DepartmentName_Rec; "Department Name")
            {
            }
            column(ProjectName_Rec; "Project Name")
            {
            }
            column(No_Rec; "No.")
            {
            }
            column(Date_Rec; Date)
            {
            }
            column(AccountNo_Rec; "Account No.")
            {
            }
            column(AccountName_Rec; "Account Name")
            {
            }
            column(Status_Rec; Status)
            {
            }
            column(Number_In_Words; NumberText[1])
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup2."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(Accounts; UserSetup4."Employee Name")
            {
            }
            column(DateAccounts; ApproverDate[5])
            {
            }
            column(Accounts_Signature; UserSetup4.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText, "Salary Advance", CurrencyCodeText);

                //Approvals
                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE("Table ID", 57000);
                ApprovalEntries.SETRANGE("Document No.", "No.");
                ApprovalEntries.SETRANGE(Status, ApprovalEntries.Status::Approved);
                IF ApprovalEntries.FIND('-') THEN BEGIN
                    i := 0;
                    REPEAT
                        i := i + 1;
                        IF i = 1 THEN BEGIN
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            IF UserSetup.GET(Approver[1]) THEN
                                UserSetup.CALCFIELDS(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            IF UserSetup1.GET(Approver[2]) THEN
                                UserSetup1.CALCFIELDS(Picture);
                        END;
                        IF i = 2 THEN BEGIN
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            IF UserSetup2.GET(Approver[3]) THEN
                                UserSetup2.CALCFIELDS(Picture);
                        END;
                        IF i = 3 THEN BEGIN
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            IF UserSetup3.GET(Approver[4]) THEN
                                UserSetup3.CALCFIELDS(Picture);
                        END;
                        IF i = 4 THEN BEGIN
                            Approver[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            IF UserSetup4.GET(Approver[5]) THEN
                                UserSetup4.CALCFIELDS(Picture);
                        END;
                    UNTIL
                   ApprovalEntries.NEXT = 0;

                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        CompanyInfo: Record 79;
        CheckReport: Report 1401;
        NumberText: array[2] of Text[80];
        TTotal: Decimal;
        ApprovalEntries: Record 454;
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record 91;
        UserSetup1: Record 91;
        UserSetup2: Record 91;
        UserSetup3: Record 91;
        i: Integer;
        PaymentMgt: Codeunit 57000;
        CurrencyCodeText: Code[10];
        UserSetup4: Record 91;
}

