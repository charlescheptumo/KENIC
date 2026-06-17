namespace KICD.KICD;

using System.Automation;
using Microsoft.Purchases.Document;

report 50110 "Release Approval Entries"
{
    ApplicationArea = All;
    Caption = 'Release Approval Entries';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(ApprovalEntry; "Approval Entry")
        {
            RequestFilterFields = "Document No.";
            trigger OnAfterGetRecord()
            var
                ApprovalEntry2: Record "Approval Entry";
                Payments: Record payments;
            begin
                // Get last approval entry for this document
                ApprovalEntry2.Reset();
                ApprovalEntry2.SetRange("Table ID", ApprovalEntry."Table ID");
                //ApprovalEntry2.SetRange("Document Type", ApprovalEntry."Document Type");
                ApprovalEntry2.SetRange("Document No.", ApprovalEntry."Document No.");
                if ApprovalEntry2.FindLast then begin
                    if ApprovalEntry2.Status = ApprovalEntry2.Status::Approved then begin
                        case ApprovalEntry."Table ID" of
                            DATABASE::payments:
                                begin
                                    if Payments.Get(ApprovalEntry."Document No.") then begin
                                        if Payments.Status <> Payments.Status::Released then begin
                                            Payments.Status := Payments.Status::Released;
                                            Payments.Modify(true);
                                        end;
                                    end;
                                end;
                            
                        end;
                    end;
                end;
            end; 
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
