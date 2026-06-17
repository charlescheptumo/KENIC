#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72215 "Project Staff Template Expe"
{
    Caption = 'Project Staff Template Experience';
    PageType = List;
    SourceTable = "Project Staff Template Experie";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key Staff Template ID"; Rec."Key Staff Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key Staff Template ID field.';
                }
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Role Code field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience Category field.';
                }
                field("Minimum Years of Experience"; Rec."Minimum Years of Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Years of Experience field.';
                }
                field("Minimum Experience Req"; Rec."Minimum Experience Req")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Experience Requirements field.';
                }
            }
        }
    }

    actions
    {
    }
}

