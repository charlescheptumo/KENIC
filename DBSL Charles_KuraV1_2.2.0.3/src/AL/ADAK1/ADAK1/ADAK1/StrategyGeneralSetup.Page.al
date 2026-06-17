#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80036 "Strategy General Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "SPM General Setup";
    UsageCategory = Administration;
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    

    layout
    {
        area(content)
        {
            group(Numbers)
            {
                field("Corp Strategic Plan Nos"; Rec."Corp Strategic Plan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corp Strategic Plan Nos field.';
                }
                field("Work Plan Nos"; Rec."Work Plan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Plan Nos field.';
                }
                field("Functional Nos"; Rec."Functional Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional Nos field.';
                }
                FIELD("Functional AWP Nos"; Rec."Functional AWP Nos")
                {
                    ApplicationArea = BASIC;
                    ToolTip = 'Specifies the value of the Functional AWP Nos field.';
                }
                field("Organizational PC Nos"; Rec."Organizational PC Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organizational PC Nos field.';
                }
                field("PM Plans Nos"; Rec."PM Plans Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PM Plans Nos field.';
                }
                field("PET Nos"; Rec."PET Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PET Nos field.';
                }
                field("PWork Plans"; Rec."PWork Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PWork Plans field.';
                }
                field("Corporate PC No. Series"; Rec."Corporate PC No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate PC No. Series field.';
                }
                field("Functional PC No. Series"; Rec."Functional PC No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional PC No. Series field.';
                }
                field("Individual Scorecard Nos"; Rec."Individual Scorecard Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Appraisal Nos';
                    ToolTip = 'Specifies the value of the Individual Appraisal Nos field.';
                }
                field("Monitoring Nos"; Rec."Monitoring Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monitoring Nos field.';
                }
                field("PC Target Revision Voucher Nos"; Rec."PC Target Revision Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PC Target Revision Voucher Nos field.';
                }
                field("Daily Performance Diary Nos"; Rec."Daily Performance Diary Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bi-Annual Performance Nos';
                    ToolTip = 'Specifies the value of the Bi-Annual Performance Nos field.';
                }
                field("Budget Consolidation Nos"; Rec."Budget Consolidation Nos")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Budget Consolidation Nos field.';
                }
                field("Performance Evaluation Nos"; Rec."Performance Evaluation Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual Performance Evaluation Nos';
                    ToolTip = 'Specifies the value of the Annual Performance Evaluation Nos field.';
                }
                field("Performance Appeals No. Series"; Rec."Performance Appeals No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Appeals No. Series field.';
                }
                field("Performance Improv Review Nos"; Rec."Performance Improv Review Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Improv Review Nos field.';
                }
                field("policy  Nos"; Rec."policy  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the policy  Nos field.';
                }
                field("PLog Nos"; Rec."PLog Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PLog Nos field.';
                }
                field("Workplan Revision No"; Rec."Workplan Revision No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Revision No field.';
                }
            }
            group(Setup)
            {
                field("Enable Performance Appeals"; Rec."Enable Performance Appeals")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Enable Performance Appeals field.';
                }
                field("Review Duration"; Rec."Review Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Duration field.';
                }
                field("Review Description"; Rec."Review Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Description field.';
                }
                field("Appraisal Based On"; Rec."Appraisal Based On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Based On field.';
                }
                field("Allow Loading of  CSP"; Rec."Allow Loading of  CSP")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Loading of  CSP field.';
                }
                field("Allow Loading of JD"; Rec."Allow Loading of JD")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Loading of JD field.';
                }
            }
            group("Annual Workplan Notification Setup")
            {
                Caption = 'Annual Workplan Notification Setup';
                field("Current Reporting Period"; Rec."Current Reporting Period")
                {
                    ToolTip = 'Specifies the value of the Current Reporting Period field.';

                }
                field("Current Reporting Quarter"; Rec."Current Reporting Quarter")
                {
                    ToolTip = 'Specifies the value of the Current Reporting Quarter field.';

                }
                field("Notification At the Begging Q"; Rec."Notification At the Begging Q")
                {
                    ToolTip = 'Specifies the value of the Notification At the Begging Q field.';

                }
                field("Notification Due Period"; Rec."Notification Due Period")
                {
                    ToolTip = 'Specifies the value of the Notification Due Period field.';

                }
                field("Current Quarter Start Date"; Rec."Current Quarter Start Date")
                {
                    ToolTip = 'Specifies the value of the Current Quarter Start Date field.';

                }
                field("Current Quarter End Date"; Rec."Current Quarter End Date")
                {
                    ToolTip = 'Specifies the value of the Current Quarter End Date field.';

                }
                field("Notification Due of PC"; Rec."Notification Due of PC")
                {
                    ToolTip = 'Specifies the value of the Notification Due of PC field.';

                }
                field("Planning and Strategy Email"; Rec."Planning and Strategy Email")
                {
                    ToolTip = 'Specifies the value of the Planning and Strategy Email field.';

                }
                field("HOD Planning & Strategy"; Rec."HOD Planning & Strategy")
                {
                    ToolTip = 'Specifies the value of the HOD Planning & Strategy field.';

                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

#pragma implicitwith restore

