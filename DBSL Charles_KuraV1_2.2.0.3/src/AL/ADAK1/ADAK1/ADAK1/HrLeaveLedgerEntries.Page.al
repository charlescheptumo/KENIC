#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69223 "Hr Leave Ledger Entries"
{
    PageType = List;
    SourceTable = "HR Leave Ledger Entries";
    Editable = false;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Leave Approval Date"; Rec."Leave Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Approval Date field.';
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of days field.';
                }
                field("Leave Start Date"; Rec."Leave Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Start Date field.';
                }
                field("Leave Posting Description"; Rec."Leave Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Posting Description field.';
                }
                field("Leave End Date"; Rec."Leave End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

