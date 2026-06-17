page 50202 "Uploaded Sharepoint Documents"
{
    ApplicationArea = All;
    Caption = 'Uploaded Sharepoint Documents';
    PageType = List;
    SourceTable = UploadedSharepointDocuments;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ApplicationNo; Rec.ApplicationNo)
                {
                    ToolTip = 'Specifies the value of the ApplicationNo field.';
                }
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
