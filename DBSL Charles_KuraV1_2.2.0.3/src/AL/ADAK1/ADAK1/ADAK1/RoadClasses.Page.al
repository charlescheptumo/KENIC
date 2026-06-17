#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72003 "Road Classes"
{
    ApplicationArea = Basic;
    Editable = TRUE;
    PageType = List;
    SourceTable = "Road Class";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Road Category"; Rec."Road Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Category field.';
                }
                field("Classification Type"; Rec."Classification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Classification Type field.';
                }
                field("Special Purpose Road (SPR)"; Rec."Special Purpose Road (SPR)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Purpose Road (SPR) field.';
                }
                field("Desired Road Reserve Width (M)"; Rec."Desired Road Reserve Width (M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Road Reserve Width (M) field.';
                }
                field("No. of Road Links"; Rec."No. of Road Links")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Links field.';
                }
                field("Total Road Network Length (Km)"; Rec."Total Road Network Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Road Network Length (Km) field.';
                }
                field("Paved Road Length (Km)"; Rec."Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paved Road Length (Km) field.';
                }
                field("Paved Road Length %"; Rec."Paved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paved Road Length % field.';
                }
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaved Road Length % field.';
                }
                field("No. of Planned Road Projects"; Rec."No. of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Road Projects field.';
                }
                field("No. of Ongoing Road Projects"; Rec."No. of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Ongoing Road Projects field.';
                }
                field("No. of Completed Road Projects"; Rec."No. of Completed Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Completed Road Projects field.';
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

