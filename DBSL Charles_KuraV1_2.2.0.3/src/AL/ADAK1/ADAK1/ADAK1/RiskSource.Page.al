#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95016 "Risk Source"
{
    PageType = Card;
    SourceTable = "Risk Source";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Source ID"; Rec."Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Of Risk Categories"; Rec."No. Of Risk Categories")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Risk Categories field.';
                }
                field("No. Of Risks"; Rec."No. Of Risks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Risks field.';
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

