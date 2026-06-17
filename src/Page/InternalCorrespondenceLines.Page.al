#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50194 "Internal Correspondence Lines"
{
    PageType = ListPart;
    SourceTable = "General Correspondence Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Notification Type"; Rec."Notification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Type field.';
                }
                field("Recipient Type"; Rec."Recipient Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Type field.';
                }
                field("Recipient No"; Rec."Recipient No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient No field.';
                }
                field("Recipient Name"; Rec."Recipient Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Name field.';
                    Visible = false;
                }
                field(Position; Rec.Position)
                {
                    ToolTip = 'Specifies the value of the Position field.', Comment = '%';
                }
                field("Recipient Email"; Rec."Recipient Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Email field.';
                }
                field("Recipient Address"; Rec."Recipient Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Recipient Address 2"; Rec."Recipient Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Recipient City"; Rec."Recipient City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Recipient Post Code"; Rec."Recipient Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

