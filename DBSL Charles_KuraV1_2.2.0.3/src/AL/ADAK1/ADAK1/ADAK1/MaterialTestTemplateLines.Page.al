#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72431 "Material Test Template Lines"
{
    PageType = ListPart;
    SourceTable = "Material Test Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Test Type"; Rec."Test Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Type field.';
                }
                field(" Description"; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage Description field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Material Test Template Passes")
                {
                    ApplicationArea = Basic;
                    Image = Addresses;
                    RunObject = Page "Material Test Template Passes";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Test Type" = field("Test Type");
                    ToolTip = 'Executes the Material Test Template Passes action.';
                }
            }
        }
    }
}

