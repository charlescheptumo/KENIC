#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95013 "Risk Management Framework"
{
    PageType = Card;
    SourceTable = "Risk Management Framework";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Primary Purpose"; Rec."Primary Purpose")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Purpose field.';
                }
                field("Overall Responsibility"; Rec."Overall Responsibility")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Responsibility field.';
                }
                field("Last Revision Date"; Rec."Last Revision Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Revision Date field.';
                }
            }
            group("Risk Qualification/Measurements")
            {
                Caption = 'Risk Qualification/Measurements';
                field("Default Risk LR Scale ID"; Rec."Default Risk LR Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Risk LR Scale ID field.';
                }
                field("Default Risk Impact R. Scale"; Rec."Default Risk Impact R. Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Risk Impact R. Scale field.';
                }
                field("Default Overall RR Scale ID"; Rec."Default Overall RR Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Overall RR Scale ID field.';
                }
                field("Default Risk AR Scale ID"; Rec."Default Risk AR Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Risk AR Scale ID field.';
                }
                field("Default UoM (Financial Loss)"; Rec."Default UoM (Financial Loss)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default UoM (Financial Loss) field.';
                }
                field("Default UoM (Persons Injured)"; Rec."Default UoM (Persons Injured)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default UoM (Persons Injured) field.';
                }
                field("Default UoM (Fatalities)"; Rec."Default UoM (Fatalities)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default UoM (Fatalities) field.';
                }
                field("Default UoM Duration of Delays"; Rec."Default UoM Duration of Delays")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default UoM (Duration of Delays/Service disruption) field.';
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Corporate Risk Mgt Plan Nos."; Rec."Corporate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Risk Mgt Plan Nos. field.';
                }
                field("Functional Risk Mgt Plan Nos."; Rec."Functional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional Risk Mgt Plan Nos. field.';
                }
                field("Project Risk Mgt Plan Nos."; Rec."Project Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Risk Mgt Plan Nos. field.';
                }
                field("Directorate Risk Mgt Plan Nos."; Rec."Directorate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Risk Mgt Plan Nos. field.';
                }
                field("Departmenta Risk Mgt Plan Nos."; Rec."Departmenta Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Departmenta Risk Mgt Plan Nos. field.';
                }
                field("Regional Risk Mgt Plan Nos."; Rec."Regional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Risk Mgt Plan Nos. field.';
                }
                field("Risk Incident Nos."; Rec."Risk Incident Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Incident Nos. field.';
                }
                field("New Risk Voucher Nos"; Rec."New Risk Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Risk Voucher Nos field.';
                }
                field("Status Report Nos"; Rec."Status Report Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status Report Nos field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control34; "Risk Mgt Framework FactBox")
            {
                Caption = 'Risk Measurement & Control Statistics';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("RMF Overview"));
                ToolTip = 'Executes the Overview action.';
            }
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("Benefits/Importance"));
                ToolTip = 'Executes the Purpose(Goals & Objectives) action.';
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("RMF Guiding Principle"));
                ToolTip = 'Executes the Guiding Principles action.';
            }
            action("Stakeholder Register")
            {
                ApplicationArea = Basic;
                Image = Stop;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page StakeHolders;
                ToolTip = 'Executes the Stakeholder Register action.';
            }
            action("Risk Taxonomy")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Categories";
                ToolTip = 'Executes the Risk Taxonomy action.';
            }
            action("Risk Response Strategies")
            {
                ApplicationArea = Basic;
                Image = ServiceAgreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Response Strategies";
                ToolTip = 'Executes the Risk Response Strategies action.';
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Management Roles";
                ToolTip = 'Executes the Roles & Responsibilities action.';
            }
            action("Risk Identification Methods")
            {
                ApplicationArea = Basic;
                Image = Indent;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Identification Methods";
                ToolTip = 'Executes the Risk Identification Methods action.';
            }
            action("Risk Likelihood Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Likelihood Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Likelihood Rating"));
                ToolTip = 'Executes the Risk Likelihood Rating Scales action.';
            }
            action("Risk Impact Rating Scales")
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Impact Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Impact Rating"));
                ToolTip = 'Executes the Risk Impact Rating Scales action.';
            }
            action("Risk Overal Rating Scales")
            {
                ApplicationArea = Basic;
                Image = OrderList;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Overall Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Overall Risk Rating"));
                ToolTip = 'Executes the Risk Overal Rating Scales action.';
            }
            action("Risk Appetite Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Appetite Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Risk Appetite Rating"));
                ToolTip = 'Executes the Risk Appetite Rating Scales action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Primary Key", Rec."Primary Key");
                    Report.Run(95000, true, true, Rec);
                end;
            }
        }
    }
}

