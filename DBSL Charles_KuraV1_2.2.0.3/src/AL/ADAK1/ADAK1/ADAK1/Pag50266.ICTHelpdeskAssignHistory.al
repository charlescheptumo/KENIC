namespace KICD.KICD;

page 50266 "ICT Helpdesk Assign History"
{
    ApplicationArea = All;
    Caption = 'ICT Helpdesk Assign History';
    PageType = List;
    SourceTable = "ICT Helpdesk Assign History";
    UsageCategory = None;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.', Comment = '%';
                }
                field("Assined To E-Mail"; Rec."Assined To E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assined To E-Mail field.', Comment = '%';
                }
                field("Assigned By"; Rec."Assigned By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned By field.', Comment = '%';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Date field.', Comment = '%';
                }
                field("Assigned DateTime"; Rec."Assigned DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned DateTime field.', Comment = '%';
                }
            }
        }
    }
}
