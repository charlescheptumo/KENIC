#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69319 "Trainers Involved"
{
    PageType = ListPart;
    SourceTable = "Trainers Involved";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID No./Paasport No.';
                    ToolTip = 'Specifies the value of the ID No./Paasport No. field.';
                }
                field("Trainer Full Name"; Rec."Trainer Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trainer Full Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

