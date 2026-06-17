#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69789 "Plan Factbox"
{
    PageType = CardPart;
    SourceTable = "Recruitment Plan";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("External Document No"; Rec."External Document No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the External Document No field.';
            }
            field("No. of Open Requisitions"; NoOfOpenRequisitions)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfOpenRequisitions field.';
            }
            field("No. of Closed Requisitions"; NoOfClosedRequisitions)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfClosedRequisitions field.';
            }
            field("No. of Job Applicants"; NoOfJobApplicants)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfJobApplicants field.';
            }
            field("No. of Job Vacancies"; NoOfJobVacancies)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfJobVacancies field.';
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Recruitment Requisition");
        RequisitionHeader.SetRange("Approval Status", RequisitionHeader."approval status"::Open);
        RequisitionHeader.SetRange("Recruitment Plan ID", Rec."Document No.");
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfOpenRequisitions += 1;
            until RequisitionHeader.Next = 0;
        end;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Recruitment Requisition");
        RequisitionHeader.SetRange("Recruitment Plan ID", Rec."Document No.");
        RequisitionHeader.SetRange("Vacancy Status", RequisitionHeader."vacancy status"::Closed);
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfClosedRequisitions += 1;
            until RequisitionHeader.Next = 0;
        end;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Job Vacancy");
        RequisitionHeader.SetRange("Recruitment Plan ID", Rec."Document No.");
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfJobVacancies += 1;
            until RequisitionHeader.Next = 0;
        end;
    end;

    var
        NoOfOpenRequisitions: Integer;
        NoOfClosedRequisitions: Integer;
        NoOfJobApplicants: Integer;
        RequisitionHeader: Record "Recruitment Requisition Header";
        NoOfJobVacancies: Integer;
}

