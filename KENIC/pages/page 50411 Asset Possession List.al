/// <summary>
/// Page Asset Possession List (ID 50411).
/// </summary>
page 50411 "Asset Possession List"
{
    Caption = 'Asset Possession Forms';
    PageType = List;
    SourceTable = "Asset Possession Header";
    CardPageId = "Asset Possession Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the form.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the staff number.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the staff member.';
                }
                field("Staff Type"; Rec."Staff Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the staff member is Permanent, Contract, Intern or Casual.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department of the staff member.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the position of the staff member.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the form was created.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the form is still open or has been issued.';
                }
            }
        }
    }
}
