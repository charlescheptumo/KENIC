#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75455 "Variation of Price Indices"
{
    PageType = List;
    SourceTable = "Variation Of Price Index";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Response No field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Index Code"; Rec."Index Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Index Code';
                    ToolTip = 'Specifies the value of the Index Code field.';
                }
                field("Index Description"; Rec."Index Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Index Description field.';
                }
                field("Range of Weighting"; Rec."Range of Weighting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Range of Weighting field.';
                }
                field("Contract Weight"; Rec."Contract Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Weight field.';
                }
                field("Index Source"; Rec."Index Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Index Source field.';
                }
                field("Base Index"; Rec."Base Index")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Base Index field.';
                }
                field("Adjustment Factor"; Rec."Adjustment Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Adjustment Factor field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

