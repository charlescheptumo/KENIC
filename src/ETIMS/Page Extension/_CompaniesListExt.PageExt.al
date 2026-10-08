pageextension 50190 CompaniesListExt extends "Company Information"
{
    layout
    {
        addafter(Communication)
        {
            group(ETIMS)
            {
                field("Company Tin"; Rec."Company Tin")
                {
                    ApplicationArea = Basic;
                }
                field("Branch ID"; Rec."Branch ID")
                {
                    ApplicationArea = Basic;
                }
                field("Device Number"; Rec."Device Number")
                {
                    ApplicationArea = Basic;
                }
                // field(ClientId; Rec.ClientId)
                // {
                //     Caption = 'ClientId';
                //     ApplicationArea = Basic;
                // }
                // field(ClientSecret; Rec.ClientSecret)
                // {
                //     Caption = 'ClientSecret';
                //     ShowCaption = true;
                //     ApplicationArea = Basic;
                //     ExtendedDatatype = Masked; // Ensures password is masked in the UI
                // }
                field("ETIMS CMC Key"; Rec."ETIMS CMC Key")
                {
                    Caption = 'ETIMS CMC Key';
                    ApplicationArea = Basic;
                }
                field("ETIMS MRC No."; Rec."ETIMS MRC No.")
                {
                    Caption = 'ETIMS MRC No.';
                    ApplicationArea = Basic;
                }
                field("ETIMS SDC ID"; Rec."ETIMS SDC ID")
                {
                    Caption = 'ETIMS SDC ID';
                    ApplicationArea = Basic;
                }
                field("ETIMS Device ID"; Rec."ETIMS Device ID")
                {
                    Caption = 'ETIMS Device ID';
                    ApplicationArea = Basic;
                }
                field("Sales Invoice Number"; Rec."Sales Invoice Number")
                {
                    Caption = 'Previous Sales Invoice Number';
                    ApplicationArea = Basic;
                }
                field("Purchase Invoice Number"; Rec."Purchase Invoice Number")
                {
                    Caption = 'Previous Purchase Invoice Number';
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
