#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72435 "Project Photo Record"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Project Photo Record";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Photo ID"; Rec."Photo ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Reference No."; Rec."External Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Reference No. field.';
                }
                field("Date Filed"; Rec."Date Filed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filed field.';
                }
                field("Additional Comments/Notes"; Rec."Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments/Notes field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
            }
        }
    }

    actions
    {
    }
}

