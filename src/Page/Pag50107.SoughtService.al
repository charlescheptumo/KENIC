page 50107 "Sought Service"
{
    ApplicationArea = All;
    Caption = 'Sought Service';
    PageType = List;
    SourceTable = "Services Sought";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Name field.', Comment = '%';
                }
                field("Service Description"; Rec."Service Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Description field.', Comment = '%';
                }
            }
        }
    }
}
