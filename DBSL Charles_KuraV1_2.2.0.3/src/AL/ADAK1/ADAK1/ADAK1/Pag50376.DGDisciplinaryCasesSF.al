namespace KENIC.KENIC;

using Microsoft.Foundation.Attachment;
/// <summary>
/// Page DG Disciplinary Cases SF (ID 50376).
/// </summary>
page 50376 "DG Disciplinary Cases SF"
{
    Caption = 'CEO Disciplinary Cases SF';
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case No.';
                    Editable = false;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Reporting';
                    Editable = false;
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mode of Reporting';
                    Editable = false;
                }
                field("Accuser Is Staff"; Rec."Accuser Is Staff")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reporter is Staff';
                    Editable = false;
                }
                field(Accuser; Rec.Accuser)
                {
                    Caption = 'Reporter';
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Witness; Rec.Witness)
                {
                    ApplicationArea = Basic;
                    Caption = 'Witness';
                    Editable = false;
                }
                field("Response to Show Cause"; Rec."Response to Show Cause")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Hearing Date"; Rec."Disciplinary Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Hearing Venue"; Rec."Hearing Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Commitee"; Rec."Disciplinary Commitee")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(Recomendations; Rec.Recomendations)
                {
                    ApplicationArea = Basic;
                }
                field("Recommendation Action Date"; Rec."Recommendation Action Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("CEO Response"; Rec."DG Response")
                {
                    ApplicationArea = All;
                }
                field("CEO Response Date"; Rec."DG Response Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Case Management")
            {
                action("Notify HR on Response")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                    Promoted = true;
                    PromotedIsBig = true;
                    Caption = 'Notify HR on Response';

                    trigger OnAction()
                    var
                        Txt001: Label 'Are you sure you want to notify HR on your response?';
                    begin
                        if Confirm(Txt001, true) then begin
                            Rec.TestField("DG Response");
                            Rec.NotifyHROnDGResponse(Rec);
                        end;
                    end;
                }
            }
            group("Related Information")
            {
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Attachment Type" := Rec."Document Attachment Type"::DGOutcomeToHR;
    end;
}

