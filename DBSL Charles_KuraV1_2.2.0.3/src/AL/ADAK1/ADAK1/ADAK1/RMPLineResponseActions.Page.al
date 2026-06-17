#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95041 "RMP Line Response Actions"
{
    Caption = 'Risk Mitigation Measures';
    CardPageID = "RMP Line Response Action";
    PageType = List;
    SourceTable = "RMP Line Response Action";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                // field("Risk ID";"Risk ID")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field("Action ID"; Rec."Action ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Action ID field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Status field.';
                }
                field("Descriptive Status"; Rec."Descriptive Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Descriptive Status field.';
                }
                field("Percentage Complete"; Rec."Percentage Complete")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage Complete field.';
                }
                field("Task Priority"; Rec."Task Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Priority field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Start Date';
                    ToolTip = 'Specifies the value of the Actual Start Date field.';
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual End Date field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Due Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

