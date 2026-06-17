#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72191 "Work Plan Tasks"
{
    Caption = 'Summary Of Bills';
    PageType = List;
    SourceTable = "New Road Work Program Task";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Work Program ID field.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Package No. field.';
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Begin-Total Job Task No. field.';
                }
                field("End-Total Job Task No."; Rec."End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End-Total Job Task No. field.';
                }
                field("No. of Bill Activities"; Rec."No. of Bill Activities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Bill Activities field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted Job No."; Rec."Posted Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Job No. field.';
                }
                field("Posted Begin-Total Job Tsk No."; Rec."Posted Begin-Total Job Tsk No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Begin-Total Job Tsk No. field.';
                }
                field("Posted End-Total Job Task No."; Rec."Posted End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted End-Total Job Task No. field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("WP Plan Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Bill Items';
                ToolTip = 'Executes the Bill Items action.';
            }
        }
    }
}

