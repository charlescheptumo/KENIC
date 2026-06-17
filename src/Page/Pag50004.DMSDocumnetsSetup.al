#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50004 "DMS Documnets Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "DMS Documents";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Sharepoint URL"; Rec."Sharepoint URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sharepoint URL field.';
                }
                field("Document Path"; Rec."Document Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Path field.';
                }
                field("Library Name"; Rec."Library Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Library Name field.';
                }
                field("Folder Name"; Rec."Folder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Folder Name field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

