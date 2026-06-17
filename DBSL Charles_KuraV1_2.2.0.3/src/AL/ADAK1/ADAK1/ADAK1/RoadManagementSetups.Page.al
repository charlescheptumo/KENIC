#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72136 "Road Management Setups"
{
    PageType = List;
    SourceTable = "Road Management Setup";
    ApplicationArea = All;
    Caption = 'Contracts Management Setup';


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Current Road Authority Code"; Rec."Current Road Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Road Authority Code field.';
                }
                field("Primary Legislation ID"; Rec."Primary Legislation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Legislation ID field.';
                }
                field("RICS Existing Link No"; Rec."RICS Existing Link No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS Existing Link No field.';
                }
                field("RICS New Link No"; Rec."RICS New Link No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS New Link No field.';
                }
                field("Road Work Plan Nos(Maintenanc)"; Rec."Road Work Plan Nos(Maintenanc)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Plan Nos(Maintenanc) field.';
                }
                field("Staff Appointment Voucher Nos"; Rec."Staff Appointment Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Appointment Voucher Nos field.';
                }
                field("Measurement Sheet Nos"; Rec."Measurement Sheet Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Measurement Sheet Nos field.';
                }
                field("Inspection Nos"; Rec."Inspection Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Nos field.';
                }
                field("Payment Certificate Nos"; Rec."Payment Certificate Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Certificate Nos field.';
                }
                field("Commencement Order Nos"; Rec."Commencement Order Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order Nos field.';
                }
                field("Work Execution Plan  Nos"; Rec."Work Execution Plan  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan  Nos field.';
                }
                field("Notice Of Completed Works Nos"; Rec."Notice Of Completed Works Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Of Completed Works Nos field.';
                }
                field("Contractor Payment Request Nos"; Rec."Contractor Payment Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Payment Request Nos field.';
                }
                field("Road Budget  Nos(Maintenance)"; Rec."Road Budget  Nos(Maintenance)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Budget  Nos(Maintenance) field.';
                }
                field("Road Budget  Nos(Development)"; Rec."Road Budget  Nos(Development)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Budget  Nos(Development) field.';
                }
                field("Road Work Plan Nos(Constructi)"; Rec."Road Work Plan Nos(Constructi)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Plan Nos(Constructi) field.';
                }
                field("Bill-To Customer No"; Rec."Bill-To Customer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-To Customer No field.';
                }
                field("RICS Project Based Nos"; Rec."RICS Project Based Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS Project Based Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}

