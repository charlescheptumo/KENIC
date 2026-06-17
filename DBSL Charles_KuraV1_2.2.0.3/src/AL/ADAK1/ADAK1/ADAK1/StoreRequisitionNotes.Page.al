#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50092 "Store Requisition Notes"
{
    PageType = List;
    SourceTable = "Store Requisition Notes";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Qty. Requested"; Rec."Qty. Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty. Requested field.';
                }
                field("Qty. Approved"; Rec."Qty. Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty. Approved field.';
                }
                field("Qty. Issued"; Rec."Qty. Issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty. Issued field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Measures"; Rec."Unit Measures")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Measures field.';
                }
                field("Remaining Qty"; Rec."Remaining Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Qty field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field("Requsted By"; Rec."Requsted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requsted By field.';
                }
                field(Dept; Rec.Dept)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dept field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Purch.SetRange("No.", Rec."Document No");
                        Report.Run(70029, true, true, Purch);
                    end;
                }
            }
        }
    }

    var
        Purch: Record "Purchase Header";
}

