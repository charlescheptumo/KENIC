#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72720 "Pavement Chart Entries"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Pavement Chart Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Enrty No."; Rec."Enrty No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enrty No. field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contractor ID"; Rec."Contractor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor ID field.';
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Date field.';
                }
                field("Survey Date"; Rec."Survey Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Date field.';
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
                field("Layer Test Code"; Rec."Layer Test Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Test Code field.';
                }
                field("Test Description"; Rec."Test Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Description field.';
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Result field.';
                }
                field("Deviation(mm)"; Rec."Deviation(mm)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deviation(mm) field.';
                }
                field("Layer Tolerance"; Rec."Layer Tolerance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Layer Tolerance field.';
                }
                field(Chainage; Rec.Chainage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage field.';
                }
            }
        }
    }

    actions
    {
    }
}

