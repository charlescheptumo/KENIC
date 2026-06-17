#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69717 "Pre-Screening Templates"
{
    ApplicationArea = Basic;
    CardPageID = "Pre-Screening Template";
    Editable = false;
    PageType = List;
    SourceTable = "Pre-Screen Template";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Pre-Screening Stage"; Rec."Pre-Screening Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-Screening Stage field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("No. of Qns"; Rec."No. of Qns")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Qns field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
            }
            systempart(Control14; Notes)
            {
            }
            systempart(Control15; MyNotes)
            {
            }
            systempart(Control16; Links)
            {
            }
        }
    }

    actions
    {
    }
}

