#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72144 "Road Facility Variants"
{
    PageType = List;
    SourceTable = "Road Facility Variant";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Type Code"; Rec."Sub Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Type Code field.';
                }
                field("Facility Type"; Rec."Facility Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Additional Notes"; Rec."Additional Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Notes field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inventory field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

