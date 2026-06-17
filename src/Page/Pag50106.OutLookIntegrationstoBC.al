page 50106 "OutLook Integrations to BC"
{
    ApplicationArea = All;
    Caption = 'OutLook Integrations to BC';
    PageType = List;
    SourceTable = "OutLook Integration to BC";
    CardPageId = "OutLook Integration to BC";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
