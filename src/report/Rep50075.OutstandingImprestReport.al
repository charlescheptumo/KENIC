report 50075 "Outstanding Imprest Report"
{
    Caption = 'Outstanding Imprest';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Outstanding Imprests.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(payments; payments)
        {
            DataItemTableView = where(
                "Payment Type" = filter(Imprest),
                "Account Type" = filter(Employee),
                Surrendered = const(false),
                "Archive Document" = const(false),
                Posted = const(true),
                reversed = const(false)
            );

            column(No_Payments; "No.")
            {
            }
            column(Account_No_; "Account No.")
            {
            }
            column(Account_Name; "Account Name")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Posted_Date; "Posted Date")
            {
            }
            column(Imprest_Deadline; "Imprest Deadline")
            {
            }
            column(Imprest_Amount; "Imprest Amount")
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CompanyMotto; CompanyInformation.Motto)
            {
            }

            dataitem("Imprest Memo"; "Imprest Memo")
            {
                DataItemLink = "No." = field("Imprest Memo No");
                DataItemTableView = sorting("No.");
                DataItemLinkReference = payments;

                column(No_ImprestMemo; "No.")
                {
                }
                column(Date_ImprestMemo; Date)
                {
                }
                column(Subject_ImprestMemo; Subject)
                {
                }
                column(Due_Date_ImprestMemo; "Due Date")
                {
                }
            }

            dataitem(Employee; Employee)
            {
                DataItemLink = "No." = field("Account No.");
                DataItemTableView = sorting("No.");
                DataItemLinkReference = payments;

                column(No_; "No.")
                {
                }
                column(EmpName; EmpName)
                {
                }
                column(Balance; Balance)
                {
                }
                column(E_Mail; "E-Mail")
                {
                }
                column(Phone_No_; "Phone No.")
                {
                }
                column(Job_Title; "Job Title")
                {
                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
                {
                }
                column(Department_Name; "Department Name")
                {
                }
                column(OutstandingAmount; OutstandingAmount)
                {
                }

                trigger OnAfterGetRecord()
                var
                    UnpostedImprest: Record payments;
                    GLCheck: Record "G/L Entry";
                    IsReversedInGL: Boolean;
                    UnpostedSurr: Record payments;
                begin
                    payments.CalcFields(Reversed);

                    Emp.Reset();
                    Emp.SetRange("No.", Employee."No.");
                    if Emp.FindFirst() then begin
                        Emp.CalcFields(Balance);
                        unpostedImprest.CalcFields(Reversed);
                        OutstandingAmount := 0;
                        UnpostedImprest.Reset();
                        UnpostedImprest.SetRange("Account Type", UnpostedImprest."Account Type"::Employee);
                        UnpostedImprest.SetRange("Account No.", Emp."No.");
                        UnpostedImprest.SetRange("Payment Type", UnpostedImprest."Payment Type"::Imprest);
                        //UnpostedImprest.SetRange(Surrendered, false);
                        UnpostedImprest.SetRange("Archive Document", false);
                        UnpostedImprest.SetRange(Posted, true);
                        if UnpostedImprest.FindSet() then begin
                            repeat
                                IsReversedInGL := false;
                                GLCheck.Reset();
                                GLCheck.SetRange("Document No.", UnpostedImprest."No.");
                                GLCheck.SetRange(Reversed, true);
                                if GLCheck.FindFirst() then
                                    IsReversedInGL := true;
                                if not IsReversedInGL then begin

                                    if UnpostedImprest.Surrendered = true then begin
                                        UnpostedSurr.Reset();
                                        UnpostedSurr.SetRange(UnpostedSurr."Imprest Issue Doc. No", UnpostedImprest."No.");
                                        UnpostedSurr.SetRange(UnpostedSurr.Posted, false);
                                        if unpostedSurr.FindSet then begin
                                            UnpostedSurr.CalcFields(Reversed);
                                            if UnpostedSurr.Reversed = false then begin

                                                UnpostedImprest.CalcFields("Imprest Amount");
                                                OutstandingAmount := OutstandingAmount + UnpostedImprest."Imprest Amount";

                                            end;
                                        end;


                                    end else begin
                                        UnpostedImprest.CalcFields("Imprest Amount");
                                        OutstandingAmount := OutstandingAmount + UnpostedImprest."Imprest Amount";
                                    end;
                                end;
                            until UnpostedImprest.Next() = 0;
                        end;
                        OutstandingAmount := Abs(Emp.Balance) + OutstandingAmount;
                        EmpName := Emp.FullName();
                    end;

                    if UnpostedImprest.Reversed = true then
                        CurrReport.Skip();
                end;

            }

            trigger OnAfterGetRecord()
            var
                GLEntry: Record "G/L Entry";
            begin

                // GLEntry.Reset();
                // GLEntry.SetRange("Document No.", payments."No.");
                // GLEntry.SetRange(Reversed, true);
                // if GLEntry.FindFirst() then
                //     CurrReport.Skip();
            end;


            trigger OnPreDataItem()
            begin
                payments.CalcFields(Reversed);
                payments.SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
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
                    field(StartDate; StartDate)
                    {
                        Caption = 'Start Date';
                        ApplicationArea = Basic;
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'End Date';
                        ShowMandatory = true;
                        ApplicationArea = Basic;
                    }
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

    trigger OnPreReport()
    begin

        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);

        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;

    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;

    var
        EmpName: Text;
        OutstandingAmount: Decimal;
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        Emp: Record Employee;
        StartDate: Date;
        EndDate: Date;
}