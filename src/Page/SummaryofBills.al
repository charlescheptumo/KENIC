#pragma implicitwith disable
page 99666 "Workplan Summary of Bills"
{
    PageType = List;
    SourceTable = "WorkPlan Summary of Bills";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Type field.';
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Begin-Total Job Task No."; Rec."Begin-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Begin-Total Job Task No. field.';
                }
                field("End-Total Job Task No."; Rec."End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End-Total Job Task No. field.';
                }
                field("No. of Bill Activities"; Rec."No. of Bill Activities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Bill Activities field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }

                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

