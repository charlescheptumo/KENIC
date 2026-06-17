#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72608 "Project Material Template"
{
    PageType = Card;
    SourceTable = "Project Material Template Head";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control7; "Project Material Temp. SubPage")
            {
                Caption = 'Materials';
                SubPageLink = "Template ID" = field("Template ID");
            }
        }
    }

    actions
    {
    }
}

