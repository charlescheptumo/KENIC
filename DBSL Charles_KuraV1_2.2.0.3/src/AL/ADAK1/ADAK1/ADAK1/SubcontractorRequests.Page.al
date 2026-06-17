#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72597 "Subcontractor Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Subcontractor Request";
    PageType = List;
    SourceTable = "Subcontracting Header";
    UsageCategory = Tasks;

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Main Contractor No."; Rec."Main Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Contractor No. field.';
                }
                field("Main Contractor Name"; Rec."Main Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Contractor Name field.';
                }
                field("Subcontractor No"; Rec."Subcontractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subcontractor No field.';
                }
                field("Subcontractor Name"; Rec."Subcontractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subcontractor Name field.';
                }
                field("Date Subcontracted"; Rec."Date Subcontracted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Subcontracted field.';
                }
            }
        }
    }

    actions
    {
    }
}

