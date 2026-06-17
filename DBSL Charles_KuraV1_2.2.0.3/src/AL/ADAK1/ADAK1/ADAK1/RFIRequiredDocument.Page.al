#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75049 "RFI Required Document"
{
    PageType = ListPart;
    SourceTable = "RFI Required Document";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Document Type ID"; Rec."Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Type ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Track Certificate Expiry field.';
                }
                field("Specialized Provider Req"; Rec."Specialized Provider Req")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialized Provider Requirement field.';
                }
                field("Linked To category No"; Rec."Linked To category No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Linked To category No field.';
                }
                field("Special Group Requirement"; Rec."Special Group Requirement")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Special Group Requirement field.';
                }
            }
        }
    }

    actions
    {
    }
}

