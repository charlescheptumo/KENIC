#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75006 "Procurement Law & Regulation"
{
    ApplicationArea = Basic;
    CardPageID = "Law & Regulation Card";
    PageType = List;
    SourceTable = "Procurement Law & Regulation";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Versions"; Rec."No. of Versions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Versions field.';
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Version No field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Versions)
            {
                ApplicationArea = Basic;
                Image = Versions;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Proc Regulation Version";
                RunPageLink = "Primary Document No" = field(Code);
                ToolTip = 'Executes the Versions action.';
            }
            action("Procurement Disputes")
            {
                ApplicationArea = Basic;
                Caption = 'Procurement Disputes';
                ToolTip = 'Executes the Procurement Disputes action.';
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Procurement Laws';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Attach Procurement Laws action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadProcurementLawsDocuments(Rec.Code, 'Procurement Laws', Rec.RecordId, 'R48');
                end;
            }
            action(AttachDocumentsM)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Procurement Manual';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Attach Procurement Manual action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadProcurementManualDocuments(Rec.Code, 'Procurement Manual', Rec.RecordId, 'R48');
                end;
            }
            action(AttachDocumentsC)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Procurement Circular';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Attach Procurement Circular action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadProcurementCircularDocuments(Rec.Code, 'Procurement Circular', Rec.RecordId, 'R48');
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

