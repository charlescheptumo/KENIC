namespace KICD.KICD;

using Microsoft.FixedAssets.FixedAsset;
using Microsoft.HumanResources.Setup;
using Microsoft.FixedAssets.Depreciation;
using System.Email;
using System.Utilities;

codeunit 50029 "Finance Job Queue"
{
    trigger OnRun()
    begin
        NotifyOnFADepreciationEndDate();
    end;

    var
        ProcSetup: Record "Procurement Setup";
        HRSetup: Record "Human Resources Setup";

    local procedure NotifyOnFADepreciationEndDate()
    var
        FA: Record "Fixed Asset";
        FADepreciationBook: Record "FA Depreciation Book";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        EmailCCRecepient: List of [Text];
        EmailBCCRecepient: List of [Text];
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        RecRef: RecordRef;
    begin
        FADepreciationBook.Reset();
        FADepreciationBook.SetRange("Depreciation Ending Date", CalcDate('<CM+15D>', Today));
        if FADepreciationBook.FindSet() then begin
            RecRef.GetTable(FADepreciationBook);

            TempBlob.CreateOutStream(OutStr);

            if Report.SaveAs(
                Report::"Fixed Asset Depreciation",
                '',
                ReportFormat::Pdf,
                OutStr,
                RecRef
            ) then begin
                TempBlob.CreateInStream(InStr);
                //txtB64 := cnv64.ToBase64(InStr, true);
                EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
                EmailSubject := 'Fixed Asset Depreciation End Dates Reminder';
                EmailBody := 'Hello,';
                EmailBody += '<BR><BR></BR>Plese find attached a summary of fixed assets with their depreciation end dates.';

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                EmailMessage.AddAttachment(
                    'FA Depreciation Reminder_' + Format(Today) + '.pdf',
                    'PDF',
                    InStr
                );

                Email.Send(EmailMessage);
            end;
        end;
    end;

    // local procedure TrackICTInventoryExpiryDate()
    // var
    //     ICTInventory: Record "ICT Inventory";
    //     Email: Codeunit Email;
    //     EmailMessage: Codeunit "Email Message";
    //     EmailSubject: Text
    //     EmailBody: Text;
    //     EmailRecepient: List of [Text];
    //     EmailCCRecepient: List of [Text];
    //     EmailBCCRecepient: List of [Text];
    //     TempBlob: Codeunit "Temp Blob";
    //     InStr: InStream;
    //     OutStr: OutStream;
    //     RecRef: RecordRef;
    // begin
    //     ICTInventory.Reset();
    //     ICTInventory.SetRange("Has Expiry Date", true);
    //     ICTInventory.SetRange("Expiry Date", CalcDate('<CM+15D>', Today));
    //     if ICTInventory.FindSet() then begin
    //         RecRef.GetTable(ICTInventory);

    //         TempBlob.CreateOutStream(OutStr);

    //         if Report.SaveAs(
    //             Report::"Fixed Asset Depreciation",
    //             '',
    //             ReportFormat::Pdf,
    //             OutStr,
    //             RecRef
    //         ) then begin
    //             TempBlob.CreateInStream(InStr);
    //             //txtB64 := cnv64.ToBase64(InStr, true);
    //             EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
    //             EmailSubject := 'Inventory Expiry End Dates Reminder';
    //             EmailBody := 'Hello,';
    //             EmailBody += '<BR><BR></BR>Plese find attached a summary of fixed assets with their depreciation end dates.';

    //             EmailMessage.Create(
    //                 EmailRecepient,
    //                 EmailSubject,
    //                 EmailBody,
    //                 true
    //             );

    //             EmailMessage.AddAttachment(
    //                 'FA Depreciation Reminder_' + Format(Today) + '.pdf',
    //                 'PDF',
    //                 InStr
    //             );

    //             Email.Send(EmailMessage);
    //         end;
    //     end;
    // end;
}
