namespace KICD.KICD;

page 50293 "CoreValues&Attributes"
{
    ApplicationArea = All;
    Caption = 'CoreValues&Attributes';
    PageType = Card;
    SourceTable = "Core Values & Attributes";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ToolTip = 'Specifies the value of the Effective Date field.', Comment = '%';
                }
            }
            part(Control16; "Attributes and Behavioral")
            {
                SubPageLink = "Attributes Template ID" = field(Code);
            }
        }
    }
}
