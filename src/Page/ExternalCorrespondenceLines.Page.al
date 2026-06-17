#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50186 "External Correspondence Lines"
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
                field("External Stakeholder Post Code"; Rec."External Stakeholder Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Post Code field.';
                }
                field("External Contact Person"; Rec."External Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Contact Person field.';
                }
                field("External Stakeholder Name"; Rec."External Stakeholder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Name field.';
                }
                field("External Stakeholder Address"; Rec."External Stakeholder Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Address field.';
                }
                field("External Stakeholder Address 2"; Rec."External Stakeholder Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Address 2 field.';
                }
                field("External Stakeholder Phone No"; Rec."External Stakeholder Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Phone No field.';
                }
                field("External Stakeholder Email"; Rec."External Stakeholder Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Email field.';
                }
                field("External Stakeholder City"; Rec."External Stakeholder City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder City field.';
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
            }
        }
    }

    actions
    {
    }
}

