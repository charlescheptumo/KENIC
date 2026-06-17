namespace KICD.KICD;

page 50301 "Portal Documents"
{
    ApplicationArea = All;
    Caption = 'Portal Documents';
    PageType = ListPart;
    SourceTable = UploadedSharepointDocuments;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(FileLink; Rec.FileLink)
                {
                    ToolTip = 'Specifies the value of the FileLink field.';
                }
                field(FileName; Rec.FileName)
                {
                    ToolTip = 'Specifies the value of the FileName field.';
                }
            }
        }
    }
}
