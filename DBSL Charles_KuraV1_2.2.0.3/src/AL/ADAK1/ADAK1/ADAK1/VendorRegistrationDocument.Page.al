#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75015 "Vendor Registration Document"
{
    PageType = List;
    SourceTable = "Vendor Registration Document";
    ApplicationArea = All;

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
                field("Global Requirement"; Rec."Global Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Requirement field.';
                }
                field("Special Group Requirement"; Rec."Special Group Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Requirement field.';
                }
                field("Contractor (Works Requirement)"; Rec."Contractor (Works Requirement)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor (Works Requirement) field.';
                }
            }
        }
    }

    actions
    {
    }
}

