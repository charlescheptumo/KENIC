#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60015 "Visitors Vehicle Occupants"
{
    PageType = ListPart;
    SourceTable = "Visitors Vehicle Occupants";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Passenger Type"; Rec."Passenger Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passenger Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Visitors Number"; Rec."Visitors Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee/ID Number';
                    ToolTip = 'Specifies the value of the Employee/ID Number field.';
                }
                field("Visitors Name"; Rec."Visitors Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitors Name field.';
                }
                field("Tag/ Visitors Pass No"; Rec."Tag/ Visitors Pass No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tag/ Visitors Pass No field.';
                }
                field("Arrival Time"; Rec."Arrival Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arrival Time field.';
                }
                field("Exit Time"; Rec."Exit Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Time field.';
                }
                field("Services Sought"; Rec."Services Sought")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Services Sought field.';
                }
                field("Reason for Visit"; Rec."Reason for Visit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Visit field.';

                    trigger OnValidate()
                    begin
                        if Rec."Reason for Visit" = Rec."reason for visit"::Personal then
                            PersonalR := true
                        else
                            PersonalR := false;
                    end;
                }
                field("Officer to Visit"; Rec."Officer to Visit")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = PersonalR;
                    ToolTip = 'Specifies the value of the Officer to Visit field.';
                }
                field("Officer to Visit Name"; Rec."Officer to Visit Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = PersonalR;
                    ToolTip = 'Specifies the value of the Officer to Visit Name field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Checking Actions")
            {
                Caption = 'Checking Actions';
                Image = Confirm;
                action("Check In")
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    ToolTip = 'Executes the Check In action.';

                    trigger OnAction()
                    begin
                        Rec.TestField("Checked in", false);
                        if Confirm('Are you sure you want to check in %1', true, Rec."Visitors Name") then begin
                            Rec."Checked in" := true;
                            Rec."Checked in At" := CurrentDatetime;
                            Rec."Checked in By" := UserId;
                            Rec.Date := Today;
                            Rec."Time In" := Time;
                            Rec."Arrival Time" := Time;
                            /*VisitorsManagement.INIT;
                            VisitorsManagement."Visitor Owner Type" := VisitorsManagement."Visitor Owner Type"::"Staff Visitor";
                            VisitorsManagement."Registration Number" := "Registration Number";
                            VisitorsManagement."Drivers Number" := Number;
                            VisitorsManagement."Drivers Name" := Name;
                            VisitorsManagement."Visitor Description" := "Visitor Description";
                            VisitorsManagement.Date := TODAY;
                            VisitorsManagement."Arrival Time" := TIME;
                            IF VisitorsManagement.INSERT(TRUE) THEN;*/
                            Message('Visitor %1 checked in...', Rec."Visitors Name");
                        end;

                    end;
                }
                action("Check Out")
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    ToolTip = 'Executes the Check Out action.';

                    trigger OnAction()
                    begin
                        Rec.TestField("Checked in", true);
                        if Confirm('Are you sure you want to check out %1', true, Rec."Visitors Name") then begin
                            Rec."Checked out" := true;
                            Rec."Checked out At" := CurrentDatetime;
                            Rec."Checked out By" := UserId;
                            Rec."Date Out" := Today;
                            Rec."Time Out" := Time;
                            Rec."Exit Time" := Time;
                            Message('Visitor %1 checked out..', Rec."Visitors Name");
                            //CurrPage.CLOSE;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnClosePage()
    begin
        if PersonalR = true then begin
            if Rec."Officer to Visit" = '' then
                Error('Officer to Visit must have a value');
        end;
    end;

    trigger OnOpenPage()
    begin
        PersonalR := false;
    end;

    var
        PersonalR: Boolean;
}

