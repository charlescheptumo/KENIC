#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56120 "ICT Helpdesk Setup Card"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk Global Parameters";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Global Parameters")
            {
                field("User Feedback Duration"; Rec."User Feedback Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Feedback Duration field.';
                }
                field("Assigned Issue Duration"; Rec."Assigned Issue Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Issue Duration field.';
                }
            }
            group("Numbers")
            {
                field("ICT Inventory Nos"; Rec."ICT Inventory Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory Nos field.';
                }
                field("ICT Issuance Voucher Nos."; Rec."ICT Issuance Voucher Nos.")
                {
                    ToolTip = 'Specifies the value of the ICT Issuance Voucher Nos. field.';

                }
                field("ICT Maintenance Schedule Nos."; Rec."ICT Maintenance Schedule Nos.")
                {
                    ToolTip = 'Specifies the value of the ICT Maintenance Schedule Nos. field.';

                }
                field("ICT Comp Nos."; Rec."ICT Comp Nos.")
                {
                    ToolTip = 'Specifies the value of the ICT Comp Nos. field.';

                }
                field("ICT Vehicle Nos."; Rec."ICT Vehicle Nos.")
                {
                    ToolTip = 'Specifies the value of the ICT Vehicle Nos. field.';

                }
                field("ICT Furniture Nos."; Rec."ICT Furniture Nos.")
                {
                    ToolTip = 'Specifies the value of the ICT Furniture Nos. field.';

                }

            }
        }
    }

    actions
    {
    }
}

