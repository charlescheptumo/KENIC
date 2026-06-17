namespace KICD.KICD;

page 50256 "Termination Reasons"
{
    ApplicationArea = All;
    Caption = 'Termination Reasons';
    PageType = ListPart;
    SourceTable = "Contract Termination Reasons";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }
}
