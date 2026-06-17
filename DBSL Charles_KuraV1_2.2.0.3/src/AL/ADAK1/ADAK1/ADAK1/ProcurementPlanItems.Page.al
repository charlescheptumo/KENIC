#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70006 "Procurement Plan Items"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan1";
    SourceTableView = sorting("Plan Item No")
                      order(ascending);
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Item No field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Advertisement Date"; Rec."Advertisement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertisement Date field.';
                }
                field("Bid/Quotation Opening Date"; Rec."Bid/Quotation Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid/Quotation Opening Date field.';
                }
                field("Proposal Evaluation date"; Rec."Proposal Evaluation date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Evaluation date field.';
                }
                field("Contract End Date (Planned)"; Rec."Contract End Date (Planned)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date (Planned) field.';
                }
                field("TOR/Technical specs due Date"; Rec."TOR/Technical specs due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOR/Technical specs due Date field.';
                }
                field("Financial Opening date"; Rec."Financial Opening date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Opening date field.';
                }
                field("Negotiation date"; Rec."Negotiation date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Negotiation date field.';
                }
                field("Notification of award date"; Rec."Notification of award date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification of award date field.';
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Date field.';
                }
                field("Target Groups"; Rec."Target Groups")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Groups field.';
                }
                field(Youth; Rec.Youth)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Youth field.';
                }
                field(Women; Rec.Women)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Women field.';
                }
                field(PWD; Rec.PWD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PWD field.';
                }
                field("Citizen Contractors"; Rec."Citizen Contractors")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizen Contractors field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account';
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Margin of preference for Local"; Rec."Margin of preference for Local")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Margin of preference for Local field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Requisition Items"; Rec."Requisition Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Items field.';
                }
                field("Approved Budget"; Rec."Approved Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Budget field.';
                }
                field(Actual; Rec.Actual)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual field.';
                }
                field(Commitment; Rec.Commitment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitment field.';
                }
                field("Quarter 1 Amount"; Rec."Quarter 1 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 1 Amount field.';
                }
                field("Quarter 2 Amount"; Rec."Quarter 2 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 2 Amount field.';
                }
                field("Quarter 3 Amount"; Rec."Quarter 3 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 3 Amount field.';
                }
                field("Quarter 4 Amount"; Rec."Quarter 4 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 4 Amount field.';
                }
                field("Quarter 1 Qty"; Rec."Quarter 1 Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 1 Qty field.';
                }
                field("Quarter 2 Qty"; Rec."Quarter 2 Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 2 Qty field.';
                }
                field("Quarter 3 Qty"; Rec."Quarter 3 Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 3 Qty field.';
                }
                field("Quarter 4 Qty"; Rec."Quarter 4 Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter 4 Qty field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

