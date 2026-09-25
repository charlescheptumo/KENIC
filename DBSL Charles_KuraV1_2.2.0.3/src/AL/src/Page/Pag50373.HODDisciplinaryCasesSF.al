namespace KENIC.KENIC;

using Microsoft.Foundation.Attachment;
/// <summary>
/// Page HOD Disciplinary Cases SF (ID 50043).
/// </summary>
page 50374 "HOD Disciplinary Cases SF"
{
    Caption = 'HOD Disciplinary Cases SF';
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case No. field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Reporting field.';
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Description field.';
                }
                field("Accuser Is Staff"; Rec."Accuser Is Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reporter is Staff field.';
                }
                field(Accuser; Rec.Accuser)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reporter field.';
                }
                 field("Witness Is Staff";Rec."Witness Is Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Witness Is Staff field.';
                }
                field(Witness; Rec.Witness)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Witness field.';
                }
                field("Area of Incident"; Rec."Area of Incident")
                {
                    ApplicationArea = All;
                }
                  field("Other Persons Is Staff";Rec."Other Persons Is Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Persons Is Staff field.';
                }
                field("Other Persons Involved"; Rec."Other Persons Involved")
                {
                    ApplicationArea = All;
                }
                field("HOD Comments"; Rec."HOD Comments")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
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
                Caption = 'Case Management';
                action("Notify HR")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DocumentCount: integer;
                        Err002: Label 'Attachment is required.';
                        Txt001: Label 'Are you sure you want to report this case to HR?';
                    begin
                        if confirm(Txt001, true) then begin
                            Rec.TestField("Date of Complaint");
                            Rec.TestField("Type of Disciplinary Case");
                            Rec.TestField("Case Description");

                            Rec.NotifyHROnCaseFile(Rec);
                            Rec."Current Step" := Rec."Current Step"::ShowCauseReplyFromEmployee;
                            Rec.Modify();
                        end;
                    end;
                }

            }
            group("Related Information")
            {
                Caption = 'Related Information';
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
        Rec."Document Attachment Type" := Rec."Document Attachment Type"::FromHODToHR;
    end;

    var
        DocAttach: Record "Document Attachment";
        Appeals: Record "HR Appealed Disc. Cases";
        Cases: Record "HR Disciplinary Cases";
}