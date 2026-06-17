#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72304 "BoQ Item Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Item Category";
    SourceTableView = where("Bill Item Group" = const(true));
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
                field("Bill Item Group"; Rec."Bill Item Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Group field.';
                }
                field("Default Job Task No"; Rec."Default Job Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Job Task No field.';
                }
                field("No Of Bill Items"; Rec."No Of Bill Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No Of Bill Items field.';
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

