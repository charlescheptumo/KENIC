namespace KICD.KICD;

page 50265 "Contract Renewal History"
{
    ApplicationArea = Basic;
    Caption = 'Contract Renewal History';
    PageType = ListPart;
    SourceTable = "Contract Renewal History";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No. field.', Comment = '%';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.', Comment = '%';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.', Comment = '%';
                }
                field("Contract Renewal Date"; Rec."Contract Renewal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Renewal Date field.';
                }
            }
        }
    }
}
