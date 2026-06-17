
page 60019 "Consolidated RegionalWorkplans"
{
    Caption = 'Consolidated Regional Workplan';
    CardPageID = "Consolidated Regional Workplan";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "RAM Workplan Header";
    SourceTableView = WHERE("Workplan Type" = CONST(Consolidated)//,
                                                                 //Consolidated = CONST(true),
                                                                 // "Submission Status" = FILTER(Submitted)
                            );
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Budget Ceiling Amount"; Rec."Budget Ceiling Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Ceiling Amount field.';
                }
                field("Total Workplan Amount"; Rec."Total Workplan Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Workplan Amount field.';
                }
                field("No of Projects"; Rec."No of Projects")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Projects field.';
                }
                field("Submission Status"; Rec."Submission Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submission Status field.';
                }
                field(Consolidated; Rec.Consolidated)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidated field.';
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan Type field.';
                }
            }
        }
    }

    actions
    {
    }
}



