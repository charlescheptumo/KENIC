#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72081 "Daily Record Machinery & Truck"
{
    PageType = ListPart;
    SourceTable = "Daily Record Machinery & Truck";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Plate No"; Rec."Plate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plate No field.';
                }
                field("Photo No"; Rec."Photo No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo No field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Number; Rec.Number)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number field.';
                }
            }
        }
    }

    actions
    {
    }
}

