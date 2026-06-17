page 50114 "Submitted Suggestion Box"
{
    ApplicationArea = All;
    Caption = 'Submitted Suggestion Box';
    PageType = Card;
    SourceTable = "Suggestion Box";
    // Editable = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                    Editable = false;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                    Editable = false;
                }
                field("Requested By Name"; Rec."Requested By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By Name field.', Comment = '%';
                    Editable = false;
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the System Type field.';
                }
                field("Project Team"; Rec."Project Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Team field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                    Editable = false;
                }
                field("Process Status"; Rec."Process Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Status field.', Comment = '%';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                    Editable = false;
                }
                field("ICT Feedback"; Rec."ICT Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Feedback field.', Comment = '%';
                }
            }
            part("Suggestion Box Lines"; "Suggestion Box Lines")
            {
                Editable = false;
                ApplicationArea = Basic;
                SubPageLink = No = field(No);
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Send Remark")
            {
                ApplicationArea = All;
                Caption = 'Send Remark', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Comment;
                ToolTip = 'Executes the Send Remark action.';

                trigger OnAction()
                begin
                    Rec.TestField(Rec."ICT Feedback");

                    // UserSet.Get(Rec."Requested By");
                    // UserSet.SetRange("System Admin", true);

                    UserSet.Reset();
                    UserSet.SetRange("User ID", Rec."Requested By");
                    if UserSet.Find('-') then begin
                        Rec."Admin Email" := UserSet."E-Mail";
                        if Rec."Admin Email" = '' then
                            Error('Kindly insert the email for the employee', UserSet."Employee No.");
                    end;
                    Recepient := Rec."Admin Email";

                    Subject := 'Feedback for Submitted Suggestion';
                    Body += 'Dear ' + Rec."Requested By Name" + ',';
                    Body += '<br>There is a feedback for the request' + Rec.No + 'that you made by ' + Rec."Admin Name" + '.';
                    Body += '<br>The feedback made is: ' + Rec."ICT Feedback" + '<br>';
                    Body += '<br><br>Kind Regards,<br>' + Rec."Requested By Name" + '.';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);

                    Rec."Has Feedback" := true;
                    Rec.Modify(true);
                    Message('You have sent the feedback.');
                end;
            }
            action("Send for CIT Review")
            {
                ApplicationArea = All;
                Caption = 'Send for CIT Review', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send for CIT Review action.';

                trigger OnAction()
                begin
                    ProjTeamMemb.Reset();
                    ProjTeamMemb.SetRange(Code, Rec."Project Team");
                    if ProjTeamMemb.FindSet then begin
                        repeat
                            if ProjTeamMemb."Member Email" = '' then
                                Error('Kindly insert the email for member %1', ProjTeamMemb."Member Name");

                            Recepient := ProjTeamMemb."Member Email";
                            Subject := 'System Change Review for Submitted Suggestion';
                            Body += 'Dear ' + ProjTeamMemb."Member Name" + ',';
                            Body += '<br>There is a system change for the request' + Rec.No + 'that has been made by ' + Rec."Requested By Name" + '.';
                            Body += '<br>Below are the suggestions made: <br>';
                            SuggestLines.Reset();
                            SuggestLines.SetRange(No, Rec.No);
                            if SuggestLines.FindSet then begin
                                repeat
                                    SugList := SuggestLines.Proposal;
                                until SuggestLines.Next() = 0;
                            end;
                            Body += '<ul><li>' + SugList + '</li></ul>';
                            Body += '<br><br>Kind Regards,<br>' + Rec."Requested By Name" + '.';

                            EmailMess.Create(Recepient, Subject, Body, true);
                            Email.Send(EmailMess, EmailScen::Default);

                        until ProjTeamMemb.Next() = 0;
                    end;

                    Rec."Process Status" := Rec."Process Status"::"Under CIT Review";
                    Rec.Modify(true);
                    Message('The document has been sent for CIT Review');
                end;
            }
        }
    }
    var
        Recepient, Subject, Body : Text;
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        UserSet: Record "User Setup";
        ProjTeamMemb: Record "Project Team Members";
        SuggestLines: Record "Suggestion Box Lines";
        SugList: Text;
}
