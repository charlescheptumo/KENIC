namespace KICD.KICD;

page 50233 "Attachments Setup"
{
    Caption = 'Attachments Setup';
    PageType = List;
    SourceTable = "Attachment Setup";
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
                field("Attachment Description"; Rec."Attachment Description")
                {
                    ToolTip = 'Specifies the value of the Attachment Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }
}
