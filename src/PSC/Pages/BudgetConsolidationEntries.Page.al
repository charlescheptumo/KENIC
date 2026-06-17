#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80461 "Budget Consolidation Entries"
{
    PageType = ListPart;
    SourceTable = "Consolidated Bugdet Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Actual Amount"; Rec."Actual Amount")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Actual Amount field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Vote id"; Rec."Vote id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote id field.';
                }
                field("Vote Desription"; Rec."Vote Desription")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Desription field.';
                }
                field("Activity Id"; Rec."Activity Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Id field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
            }
        }
    }

    actions
    {
    }
}

