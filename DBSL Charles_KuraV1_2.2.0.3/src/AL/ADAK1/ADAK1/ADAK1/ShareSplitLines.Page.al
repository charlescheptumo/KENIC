#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57081 "Share Split Lines"
{
    PageType = List;
    SourceTable = "Split Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment No"; Rec."Investment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Expected Interest Date"; Rec."Expected Interest Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Interest Date field.';
                }
                field("Principal Amount"; Rec."Principal Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Amount field.';
                }
                field("Principal Amount + Interest"; Rec."Principal Amount + Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Amount + Interest field.';
                }
                field("Tax Benefit"; Rec."Tax Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Benefit field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Days field.';
                }
                field("Old Ratio"; Rec."Old Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Old Ratio field.';
                }
                field("New Ratio"; Rec."New Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Ratio field.';
                }
                field("Bonus Units"; Rec."Bonus Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bonus Units field.';
                }
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::"Share Split";
    end;
}

