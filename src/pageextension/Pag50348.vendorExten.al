pageextension 50348 VendorCardExt extends "Vendor Card"
{
    layout
    {
        modify("VAT Registration No.")
        {
            ShowMandatory = true;

            trigger OnAfterValidate()
            begin
                if Rec."VAT Registration No." = '' then
                    Error('KRA PIN (VAT Registration No.) must be filled before proceeding.');
            end;
        }
        modify("E-Mail")
        {
            ShowMandatory = true;

            trigger OnAfterValidate()
            begin
                if Rec."E-Mail" = '' then
                    Error('E-Mail must be filled before proceeding.');
            end;
        }
        modify("Phone No.")
        {
            ShowMandatory = true;

            trigger OnAfterValidate()
            begin
                if Rec."Phone No." = '' then
                    Error('Phone No. must be filled before proceeding.');
            end;
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        // if Rec."VAT Registration No." = '' then
        //     Error('KRA PIN (VAT Registration No.) must be filled before proceeding.');

        // if Rec."E-Mail" = '' then
        //     Error('E-Mail must be filled before proceeding.');

        // if Rec."Phone No." = '' then
        //     Error('Phone No. must be filled before proceeding.');

        // exit(true);
    end;

}