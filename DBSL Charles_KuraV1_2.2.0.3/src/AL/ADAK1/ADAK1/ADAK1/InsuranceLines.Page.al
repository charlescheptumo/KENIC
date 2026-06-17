#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69828 "Insurance Lines"
{
    PageType = ListPart;
    SourceTable = "Insurance Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Code field.';
                }
                field("Insurance Name"; Rec."Insurance Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Insurance Name field.';
                }
                field("Type Of Insurance"; Rec."Type Of Insurance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type Of Insurance field.';
                }
                field("Policy Number"; Rec."Policy Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Number field.';
                }
                field("Date of Commencement"; Rec."Date of Commencement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Commencement field.';
                }
                field("Sum Assuared"; Rec."Sum Assuared")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sum Assuared field.';
                }
                field("Monthly Deduction"; Rec."Monthly Deduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Deduction field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action(Beneficiaries)
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    
                    RunObject = Page "Insurance Beneficiaries";
                    RunPageLink = "Document No" = field("Document No."),
                                  "Insurance Code" = field("Insurance Code");
                    ToolTip = 'Executes the Beneficiaries action.';
                }
            }
        }
    }
}

