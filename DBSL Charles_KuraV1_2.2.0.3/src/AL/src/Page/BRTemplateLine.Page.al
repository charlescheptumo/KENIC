#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80335 "BR Template Line"
{
    PageType = ListPart;
    SourceTable = "BR Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section ID field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Option Text Response Type"; Rec."Option Text Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Option Text Response Type field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Template Score Guide")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                RunObject = Page "Template Score GuideSPM";
                RunPageLink = "Template ID" = field("Template ID"),
                              "Section ID" = field("Section ID"),
                              "Question ID" = field("Question ID");
                ToolTip = 'Executes the Template Score Guide action.';
            }
        }
    }
}

