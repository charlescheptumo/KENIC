#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72780 "Project Road Facility Items"
{
    CardPageID = "Project Road Facility Item";
    PageType = List;
    SourceTable = "Project Road Facility Item";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Facility  No."; Rec."Facility  No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility  No. field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Road Facility Category"; Rec."Road Facility Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility Category field.';
                }
                field("Road Facility Type"; Rec."Road Facility Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility Type field.';
                }
                field("Road Facility SubType"; Rec."Road Facility SubType")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility SubType field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Facility Label"; Rec."Facility Label")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Label field.';
                }
                field("Facility Location"; Rec."Facility Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Location field.';
                }
                field("Material Type"; Rec."Material Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Type field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

