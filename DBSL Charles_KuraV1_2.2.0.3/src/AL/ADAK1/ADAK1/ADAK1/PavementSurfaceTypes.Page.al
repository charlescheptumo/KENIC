#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72005 "Pavement Surface Types"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = TRUE;
    PageType = List;
    SourceTable = "Pavement Surface Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Pavement Category"; Rec."Pavement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Category field.';
                }
                field("Road Length (Kms)"; Rec."Road Length (Kms)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Length (Kms) field.';
                }
                field("No of Road Section"; Rec."No of Road Section")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Road Section field.';
                }
            }
        }
    }

    actions
    {
    }
}

