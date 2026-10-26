/// <summary>
/// Page Asset Possession Items (ID 50416).
/// Setup of the standard rows copied onto every new Asset Possession Form.
/// </summary>
page 50416 "Asset Possession Items"
{
    Caption = 'Asset Possession Items';
    PageType = List;
    SourceTable = "Asset Possession Item";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the part of the form the item belongs to.';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the item.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item as it is printed on the form.';
                }
                field("Track By Quantity"; Rec."Track By Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that this item is recorded by quantity instead of an asset tag, for example pedestal keys.';
                }
                field("Details Required"; Rec."Details Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that details (bank, post office, car) must be entered when the item is issued.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(InsertDefaults)
            {
                ApplicationArea = All;
                Caption = 'Insert Default Items';
                Image = Suggest;
                ToolTip = 'Insert the standard items from the Asset Possession Form template. Existing items are left unchanged.';

                trigger OnAction()
                begin
                    Rec.InsertDefaultItems();
                    CurrPage.Update(false);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(InsertDefaults_Promoted; InsertDefaults)
                {
                }
            }
        }
    }
}
