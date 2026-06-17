page 50104 "Portal Users Curr"
{
    ApplicationArea = All;
    Caption = 'Portal Users';
    PageType = List;
    SourceTable = portalusers;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("customer No"; Rec."customer No")
                {
                    ToolTip = 'Specifies the value of the customer No field.', Comment = '%';
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.', Comment = '%';
                }
                field("Last Login"; Rec."Last Login")
                {
                    ToolTip = 'Specifies the value of the Last Login field.', Comment = '%';
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the status field.', Comment = '%';
                }
                field(changedPassword; Rec.changedPassword)
                {
                    ToolTip = 'Specifies the value of the changedPassword field.', Comment = '%';
                }
                field(validated; Rec.validated)
                {
                    ToolTip = 'Specifies the value of the validated field.', Comment = '%';
                }
                field(usertype; Rec.usertype)
                {
                    ToolTip = 'Specifies the value of the usertype field.', Comment = '%';
                }
                field(isAdmin; Rec.isAdmin)
                {
                    ToolTip = 'Specifies the value of the isAdmin field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(ActivatedAsVendor; Rec.ActivatedAsVendor)
                {
                    ToolTip = 'Specifies the value of the ActivatedAsVendor field.', Comment = '%';
                }
                field(IDNoorRegNo; Rec.IDNoorRegNo)
                {
                    ToolTip = 'Specifies the value of the IDNoorRegNo field.', Comment = '%';
                }
                field(VendorNo; Rec.VendorNo)
                {
                    ToolTip = 'Specifies the value of the VendorNo field.', Comment = '%';
                }
            }
        }
    }
}
