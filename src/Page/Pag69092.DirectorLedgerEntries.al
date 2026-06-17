#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69092 "Director Ledger Entries"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Director Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }

                field("Rate Per Day"; Rec."Rate Per Day")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate Per Day field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Tax Deductible"; Rec."Tax Deductible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Deductible field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Pay Period"; Rec."Pay Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Period field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Period Entry field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Paye; Rec.Paye)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paye field.';
                }
                field("Manual Entry"; Rec."Manual Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manual Entry field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000028; Outlook)
            {
            }
            systempart(Control1000000029; Notes)
            {
            }
            systempart(Control1000000030; MyNotes)
            {
            }
            systempart(Control1000000031; Links)
            {
            }
        }
    }

    actions
    {
    }
}

