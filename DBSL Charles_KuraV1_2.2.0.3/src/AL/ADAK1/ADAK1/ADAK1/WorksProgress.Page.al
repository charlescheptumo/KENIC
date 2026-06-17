#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72124 "Works Progress"
{
    ApplicationArea = Basic;
    CardPageID = "Works Progress Card";
    PageType = List;
    SourceTable = "Works Progress Headers";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
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
        }
    }

    actions
    {
    }
}

