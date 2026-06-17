report 50082 "Memo Report Internal"
{
    Caption = 'Memo Report Internal';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Memo Report Internal.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(GeneralCorrespondenceHeader; "General Correspondence Header")
        {
            column(ToCEO; ToCEO)
            {

            }
            column(From; GeneralCorrespondenceHeader."Creator Name")
            {

            }
            column(Date; FormattedDate)
            {

            }
            column(Ref; GeneralCorrespondenceHeader."Document No")
            {

            }
            column(Re; GeneralCorrespondenceHeader."Communication Subject")
            {

            }
            column(Type; GeneralCorrespondenceHeader.Type)
            {

            }
            column(Content1; GeneralCorrespondenceHeader."Communication Content")
            {

            }
            column(Content2; GeneralCorrespondenceHeader."Communication Content2")
            {

            }
            column(Content3; GeneralCorrespondenceHeader."Communication Content3")
            {

            }
            column(Content4; GeneralCorrespondenceHeader."Communication Content4")
            {

            }
            column(Content5; GeneralCorrespondenceHeader."Communication Content5")
            {

            }
            column(Content6; GeneralCorrespondenceHeader."Communication Content6")
            {

            }
            column(Content7; GeneralCorrespondenceHeader."Communication Content7")
            {

            }
            column(Content8; GeneralCorrespondenceHeader."Communication Content8")
            {

            }
            column(Content9; GeneralCorrespondenceHeader."Communication Content9")
            {

            }
            column(Content10; GeneralCorrespondenceHeader."Communication Content10")
            {

            }
            column(ByFrom; GeneralCorrespondenceHeader."Sender Job Title")
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
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; ApproverDate[2])
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
            column(Edirector; UserSetup4."Employee Name")
            {
            }
            column(EDDate; ApproverDate[5])
            {
            }
            column(ED_Signature; UserSetup4.Picture)
            {
            }
            column(FApprover; UserSetup5."Employee Name")
            {
            }
            column(FADate; ApproverDate[6])
            {
            }
            column(FA_Signature; UserSetup5.Picture)
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
            trigger OnAfterGetRecord()
            begin
                NewDate := CopyStr(Format(GeneralCorrespondenceHeader."Document Date"), 1, 10);
                FormattedDate := Format(GeneralCorrespondenceHeader."Document Date", 0, '<Day> <Month Text> <year4>');
                // MemoNosSetup.Get();
                // GeneralCorrespondenceHeader.Reset();
                // GeneralCorrespondenceHeader.SetRange("Document No", "Document No");
                // if GeneralCorrespondenceHeader.Find('-') then begin
                //     NoSeries := GeneralCorrespondenceHeader."Get No. Series" + '(' + GeneralCorrespondenceHeader."Document No" + ')';
                // end;
                CorrespondenceApprovals.Reset;
                // CorrespondenceApprovals.SetRange("Table ID", 50080);
                CorrespondenceApprovals.SetRange("Document No", GeneralCorrespondenceHeader."Document No");
                CorrespondenceApprovals.SetRange(Status, CorrespondenceApprovals.Status::Approved);
                if CorrespondenceApprovals.Find('-') then begin
                    //i:=0;
                    repeat
                        //i:=i+1;
                        //IF i=2 THEN BEGIN
                        if CorrespondenceApprovals.Sequence = 1 then begin
                            Approver1[1] := GeneralCorrespondenceHeader."Created By";
                            ApproverDate[1] := CurrentDateTime;
                            if UserSetup.Get(Approver1[1]) then
                                UserSetup.CalcFields(Picture);
                            Approver1[2] := CorrespondenceApprovals."User ID";
                            ApproverDate[2] := CurrentDateTime;
                            if UserSetup1.Get(Approver1[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        // IF i=3 THEN
                        // BEGIN
                        if CorrespondenceApprovals.Sequence = 2 then begin
                            Approver1[3] := CorrespondenceApprovals."User ID";
                            ApproverDate[3] := CurrentDateTime;
                            if UserSetup2.Get(Approver1[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        //IF i= 4 THEN
                        if CorrespondenceApprovals.Sequence = 3 then begin
                            Approver1[4] := CorrespondenceApprovals."User ID";
                            ApproverDate[4] := CurrentDateTime;
                            if UserSetup3.Get(Approver1[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                        //IF i=5 THEN
                        if CorrespondenceApprovals.Sequence = 4 then begin
                            Approver1[5] := CorrespondenceApprovals."User ID";
                            ApproverDate[5] := CurrentDateTime;
                            if UserSetup4.Get(Approver1[5]) then
                                UserSetup4.CalcFields(Picture);
                        end;
                        //IF i=6 THEN
                        begin
                            Approver1[6] := CorrespondenceApprovals."User ID";
                            ApproverDate[6] := CurrentDateTime;
                            if UserSetup5.Get(Approver1[6]) then
                                UserSetup5.CalcFields(Picture);
                        end;
                    until
                   CorrespondenceApprovals.Next = 0;
                end;
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

    trigger OnPreReport()
    begin
        CompanyInformation.get();
        CompanyInformation.CalcFields(Picture);
        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;

    var
        ToCEO: Label 'Chief Executive Officer';
        // MemoNosSetup: Record "Memo Nos Setup Url";
        NoSeries: Text;
        CorrespondenceApprovals: Record "General Correspond Approval";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        Approver1: array[10] of Code[50];
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        UserSetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
        NewDate: Text;
        FormattedDate: Text;
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
}