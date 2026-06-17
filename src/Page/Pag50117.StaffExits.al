page 50117 "Staff Exits"
{
    ApplicationArea = All;
    Caption = 'Staff Exits';
    PageType = List;
    SourceTable = "Staff Exit";
    CardPageID = "Staff Exit Card";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
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
                field("Employment Date"; Rec."Employment Date")
                {
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field(Status; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field("Company E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the employee''s email address at the company.';
                }
                field(Title; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
            }
        }
    }
}
