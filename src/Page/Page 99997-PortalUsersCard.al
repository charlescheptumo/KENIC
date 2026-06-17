#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99910 "Portal User card"
{
    PageType = Card;
    SourceTable = "Dynasoft Portal User";
    Editable = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the User Name field.';

                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Authentication Email"; Rec."Authentication Email")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Authentication Email field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(State; Rec.State)
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the State field.';
                }
                field("Change Password"; Rec."Change Password")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Change Password field.';
                }
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Record ID field.';
                }
                field("Password Value"; Rec."Password Value")
                {
                    ApplicationArea = BasicHR;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Password Value field.';
                }

            }
        }

    }

}
