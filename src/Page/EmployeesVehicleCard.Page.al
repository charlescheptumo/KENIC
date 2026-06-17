#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60006 "Employees Vehicle Card"
{
    PageType = Card;
    SourceTable = "Employees Vehicles";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Employee no."; Rec."Employee no.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee no. field.';
                }
                field("Employees Name"; Rec."Employees Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employees Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Email field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Vehicle Pass/Card number"; Rec."Vehicle Pass/Card number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Pass/Card number field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Body Type"; Rec."Body Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body Type field.';
                }
                field("Vehicles Color"; Rec."Vehicles Color")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicles Color field.';
                }
                field("Chassis Serial No."; Rec."Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chassis Serial No. field.';
                }
                field("Engine Serial No."; Rec."Engine Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engine Serial No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

