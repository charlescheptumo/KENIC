#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50191 "Incoming Correspondence Lines"
{
    PageType = ListPart;
    SourceTable = "Incoming Correspondence Line";
    ApplicationArea = All;

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
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Recipient Type"; Rec."Recipient Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Type field.';
                }
                field("Notification Type"; Rec."Notification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Type field.';
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
                }
                field("Recipient Email"; Rec."Recipient Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Email field.';
                }
                field("Recipient Directorate Code"; Rec."Recipient Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Directorate Code field.';
                }
                field("Recipient Directorate Name"; Rec."Recipient Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Directorate Name field.';
                }
                field("Recipient Directorate Email"; Rec."Recipient Directorate Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Directorate Email field.';
                }
                field("Recepient Region Code"; Rec."Recepient Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recepient Region Code field.';
                }
                field("Recepient Region Name"; Rec."Recepient Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recepient Region Name field.';
                }
                field("Recipient Department Code"; Rec."Recipient Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Department Code field.';
                }
                field("Recipient Department Name"; Rec."Recipient Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Department Name field.';
                }
                field("Recipient Job ID"; Rec."Recipient Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Job ID field.';
                }
                field("Recipient Job Title"; Rec."Recipient Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Job Title field.';
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
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

