pageextension 50150 StandingImprestPageExtension extends "Standing Imprest Requsition"
{
    layout
    {
        addlast(General)
        {
            field(AccountNoOData; Rec."Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Exposes Account No. for OData.';
            }
        }
    }
}
