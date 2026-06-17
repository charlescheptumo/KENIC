#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72733 "Road Camp"
{
    PageType = Card;
    SourceTable = "Road Camps Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Assigned Staff No"; Rec."Assigned Staff No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Staff No field.';
                }
                field("Assigned Staff Name"; Rec."Assigned Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Staff Name field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
            }
            part(Control11; "Road Camps Lines")
            {
                SubPageLink = "Document No" = field("Document No");
            }
        }
    }

    actions
    {
    }
}

