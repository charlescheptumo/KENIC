#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72688 "Cont Staff Disengagement Lines"
{
    PageType = ListPart;
    SourceTable = "Contr Staff Disengagement Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Contractor Staff No"; Rec."Contractor Staff No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Staff No field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Disengagement Reason"; Rec."Disengagement Reason")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Disengagement Reason field.';
                }
                field("Disengagement Details"; Rec."Disengagement Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disengagement Details field.';
                }
                field("Disengagement Date"; Rec."Disengagement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disengagement Date field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
            }
        }
    }

    actions
    {
    }
}

