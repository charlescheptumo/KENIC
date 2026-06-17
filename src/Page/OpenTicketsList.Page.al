#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60043 "Open Tickets List"
{
    CardPageID = "Ticketing Card";
    PageType = List;
    SourceTable = "Front Office Management";
    SourceTableView = where("Assigned to Department" = const(false),
                            Status = const(Open));
    ApplicationArea = all;

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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
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
        area(creation)
        {
            action("Import Tickets")
            {
                ApplicationArea = Basic;
                Image = Excel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Front Office Tickets";
                ToolTip = 'Executes the Import Tickets action.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        FrontOff.Reset();
        // FrontOff.SetRange("No.",FrontOff."No.");
        FrontOff.SetRange(Status, FrontOff.Status::Escalated);
        if FrontOff.FindSet then begin
            if Format(Rec."Date of Escalation" - Today) > Format(2) then begin
                UserSet.Get();
                // UserSet.
                if UserSet."System Admin" = true then begin
                    ICTEmail := UserSet."E-Mail";

                    Subj := 'Reminder ';
                    Body += '';
                    EmailMess.Create(ICTEmail, Subj, Body);
                    Emai.Send(EmailMess, EmailScen::Default);
                end;
            end
        end;
    end;

    var
        FrontOff: Record "Front Office Management";
        Emai: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Recepient, Subj, Body : Text;
        ICTEmail: Text;
        UserSet: Record "User Setup";

}

