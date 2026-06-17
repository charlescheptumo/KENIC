page 50196 "Incoming Correspondences File"
{
    ApplicationArea = All;
    Caption = 'Incoming Correspondences File';
    PageType = List;
    SourceTable = "Incoming Correspondence Line";
    UsageCategory = Lists;
    // InsertAllowed =No;
    // DeleteAllowed =No;
    // ModifyAllowed =No;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.', Comment = '%';
                }
                field("Recipient No"; Rec."Recipient No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient No field.', Comment = '%';
                }
                field("Recipient Name"; Rec."Recipient Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Name field.', Comment = '%';
                }
                field("Recipient Email"; Rec."Recipient Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Email field.', Comment = '%';
                }
                field("Recipient Directorate Code"; Rec."Recipient Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Directorate Code field.', Comment = '%';
                }
                field("Notification Type"; Rec."Notification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Type field.', Comment = '%';
                }
                field("Receipient User ID"; Rec."Receipient User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipient User ID field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Correspondence Details")
            {
                RunObject = Page "Incoming Correspondences Card";
                RunPageLink = "Document No" = FIELD("Document No");
                Promoted = true;
                PromotedIsBig = true;
                Image = LedgerBook;
                PromotedCategory = Process;
                ToolTip = 'Executes the Correspondence Details action.';
            }
        }
    }

    VAR
        GeneralCorrespondenceHeader: Record 72051;
        GeneralCorrespondApproval: Record 72054;
        GeneralCorrespondenceLine: Record 72055;
        ResponsibilityCenter: Record 5714;
        SenderName: Text[200];
        ComminicationSubject: Text[200];
        ReferenceNo: Code[100];

}
