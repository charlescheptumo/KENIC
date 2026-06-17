#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75024 "Procurement Template Card"
{
    PageType = Card;
    SourceTable = "Procurement Document Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
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
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control11; "Procurement Doc Template Line")
            {
                SubPageLink = "Template ID" = field("Template ID");
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup21)
            {
                action(Registration)
                {
                    ApplicationArea = Basic;
                    Image = RegisteredDocs;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Registration);
                    ToolTip = 'Executes the Registration action.';
                }
                action(Prequalification)
                {
                    ApplicationArea = Basic;
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Prequalification);
                    ToolTip = 'Executes the Prequalification action.';
                }
                action("EOI-Response")
                {
                    ApplicationArea = Basic;
                    Image = Return;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("EOI Response");
                    ToolTip = 'Executes the EOI-Response action.';
                }
                action("RFQ-Response")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("RFQ Response");
                    ToolTip = 'Executes the RFQ-Response action.';
                }
                action("ITT Response")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("ITT Response");
                    ToolTip = 'Executes the ITT Response action.';
                }
                action("Contract Issuance")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("Contract Issuance");
                    ToolTip = 'Executes the Contract Issuance action.';
                }
                action("Contract Documents")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Contract);
                    ToolTip = 'Executes the Contract Documents action.';
                }
                action("Purchase Requisition Notes")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("Purchase Requisition Notes");
                    ToolTip = 'Executes the Purchase Requisition Notes action.';
                }
                action(Transactional)
                {
                    ApplicationArea = Basic;
                    Image = TransferFunds;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Transactional);
                    ToolTip = 'Executes the Transactional action.';
                }
            }
        }
    }
}

