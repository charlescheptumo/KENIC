#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72071 "Road Asset Survey Card(pav"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Asset Survey Sheet";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Sheet No"; Rec."Sheet No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sheet No field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Name"; Rec."Road Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Name field.';
                }
                field("Surveyor Name"; Rec."Surveyor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surveyor Name field.';
                }
                field("Survey Date"; Rec."Survey Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Date field.';
                }
                field(AADT; Rec.AADT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual AVerae Daily Traffic';
                    ToolTip = 'Specifies the value of the Annual AVerae Daily Traffic field.';
                }
                field("Road Length"; Rec."Road Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Length field.';
                }
                field("ROW Width"; Rec."ROW Width")
                {
                    ApplicationArea = Basic;
                    Caption = 'Right Of Way Width';
                    ToolTip = 'Specifies the value of the Right Of Way Width field.';
                }
            }
            part(Control10; "Road Asset Survey Line")
            {
                SubPageLink = "Road Code" = field("Road Code"),
                              "Header No" = field("Sheet No");
            }
        }
    }

    actions
    {
    }
}

