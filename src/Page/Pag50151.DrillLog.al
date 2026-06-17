page 50152 "Drill Log"
{
    ApplicationArea = All;
    Caption = 'Drill Log';
    PageType = Card;
    SourceTable = "Emergency Drill Log";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = NotPost;

                Caption = 'General';
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Drill Document Type"; Rec."Drill Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Document Type field.';
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Management Plan ID field.';
                }
                field("OSH Plan Calendar ID"; Rec."OSH Plan Calendar ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the OSH Plan Calendar ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date of Drill"; Rec."Date of Drill")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Drill field.';
                }
                field("Drill Start Time"; Rec."Drill Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Start Time field.';
                }
                field("Drill End Time"; Rec."Drill End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill End Time field.';
                }
                field("Overall Drill Manager ID"; Rec."Overall Drill Manager ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Manager ID field.';
                }
                field("Overall Drill Manager Name"; Rec."Overall Drill Manager Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Manager Name field.';
                }
                field("Overall Drill Manager Email"; Rec."Overall Drill Manager Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Manager Email field.';
                }
                field("Drill Location Details"; Rec."Drill Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Location Details field.';
                }
                field("Assembly Point Location"; Rec."Assembly Point Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assembly Point Location field.';
                }
                field("Prior Notice to Staff"; Rec."Prior Notice to Staff")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Prior Notice to Staff field.';
                }
                field("Notice to Staff Date"; Rec."Notice to Staff Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Notice to Staff Date field.';
                }
                field("Total No. of People Involved"; Rec."Total No. of People Involved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of People Involved field.';
                }
                field("Total No. of People Evacuated"; Rec."Total No. of People Evacuated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of People Evacuated field.';
                }
                field("Total No. of recorded Injuries"; Rec."Total No. of recorded Injuries")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of recorded Injuries field.';
                }
                field("Time Evacuation Started"; Rec."Time Evacuation Started")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Evacuation Started field.';
                }
                field("Time Evacuation Ended"; Rec."Time Evacuation Ended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Evacuation Ended field.';
                }
                field("Evacuation Delay Time"; Rec."Evacuation Delay Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Delay Time field.';
                }
                field("Overall Drill Standard"; Rec."Overall Drill Standard")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Standard field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Areas of Improvement"; Rec."Areas of Improvement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Areas of Improvement field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
            }
        }
        area(factboxes)
        {
            part(Attachments; "Doc. Attachment List Factbox")
            {
                SubPageLink = "Table ID" = const(Database::"Emergency Drill Log"), "No." = field("Drill ID");
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Notify Staff")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                Image = Email;
                ToolTip = 'Executes the Notify Staff action.';

                trigger OnAction()
                begin
                    Employee.Reset();
                    Employee.SetRange(Status, Employee.Status::Active);
                    if Employee.findset then begin
                        repeat
                            if Employee."Company E-Mail" = '' then
                                Error('The Employee %1 does not have an email', Employee."No.");
                            Recepient := Employee."Company E-Mail";

                            Subject := 'Drill Notice';
                            // Body += 'Dear ' + Employee.FullName() + ',';
                            Body += 'Dear Team,';
                            Body += '<br><br>We hope this message finds you well. As part of our ongoing commitment to safety and preparedness, we will be conducting a ' + Format(Rec."Drill Document Type") + ' on ' + format(Rec."Date of Drill") + ' at ' + Format(Rec."Drill Start Time") + ' to ' + Format(Rec."Drill End Time") + '.';
                            Body += '<br><br>We will have ' + Rec."Assembly Point Location" + ' as the assembly point with these being its details ' + Rec."Drill Location Details" + '.<br>';
                            Body += '<b>Purpose of the Drill:<b>';
                            Body += '<br>' + Rec.Description + '.';
                            Body += '<br><br>Your cooperation and participation are crucial to the success of this drill. If you have any questions or concerns, please feel free to contact ' + Rec."Overall Drill Manager Name" + ' at ' + Rec."Overall Drill Manager Name" + '.';
                            Body += '<br>Thank you for your attention to this important matter.';
                            Body += '<br>Kind regards,<br>';
                            Body += 'The OSH Committee.';
                            EmailMessage.Create(Recepient, Subject, Body, true);
                            Email.Send(EmailMessage, EmailScenario::Default);
                        until Employee.Next = 0;

                        Rec."Prior Notice to Staff" := true;
                        Rec."Notice to Staff Date" := Today;
                    end
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                Image = Action;
                ToolTip = 'Executes the Submit action.';

                trigger OnAction()
                begin
                    if Confirm('Would you like to submit the Drill Log?', false, true) then begin
                        Rec.Posted := true;
                        CurrPage.Editable(false);
                    end

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if (Rec.Posted = true) then begin
            NotPost := false;
        end else begin
            NotPost := true;
        end;

        if Rec."Overall Drill Manager ID" = '' then begin
            Resource.Get('ADAK008');
            Rec."Overall Drill Manager ID" := Resource."No.";
        end
    end;

    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailScenario: Enum "Email Scenario";
        Recepient, Subject, Body : Text;
        Employee: Record Employee;
        NotPost: Boolean;
        Resource: Record Resource;
}
