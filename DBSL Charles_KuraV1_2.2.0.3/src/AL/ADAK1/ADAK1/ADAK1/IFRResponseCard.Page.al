#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75364 "IFR Response Card"
{
    PageType = Card;
    SourceTable = "RFI Response";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Document No. field.';
                }
                field("Registration Period"; Rec."Registration Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Period field.';
                }
                field("Vendor Representative Name"; Rec."Vendor Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Representative Name field.';
                }
                field("Vendor Repr Designation"; Rec."Vendor Repr Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Representative Designation field.';
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address field.';
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Region';
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field(Constituency; Rec.Constituency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Submitted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control31; "RFI Response Line")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control28; Notes)
            {
            }
            systempart(Control29; MyNotes)
            {
            }
            systempart(Control30; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field("Document No."),
                                  "Document Type" = const("IFP Response"),
                                  "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Filed Documents action.';
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    ToolTip = 'Executes the Print action.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange("Document No.", Rec."Document No.");
                        Report.Run(70107, true, true, Rec);
                    end;
                }
            }
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
                Image = "Order";
                action("Vendor Special Group Entry")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    RunObject = Page "Vendor Special Group Entry";
                    RunPageLink = "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Special Group Entry action.';
                }
                action("Vendor Bank Account List")
                {
                    ApplicationArea = Basic;
                    Image = BankAccount;
                    ToolTip = 'Executes the Vendor Bank Account List action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    // RunObject = Page "Vendor Bank Account List";
                    // RunPageLink = "Vendor No."=field("Vendor No.");
                }
                action("Vendor Business Owner")
                {
                    ApplicationArea = Basic;
                    Image = Relatives;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Business Owner";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Business Owner action.';
                }
                action("Vendor Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Litigation History";
                    ToolTip = 'Executes the Vendor Litigation History action.';
                    //RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = Category;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Professional Staff";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Past Experience action.';
                }
                action("Vendor Professional Staff")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Professional Staff action.';
                }
                action("Vendor Audited Income Statemen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Audited Income Statement';
                    Image = StatisticsDocument;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Income Statemen";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Audited Income Statement action.';
                }
                action("Vendor Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = Balance;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Balance Sheet";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Vendor Audited Balance Sheet action.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"IFR Response";
    end;
}

