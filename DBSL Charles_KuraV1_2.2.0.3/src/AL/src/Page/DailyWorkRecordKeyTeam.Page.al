#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72444 "Daily Work Record Key Team"
{
    PageType = Card;
    SourceTable = "Daily Work Record Key Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Contractor Staff No."; Rec."Contractor Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Staff No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Work Execution Programme ID"; Rec."Work Execution Programme ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Programme ID field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Estimate ManHours Worked"; Rec."Estimate ManHours Worked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate ManHours Worked field.';
                }
                field("Overtime Hours Worked"; Rec."Overtime Hours Worked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Hours Worked field.';
                }
            }
        }
    }

    actions
    {
    }
}

