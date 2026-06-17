page 50205 "Board Members"
{
    ApplicationArea = All;
    Caption = 'Board Members';
    PageType = List;
    SourceTable = "Board Members";
    UsageCategory = Lists;
    CardPageId = "Board Member";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Personal No"; Rec."Personal No")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.', Comment = '%';
                }
                field("E-Mail"; Rec."Company E-Mail")
                {
                    ToolTip = 'Specifies the employee''s Alternative email address.';
                }
            }
        }
    }
}
