#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72083 "Daily Record Materials Del/Rem"
{
    PageType = ListPart;
    SourceTable = "Daily Record Materials Del/Rem";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Qunatity; Rec.Qunatity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qunatity field.';
                }
                field("Photo No"; Rec."Photo No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo No field.';
                }
            }
        }
    }

    actions
    {
    }
}

