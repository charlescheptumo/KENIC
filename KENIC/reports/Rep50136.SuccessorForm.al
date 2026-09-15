namespace KENIC.KENIC;

using Microsoft.Foundation.Company;

report 50170 "Successor Form"
{
    ApplicationArea = All;
    Caption = 'Successor Form';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/SuccessorForm.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Header; "Successor Form Header")
        {
            RequestFilterFields = "No.";

            column(No_Header; "No.")
            {
            }
            column(Name_Header; "Name")
            {
            }
            column(JobTitle_Header; "Job Title")
            {
            }
            column(Successor_Header; Successor)
            {
            }
            column(SuccessorJobTitle_Header; "Successor Job Title")
            {
            }
            column(StartDate_Header; "Start Date")
            {
            }
            column(CompletionDate_Header; "Completion Date")
            {
            }
            column(JobHolderSignature_Header; "Job Holder Signature")
            {
            }
            column(JobHolderSignatureDate_Header; "Job Holder Signature Date")
            {
            }
            column(SuccessorSignature_Header; "Successor Signature")
            {
            }
            column(SuccessorSignatureDate_Header; "Successor Signature Date")
            {
            }
            column(CompanyName_Header; CompanyInfo.Name)
            {
            }
            column(CompanyAddress_Header; CompanyInfo."Home Page")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }

            dataitem(TopDevArea; "Successor Form Top Dev Area")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where("Development Area" = filter(<> ''));

                column(LineNo_TopDevArea; "Line No.")
                {
                }
                column(DevelopmentArea_TopDevArea; "Development Area")
                {
                }
            }

            dataitem(Line; "Successor Form Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where("Development Area/Activity" = filter(<> ''));

                column(LineNo_Line; "Line No.")
                {
                }
                column(DevelopmentAreaActivity_Line; "Development Area/Activity")
                {
                }
                column(Timeframe_Line; Timeframe)
                {
                }
                column(ProgressComment_Line; "Progress/Comment")
                {
                }
                column(TrainingRequired_Line; "Training Required")
                {
                }
            }
            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
            }
        }
    }
    var
        CompanyInfo: Record "Company Information";
}