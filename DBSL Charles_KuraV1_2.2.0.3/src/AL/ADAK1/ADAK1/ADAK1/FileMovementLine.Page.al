#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59091 "File Movement Line"
{
    PageType = ListPart;
    SourceTable = "File Movement Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field("File Description"; Rec."File Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Description field.';
                }
                field("File Number"; Rec."File Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Number field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Purpose/Description"; Rec."Purpose/Description")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Purpose/Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

