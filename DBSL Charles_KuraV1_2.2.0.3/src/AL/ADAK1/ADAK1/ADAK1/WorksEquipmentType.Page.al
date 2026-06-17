#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 90158 "Works Equipment Type"
{
    PageType = List;
    SourceTable = "Works Equipment Type";
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
                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. of Equipment (Ongoing)"; Rec."No. of Equipment (Ongoing)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Equipment (Ongoing Projects) field.';
                }
            }
        }
    }

    actions
    {
    }
}
