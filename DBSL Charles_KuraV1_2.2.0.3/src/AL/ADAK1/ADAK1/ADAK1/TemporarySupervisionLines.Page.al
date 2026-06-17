
Page 72530 "Temporary Supervision Lines"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "Temporary Supervision Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill No';
                    ToolTip = 'Specifies the value of the Bill No field.';
                }
                field("Plan Line No"; Rec."Plan Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Line No field.';
                }
                field("Bill Item No"; Rec."Bill Item No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bill Item No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bill Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Identification No';
                    ToolTip = 'Specifies the value of the Identification No field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Scheduled Date of Delivery"; Rec."Scheduled Date of Delivery")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled Date of Delivery field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Provision Type"; Rec."Provision Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provision Type field.';
                }
                field("Reversion Type"; Rec."Reversion Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversion Type field.';
                }
                field("Acknowledgement Details"; Rec."Acknowledgement Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acknowledgement Details field.';
                }
                field("Acknowledgement Date"; Rec."Acknowledgement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acknowledgement Date field.';
                }
                field("Acknowledgment By"; Rec."Acknowledgment By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acknowledgment By field.';
                }
            }
        }
    }

    actions
    {
    }
}



