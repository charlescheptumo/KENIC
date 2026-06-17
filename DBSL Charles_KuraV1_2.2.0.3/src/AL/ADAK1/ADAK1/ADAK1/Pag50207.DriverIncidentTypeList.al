/// <summary>
/// Page Driver Incident Type List (ID 50207).
/// </summary>
page 50207 "Driver Incident Type List"
{
    ApplicationArea = All;
    Caption = 'Driver Incident Type List';
    PageType = List;
    SourceTable = "Driver Incident Types";
    UsageCategory = Lists;
    Editable = true;
    InsertAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
