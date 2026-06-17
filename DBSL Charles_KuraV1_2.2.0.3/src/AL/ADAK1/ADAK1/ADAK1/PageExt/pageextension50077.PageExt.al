#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50077 "pageextension50077" extends "Industry Groups"
{
    layout
    {
        addafter("No. of Contacts")
        {
            field("No. of Vendors"; Rec."No. of Vendors")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the No. of Vendors field.';
            }
        }
    }
    actions
    {
        addafter("C&ontacts")
        {
            action(Vendors)
            {
                ApplicationArea = Basic;
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor List";
                RunPageLink = "Industry Group" = field(Code);
                ToolTip = 'Executes the Vendors action.';
            }
        }
    }
}

