#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80457 "Workplan Cost Elements"
{
    PageType = List;
    SourceTable = "Workplan Cost Elements";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Activity No"; Rec."Sub Activity No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Sub Activity No field.';
                }
                field("Sub Activity Name"; Rec."Sub Activity Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Sub Activity Name field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Element No';
                    ToolTip = 'Specifies the value of the Cost Element No field.';
                }
                field("Cost Elements"; Rec."Cost Elements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Budget';
                    ToolTip = 'Specifies the value of the Financial Budget field.';
                }
                field("Vote id"; Rec."Vote id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote id field.';
                }
                field("Vote Desription"; Rec."Vote Desription")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vote Desription field.';
                }
                field("Plan Category"; Rec."Plan Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Plan Category';
                    ToolTip = 'Specifies the value of the Plan Category field.';
                }
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item No';
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("Plan Item Description"; Rec."Plan Item Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Item Description field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Funding Level"; Rec."Funding Level")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Level field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

