#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75153 "Bid Filed Document"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bid Filed Document";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Filed"; Rec."Date Filed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filed field.';
                }
                field("Procurement Document Type ID"; Rec."Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Type ID field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Name';
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document/Certificate No. field.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Document Link"; Rec."Document Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                    ToolTip = 'Specifies the value of the Document Link field.';
                }
            }
        }
    }

    actions
    {
    }
}

