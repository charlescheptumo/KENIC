#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72126 "Works Contract Line"
{
    PageType = ListPart;
    SourceTable = "Works Contract Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Name field.';
                }
                field("Percentage This Month"; Rec."Percentage This Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage This Month field.';
                }
                field("Cum.  Percentage This Month"; Rec."Cum.  Percentage This Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cum.  Percentage This Month field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
    }

    actions
    {
    }
}

