page 50094 "Assigned Task by CEO"
{
    ApplicationArea = All;
    Caption = 'Assigned Task by CEO';
    PageType = Card;
    SourceTable = "CEO Assign Tasks";
    SourceTableView = where(Completed = filter(false));

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
                field(Completed; Rec.Completed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Is Completed field.', Comment = '%';
                }
                field("To be Completed On"; Rec."To be Completed On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                SubPageLink = No = field(No);
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Confirm Completed")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Task;
                Caption = '&Confirm Completed';
                ToolTip = 'Executes the &Confirm Completed action.';

                trigger OnAction()
                begin
                    // Rec.TestField(Completed);
                    Rec.TestField("Date of Completion");

                    CEOTaskList.Reset();
                    CEOTaskList.SetRange(No, Rec.No);
                    if CEOTaskList.findset then begin
                        repeat
                            CEOTaskList.TestField(Completed);
                        until CEOTaskList.Next() = 0;
                    end;
                    Emp.Get(Rec."CEO No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for CEO %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Task Assignment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    // Body += '<br>I am currently booking for an appointment at this date and time' + Rec."Appointment Date" + '.';
                    Body += '<br> The tasks assigned to' + Rec."Assign to Employee Name" + 'have been completed. <BR>';
                    Body += '<BR> They have been completed on the' + Format(Rec."Date of Completion") + '. <BR>';

                    // // foreach TaskLine in 
                    // CEOTaskList.Reset();
                    // CEOTaskList.SetRange(No, Rec.No);
                    // if CEOTaskList.FindSet() then begin
                    //     repeat
                    //         TaskLine := CEOTaskList.Tasks;
                    //     until CEOTaskList.Next() = 0;
                    // end;

                    // Body += '<br><li>' + TaskLine +'</li>';
                    // Body += '<br><li>Test</li><li>Test2</li>' +'</li>';
                    // Body+= '<BR>To be completed on '+ Format(Rec."To be Completed On");
                    Body += '<BR> Kind Regards, <BR> <br>' + Rec."Assign to Employee Name" + '. <BR>';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    Message('You Sent the Tasks for confirmation of completion.');
                    // CustomFunc.CreateEvent(Recepient);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."CEO No" = '' then begin
            Emp.Reset();
            Emp.SetRange(CEO, true);
            if Emp.Find('-') then begin
                Rec."CEO No" := Emp."No.";
                Rec."CEO Email" := Emp."E-Mail";
            end
        end;
        CEOTaskList.No := Rec.No;
    end;

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
