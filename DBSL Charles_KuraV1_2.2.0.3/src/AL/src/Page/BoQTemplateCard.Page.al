#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72012 "BoQ Template Card"
{
    Caption = 'BoQ Template Card';
    PageType = ListPlus;
    SourceTable = "BoQ Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Bill No"; Rec."Bill No")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a code which identifies this standard purchase code.';
                }
                field("Activity Group Title"; Rec."Activity Group Title")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the standard purchase code.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
            }
            part(StdPurchaseLines; "BoQ Template Lines")
            {
                ApplicationArea = Suite;
                SubPageLink = "BoQ Template ID" = field("Bill No");
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::"Purchase Requisition","No.",'Works Purchase Requisition',RECORDID,"Shortcut Dimension 1 Code");
                    // TESTFIELD("Primary Region",'R48');
                    // DMSManagement.UploadStandardPRNDocuments(Code,FORMAT("Template Type"),RECORDID,"Primary Region");
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

