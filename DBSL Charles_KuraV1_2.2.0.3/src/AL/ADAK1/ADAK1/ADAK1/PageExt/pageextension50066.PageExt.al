
PageExtension 50066 "pageextension50066" extends "Job Planning Lines"
{


    layout
    {


        addfirst(Control1)
        {
            field(Select; Rec.Select)
            {
                ApplicationArea = Basic;
                Visible = true;
                ToolTip = 'Specifies the value of the Select field.';
            }
        }

        addafter("No.")
        {
            field("Contract Type"; Rec."Contract Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract Type field.';
            }
            field("Road Code"; Rec."Road Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Road Code field.';
            }
        }
        addafter(Type)
        {
            field(Active; Rec.Active)
            {
                ApplicationArea = Basic;
                Editable = true;
                ToolTip = 'Specifies the value of the Active field.';
            }
        }
        addafter(Quantity)
        {
            field("Planned Rate Amount"; Rec."Planned Rate Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Planned Rate Amount field.';
            }
            field("Reversion Type"; Rec."Reversion Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reversion Type field.';
            }
            field("Road Technology"; Rec."Road Technology")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Road Technology field.';
            }
            field("Labour (%)"; Rec."Labour (%)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Labour (%) field.';
            }
        }
        addafter("Location Code")
        {
            field("Instruction Code"; Rec."Instruction Code")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Instruction Code field.';
            }
            field(Instruction; Rec.Instruction)
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Instruction field.';
            }
            field("Vendor No"; Rec."Vendor No")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Vendor No field.';
            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Vendor Name field.';
            }
            field("Station No"; Rec."Station No")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Station No field.';
            }
            field("Station Name"; Rec."Station Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Station Name field.';
            }
            field(Ordered; Rec.Ordered)
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Ordered field.';
            }
            field("Media Order"; Rec."Media Order")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Media Order field.';
            }
            field("Road Activity Categories"; Rec."Road Activity Categories")
            {
                ApplicationArea = Basic;
                Visible = true;
                ToolTip = 'Specifies the value of the Road Activity Categories field.';
            }
        }
        addafter("Work Type Code")
        {
            field("Bill Item No"; Rec."Bill Item No")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Bill Item No field.';
            }
            field("Road Activity Sub-Category"; Rec."Road Activity Sub-Category")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Road Activity Sub-Category field.';
            }
            field("Unit of Measure"; Rec."Unit of Measure")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Unit of Measure field.';
            }
        }

        addafter("Unit of Measure Code")
        {
            field("Qty. to Order"; Rec."Qty. to Order")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Qty. to Order field.';
            }
            field("Certified Quantity To Date"; Rec."Certified Quantity To Date")
            {
                ApplicationArea = basic;
                ToolTip = 'Specifies the value of the Certified Quantity To Date field.';
            }
        }
        addafter("Usage Link")
        {
            field("Bid Amount"; Rec."Bid Amount")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Bid Amount field.';
            }
            field("Bid Quantity"; Rec."Bid Quantity")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Bid Quantity field.';
            }
            field("Bid Rate"; Rec."Bid Rate")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Bid Rate field.';
            }
        }

        addafter("Unit Cost")
        {
            field("Unit Cost Inc VAT"; Rec."Unit Cost Inc VAT")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Unit Cost Inc VAT field.';
            }
        }
        addafter(Description)
        {
            field("Detailed Description"; Rec."Detailed Description")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Detailed Description field.';
            }
        }
        addafter("Total Cost")
        {
            field("Total Cost Incl. VAT"; Rec."Total Cost Incl. VAT")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Cost Incl. VAT field.';
                // Caption = 'Unit Cost Incl. VAT';
            }
            field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
            }
            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
            }
        }
        addafter(Overdue)
        {
            field("Last Proj Variation Order No."; Rec."Last Proj Variation Order No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Last Proj Variation Order No. field.';
            }
        }
        moveafter("Line Type"; Type)
        moveafter(Description; Quantity)
        moveafter(Quantity; "Gen. Bus. Posting Group")
        moveafter(Type; "No.")
    }
    actions
    {
        modify("Create &Sales Invoice")
        {
            Caption = 'Create &Purchase Invoice';
            ToolTip = 'Use a batch job to help you create purchase invoices for the involved job tasks.';

            //Unsupported feature: Property Modification (Name) on ""Create &Sales Invoice"(Action 51)".

        }
        modify("Create Sales &Credit Memo")
        {
            Caption = 'Create Purchase  &Credit Memo';
            ToolTip = 'Create a purchase credit memo for the selected job planning line.';

            //Unsupported feature: Property Modification (Name) on ""Create Sales &Credit Memo"(Action 60)".

        }
        modify("Sales &Invoices/Credit Memos")
        {
            Caption = 'Purchase Invoice/Credit Memos';
            ToolTip = 'View purchase invoices or purchase credit memos that are related to the selected job.';

            //Unsupported feature: Property Modification (Name) on ""Sales &Invoices/Credit Memos"(Action 69)".

        }
        addafter(OrderPromising)
        {
            action(PaymentCert)
            {
                ApplicationArea = Jobs;
                Caption = 'Generate Payment Certificate';
                Ellipsis = true;
                Image = JobSalesInvoice;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Use a batch job to help you create sales invoices for the involved job tasks.';

                trigger OnAction()
                begin
                    CreateMediaOrder(false);
                end;
            }
        }
    }

    var
        JobPlanLines: Record "Job Planning Line";
        Currency: Record Currency;
        PurchHeader: Record "Purchase Header";
        PurchHeader2: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        TempJobPlanningLine: Record "Job Planning Line" temporary;
        TransferExtendedText: Codeunit "Transfer Extended Text";
        JobInvCurrency: Boolean;
        UpdateExchangeRates: Boolean;
        NoOfPurchaseLinesCreated: Integer;
        Job: Record Job;
        LineNo: Integer;
        Text003: label '%1 may not be lower than %2 and may not exceed %3.';
        Text004: label 'You must specify Invoice No. or New Invoice.';
        Text005: label 'You must specify Credit Memo No. or New Invoice.';
        Text007: label 'You must specify %1.';
        Text008: label 'The lines were successfully transferred to a credit memo.';
        Text009: label 'The selected planning lines must have the same %1.';
        Text010: label 'The currency dates on all planning lines will be updated based on the invoice posting date because there is a difference in currency exchange rates. Recalculations will be based on the Exch. Calculation setup for the Cost and Price values for the job. Do you want to continue?';
        Text011: label 'The currency exchange rate on all planning lines will be updated based on the exchange rate on the sales invoice. Do you want to continue?';
        Text012: label 'The %1 %2 does not exist anymore. A printed copy of the document was created before the document was deleted.', Comment = 'The Sales Invoice Header 103001 does not exist in the system anymore. A printed copy of the document was created before deletion.';
        PurchaseOrder: Page "Purchase Invoice";
        JobPostingGroup: Record "Job Posting Group";

    local procedure CreateMediaOrder(CrMemo: Boolean)
    var
        JobPlanningLine: Record "Job Planning Line";
        JobCreateInvoice: Codeunit "Job Create-Invoice";
    begin
        Rec.TestField("Job No.");
        JobPlanningLine.Copy(JobPlanningLine);
        //CurrPage.SETSELECTIONFILTER(JobPlanningLine);
        CreateMediaOrderDoc(JobPlanningLine, CrMemo);
    end;

    procedure CreateMediaOrderDoc(var JobPlanningLine: Record "Job Planning Line"; CrMemo: Boolean)
    var
        PurchHeader: Record "Purchase Header";
        GetSalesInvoiceNo: Report "Fixed Asset - Analysis";
        GetSalesCrMemoNo: Report "Job Transfer to Credit Memo";
        Done: Boolean;
        NewInvoice: Boolean;
        PostingDate: Date;
        InvoiceNo: Code[20];
        DimMgt: Codeunit DimensionManagement;
        Factor: Integer;
        DimSetIDArr: array[10] of Integer;
        PurchNo: Code[20];
        PurSetUp: Record "Purchases & Payables Setup";
    begin
        Job.Reset;
        Job.SetRange(Job."No.", Rec."Job No.");
        if Job.FindFirst() then begin
            PurSetUp.Get;

            //create purchase header
            PurchHeader.Init;
            PurchHeader."No." := '';
            PurchHeader."Document Type" := PurchHeader."document type"::Invoice;
            PurchHeader.Validate("Buy-from Vendor No.", Job."Contractor No.");
            PurchHeader.Validate("Purchase Requisition No.", Job."Bill-to Customer No.");
            PurchHeader.Validate("Campaign No.", Job."Opportunity Reference");
            PurchHeader.Validate("Document Date", Today);
            PurchHeader."Currency Code" := Job."Currency Code";
            PurchHeader."Receiving No. Series" := PurSetUp."Posted Receipt Nos.";
            PurchHeader."Posting No. Series" := PurSetUp."Posted Invoice Nos.";
            PurchHeader.Insert(true);
            PurchNo := PurchHeader."No.";
            PurchHeader.Reset;
            PurchHeader.SetRange("Document Type", PurchHeader."document type"::Invoice);
            PurchHeader.SetRange("No.", PurchNo);
            if PurchHeader.FindFirst() then begin

                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.", Job."No.");
                JobPlanningLine.SetRange(JobPlanningLine.Select, true);
                JobPlanningLine.SetRange(Active, true);
                if JobPlanningLine.FindSet() then begin
                    repeat
                        LineNo := LineNo + 1000;
                        JobPlanningLine.TestField("Planning Date");
                        Job.Get(JobPlanningLine."Job No.");
                        Clear(PurchLine);
                        PurchLine.Init();
                        PurchLine."Document Type" := PurchHeader."Document Type";
                        PurchLine."Document No." := PurchHeader."No.";
                        if (not JobInvCurrency) and (JobPlanningLine.Type <> JobPlanningLine.Type::Text) then begin
                            PurchHeader.TestField("Currency Code", JobPlanningLine."Currency Code");
                            if Job."Currency Code" <> '' then begin
                                if Confirm(Text011) then begin
                                    JobPlanningLine.Validate("Currency Factor", PurchHeader."Currency Factor");
                                    JobPlanningLine.Modify;
                                end else
                                    Error('This job planning line was automatically generated. Do you want to continue?');
                            end;
                            PurchHeader.TestField("Currency Code", Job."Currency Code");
                        end;

                        PurchLine.Validate(Type, PurchLine.Type::"G/L Account");
                        Job.Reset;
                        Job.SetRange("No.", JobPlanningLine."Job No.");
                        if Job.FindSet then begin
                            JobPostingGroup.Reset;
                            JobPostingGroup.SetRange(JobPostingGroup.Code, Job."Job Posting Group");
                            if JobPostingGroup.FindSet then begin
                                PurchLine.Validate("No.", JobPostingGroup."G/L Expense Acc. (Contract)");
                            end;
                        end;
                        if JobPlanningLine."Qty. to Order" > 0 then begin
                            PurchLine.Validate("Job No.", Job."No.");
                            PurchLine.Validate("Direct Unit Cost", JobPlanningLine."Unit Cost Inc VAT");
                            PurchLine.Validate("Unit Cost", JobPlanningLine."Unit Cost Inc VAT");
                            PurchLine.Validate("Gen. Prod. Posting Group", JobPlanningLine."Gen. Prod. Posting Group");
                            PurchLine.Validate("Location Code", JobPlanningLine."Location Code");
                            PurchLine.Validate("Variant Code", JobPlanningLine."Variant Code");
                        end;

                        if PurchLine.Type <> PurchLine.Type::" " then begin
                            PurchLine.Validate("Unit of Measure Code", JobPlanningLine."Unit of Measure Code");
                            if JobPlanningLine."Qty. to Order" > 0 then
                                PurchLine.Validate(Quantity, 1 * JobPlanningLine."Qty. to Order");
                            if JobInvCurrency then begin
                                Currency.Get(PurchLine."Currency Code");
                                PurchLine.Validate("Unit Cost",
                                  ROUND(JobPlanningLine."Unit Cost Inc VAT" * PurchHeader."Currency Factor",
                                    Currency."Unit-Amount Rounding Precision"));
                                PurchLine.Validate("Direct Unit Cost",
                              ROUND(JobPlanningLine."Unit Cost Inc VAT" * PurchHeader."Currency Factor",
                                Currency."Unit-Amount Rounding Precision"));
                            end else
                                if JobPlanningLine."Qty. to Order" > 0 then begin
                                    PurchLine.Validate("Unit Cost", JobPlanningLine."Unit Cost Inc VAT");
                                    PurchLine.Validate(PurchLine."Direct Unit Cost", JobPlanningLine."Unit Cost Inc VAT");
                                    PurchLine.Validate("Unit Cost", JobPlanningLine."Unit Cost Inc VAT");
                                    PurchLine.Validate("Unit Cost (LCY)", JobPlanningLine."Unit Cost Inc VAT");
                                    PurchLine.Validate("Line Discount %", JobPlanningLine."Agency Commision %");
                                    PurchLine."Inv. Discount Amount" := 0;
                                    PurchLine."Inv. Disc. Amount to Invoice" := 0;
                                    PurchLine.UpdateAmounts;
                                end;
                        end;

                        if not PurchHeader."Prices Including VAT" then
                            //PurchLine.VALIDATE("Job Contract Entry No.",JobPlanningLine."Job Contract Entry No.");
                            PurchLine."Job No." := Job."No.";
                        PurchLine.Validate("Job No.");
                        PurchLine."Job Task No." := JobPlanningLine."Job Task No.";
                        if PurchLine."Job Task No." <> '' then begin
                            DimSetIDArr[1] := PurchLine."Dimension Set ID";
                            DimSetIDArr[2] :=
                              DimMgt.CreateDimSetFromJobTaskDim(
                                PurchLine."Job No.", PurchLine."Job Task No.", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                            DimSetIDArr[3] := GetLedgEntryDimSetID(JobPlanningLine);
                            DimSetIDArr[4] := GetJobLedgEntryDimSetID(JobPlanningLine);
                            PurchLine."Dimension Set ID" :=
                              DimMgt.GetCombinedDimensionSetID(
                                DimSetIDArr, PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                        end;
                        PurchLine.Description := JobPlanningLine.Description;
                        PurchLine."Description 2" := JobPlanningLine."Description 2";
                        if JobPlanningLine."Qty. to Transfer to Invoice" > 0 then
                            PurchLine.Validate("Direct Unit Cost", JobPlanningLine."Unit Cost Inc VAT");
                        PurchLine."Line No." := LineNo;
                        PurchLine.Insert(true);
                        if PurchHeader."Prices Including VAT" and
                           (PurchLine.Type <> PurchLine.Type::" ")
                        then begin
                            if PurchLine."Currency Code" = '' then
                                Currency.InitRoundingPrecision
                            else
                                Currency.Get(PurchLine."Currency Code");
                            PurchLine."Unit Cost" :=
                              ROUND(
                                PurchLine."Unit Cost" * (1 + (PurchLine."VAT %" / 100)),
                                Currency."Unit-Amount Rounding Precision");
                            if PurchLine.Quantity <> 0 then begin
                                PurchLine."Line Discount Amount" :=
                                  ROUND(
                                    PurchLine.Quantity * PurchLine."Unit Cost" * PurchLine."Line Discount %" / 100,
                                    Currency."Amount Rounding Precision");
                                PurchLine.Validate("Inv. Discount Amount",
                                  ROUND(
                                    PurchLine."Inv. Discount Amount" * (1 + (PurchLine."VAT %" / 100)),
                                    Currency."Amount Rounding Precision"));
                            end;

                            // PurchLine.VALIDATE("Job Contract Entry No.",JobPlanningLine."Job Contract Entry No.");

                            PurchLine.Modify;
                            JobPlanningLine."VAT Unit Price" := PurchLine."Unit Cost";
                            JobPlanningLine."VAT Line Discount Amount" := PurchLine."Line Discount Amount";
                            JobPlanningLine."VAT Line Amount" := PurchLine."Line Amount";
                            JobPlanningLine."VAT %" := PurchLine."VAT %";
                            JobPlanningLine."Media Order" := PurchNo;
                            JobPlanningLine.Select := false;
                            JobPlanningLine.Ordered := true;
                            JobPlanningLine.Modify;
                        end;

                    until JobPlanningLine.Next = 0;
                    PurchHeader."Vendor Order No." := Rec."No.";
                    PurchHeader.Modify;
                    Rec."Media Order" := PurchNo;
                    //MODIFY;
                end;

            end;
        end;
        //MESSAGE('Road Project Order %1 Created Succesfully',PurchNo);

        // PurchHeader.Reset;
        // PurchHeader.SetRange(PurchHeader."Document Type", PurchHeader."document type"::Invoice);
        // PurchHeader.SetRange(PurchHeader."No.", PurchNo);
        // if PurchHeader.FindSet then begin
        //     PurchaseOrder.SetTableview(PurchHeader);
        //     PurchaseOrder.Run;
        // end;

        Message('Payment Certificate %1 Created Succesfully', PurchNo);

        PurchHeader.Reset;
        PurchHeader.SetRange(PurchHeader."Document Type", PurchHeader."document type"::Invoice);
        PurchHeader.SetRange(PurchHeader."No.", PurchNo);
        if PurchHeader.FindSet then begin
            PurchaseOrder.SetTableview(PurchHeader);
            PurchaseOrder.Run;
        end;

    end;

    local procedure GetLedgEntryDimSetID(JobPlanningLine: Record "Job Planning Line"): Integer
    var
        ResLedgEntry: Record "Res. Ledger Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        GLEntry: Record "G/L Entry";
    begin
        if JobPlanningLine."Ledger Entry No." = 0 then
            exit(0);

        case JobPlanningLine."Ledger Entry Type" of
            JobPlanningLine."ledger entry type"::Resource:
                begin
                    ResLedgEntry.Get(JobPlanningLine."Ledger Entry No.");
                    exit(ResLedgEntry."Dimension Set ID");
                end;
            JobPlanningLine."ledger entry type"::Item:
                begin
                    ItemLedgEntry.Get(JobPlanningLine."Ledger Entry No.");
                    exit(ItemLedgEntry."Dimension Set ID");
                end;
            JobPlanningLine."ledger entry type"::"G/L Account":
                begin
                    GLEntry.Get(JobPlanningLine."Ledger Entry No.");
                    exit(GLEntry."Dimension Set ID");
                end;
            else
                exit(0);
        end;
    end;

    local procedure GetJobLedgEntryDimSetID(JobPlanningLine: Record "Job Planning Line"): Integer
    var
        JobLedgerEntry: Record "Job Ledger Entry";
    begin
        if JobPlanningLine."Job Ledger Entry No." = 0 then
            exit(0);

        if JobLedgerEntry.Get(JobPlanningLine."Job Ledger Entry No.") then
            exit(JobLedgerEntry."Dimension Set ID");

        exit(0);
    end;
}



