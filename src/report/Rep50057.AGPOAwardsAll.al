report 50057 "AGPO Awards-All 2"
{
    ApplicationArea = All;
    Caption = 'AGPO Awards-All';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AGPO Awards-All.rdlc';

    dataset
    {
        dataitem(PCE; 70239)
        {
            column(image1; corec.Picture)
            {
            }
            column(name; corec.Name)
            {
            }
            // column(EntryNo_PCE;PCE."Entry No")
            // {
            // }
            // column(NOANo_PCE;PCE."NOA No")
            // {
            // }
            // column(ProfessionalOpinionNo_PCE;PCE."Professional Opinion No")
            // {
            // }
            // column(EvaluationReportNo_PCE;PCE."Evaluation Report No")
            // {
            // }
            column(IFSCode_PCE; PCE."IFS Code")
            {
            }
            // column(PRNNo_PCE;PCE."PRN No")
            // {
            // }
            // column(PurchaseAgreementType_PCE;PCE."Purchase Agreement Type")
            // {
            // }
            // column(PurchaseAgreementNo_PCE;PCE."Purchase Agreement No")
            // {
            // }
            column(CreatedBy_PCE; PCE."Created By")
            {
            }
            // column(CreatedOn_PCE;PCE."Created On")
            // {
            // }
            // column(Archived_PCE;PCE.Archived)
            // {
            // }
            // column(AwardedBidderNo_PCE;PCE."Awarded Bidder No")
            // {
            // }
            // column(AwardedBidderName_PCE;PCE."Awarded Bidder Name")
            // {
            // }
            // column(AwardedBidSum_PCE;PCE."Awarded Bid Sum")
            // {
            // }
            // column(TenderName_PCE;PCE."Tender Name")
            // {
            // }
            // column(AwardedBidNo_PCE;PCE."Awarded Bid No")
            // {
            // }
            // column(ArchivedOn_PCE;PCE."Archived On")
            // {
            // }
            // column(ArchivedBy_PCE;PCE."Archived By")
            // {
            // }
            column(ProcurementMethod; ProcurementMethod)
            {
            }
            column(TenderOpeningDate; TenderOpeningDate)
            {
            }
            column(EvaluationCompletionDate; EvaluationCompletionDate)
            {
            }
            column(DateofNotificationofAward; DateofNotificationofAward)
            {
            }
            column(DateofSigningContract; DateofSigningContract)
            {
            }
            column(ContractExpiryDate; ContractExpiryDate)
            {
            }
            column(SNo; SNo)
            {
            }
            column(preference; Preference)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF IFS.GET(PCE."IFS Code") THEN BEGIN
                    ProcurementMethod := FORMAT(IFS."Procurement Method");
                    //   TenderOpeningDate:=DT2DATE(IFS."Actual Bid Opening Date");
                    Preference := IFS."PP Preference/Reservation Code";
                END;
                //  IF EVALRPRT.GET(PCE."Evaluation Report No") THEN BEGIN
                //   EvaluationCompletionDate:=EVALRPRT."Document Date";
                //  END;
                //  IF NOA.GET(PCE."NOA No" ) THEN BEGIN
                //   DateofNotificationofAward:=NOA."Document Date";
                //  END;
                //  IF PCE."Purchase Agreement Type"=PCE."Purchase Agreement Type"::Contract THEN BEGIN
                //    Purch.RESET;
                //    Purch.SETRANGE("Document Type",Purch."Document Type"::"Blanket Order");
                //    Purch.SETRANGE("No.",PCE."Purchase Agreement No");
                //    IF Purch.FINDSET THEN
                //   ContractExpiryDate:=Purch."Contract End Date";
                //   DateofSigningContract:=Purch."Contract Start Date";
                //  END;
                //   IF PCE."Purchase Agreement Type"=PCE."Purchase Agreement Type"::"LPO/LSO" THEN BEGIN
                //    Purch.RESET;
                //    Purch.SETRANGE("Document Type",Purch."Document Type"::Order);
                //    Purch.SETRANGE("No.",PCE."Purchase Agreement No");
                //    IF Purch.FINDSET THEN
                //      IF ContractExpiryDate<>0D THEN BEGIN
                //   ContractExpiryDate:=CALCDATE('1M',Purch."Order Date");
                //   DateofSigningContract:=Purch."Document Date";

                //   END;
                //  END;
                SNo := SNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                corec.GET;
                corec.CALCFIELDS(corec.Picture);
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

    trigger OnInitReport()
    begin
        SNo := 0;
    end;

    var
        corec: Record 79;
        ProcurementMethod: Text[250];
        TenderOpeningDate: Date;
        EvaluationCompletionDate: Date;
        DateofNotificationofAward: Date;
        DateofSigningContract: Date;
        ContractExpiryDate: Date;
        IFS: Record 173;
        BidOpeningRegister: Record 70173;
        EVALRPRT: Record 70181;
        NOA: Record 70181;
        Purch: Record 38;
        SNo: Integer;
        Preference: Code[10];
}

