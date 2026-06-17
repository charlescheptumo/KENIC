#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
namespace KICD.KICD;

Page 55008 "Committee Board Members"
{
    PageType = List;
    SourceTable = "committee board members";
    ApplicationArea = All;
    Caption = 'Committee Board Members';
    Editable = false;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the Director No.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the member name.';
                }
                field(Committee; Rec.Committee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the committee this member belongs to.';
                }
            }
        }
    }
}
