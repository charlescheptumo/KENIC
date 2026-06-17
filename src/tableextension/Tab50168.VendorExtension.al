// tableextension 50168 VendorExt extends Vendor
// {
//     fields
//     {
//         modify("VAT Registration No.")
//         {
//             trigger OnAfterValidate()
//             begin
//                 if "VAT Registration No." = '' then
//                     Error('KRA PIN (VAT Registration No.) is mandatory.');
//             end;
//         }
//     }

//     trigger OnBeforeInsert()
//     begin
//         if "VAT Registration No." = '' then
//             Error('KRA PIN (VAT Registration No.) is mandatory.');
//     end;

//     trigger OnBeforeModify()
//     begin
//         if "VAT Registration No." = '' then
//             Error('KRA PIN (VAT Registration No.) is mandatory.');
//     end;
// }