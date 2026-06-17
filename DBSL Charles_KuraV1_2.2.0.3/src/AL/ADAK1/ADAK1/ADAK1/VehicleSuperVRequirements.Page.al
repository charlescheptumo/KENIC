
Page 72528 "Vehicle SuperV Requirements"
{
    ApplicationArea = Basic;
    Caption = 'PC SUM expenditures';
    CardPageID = "Vehicle SuperV Requirement C";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Temporary Supervision Requirem";
    UsageCategory = Documents;

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
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Rejection Remarks"; Rec."Rejection Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejection Remarks field.';
                }
                field("Rejected By"; Rec."Rejected By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected By field.';
                }
                field("Rejected DateTime"; Rec."Rejected DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected DateTime field.';
                }
                field("Assigned To:"; Rec."Assigned To:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To: field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Links)
            {
            }
            systempart(Control13; Notes)
            {
            }
        }
    }

    actions
    {
    }
}



