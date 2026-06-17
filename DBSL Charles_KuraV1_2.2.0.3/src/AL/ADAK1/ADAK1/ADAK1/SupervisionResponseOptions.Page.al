#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72562 "Supervision Response Options"
{
    CardPageID = "Supervision Response Option";
    PageType = ListPart;
    SourceTable = "Supervision Response Option";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Response Type ID"; Rec."Response Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type ID field.';
                }
                field("Option Code"; Rec."Option Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Option Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum % Score"; Rec."Minimum % Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum % Score field.';
                }
                field("Maximum % Score"; Rec."Maximum % Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum % Score field.';
                }
                field("Corrective Order is Applicable"; Rec."Corrective Order is Applicable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrective Order is Applicable field.';
                }
            }
        }
    }

    actions
    {
    }
}

