page 50200 "Uploaded Documents"
{
    ApplicationArea = All;
    Caption = 'Uploaded Documents';
    PageType = ListPart;
    SourceTable = "Sharepoint File List";


    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Created; Rec.Created)
                {
                    ToolTip = 'Specifies the value of the Created field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Download)
            {
                ToolTip = 'Executes the Download action.';
                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger OnOpenPage()
    begin

    end;
}
