#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75039 "Vendor Staff Experience"
{
    PageType = List;
    SourceTable = "Vendor Staff Experience";
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
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience Category field.';
                }
                field("Experience Summary"; Rec."Experience Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience Summary field.';
                }
                field("Assignment Description"; Rec."Assignment Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment Description field.';
                }
                field("Years of Experience"; Rec."Years of Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years of Experience field.';
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
            }
        }
    }

    actions
    {
    }
}

