#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72734 "Road Camps Lines"
{
    PageType = ListPart;
    SourceTable = "Road Camps Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Camp No"; Rec."Camp No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Camp No field.';
                }
                field("Camp Name"; Rec."Camp Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Camp Name field.';
                }
                field("Parcel Number"; Rec."Parcel Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parcel Number field.';
                }
                field("Physical Location"; Rec."Physical Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical Location field.';
                }
                field("Approximate Size(Ha.)"; Rec."Approximate Size(Ha.)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approximate Size(Ha.) field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Layout/Spatial Reference"; Rec."Layout/Spatial Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layout/Spatial Reference field.';
                }
                field("Web GIS URL"; Rec."Web GIS URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Web GIS URL field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

