#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80130 "Quartely Review Periods"
{
    PageType = List;
    SourceTable = "Review Quarterly Periods";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Review Period Code"; Rec."Review Period Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Review Period Code field.';
                }
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
                field("Reporting Start Date"; Rec."Reporting Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting Start Date field.';
                }
                field("Reporting End Date"; Rec."Reporting End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting End Date field.';
                }
                field("Current Year?"; Rec."Current Year?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Year? field.';
                }
            }
        }
    }

    actions
    {
    }
}

