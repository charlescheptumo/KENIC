page 50180 "OSH Inspection Voucher Card"
{
    ApplicationArea = All;
    Caption = 'OSH Inspection Voucher Card';
    PageType = Card;
    SourceTable = "Inspection Voucher";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("OSH Inspection Lines"; "OSH Inspection Lines")
            {
                SubPageLink = "Template ID" = field("Drill ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Attachments; "Doc. Attachment List Factbox")
            {
                ApplicationArea = Basic;
                SubPageLink = "Table ID" = const(69451), "No." = field("Drill ID");
            }
        }
    }
}
