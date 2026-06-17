#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75012 "Procurement Plan Entry"
{
    PageType = List;
    //return
    // DeleteAllowed = false;
    // Editable = false;
    SourceTable = "Procurement Plan Entry";
    ApplicationArea = All;
    //SourceTableView = where("Procurement Type" = filter('Works'));



    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = ProcurementPlanNoVisible;
                    ToolTip = 'Specifies the value of the Procurement Plan ID field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Category field.';
                }
                field(Items; Rec.Items)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Items field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job No field.';
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job Task No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Preference/Reservation Code"; Rec."Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preference/Reservation Code field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Product Group field.';
                }
                field("Procurement Use"; Rec."Procurement Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Use field.';
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                    visible = true;
                    ToolTip = 'Specifies the value of the Planning Date field.';
                }
                field("Planned Days"; Rec."Planned Days")
                {
                    ApplicationArea = Basic;
                    visible = true;
                    ToolTip = 'Specifies the value of the Planned Days field.';
                }
                field("Actual Days"; Rec."Actual Days")
                {
                    ApplicationArea = Basic;
                    visible = true;
                    ToolTip = 'Specifies the value of the Actual Days field.';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    trigger OnAssistEdit()
                    begin
                        Pplan.Reset();
                        Pplan.SetRange(Code, Rec."Procurement Plan ID");
                        if Pplan.FindFirst() then begin
                            Clear(ChangeExchangeRate);
                            if Pplan."Document Date" <> 0D then
                                ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Pplan."Document Date")
                            else
                                ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                            if ChangeExchangeRate.RunModal = ACTION::OK then begin
                                Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            end;
                            Clear(ChangeExchangeRate);
                        end;
                    end;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Estimated Cost of Project"; Rec."Estimated Cost of Project")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Cost of Project field.';
                }
                field("Accumulated Total Budget";Rec."Accumulated Total Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accumulated Total Budget field.';
                    DrillDownPageId = 75419;
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ToolTip = 'Specifies the value of the Available Procurement Budget field.';
                }
                field("Q1 Quantity";Rec."Q1 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Quantity field.';
                }
                field("Q1 Amount";Rec."Q1 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Amount field.';
                }
                field("Q2 Quantity";Rec."Q2 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Quantity field.';
                }
                field("Q2 Amount";Rec."Q2 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Amount field.';
                }
                field("Q3 Quantity";Rec."Q3 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Quantity field.';
                }
                field("Q3 Amount";Rec."Q3 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Amount field.';
                }
                field("Q4 Quantity";Rec."Q4 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Quantity field.';
                }
                field("Q4 Amount";Rec."Q4 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Amount field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Budget Cost"; Rec."Line Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Budget';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line Budget field.';
                }
                field("Line Budget Cost (LCY)"; Rec."Line Budget Cost (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Budget Cost (LCY) field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Region field.';
                    Visible = false;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                    // TableRelation = "General Ledger Setup"."Shortcut Dimension 3 Code";

                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                // field("Road No."; Rec."Road No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Road Name"; Rec."Road Name")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Total PRN Commitments"; Rec."Total PRN Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total PRN Commitments field.';
                }
                field("Total PO Commitments"; Rec."Total PO Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total PO Commitments field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }

                // field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Budget Control Job Task No. field.';
                // }
                field("Section Length(Km)"; Rec."Section Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Length(Km) field.';
                    visible = false;
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Plan Project ID field.';
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Task No. field.';
                }
                field("Invite Tender"; Rec."Invite Tender")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Invite Tender field.';
                }
                field("Open Tender"; Rec."Open Tender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open Tender field.';
                }
                field("Bid Evaluation"; Rec."Bid Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Evaluation field.';
                }
                field("Tender Committee Action"; Rec."Tender Committee Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Committee Action field.';
                }
                field("Notification of Award"; Rec."Notification of Award")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification of Award field.';
                }
                field("Signing of Contract"; Rec."Signing of Contract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Signing of Contract field.';
                }
                field("Work Commencement"; Rec."Work Commencement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Commencement field.';
                }
                field("Completion of works"; Rec."Completion of works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion of works field.';
                }
                field("Revision  No"; Rec."Revision  No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision  No field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = ' KICD Budget Code';
                    ToolTip = 'Specifies the value of the  KICD Budget Code field.';
                }
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Type field.';
                }
                field("Works Type"; Rec."Works Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Type field.';
                }
                field("Original Budget"; Rec."Original Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Budget field.';
                }
                field("Budget Type 1"; Rec."Budget Type 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Type 1 field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
            }
            systempart(Control38; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control40; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Suggest)
            {
                Image = Suggest;
                action("Suggest From G/L Budget")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Select Procurement Line1";
                    // RunPageLink = "Works Type"=filter("Road Construction"|"Axle Load "|Maintenance|"Survey/Study"|"Structure Construction"),
                    //             Works=filter(Yes);
                    Visible = false;
                    ToolTip = 'Executes the Suggest From G/L Budget action.';
                }
                action(SelectBudgetEntries)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Select Budget Entries';
                    Ellipsis = true;
                    Image = "Filter";
                    visible = true;
                    ToolTip = 'Executes the Select Budget Entries action.';
                    // ToolTip = 'Limit the entries according to the dimension filters that you specify. NOTE: If you use a high number of dimension combinations, this function may not work and can result in a message that the SQL server only supports a maximum of 2100 parameters.';

                    trigger OnAction()
                    var
                        ProcurementPlan: Record 70098;
                        CashManagementSetup: record 57004;
                        CurrentBudget: text;
                        Glline: Record 96;
                        ProcurementPlanEntry: record 70101;



                    begin
                        // SetFilter("Dimension Set ID", DimensionSetIDFilter.LookupFilter);
                        CashManagementSetup.GET;
                        CurrentBudget := CashManagementSetup."Current Budget";

                        //ProcurementPlan.RESET;
                        //ProcurementPlan.SETRANGE(ProcurementPlan.Code, "Procurement Plan ID");
                        IF ProcurementPlan.FINDSET THEN
                            //  Responsibility := ProcurementPlan."Planning Responsibility Center";
                            //MESSAGE('%1',Responsibility);



                            GlLine.RESET;
                        GlLine.SETRANGE(GlLine."Budget Name", CurrentBudget);
                        //GlLine.SETRANGE(GlLine."Shortcut Dimension 4 Code",ProcurementPlan."Planning Responsibility Center");
                        // GlLine.SETRANGE(GlLine.Works, TRUE);
                        //GlLine.SETRANGE(GlLine."Directorate Code", Responsibility);

                        IF GlLine.FINDSET THEN BEGIN
                            REPEAT
                                ProcurementPlanEntry.SETCURRENTKEY("Procurement Plan ID", "Planning Category");
                                ProcurementPlanEntry.SETRANGE(ProcurementPlanEntry."Procurement Plan ID", rec."Procurement Plan ID");
                                // ProcurementPlanEntry.SETRANGE(ProcurementPlanEntry."Planning Category", "Planning Category");
                                IF ProcurementPlanEntry.FINDSET THEN BEGIN
                                    REPEAT
                                        ProcurementPlanEntry.INIT;
                                        ProcurementPlanEntry."Entry No." := ProcurementPlanEntry."Entry No." + 1;
                                        ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."Document Type"::"Procurement Plan";
                                        ProcurementPlanEntry."KeRRA Budget Code" := GlLine."KeRRA Budget Code";
                                        // ProcurementPlanEntry."Budget Entry No" := GlLine."Entry No.";
                                        ProcurementPlanEntry.Description := GlLine.Description;
                                        ProcurementPlanEntry."Global Dimension 1 Code" := GlLine."Global Dimension 1 Code";
                                        ProcurementPlanEntry."Global Dimension 2 Code" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Unit Cost" := GlLine.Amount;
                                        ProcurementPlanEntry.Quantity := 1;
                                        // VALIDATE(Quantity);
                                        ProcurementPlanEntry."Project Type" := GlLine."Project Type";
                                        ProcurementPlanEntry."Works Type" := GlLine."Works Type";
                                        ProcurementPlanEntry."Procurement Type" := 'WORKS';
                                        ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                                        ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."Requisition Product Group"::Works;
                                        ProcurementPlanEntry.Region := GlLine."Global Dimension 1 Code";
                                        // ProcurementPlanEntry.Directorate := GlLine."Directorate Code";
                                        ProcurementPlanEntry."Budget Control Job No" := GlLine."Project Code";
                                        ProcurementPlanEntry."Budget Type 1" := GlLine."Budget Type 1";
                                        ProcurementPlanEntry."Funding Source ID" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."Procurement Use"::"Project-Specific Use";
                                        ProcurementPlanEntry."Original Budget" := GlLine."Original Budget";
                                        ProcurementPlanEntry.INSERT(TRUE);


                                    UNTIL GlLine.NEXT = 0
                                END;
                            UNTIL ProcurementPlanEntry.NEXT = 0;
                        END;

                        // ProcurementPlan.RESET;
                        // ProcurementPlan.SETRANGE(ProcurementPlan.Code,"Procurement Plan ID");
                        // IF ProjectStaffVoucher.FINDSET THEN 
                        //  REPEAT
                        //    ProjectStaffVoucher."From Document No.":="Document No.";
                        //    ProjectStaffVoucher."Document Type":="Document Type";
                        //    ProjectStaffVoucher.MODIFY(TRUE);
                        //    UNTIL ProjectStaffVoucher.NEXT=0;
                        // 
                        // ProjectStaffAppointmentLine.RESET;
                        // ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
                        // IF ProjectStaffAppointmentLine.FINDSET THEN 
                        //  BEGIN
                        //     ProjectStaffAppointList.SETTABLEVIEW(ProjectStaffAppointmentLine);
                        //     ProjectStaffAppointList.GetDocNumber("Document No.","Staff Appointment Voucher No.");
                        //     ProjectStaffAppointList.RUN;
                        //    END;

                    end;
                }


                action("Suggest Budget Entries")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    visible = false;
                    ToolTip = 'Executes the Suggest Budget Entries action.';

                    trigger OnAction()
                    begin
                        CashManagementSetup.Get;
                        CurrentBudget := CashManagementSetup."Current Budget";

                        ProcurementPlan.Reset;
                        ProcurementPlan.SetRange(ProcurementPlan.Code, Rec."Procurement Plan ID");
                        if ProcurementPlan.FindSet then
                            Responsibility := ProcurementPlan."Planning Responsibility Center";
                        //MESSAGE('%1',Responsibility);



                        GlLine.Reset;
                        GlLine.SetRange(GlLine."Budget Name", CurrentBudget);
                        GlLine.SETRANGE(GlLine."Shortcut Dimension 4 Code", ProcurementPlan."Planning Responsibility Center");
                        //// // GlLine.SetRange(GlLine.Works, true);
                        ///GlLine.SetRange(GlLine."Project Type", GlLine."Project Type"::"Multi-Year Programs");
                        //GlLine.SetRange(GlLine."Directorate Code", Responsibility);

                        if GlLine.FindSet then begin
                            repeat
                                ProcurementPlanEntry.SetCurrentkey("Procurement Plan ID", "Planning Category");
                                ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID", Rec."Procurement Plan ID");
                                ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Planning Category", Rec."Planning Category");
                                if ProcurementPlanEntry.FindSet then begin
                                    repeat
                                        ProcurementPlanEntry.Init;
                                        ProcurementPlanEntry."Entry No." := ProcurementPlanEntry."Entry No." + 1;
                                        ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."document type"::"Procurement Plan";
                                        ProcurementPlanEntry."KeRRA Budget Code" := GlLine."KeRRA Budget Code";
                                        // ProcurementPlanEntry."Budget Entry No" := GlLine."Entry No.";
                                        ProcurementPlanEntry.Description := GlLine.Description;
                                        ProcurementPlanEntry."Global Dimension 1 Code" := GlLine."Global Dimension 1 Code";
                                        ProcurementPlanEntry."Global Dimension 2 Code" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Unit Cost" := GlLine.Amount;
                                        ProcurementPlanEntry.Quantity := 1;
                                        Rec.Validate(Rec.Quantity);
                                        ProcurementPlanEntry."Project Type" := GlLine."Project Type";
                                        ProcurementPlanEntry."Works Type" := GlLine."Works Type";
                                        ProcurementPlanEntry."Procurement Type" := 'WORKS';
                                        ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                                        ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                                        ProcurementPlanEntry.Region := GlLine."Global Dimension 1 Code";
                                        //// ProcurementPlanEntry.Directorate := GlLine."Directorate Code";
                                        ProcurementPlanEntry."Budget Control Job No" := GlLine."Project Code";
                                        ProcurementPlanEntry."Budget Type 1" := GlLine."Budget Type 1";
                                        ProcurementPlanEntry."Funding Source ID" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                                        ProcurementPlanEntry."Original Budget" := GlLine."Original Budget";
                                        ProcurementPlanEntry.Insert(true);


                                    until GlLine.Next = 0
                                end;
                            until ProcurementPlanEntry.Next = 0;
                        end;

                        // ProcurementPlan.RESET;
                        // ProcurementPlan.SETRANGE(ProcurementPlan.Code,"Procurement Plan ID");
                        // IF ProjectStaffVoucher.FINDSET THEN
                        //  REPEAT
                        //    ProjectStaffVoucher."From Document No.":="Document No.";
                        //    ProjectStaffVoucher."Document Type":="Document Type";
                        //    ProjectStaffVoucher.MODIFY(TRUE);
                        //    UNTIL ProjectStaffVoucher.NEXT=0;
                        //
                        // ProjectStaffAppointmentLine.RESET;
                        // ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
                        // IF ProjectStaffAppointmentLine.FINDSET THEN
                        //  BEGIN
                        //     ProjectStaffAppointList.SETTABLEVIEW(ProjectStaffAppointmentLine);
                        //     ProjectStaffAppointList.GetDocNumber("Document No.","Staff Appointment Voucher No.");
                        //     ProjectStaffAppointList.RUN;
                        //    END;
                    end;
                }
            }
        }
    }


    trigger OnOpenPage()
    begin
        Rec.CalcFields("Total Contract Commitments");
        GlLine.Reset;
        // GlLine.SetRange(Select, true);
        if GlLine.FindSet then begin
            if Today = Today then
                repeat


                    ProcurementPlanEntry.Reset;
                    ProcurementPlanEntry.SetRange("Procurement Plan ID", ProcurementPlanEntry."Procurement Plan ID");
                    ProcurementPlanEntry.SetRange("Planning Category", ProcurementPlanEntry."Planning Category");
                    if ProcurementPlanEntry.FindSet then begin
                        repeat
                            Rec."KeRRA Budget Code" := GlLine."KeRRA Budget Code";
                            Rec.Description := GlLine.Description;
                            Rec."Works Type" := GlLine."Works Type";


                            GlLine.Modify(true);
                        until ProcurementPlanEntry.Next = 0;
                    end;
                until GlLine.Next = 0;
        end;

        Rec."Available Procurement Budget" := Rec."Line Budget Cost" - (rec."Total Contract Commitments" + Rec."Total Actual Costs");
        
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        ProcurementPlanNo: Code[20];
       // [InDataSet]
        ProcurementPlanNoVisible: Boolean;
       // [InDataSet]
        ProcurementPlanLineNoVisible: Boolean;
        gl: Record "G/L Budget Entry";
        GLSelect: Page "Select Procurement Line1";
        GlLine: Record "G/L Budget Entry";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        CashManagementSetup: Record "Cash Management Setup";
        CurrentBudget: Code[50];
        Responsibility: Text;
        Pplan: Record "Procurement Plan";


    procedure SetProcurementNo(No: Code[20])
    begin
        ProcurementPlanNo := No;
    end;


    procedure SetProcurementNoVisible(NewJobNoVisible: Boolean)
    begin
        ProcurementPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetProcuremntLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        ProcurementPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

#pragma implicitwith restore
