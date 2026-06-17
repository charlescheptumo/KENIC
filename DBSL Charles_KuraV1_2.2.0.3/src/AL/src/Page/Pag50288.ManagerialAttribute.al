namespace KICD.KICD;

page 50288 "Managerial Attribute"
{
    ApplicationArea = All;
    Caption = 'Managerial Attribute';
    PageType = Card;
    SourceTable = "Managerial Attributes";
    
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
                field("Effective Date";Rec."Effective Date")
                {
                    ToolTip = 'Species the value of the Effective Date';
                }
            }
             part(Control16; "Managerial Attributes Lines")
            {
                SubPageLink = "Managerial Template ID" = field(Code);
            }
        }
    }
}
