/// <summary>
/// Page Driver Incident Details (ID 50208).
/// </summary>
page 50208 "Driver Incident Details"
{
    Caption = 'Driver Incident Details';
    PageType = ListPart;
    SourceTable = "Driver Incident Details";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Driver field.', Comment = '%';
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
                    Editable = false;
                }
                field("Incident Type"; Rec."Incident Type")
                {
                    ToolTip = 'Specifies the value of the Incident Type field.', Comment = '%';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ToolTip = 'Specifies the value of the Incident Description field.', Comment = '%';
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ToolTip = 'Specifies the value of the Incident Date field.', Comment = '%';
                }
                field("Police Abstract"; Rec."Police Abstract")
                {
                    ToolTip = 'Specifies the value of the Police Abstract field.', Comment = '%';
                }
                field("Police Abstract No."; Rec."Police Abstract No.")
                {
                    ToolTip = 'Specifies the value of the Police Abstract No. field.', Comment = '%';
                }
            }
        }
    }
}
