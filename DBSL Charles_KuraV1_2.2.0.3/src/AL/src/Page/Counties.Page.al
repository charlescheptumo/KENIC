#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72008 "Counties"
{
    ApplicationArea = Basic;
    CardPageID = "County Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = County1;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Of Constituencies"; Rec."No. Of Constituencies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Constituencies field.';
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Sections field.';
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
                field("Total Budget (Construction)"; Rec."Total Budget (Construction)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Construction) field.';
                }
                field("Total Budget (Maintainenace)"; Rec."Total Budget (Maintainenace)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Maintainenace) field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Actual Cost (Maintainenace)"; Rec."Actual Cost (Maintainenace)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Cost (Maintainenace) field.';
                }
                field("Actual Cost (Construction)"; Rec."Actual Cost (Construction)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Cost (Construction) field.';
                }
            }
        }
    }

    actions
    {
    }
}

