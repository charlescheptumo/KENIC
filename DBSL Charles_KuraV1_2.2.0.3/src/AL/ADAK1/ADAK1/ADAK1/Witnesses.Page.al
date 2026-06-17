#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56054 "Witnesses"
{
    PageType = List;
    SourceTable = Witnesses;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Case No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Witnessness Name"; Rec."Witnessness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witnessness Name field.';
                }
                field("Witnessness Address"; Rec."Witnessness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witnessness Address field.';
                }
                field("Witnessness Phone"; Rec."Witnessness Phone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witnessness Phone field.';
                }
            }
        }
    }

    actions
    {
    }
}

