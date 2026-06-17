#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95012 "Risk Management Frameworks."
{
    ApplicationArea = Basic;
    CardPageID = "Risk Management Framework";
    PageType = List;
    SourceTable = "Risk Management Framework";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
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
                field("No. Of Risk Mgt Plans"; Rec."No. Of Risk Mgt Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Risk Mgt Plans field.';
                }
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
            }
        }
    }

    actions
    {
    }
}

