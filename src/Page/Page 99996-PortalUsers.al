/// <summary>
/// Page Portal Users (ID 99996).
/// </summary>
page 99996 "Portal Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dynasoft Portal User";
    CardPageId = "Portal User card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Name field.';

                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Authentication Email"; Rec."Authentication Email")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Authentication Email field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(State; Rec.State)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the State field.';
                }
                field("Change Password"; Rec."Change Password")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Change Password field.';
                }
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Record ID field.';
                }
                field("Password Value"; Rec."Password Value")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the value of the Password Value field.';
                }
                // field("Login Type"; "Login Type")
                // {
                //     ApplicationArea = BasicHR;
                // }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                ToolTip = 'Executes the ActionName action.';

                trigger OnAction();
                begin

                end;
            }
        }
    }
}