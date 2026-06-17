#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75040 "Vendor Staff Employment"
{
    PageType = List;
    SourceTable = "Vendor Staff Employment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff ID field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Previous Employer"; Rec."Previous Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Employer field.';
                }
                field("Title Held"; Rec."Title Held")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title Held field.';
                }
                field("Start Year"; Rec."Start Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Year field.';
                }
                field("End Year"; Rec."End Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Year field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
            }
        }
    }

    actions
    {
    }
}

