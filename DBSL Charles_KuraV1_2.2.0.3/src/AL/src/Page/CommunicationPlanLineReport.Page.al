#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95002 "Communication Plan Line Report"
{
    PageType = ListPart;
    SourceTable = "Communication Plan Line";
    SourceTableView = where(Category = filter("Status Report"));
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
                    Enabled = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Communication Type"; Rec."Communication Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Submission Period"; Rec."Submission Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Period field.';
                }
                field("Planned Submission Date"; Rec."Planned Submission Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Submission Date field.';
                }
                field("Actual Submission Date"; Rec."Actual Submission Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Submission Date field.';
                }
                field("No. of Target Stakeholders"; Rec."No. of Target Stakeholders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Target Stakeholders field.';
                }
                field("Default Report Medium"; Rec."Default Report Medium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Report Medium field.';
                }
                field("No. of Project Reports"; Rec."No. of Project Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Project Reports field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Function")
            {
                Caption = '&Reporting Details';
                Image = RollUpCosts;
                action("Comm Plan Meeting Schedules")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed Meeting Schedules';
                    Image = RollUpCosts;
                    RunObject = Page "Comm Plan Meeting Schedules";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
                    Visible = false;
                    ToolTip = 'Executes the Detailed Meeting Schedules action.';
                }
                action("Comm Plan Line Stakeholders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target Stakeholders';
                    Image = SpecialOrder;
                    RunObject = Page "Comm Plan Line Stakeholders";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
                    ToolTip = 'Executes the Target Stakeholders action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

