/// <summary>
/// Page Exit Form Lines Subform (ID 50421).
/// Used by every repeating block on the card; each block passes its own Section filter.
/// </summary>
page 50421 "Exit Form Lines Subform"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Exit Form Line";
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the manager name or title, the rating criteria, or the week.';
                }
                field("Month/Year"; Rec."Month/Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the month and year, used in the weekly log.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the rating from 1 to 6, used in the intern ratings.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the activities done, used in the weekly log.';
                }
                field("Signed By"; Rec."Signed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who signed.';
                }
                field("Signature Date"; Rec."Signature Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the signature.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies remarks, including the reason if the department has not cleared the staff member.';
                }
            }
        }
    }
}
