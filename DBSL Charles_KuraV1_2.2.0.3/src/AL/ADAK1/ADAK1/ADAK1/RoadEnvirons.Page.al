#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72066 "Road Environs"
{
    PageType = List;
    SourceTable = "Road Environs";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Environ ID"; Rec."Environ ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Environ ID field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Environ Catgegory"; Rec."Road Environ Catgegory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Environ Catgegory field.';
                }
                field("Road Envrion Type"; Rec."Road Envrion Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Envrion Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Distance(Km) From Road Link"; Rec."Distance(Km) From Road Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Distance(Km) From Road Link field.';
                }
            }
        }
    }

    actions
    {
    }
}

