/// <summary>
/// Page ProfessionalBodyMembers (ID 50023).
/// </summary>
page 50023 ProfessionalBodyMembers
{
    Caption = 'Professional Body Members';
    PageType = ListPart;
    SourceTable = ProfessionalBodyMembers;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Membership No."; Rec."Membership No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Membership No. field.';
                }
                field("Membership Category"; Rec."Membership Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Membership Category field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Annual Fee Payable"; Rec."Annual Fee Payable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Fee Payable field.';
                }
                field("CPD Points Required"; Rec."CPD Points Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CPD Points Required field.';
                }
            }
        }
    }
}
