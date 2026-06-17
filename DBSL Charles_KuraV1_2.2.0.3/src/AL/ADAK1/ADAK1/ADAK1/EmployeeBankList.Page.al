#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69007 "Employee Bank List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Employee Bank AccountX";
    UsageCategory = Administration;

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
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch No. field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field(Agent; Rec.Agent)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Agent field.';
                }
                field("No.Of Employees"; Rec."No.Of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Employees field.';
                }
                field("No.Of Employees-Guards"; Rec."No.Of Employees-Guards")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No.Of Employees-Guards field.';
                }
                field("No.Of Employees-Admin"; Rec."No.Of Employees-Admin")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No.Of Employees-Admin field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; MyNotes)
            {
            }
            systempart(Control1000000021; Links)
            {
            }
        }
    }

    actions
    {
    }
    trigger OnOpenPage();
    begin
        UserSetup.Get(UserId);
        if UserSetup."Payroll View" = false then
            ERROR('You do not have sufficient rights to view Employee Bank List Page!Please contact system administrator.');

    end;
    var
        UserSetup: Record "User Setup";
}

