#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72270 "WEP Equipment Repair Plan"
{
    PageType = List;
    SourceTable = "WEP Equipment Repair Plan";
    SourceTableView = where("Document Type" = filter("Work Execution Programme"));
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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Equipment No."; Rec."Equipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment No. field.';
                }
                field("Entry  No"; Rec."Entry  No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry  No field.';
                }
                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Description field.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Type field.';
                }
                field("Scheduled Date"; Rec."Scheduled Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled Date field.';
                }
                field("To-do Description"; Rec."To-do Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To-do Description field.';
                }
                field("Responsible Staff No."; Rec."Responsible Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Staff No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

