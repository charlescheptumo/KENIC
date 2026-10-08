/// <summary>
/// List page for maintaining eTims-User records that link a Business Central user to eTIMS device/portal credentials (user id/name, address, contact, password, sync status).
/// </summary>
page 50725 "eTims-User List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-User List';
    PageType = List;
    SourceTable = "eTims-User";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(UserId; Rec.UserId)
                {
                    ToolTip = 'Specifies the value of the UserId field.';
                    Caption = 'Select User';
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
                }
                field(Remark; Rec.Remark)
                {
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field(useYn; Rec.useYn)
                {
                    ToolTip = 'Specifies the value of the UseYN field.';
                }
                field(Synched; Rec.Synched)
                {
                    ToolTip = 'Specifies the value of the Synched field.';
                }
            }
        }
    }
}
