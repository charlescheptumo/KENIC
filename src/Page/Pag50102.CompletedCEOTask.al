page 50102 "Completed CEO Task"
{
    ApplicationArea = All;
    Caption = 'Completed CEO Task';
    PageType = Card;
    SourceTable = "CEO Assign Tasks";
    Editable = false;
    SourceTableView = where(Completed = filter(true));


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
                }
                field("Assign to Employee No"; Rec."Assign to Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign to Employee No field.', Comment = '%';
                }
                field("Assign to Employee Name"; Rec."Assign to Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign to Employee Name field.', Comment = '%';
                }
                field(Completed; Rec.Completed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Completed field.', Comment = '%';
                }
                field("To be Completed On"; Rec."To be Completed On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To be Completed On field.', Comment = '%';
                }
                field("Date of Completion"; Rec."Date of Completion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Completion field.', Comment = '%';
                }
            }
            part("CEO Assign Tasks List"; "CEO Assign Tasks List")
            {
                Editable = false;
                SubPageLink = No = field(No);
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Send Remark")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Task;
                Caption = '&Send Remark';
                ToolTip = 'Executes the &Send Remark action.';

                trigger OnAction()
                begin
                    Rec.TestField("CEO Remark");

                    CEOTaskList.Reset();
                    CEOTaskList.SetRange(No, Rec.No);
                    if CEOTaskList.findset then begin
                        repeat
                            CEOTaskList.TestField(Completed);
                        until CEOTaskList.Next() = 0;
                    end;
                    Emp.Get(Rec."Assign to Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Task Assignment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    Body += '<br> Your tasks have been reviewed. Kindly login to the system to check on any remarks from the CEO. <BR>';
                    Body += '<BR> Kind Regards, <BR> <br>' + Emp."First Name" + '. <BR>';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    Message('You Sent the Review for the Tasks.');
                    // CustomFunc.CreateEvent(Recepient);
                end;
            }
            action("Mark Completed")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Task;
                Caption = '&Mark Completed';
                ToolTip = 'Executes the &Mark Completed action.';

                trigger OnAction()
                begin
                    Rec.TestField(Completed);

                    CEOTaskList.Reset();
                    CEOTaskList.SetRange(No, Rec.No);
                    if CEOTaskList.findset then begin
                        repeat
                            CEOTaskList.TestField(Completed);
                        until CEOTaskList.Next() = 0;
                    end;
                    Emp.Get(Rec."Assign to Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Task Assignment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    Body += '<br> Your tasks have been reviewed and have been marked as completed. <BR>';
                    Body += '<BR> Kind Regards, <BR> <br>' + '<BR> The CEO.' + Emp."First Name" + '. <BR>';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    Message('You Sent the Review for the Tasks.');
                    // CustomFunc.CreateEvent(Recepient);
                end;
            }
        }
    }
    var
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Emp: Record Employee;
        Recepient, Subject, Body : Text;
        // CustomFunc: Codeunit "Custom Function";
        TaskLine: Text;
        CEOTaskList: Record "CEO Assign Tasks List";
}
