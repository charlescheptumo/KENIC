page 50174 "OSH Rule Template"
{
    ApplicationArea = All;
    Caption = 'OSH Rule Template';
    PageType = Card;
    SourceTable = "OSH Rule Template";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
            part("OSH Rule Template Lines"; "OSH Rule Template Lines")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
