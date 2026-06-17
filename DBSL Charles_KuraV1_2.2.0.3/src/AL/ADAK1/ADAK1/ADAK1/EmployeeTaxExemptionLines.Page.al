#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69034 "Employee Tax Exemption Lines"
{
    PageType = ListPart;
    SourceTable = "Employee Tax Exemption";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Amount Exempted"; Rec."Amount Exempted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Exempted field.';
                }
                field("Certificate No"; Rec."Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate No field.';
                }
                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StartDate field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

