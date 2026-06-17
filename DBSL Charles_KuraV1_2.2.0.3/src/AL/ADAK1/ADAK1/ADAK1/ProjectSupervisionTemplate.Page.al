#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72559 "Project Supervision Template"
{
    PageType = Card;
    SourceTable = "Project Supervision Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Project Stage"; Rec."Project Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Stage field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Supervisor"; Rec."Primary Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Supervisor field.';
                }
                field("Default Response Type"; Rec."Default Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Response Type field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control11; "Supervision Template Cat Lines")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Template ID" = field("Template ID");
            }
        }
    }

    actions
    {
    }
}

