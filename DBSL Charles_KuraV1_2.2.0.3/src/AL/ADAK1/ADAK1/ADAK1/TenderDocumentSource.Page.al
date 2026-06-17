#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75097 "Tender Document Source"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tender Document Source";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Url Link"; Rec."Url Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Url Link field.';
                }
                field("Default IFS Bid Charge Code"; Rec."Default IFS Bid Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default IFS Bid Charge Code field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

