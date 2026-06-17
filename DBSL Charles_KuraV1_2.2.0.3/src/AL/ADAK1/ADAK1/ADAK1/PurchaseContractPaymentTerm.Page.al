#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75287 "Purchase Contract Payment Term"
{
    Caption = 'Record of Payments';
    PageType = Listpart;
    SourceTable = "Purchase Contract Payment Term";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Sum field.';
                }
                field("Instalment Code"; Rec."Instalment Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'IPC Number';
                    ToolTip = 'Specifies the value of the IPC Number field.';
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                    OptionCaption = ',Advance,Interim,Interest,Final';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Payment %"; Rec."Payment %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment % field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Planned Amount"; Rec."Planned Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross IPC Amount(KES)';
                    ToolTip = 'Specifies the value of the Gross IPC Amount(KES) field.';
                }
                field("Planned Amount (LCY)"; Rec."Planned Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cumulative IPC Gross Amount(KES)';
                    ToolTip = 'Specifies the value of the Cumulative IPC Gross Amount(KES) field.';
                }
                field("Gross IPC Amount(FCY)"; Rec."Gross IPC Amount(FCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross IPC Amount(FCY)';
                    ToolTip = 'Specifies the value of the Gross IPC Amount(FCY) field.';
                }
                field("Cumulative Gross IPC Amount(FC"; Rec."Cumulative Gross IPC Amount(FC")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cumulative Gross IPC Amount(FCY';
                    ToolTip = 'Specifies the value of the Cumulative Gross IPC Amount(FCY field.';
                }
                field("Paid Amount"; Rec."Paid Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Paid Amount field.';
                }
                field("Paid Amount (LCY)"; Rec."Paid Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cumulative Paid Amount (KES)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumulative Paid Amount (KES) field.';
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Outstanding Amount field.';
                }
                field("Cumulative Outstanding Amount"; Rec."Cumulative Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumulative Outstanding Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Lines)
            {
                Caption = 'Lines';
                action("Purchase Contract Milestone")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Milestones';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Contract Milestone";
                    RunPageLink = "No." = field("No."),
                                  "Payment Instalment Code" = field("Instalment Code");
                    ToolTip = 'Executes the Contract Milestones action.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec."Outstanding Amount" := Rec."Planned Amount" - Rec."Paid Amount";
        Rec."Cumulative Outstanding Amount" := Rec."Cumulative Outstanding Amount" + Rec."Outstanding Amount";
    end;

    trigger OnAfterGetRecord()
    begin
        Rec."Outstanding Amount" := Rec."Planned Amount" - Rec."Paid Amount";
        Rec."Cumulative Outstanding Amount" := Rec."Cumulative Outstanding Amount" + Rec."Outstanding Amount";
    end;

    trigger OnOpenPage()
    begin

        Rec."Outstanding Amount" := Rec."Planned Amount" - Rec."Paid Amount";
        Rec."Cumulative Outstanding Amount" := Rec."Cumulative Outstanding Amount" + Rec."Outstanding Amount";
    end;

    var
        PurchaseContractPaymentTerm: Record "Purchase Contract Payment Term";
}

