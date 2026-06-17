#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50185 "General Correspondences"
{
    CardPageID = "General Correspondence Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    Caption = 'Memos';
    SourceTable = "General Correspondence Header";
    DelayedInsert = true;
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
                    Style = Unfavorable;
                    StyleExpr = Rec."Urgency Status" = Rec."Urgency Status"::Urgency;
                    ToolTip = 'Specifies the value of the Urgency Status field.';
                }
                field("Division Code"; Rec."Division Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Section Code field.', Comment = '%';
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
        /*IF UserSetup.GET("Created By") THEN BEGIN
          IF UserSetup."Portal User" THEN BEGIN
            IF UserSetup1.GET(USERID) THEN BEGIN
             SETRANGE("Creator No",UserSetup1."Employee No.");
              END;
            END;
          END;*/

    end;

    trigger OnAfterGetRecord()
    begin
        /*IF UserSetup.GET("Created By") THEN BEGIN
          IF UserSetup."Portal User" THEN BEGIN
            IF UserSetup1.GET(USERID) THEN BEGIN
             SETRANGE("Creator No",UserSetup1."Employee No.");
              END;
            END;
          END;*/

    end;

    trigger OnOpenPage()
    begin
        /*IF UserSetup.GET("Created By") THEN BEGIN
          IF UserSetup."Portal User" THEN BEGIN
            IF UserSetup1.GET(USERID) THEN BEGIN
             SETRANGE("Creator No",UserSetup1."Employee No.");
              END;
            END;
          END;*/

    end;

    var
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
}

