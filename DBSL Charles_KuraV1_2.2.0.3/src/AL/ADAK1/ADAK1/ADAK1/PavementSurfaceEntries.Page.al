#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72152 "Pavement Surface Entries"
{
    CardPageID = "Pavement Surface Entry";
    PageType = List;
    SourceTable = "Pavement Surface Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Enrty No"; Rec."Enrty No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enrty No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Pavement Surface Type"; Rec."Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Surface Type field.';
                }
                field("Pavement Category"; Rec."Pavement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pavement Category field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Road Length (Kms)"; Rec."Road Length (Kms)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Length (Kms) field.';
                }
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class ID field.';
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
                field("Road Surface Condition"; Rec."Road Surface Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Surface Condition field.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Reversal Document No"; Rec."Reversal Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversal Document No field.';
                }
            }
        }
    }

    actions
    {
    }
}

