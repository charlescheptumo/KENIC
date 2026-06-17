#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72427 "Road Materials"
{
    CardPageID = "Road Material";
    PageType = List;
    SourceTable = "Road Material";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Material Code"; Rec."Material Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Base Unit Of Measure"; Rec."Base Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Base Unit Of Measure field.';
                }
                field("Default Material Test Template"; Rec."Default Material Test Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Material Test Template field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Category Code field.';
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

