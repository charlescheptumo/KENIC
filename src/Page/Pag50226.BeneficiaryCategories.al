namespace KICD.KICD;

page 50226 "Beneficiary Categories"
{
    Caption = 'Beneficiary Categories';
    PageType = List;
    SourceTable = "Benefits Types";
    ApplicationArea = Basic;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }
}
