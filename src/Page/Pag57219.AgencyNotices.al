#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57219 "Agency Notices"
{
    ApplicationArea = Basic;
    CardPageID = "Agency Notice";
    PageType = List;
    SourceTable = "Agency Notice Header";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Notice Date"; Rec."Notice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Date field.';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Lifted; Rec.Lifted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lifted field.';
                }
                field("Payment Registration Number"; Rec."Payment Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Registration Number field.';
                }
                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligation WHT field.';
                }
                field("Obligation VAT"; Rec."Obligation VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligation VAT field.';
                }
                field("Obligation Income Tax"; Rec."Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Obligation PAYE';
                    ToolTip = 'Specifies the value of the Obligation PAYE field.';
                }
                field("Obligation Total Amount"; Rec."Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Obligation Total Amount field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Contractor PIN"; Rec."Contractor PIN")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor PIN field.';
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

