#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72053 "Road Definition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Definition";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Properties Of Link")
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(Km) field.';
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(Km) field.';
                }
                field("Link Length(Km)"; Rec."Link Length(Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Link Length(Km) field.';
                }
                field("Surface Type"; Rec."Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surface Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

