page 50283 "Posted Correspondences"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "General Correspondence Header";
    CardPageID = "General Correspondence Card-2";
    SourceTableView = where(Status = const(Approved), Posted = const(true));
    
   layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Urgency Status";Rec."Urgency Status")
                {
                    ApplicationArea = Basic;
                }
                field("Sender No";Rec."Sender No")
                {
                    ApplicationArea = Basic;
                }
                field("Sender Name";Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Recipient No";Rec."Recipient No")
                {
                    ApplicationArea = Basic;
                }
                field("External Stakeholder Name";Rec."External Stakeholder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Recipient Name";Rec."Recipient Name")
                {
                    ApplicationArea = Basic;
                }
                field("External Reference No";Rec."External Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Communication Subject";Rec."Communication Subject")
                {
                    ApplicationArea = Basic;
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