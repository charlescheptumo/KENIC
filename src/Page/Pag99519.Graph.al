
page 99520 Graph
{
    ApplicationArea = All;
    Caption = 'Graph';
    PageType = Card;
    SourceTable = "Microsoft Graphs";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the URL field.';
                }
                field("Tenant ID"; Rec."Tenant ID")
                {
                    ApplicationArea = All;
                }
                field(Host; Rec.Host)
                {

                }
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client ID field.';
                }
                field("Client Secret"; Rec."Client Secret")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client Secret field.';
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Scope field.';
                }
                field("Microsoft Graph Outlook Events URL"; Rec."Microsoft Graph Outlook Events URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Microsoft Graph Outlook Events URL field.', Comment = '%';
                }
                field("Microsoft Graph UserId"; Rec."Microsoft Graph UserId")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Microsoft Graph UserId field.', Comment = '%';
                }
                field("Microsoft Graph Token"; Rec."Microsoft Graph Token")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Microsoft Graph Token field.', Comment = '%';
                }
                field(Assertion; Rec.Assertion)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assertion field.', Comment = '%';
                }
                field("Access Token URL"; Rec."Access Token URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Access Token URL field.', Comment = '%';
                }
                field("Access Token"; Rec."Access Token")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Access Token field.', Comment = '%';
                }
                field("Authorization Time"; Rec."Authorization Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authorization Time field.', Comment = '%';
                }
                field("Authorization URL"; Rec."Authorization URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authorization URL field.', Comment = '%';
                }
                field("Expires In"; Rec."Expires In")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expires In field.', Comment = '%';
                }
                field("Redirect URL"; Rec."Redirect URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Redirect URL field.', Comment = '%';
                }
                field("Ext. Expires In"; Rec."Ext. Expires In")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ext. Expires In field.', Comment = '%';
                }
                field("Refresh Token"; Rec."Refresh Token")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Refresh Token field.', Comment = '%';
                }
                field("Authorization Scope"; Rec."Authorization Scope")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authorization Scope field.', Comment = '%';
                }
            }
        }
    }
}


