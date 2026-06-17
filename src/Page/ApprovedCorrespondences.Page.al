#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50184 "Approved Correspondences"
{
    Caption = 'Approved Correspondences';
    CardPageID = "General Correspondence Card-2";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "General Correspondence Header";
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Urgency Status"; Rec."Urgency Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Urgency Status field.';
                }
                field("Sender No"; Rec."Sender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender No field.';
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Name field.';
                }
                field("Recipient No"; Rec."Recipient No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient No field.';
                }
                field("External Stakeholder Name"; Rec."External Stakeholder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Stakeholder Name field.';
                }
                field("Recipient Name"; Rec."Recipient Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient Name field.';
                }
                field("External Reference No"; Rec."External Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Reference No field.';
                }
                field("Communication Subject"; Rec."Communication Subject")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Subject field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
          SETRANGE("Signed By",UserSetup."User ID");
          END;*/

    end;

    trigger OnAfterGetRecord()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
          SETRANGE("Signed By",UserSetup."User ID");
          END;*/

    end;

    trigger OnOpenPage()
    begin
        //CALCFIELDS("Current Approver");
        /*IF UserSetup.GET(USERID) THEN BEGIN
          SETRANGE("Signed By",UserSetup."User ID");
          END;*/

    end;

    var
        UserSetup: Record "User Setup";
        InternalCorrespondApprovals: Record "Daily Record Machinery & Truck";
}

