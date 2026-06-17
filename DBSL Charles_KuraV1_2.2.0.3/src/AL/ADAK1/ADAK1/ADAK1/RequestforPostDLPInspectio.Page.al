#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72578 "Request for Post DLP Inspectio"
{
    Caption = 'Request for End of DLP Inspection';
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Work Execution Plan 1D"; Rec."Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                    Caption = 'Work Execution Plan ID';
                    ToolTip = 'Specifies the value of the Work Execution Plan ID field.';
                }
                field("Commencement Order No."; Rec."Commencement Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order No. field.';
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defects Liability Period field.';
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Payments To Date"; Rec."Payments To Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payments To Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part(Control41; "Measurement & Payment Entries")
            {
                SubPageLink = "Job No." = field("Project ID"),
                              "Document Type" = field("Document Type");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = false;
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer No. field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer Name field.';
                }
                field("Resident Engineer Mail"; Rec."Resident Engineer Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer Mail field.';
                }
                field("Resident Engineer No."; Rec."Resident Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer No. field.';
                }
                field("Resident Engineer Name"; Rec."Resident Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer Name field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Portal Status field.';
                }
                field("Total Contract Sum"; Rec."Total Contract Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Contract Sum field.';
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Sum field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Primary Contractor Rep."; Rec."Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contractor Rep. field.';
                }
                field("Contractor Representative Role"; Rec."Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Representative Role field.';
                }
                field("Contractor Rep. Email"; Rec."Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Rep. Email field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Submit action.';

                trigger OnAction()
                begin
                    Rec."Portal Status" := Rec."portal status"::Submitted;
                    Message('Request Submitted Successfully');

                    //Notify The RE that the Contractor has submitted a request for completion
                    ProcurementProcessing.FnNotifyRERequestForTakingOver(Rec);
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Request for End of DLP Inspection";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Request for End of DLP Inspection";
    end;

    var
        ProcurementProcessing: Codeunit "Procurement Processing";
}

