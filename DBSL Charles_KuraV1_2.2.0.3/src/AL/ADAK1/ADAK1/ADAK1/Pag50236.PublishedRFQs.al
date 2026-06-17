namespace KICD.KICD;

using Microsoft.Purchases.Document;

page 50236 "Published RFQs"
{
    Caption = 'Published RFQs';
    PageType = List;
    SourceTable = "Standard Purchase Code";
    ApplicationArea = Basic;
    CardPageID = "Request For Quotation (RFQ)";
    Editable = false;
    SourceTableView = where("Procurement Method" = const(RFQ),
                            Status = const(Released),
                            Published = const(true));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
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
            }
        }
    }

    actions
    {

    }
    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN
        //     Rec.SetFilter("Location Code", '=%1', UserSetup."Responsibility Center");
    end;

    var
    // UserSetup: Record "User Setup";
}

