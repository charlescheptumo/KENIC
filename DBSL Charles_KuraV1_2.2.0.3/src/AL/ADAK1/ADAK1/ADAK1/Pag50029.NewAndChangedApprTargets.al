/// <summary>
/// Page NewAndChangedApprTargets (ID 50029).
/// </summary>
page 50029 NewAndChangedApprTargets
{
    Caption = 'NewAndChangedApprTargets';
    PageType = ListPart;
    SourceTable = NewAndChangedApprTargets;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Target; Rec.Target)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Results Achieved"; Rec."Results Achieved")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Results Achieved field.';
                }
                field("Performance Appraisal"; Rec."Performance Appraisal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Performance Appraisal field.';
                }
                field(Reasons; Rec.Reasons)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reasons field.';
                }
            }
        }
    }
}
