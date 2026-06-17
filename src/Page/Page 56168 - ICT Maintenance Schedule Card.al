page 56168 "ICT Maintenance Schedule Card"
{
    PageType = Document;
    SourceTable = 56070;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
            // part(;56169)
            // {
            //     SubPageLink = Document No=FIELD(Code);
            // }
        }

    }

    actions
    {
    }
}

