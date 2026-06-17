#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72599 "WorkPlan Document Attachments"
{
    CardPageID = "WorkPlan Document Attachment";
    PageType = List;
    SourceTable = "Road WorkPlan Document Attach";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Work Program ID field.';
                }
                field("Budget Entry No"; Rec."Budget Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Entry No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'ADAK Budget Code';
                    ToolTip = 'Specifies the value of the ADAK Budget Code field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Attached; Rec.Attached)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Attached field.';
                }

            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
                Caption = 'Tender Documents Attachments';
                visible = false;
            }
            part("Attached Documents1"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment Tender Documents Attachments';
                SubPageLink = "Table ID" = const(72304);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Attach Docs action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Road Work Program ID", 'Testing', Rec.RecordId, '');
                    Rec.Attached := true;
                    Rec.Modify();
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
}

#pragma implicitwith restore

