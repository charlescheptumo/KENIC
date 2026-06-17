#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69453 "HSE Plan Legal Registers"
{
    CardPageID = "HSE Plan Legal Register";
    PageType = List;
    SourceTable = 69426;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Legal Instrument ID"; Rec."Legal Instrument ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Instrument ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Instrument Type"; Rec."Instrument Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Instrument Type field.';
                }
            }
        }
    }

    actions
    {
    }
}
