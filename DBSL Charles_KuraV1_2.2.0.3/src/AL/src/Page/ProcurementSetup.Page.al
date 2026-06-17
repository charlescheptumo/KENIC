#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma warning disable DOC0101
#pragma implicitwith disable
Page 75000 "Procurement Setup"
#pragma warning restore DOC0101
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Procurement Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Default Proc Email Contact"; Rec."Default Proc Email Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Proc Email Contact field.';
                }
                field(SuppRegistrationEmailContact; Rec.SuppRegistrationEmailContact)
                {
                    ApplicationArea = all;
                    Caption = 'Supplier Registration Email Contact';
                    ToolTip = 'Specifies the value of the Supplier Registration Email Contact field.';
                }
                field("Default IFP Bid Charge Code"; Rec."Default IFP Bid Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default IFP Bid Charge Code field.';
                }
                field("Effective Procurement Plan"; Rec."Effective Procurement Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Procurement Plan field.';
                }
                field("Procurement Plan Notification"; Rec."Procurement Plan Notification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Notification field.';
                }
                field("Default Language Code"; Rec."Default Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Language Code field.';
                }
                field("Local Vendor Country Code"; Rec."Local Vendor Country Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Local Vendor Country Code field.';
                }
                field("Display Scoring Criteria"; Rec."Display Scoring Criteria")
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Scoring Criteria to Vendors?';
                    ToolTip = 'Specifies the value of the Display Scoring Criteria to Vendors? field.';
                }
                field("Default Tender Addendum Type"; Rec."Default Tender Addendum Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Tender Addendum Type field.';
                }
                field("Default PRN Conversion Proc"; Rec."Default PRN Conversion Proc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default PRN Conversion Procedure field.';
                }
                field("Default IFS Bid Charge Code"; Rec."Default IFS Bid Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default IFS Bid Charge Code field.';
                }
                field("Default Single Stage Tender"; Rec."Default Single Stage Tender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Single Stage Tender Validity Duration field.';
                }
                field("Default Two Stage Tender valid"; Rec."Default Two Stage Tender valid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Two Stage Tender Validity Duration field.';
                }
                field("Default RFQ Validity Duration"; Rec."Default RFQ Validity Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default RFQ Validity Duration field.';
                }
                field("Default LVP Validity Duration"; Rec."Default LVP Validity Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default LVP Validity Duration field.';
                }
                field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Acceptance Deadline Duration field.';
                }
                field("Min. Contract Holding Duration"; Rec."Min. Contract Holding Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. Contract Holding/Standstill Duration field.';
                }
                field("Procurement Appeal Review"; Rec."Procurement Appeal Review")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Appeal Review Board No. field.';
                }
                field("Enforce Strict Proc Budget che"; Rec."Enforce Strict Proc Budget che")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enforce Strict Procurement Budget Checks field.';
                }
                field("Back Alert on PRN Approval"; Rec."Back Alert on PRN Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Back Alert on PRN Final Approval field.';
                }
                field("Back Alert on IFS Creation"; Rec."Back Alert on IFS Creation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Back Alert on IFS Creation field.';
                }
                field("Default Procurement Template"; Rec."Default Procurement Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Procurement Template field.';
                }
                field("Default General Product PG"; Rec."Default General Product PG")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default General Product PG field.';
                }
                field("Default Vendor PG"; Rec."Default Vendor PG")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Vendor PG field.';
                }
                field("Default Tender Evaluation Peri"; Rec."Default Tender Evaluation Peri")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Tender Evaluation Period field.';
                }
                field("Procurement Link"; Rec."Procurement Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Link field.';
                }
                field("Procurement Officer License No"; Rec."Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Officer License No field.', Comment = '%';
                }
                field("Order Conditions"; Rec."Order Conditions")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Order Conditions field.';

                    trigger OnValidate()
                    begin
                        // CALCFIELDS("Order Conditions");
                        // "Order Conditions".CREATEINSTREAM(ObjInstr);
                        // Obj.READ(ObjInstr);

                        // IF ObjText<>FORMAT(Obj) THEN
                        // BEGIN
                        // CLEAR("Order Conditions");
                        // CLEAR(Obj);
                        // Obj.ADDTEXT(ObjText);
                        // "Order Conditions".CREATEOUTSTREAM(ObjOutStr);
                        // Obj.WRITE(ObjOutStr);
                        // MODIFY;
                        // END;
                    end;
                }
                field("<Order Conditions>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Terms and Conditions';
                    MultiLine = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Terms and Conditions field.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Order Conditions");
                        Rec."Order Conditions".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Order Conditions");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Order Conditions".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            Rec.Modify;
                        end;
                    end;
                }
                field("Terms and Conditions"; Rec."Terms and Conditions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terms and Conditions field.';
                }
                field("Item Journal Template Name"; Rec."Item Journal Template Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Journal Template Name field.', Comment = '%';
                }
                field("Item Journal Batch Name"; Rec."Item Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Journal Batch Name field.', Comment = '%';
                }
            }
            group("Number Series")
            {
                field("Procument Plan Nos"; Rec."Procument Plan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procument Plan Nos field.';
                }
                field("Purchase Req No"; Rec."Purchase Req No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Req No field.';
                }
                field("Store Req No"; Rec."Store Req No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store Req No field.';
                }
                field("Meals Req. Nos";Rec."Meals Req. Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meal Req No field.';
                }
                field("Return to Store Nos"; Rec."Return to Store Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return to Store Nos field.';
                }
                field("Loan Issue Req. Nos"; Rec."Loan Issue Req. Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Issue Req. Nos field.';
                }
                field("Loan Issue Surrender Nos"; Rec."Loan Issue Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Issue Surrender Nos field.';
                }
                field("Item Rejection Nos"; Rec."Item Rejection Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Rejection Nos field.';
                }
                field("Request For Registration Nos"; Rec."Request For Registration Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request For Registration Nos field.';
                }
                field("IFT Nos"; Rec."IFT Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFT Nos field.';
                }
                field("IFP Nos."; Rec."IFP Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFP Nos. field.';
                }
                field("Bid Req Template No. Series"; Rec."Bid Req Template No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Req Template No. Series field.';
                }
                field("ITT No. Series"; Rec."ITT No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ITT No. Series field.';
                }
                field("RFQ Nos"; Rec."RFQ Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFQ Nos field.';
                }

                field("Tender Clarification Nos"; Rec."Tender Clarification Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Clarification Nos field.';
                }
                field("EOI No. Series"; Rec."EOI No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EOI No. Series field.';
                }
                field("Low Value Purchase No. Series"; Rec."Low Value Purchase No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Low Value Purchase No. Series field.';
                }
                field("Standing Proc Committee  No."; Rec."Standing Proc Committee  No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Proc Committee  No. field.';
                }
                field("Vendor Debarment No. series"; Rec."Vendor Debarment No. series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Debarment No. series field.';
                }
                field("Vendor Reinstatement Nos"; Rec."Vendor Reinstatement Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Reinstatement Nos field.';
                }
                field("Project Key Staff Temp Nos"; Rec."Project Key Staff Temp Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Key Staff Temp Nos field.';
                }
                field("IFS Prebid Register"; Rec."IFS Prebid Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFS Prebid Register Nos';
                    ToolTip = 'Specifies the value of the IFS Prebid Register Nos field.';
                }
                field("Supplier Appraisal Template No"; Rec."Supplier Appraisal Template No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Appraisal Template No field.';
                }
                field("IFP Response Nos"; Rec."IFP Response Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFP Response Nos field.';
                }
                field("IFS Tender Committee No."; Rec."IFS Tender Committee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Tender Committee No. field.';
                }
                field("EOI Response Nos"; Rec."EOI Response Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EOI Response Nos field.';
                }
                field("Prequalification Score Header"; Rec."Prequalification Score Header")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Score Header field.';
                }
                field("Tender Addendum Notice"; Rec."Tender Addendum Notice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Addendum Notice field.';
                }
                field("Tender Cancellation Nos"; Rec."Tender Cancellation Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Cancellation Nos field.';
                }
                field("Bid Opening Nos"; Rec."Bid Opening Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Nos field.';
                }
                field("Final Evaluation Report Nos"; Rec."Final Evaluation Report Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluation Report Nos field.';
                }
                field("Proffesional Opinion Nos"; Rec."Proffesional Opinion Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proffesional Opinion Nos field.';
                }
                field("Notice of Award"; Rec."Notice of Award")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award field.';
                }
                field("Bid Security Claim Nos"; Rec."Bid Security Claim Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Security Claim Nos field.';
                }
                field("IFP Opening Register Nos"; Rec."IFP Opening Register Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFP Opening Register Nos field.';
                }
                field("Vendor Registration Invite Nos"; Rec."Vendor Registration Invite Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Registration Invite Nos field.';
                }
                field("Bid Security Returned Nos"; Rec."Bid Security Returned Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Security Returned Nos field.';
                }
                field("Request for PC sum Expensing Nos"; Rec."Request for PCsumExpensing Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request for PCsumExpensing Nos field.';
                }
                field("PC Evaluation Report Nos"; Rec."PC Evaluation Report Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PC Evaluation Report Nos field.';
                }
                field("Functional Disposal Plan Nos"; Rec."Functional Disposal Plan Nos")
                {
                    // ToolTip = 'Specifies the value of the Functional Disposal Plan Nos field.', Comment = '%';
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Functional Disposal Plan Nos field.';
                }
                field("Disposal Requisition Nos"; Rec."Disposal Requisition Nos")
                {
                    // ToolTip = 'Specifies the value of the Disposal Requisition Nos field.', Comment = '%';
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Disposal Requisition Nos field.';
                }
                field("Vendor Appraisal Nos"; Rec."Vendor Appraisal Nos")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Vendor Appraisal Nos field.';
                }
                field("Disposal Plan Nos"; Rec."Disposal Plan Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Plan Nos field.', Comment = '%';
                }
                field("Asset Disposal Nos"; Rec."Asset Disposal Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Asset Disposal Nos field.', Comment = '%';
                }
                field("Disposal Invitation Nos"; Rec."Disposal Invitation Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Invitation Nos field.', Comment = '%';
                }
            }
            group(Bid)
            {
                Caption = 'Bid';
                field("Default Bid Security %"; Rec."Default Bid Security %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Bid Security % field.';
                }
                field("Default Performance Security %"; Rec."Default Performance Security %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Performance Security % field.';
                }
                field("Default Advance Pay Security %"; Rec."Default Advance Pay Security %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Advance Payment Security % field.';
                }
                field("Special Grp Bid Waiver"; Rec."Special Grp Bid Waiver")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Bid Security Waiver field.';
                }
                field("Special Grp Performance Waiver"; Rec."Special Grp Performance Waiver")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Performance Security Waiver field.';
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Tender Validity Duration field.';
                }
                field("Bid Security Validity(After)"; Rec."Bid Security Validity(After)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Security Validity (After Tender Validity) field.';
                }
                field("Goods Supply Insurance Type"; Rec."Goods Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Goods Supply Insurance Type field.';
                }
                field("Works Supply Insurance Type"; Rec."Works Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Works Supply Insurance Type field.';
                }
                field("Service Supply Insurance Type"; Rec."Service Supply Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Services Supply Insurance Type field.';
                }
                field("Default Arbitrator Appointer"; Rec."Default Arbitrator Appointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Arbitrator Appointer field.';
                }
                field("Infinite Bid Value Limit"; Rec."Infinite Bid Value Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Infinite Bid Value Limit field.';
                }
                field("YES Bid Rating Response Value"; Rec."YES Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default YES Bid Rating Response Value field.';
                }
                field("Default YES Bid Rating Score %"; Rec."Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default YES Bid Rating Score % field.';
                }
                field("NO Bid Rating Response Value"; Rec."NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NO Bid Rating Response Value field.';
                }
                field("Default NO Bid Rating Score %"; Rec."Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default NO Bid Rating Score % field.';
                }
                field("1-POOR Option Text Bid Score %"; Rec."1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 1-POOR Option Text Bid Score % field.';
                }
                field("2-FAIR Option Text Bid Score %"; Rec."2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 2-FAIR Option Text Bid Score % field.';
                }
                field("3-GOOD Option Text Bid Score %"; Rec."3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 3-GOOD Option Text Bid Score % field.';
                }
                field("4-VERY GOOD  Text Bid Score %"; Rec."4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 4-VERY GOOD Option Text Bid Score % field.';
                }
                field("5-EXCELLENT Text Bid Score %"; Rec."5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 5-EXCELLENT Option Text Bid Score % field.';
                }
            }
            group(Notification)
            {
                Caption = 'Notification';
                field("Notify Committe Members"; Rec."Notify Committe Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notify Committe Members field.';
                }
            }
            group("EDMS Libraries")
            {
                Caption = 'EDMS Libraries';
                field("SharePoint Site Link"; Rec."SharePoint Site Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site Link field.';
                }
                field("SharePoint Site Domain Name"; Rec."SharePoint Site Domain Name")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site Domain Name field.';
                }
                field("SharePoint Site UserName"; Rec."SharePoint Site UserName")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site UserName field.';
                }
                field("SharePoint Site Password"; Rec."SharePoint Site Password")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SharePoint Site Password field.';
                }
                field("PRN(Goods & Services) DMS Link"; Rec."PRN(Goods & Services) DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the PRN(Goods & Services) DMS Link field.';
                }
                field("PRN(Works) DMS Link"; Rec."PRN(Works) DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the PRN(Works) DMS Link field.';
                }
                field("IFS DMS Link"; Rec."IFS DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the IFS DMS Link field.';
                }
                field("RFQ DMS Link"; Rec."RFQ DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the RFQ DMS Link field.';
                }
                field("IFS Tender Comm. DMS Link"; Rec."IFS Tender Comm. DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the IFS Tender Comm. DMS Link field.';
                }
                field("Tender Addendum DMS Link"; Rec."Tender Addendum DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Tender Addendum DMS Link field.';
                }
                field("IFS Bid Response DMS Link"; Rec."IFS Bid Response DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the IFS Bid Response DMS Link field.';
                }
                field("Evaluation Report DMS Link"; Rec."Evaluation Report DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Evaluation Report DMS Link field.';
                }
                field("Professional Opinion DMS Link"; Rec."Professional Opinion DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Professional Opinion DMS Link field.';
                }
                field("Notice of Award DMS Link"; Rec."Notice of Award DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Notice of Award DMS Link field.';
                }
                field("Standard Contract DMS Link"; Rec."Standard Contract DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Standard Contract DMS Link field.';
                }
                field("Inspection DMS Link"; Rec."Inspection DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Inspection DMS Link field.';
                }
                field("LPO/LSO DMS Link"; Rec."LPO/LSO DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the LPO/LSO DMS Link field.';
                }
                field("Framework Contracts DMS Link"; Rec."Framework Contracts DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Framework Contracts DMS Link field.';
                }
                field("Vendor Card DMS Link"; Rec."Vendor Card DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Vendor Card DMS Link field.';
                }
                field("IFP(Prequalification) DMS Link"; Rec."IFP(Prequalification) DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the IFP(Prequalification) DMS Link field.';
                }
                field("RFI Response DMS Link"; Rec."RFI Response DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the RFI Response DMS Link field.';
                }
                field("Procurement Laws DMS Link"; Rec."Procurement Laws DMS Link")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Procurement Laws DMS Link field.';
                }
                field("Tender Opening Reg DMS Link"; Rec."Tender Opening Reg DMS Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Opening Reg DMS Link field.';
                }
                field("SharePoint Document Library"; Rec."SharePoint Document Library")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Document Library field.';
                }
                field("SharePoint Site Main Library"; Rec."SharePoint Site Main Library")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SharePoint Site Main Library field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control10; Links)
            {
                Caption = 'Attach Procurement Laws';
            }
        }
    }


    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    var
        OrderConditions: BigText;
        Instr: InStream;
        OutStr: OutStream;
        OrderConditionsTxt: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}

#pragma implicitwith restore

