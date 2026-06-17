
page 72044 "RoadWork Ceiling Detailed"
{
    PageType = List;
    SourceTable = "RoadWorks Ceiling DetailedLine";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Allocation Percentage(%)"; Rec."Allocation Percentage(%)")
                {
                    ToolTip = 'Specifies the value of the Allocation Percentage(%) field.';
                }
                field("Town Allocation(KES)"; Rec."Town Allocation(KES)")
                {
                    ToolTip = 'Specifies the value of the Town Allocation(KES) field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Regional Allocated Amount"; Rec."Regional Allocated Amount")
                {
                    ToolTip = 'Specifies the value of the Regional Allocated Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}



