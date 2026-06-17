#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72125 "Works Progress Card"
{
    PageType = Card;
    SourceTable = "Works Progress Headers";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Progress No"; Rec."Progress No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress No field.';
                }
                field("Progress Date"; Rec."Progress Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress Date field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Link Name field.';
                }
            }
            part(Control9; "Works Contract Line")
            {
                // SubPageLink = "Header No"=field("Progress No");
            }
            part(Control10; "Annual Workplan Section")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
            part(Control11; "Employment Details")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
            part(Control12; "Contract Signing & Progress")
            {
                SubPageLink = "Heder No" = field("Progress No");
            }
            part(Control13; "Progress Employment")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
            part(Control14; "Progress Per Road Activity")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
        }
    }

    actions
    {
    }
}

