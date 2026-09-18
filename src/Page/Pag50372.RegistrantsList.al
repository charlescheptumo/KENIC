namespace KENIC.KENIC;

page 50372 "Registrants List"
{
    ApplicationArea = All;
    Caption = 'Registrars';
    PageType = List;
    SourceTable = Registrants;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = true;
    ModifyAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Roid; Rec.Roid) { ApplicationArea = All; }
                field(ClientId; Rec.ClientId) { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field(Email; Rec.Email) { ApplicationArea = All; }
                field(Phone; Rec.Phone) { ApplicationArea = All; }
                field(Country; Rec.Country) { ApplicationArea = All; }
                field(City; Rec.City) { ApplicationArea = All; }
                field(AdminContact; Rec.AdminContact) { ApplicationArea = All; }
                field(AdminEmail; Rec.AdminEmail) { ApplicationArea = All; }
                field(BillingContact; Rec.BillingContact) { ApplicationArea = All; }
                field(BillingEmail; Rec.BillingEmail) { ApplicationArea = All; }
                field(TechContact; Rec.TechContact) { ApplicationArea = All; }
                field(TechEmail; Rec.TechEmail) { ApplicationArea = All; }
                field(ServiceContact; Rec.ServiceContact) { ApplicationArea = All; }
                field(ServiceEmail; Rec.ServiceEmail) { ApplicationArea = All; }
                field(CreateDate; Rec.CreateDate) { ApplicationArea = All; }
                field(UpdateDate; Rec.UpdateDate) { ApplicationArea = All; }
                field(BillingDate; Rec.BillingDate) { ApplicationArea = All; }
                field(AllowEpp; Rec.AllowEpp) { ApplicationArea = All; }
                field(RestrictIps; Rec.RestrictIps) { ApplicationArea = All; }
                field(IsPicked; Rec.IsPicked) { ApplicationArea = All; }
                field(IanaNumber; Rec.IanaNumber) { ApplicationArea = All; }
                field(LastUpdatedAt; Rec.LastUpdatedAt) { ApplicationArea = All; }
                field(LastUpdatedBy; Rec.LastUpdatedBy) { ApplicationArea = All; }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetRegistrants)
            {
                ApplicationArea = All;
                Caption = 'Get Registrars';
                ToolTip = 'Retrieve registrars by zone name, client ID, or date range.';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetRegistrantsDialog: Page "Get Registrants";
                begin
                    GetRegistrantsDialog.RunModal();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
