#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72186 "BoQ Template Bill Codes"
{
    CardPageID = "BoQ Template Bill Code";
    PageType = ListPart;
    SourceTable = "BoQ Template Bill Code";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Job Task No"; Rec."Default Job Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Job Task No field.';
                }
                field("No. of Bill Activities"; Rec."No. of Bill Activities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Bill Activities field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

