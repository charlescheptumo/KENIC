#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50046 "Visitors Vehicle Card"
{
    PageType = Card;
    SourceTable = "Visitors Management";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Vehicle Owner Type"; Rec."Vehicle Owner Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Owner Type field.';
                }
                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Number field.';
                }
                field("Body Type"; Rec."Body Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body Type field.';
                }
                field("Vehicles Color"; Rec."Vehicles Color")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicles Color field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Drivers Number"; Rec."Drivers Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drivers Number field.';
                }
                field("Drivers Name"; Rec."Drivers Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drivers Name field.';
                }
                field("Drivers Phone Number"; Rec."Drivers Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drivers Phone Number field.';
                }
                field("Services Sought"; Rec."Services Sought")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Services Sought field.';
                }
                group("Checkin Details")
                {
                    Caption = 'Checkin Details';
                    field("Checked in By"; Rec."Checked in By")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Checked in By field.';
                    }
                    field("Checked in At"; Rec."Checked in At")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Checked in At field.';
                    }
                    field("Checked in"; Rec."Checked in")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Checked in field.';
                    }
                    field("Arrival Time"; Rec."Arrival Time")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Arrival Time field.';
                    }
                }
                group("Checkout Details")
                {
                    Caption = 'Checkout Details';
                    field("Date Out"; Rec."Date Out")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Date Out field.';
                    }
                    field("Time Out"; Rec."Time Out")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Time Out field.';
                    }
                    field("Checked out By"; Rec."Checked out By")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Checked out By field.';
                    }
                    field("Checked out"; Rec."Checked out")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Checked out field.';
                    }
                    field("Exit Time"; Rec."Exit Time")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Exit Time field.';
                    }
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                }
            }
            part(Control24; "Request for PC Sum Lines")
            {
                // SubPageLink = "Document No." = field("No."),Date = field(Date);
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
            }
            systempart(Control13; Notes)
            {
            }
            systempart(Control14; MyNotes)
            {
            }
            systempart(Control15; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Post ")
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post  action.';

                trigger OnAction()
                begin
                    if Confirm(Text0001, true, Rec."No.") then begin
                        Rec.Posted := true;
                        Rec.Status := Rec.Status::Posted;
                        Rec.Modify;
                    end;
                end;
            }
            action("Check In")
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Check In action.';

                trigger OnAction()
                begin
                    Rec.TestField("Checked in", false);
                    if Confirm('Are you sure you want to check in %1', true, Rec."Registration Number") then begin
                        Rec."Checked in" := true;
                        Rec."Checked in At" := CurrentDatetime;
                        Rec."Checked in By" := UserId;
                        Rec.Date := Today;
                        Rec."Time In" := Time;
                        Rec."Arrival Time" := Time;
                        /*VisitorsManagement.INIT;
                        VisitorsManagement."Vehicle Owner Type" := VisitorsManagement."Vehicle Owner Type"::"Staff Vehicle";
                        VisitorsManagement."Registration Number" := "Registration Number";
                        VisitorsManagement."Drivers Number" := Number;
                        VisitorsManagement."Drivers Name" := Name;
                        VisitorsManagement."Vehicle Description" := "Vehicle Description";
                        VisitorsManagement.Date := TODAY;
                        VisitorsManagement."Arrival Time" := TIME;
                        IF VisitorsManagement.INSERT(TRUE) THEN;*/
                        Message('Vehicle %1 checked in...', Rec."Registration Number");
                    end;

                end;
            }
            action("Check Out")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Check Out action.';

                trigger OnAction()
                begin
                    Rec.TestField("Checked in", true);
                    if Confirm('Are you sure you want to check out %1', true, Rec."Registration Number") then begin
                        Rec."Checked out" := true;
                        Rec."Checked out At" := CurrentDatetime;
                        Rec."Checked out By" := UserId;
                        Rec."Date Out" := Today;
                        Rec."Time Out" := Time;
                        Rec."Exit Time" := Time;
                        Message('Vehicle %1 checked out..', Rec."Registration Number");
                        //CurrPage.CLOSE;
                    end;
                end;
            }
        }
    }

    var
        Text0001: label 'Are you sure you want to post %1';
}

