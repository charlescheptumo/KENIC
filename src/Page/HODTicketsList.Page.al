#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60068 "HOD Tickets List"
{
    CardPageID = "Ticketing Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Front Office Management";
    SourceTableView = sorting("No.")
                      where("Currently Assign To" = const(HOD),
                            Status = filter(Open | Assigned | Escalated));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
                field("Follow up Actions"; Rec."Follow up Actions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Follow up Actions field.';
                }
                field("Assigned Officer No."; Rec."Assigned Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer No. field.';
                }
                field("Assigned Officer Name"; Rec."Assigned Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
                field("Assigned Officer Email"; Rec."Assigned Officer Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Email field.';
                }
                field("Level of Priority"; Rec."Level of Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level of Priority field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("General Tickets Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report "Complaints Report";
                ToolTip = 'Executes the General Tickets Report action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // EscalationMatrix.RESET;
        // EscalationMatrix.SETRANGE("Assign To",EscalationMatrix."Assign To"::HOD);
        // EscalationMatrix.SETRANGE(Closed,FALSE);
        // // EscalationMatrix.SETRANGE("No.","No.");
        // // EscalationMatrix.SETRANGE("Document Type","Document Type");
        // //IF EscalationMatrix.FINDSET THEN BEGIN
        // // REPEAT
        //  //FILTERGROUP(2);
        // //SETRANGE(,EscalationMatrix."No.");
        //   FILTERGROUP(0);
        // //  UNTIL EscalationMatrix.NEXT=0;
        //  //END;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            if UserSetup."System Admin" = true or UserSetup."Authorize Tickets" = true then
                //IF UserSetup."Authorize Tickets" = TRUE THEN
                //OR UserSetup."DCS Accreditation"= TRUE
                exit else
                Rec.SetRange("Assigned Officer No.", UserSetup."Employee No.");

        end;
    end;

    trigger OnOpenPage()
    begin
        // EscalationMatrix.RESET;
        // EscalationMatrix.SETRANGE("Assign To",EscalationMatrix."Assign To"::HOD);
        // EscalationMatrix.SETRANGE(Closed,FALSE);
        // // EscalationMatrix.SETRANGE("No.","No.");
        // // EscalationMatrix.SETRANGE("Document Type","Document Type");
        // IF EscalationMatrix.FINDSET THEN BEGIN
        //  FILTERGROUP(2);
        // SETRANGE("No.",EscalationMatrix."No.");
        //   FILTERGROUP(0);
        //  END;
        /*UserSetup.RESET;
        UserSetup.SETRANGE("User ID",USERID);
        IF UserSetup.FINDFIRST THEN BEGIN
          IF UserSetup."System Admin" = TRUE OR UserSetup."DCS Accreditation"= TRUE OR UserSetup."Authorize Tickets" = TRUE THEN
            EXIT ELSE
        
        SETRANGE("Assigned Officer No.",UserSetup."Employee No.");
          END;
          */

        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            if UserSetup."System Admin" = true or UserSetup."Authorize Tickets" = true then
                //IF UserSetup."Authorize Tickets" = TRUE THEN
                //OR UserSetup."DCS Accreditation"= TRUE
                exit else
                Rec.SetRange("Assigned Officer No.", UserSetup."Employee No.");

        end;

    end;

    var
        EscalationMatrix: Record "Assignment Escalation Matrix";
        UserSetup: Record "User Setup";
}

