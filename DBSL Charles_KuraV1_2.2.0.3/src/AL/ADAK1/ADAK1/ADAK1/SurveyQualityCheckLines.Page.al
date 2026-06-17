#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72682 "Survey Quality Check Lines"
{
    PageType = ListPart;
    SourceTable = "Survey Quality Check Line";
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
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Layer Code"; Rec."Layer Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Code field.';
                }
                field("Layer Description"; Rec."Layer Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Description field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Survey Test Done"; Rec."Survey Test Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Survey Check Done';
                    ToolTip = 'Specifies the value of the Survey Check Done field.';
                }
                field("Test Time"; Rec."Test Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Time field.';
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Date field.';
                }
                field("Surveyor Type"; Rec."Surveyor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surveyor Type field.';
                }
                field("Surveyor No"; Rec."Surveyor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surveyor No field.';
                }
                field("Surveyor Name"; Rec."Surveyor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surveyor Name field.';
                }
                field("Location (Chainage)"; Rec."Location (Chainage)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location (Chainage) field.';
                }
                field("Layer Tolerance"; Rec."Layer Tolerance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Tolerance field.';
                }
                field("Final Test Result"; Rec."Final Test Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Test Result field.';
                }
                field(Offset; Rec.Offset)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offset field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

