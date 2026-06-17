#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69009 "Brackets Table"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bracket Tablesx";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bracket Code"; Rec."Bracket Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bracket Code field.';
                }
                field("Bracket Description"; Rec."Bracket Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bracket Description field.';
                }
                field("Effective Starting Date"; Rec."Effective Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Starting Date field.';
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective End Date field.';
                }
                field(Annual; Rec.Annual)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Annual field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Notes)
            {
                Visible = false;
            }
            systempart(Control1000000009; MyNotes)
            {
                Visible = false;
            }
            systempart(Control1000000010; Links)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = '&Brackets Table';
                Ellipsis = true;
                Image = "Table";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Tax Table";
                RunPageLink = "Table Code" = field("Bracket Code");
                ToolTip = 'Executes the &Brackets Table action.';
            }
        }
    }
    trigger OnOpenPage();
    begin
        UserSetup.Get(UserId);
        if UserSetup."Payroll View" = false then
            ERROR('You do not have sufficient rights to view Brackets Page!Please contact system administrator.');

    end;

    var
        UserSetup: Record "User Setup";
}

