page 50105 "OutLook Integration to BC"
{
    ApplicationArea = All;
    Caption = 'OutLook Integration to BC';
    PageType = Card;
    SourceTable = "OutLook Integration to BC";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Microsoft Graph Outlook Events URL"; Rec."Microsoft Graph Outlook Events URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Microsoft Graph Outlook Events URL field.', Comment = '%';
                }
                field("Microsoft Graph Token"; Rec."Microsoft Graph Token")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Microsoft Graph Token field.', Comment = '%';
                }
            }
        }
    }
}
