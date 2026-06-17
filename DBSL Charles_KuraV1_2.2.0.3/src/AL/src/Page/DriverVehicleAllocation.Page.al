
Page 59049 "Driver Vehicle Allocation"
{
    PageType = ListPart;
    SourceTable = "Vehicle Driver Allocation";
    ApplicationArea = All;
    //ApplicationArea=All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Driver Code"; Rec."Driver Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Code field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Number of Days"; Rec."Number of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Days field.';
                }
                field("Number of Hours"; Rec."Number of Hours")
                {
                    ToolTip = 'Specifies the value of the Number of Hours field.', Comment = '%';
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip End Date field.';
                }
                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Number field.';
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                }
                field("Reassigned?"; Rec."Reassigned?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reassigned? field.';
                }
                field("New Trip"; Rec."New Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the New Trip field.';
                }
                field("Date Reassigned"; Rec."Date Reassigned")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Reassigned field.';
                }
                /*  field("Approved Imprest Memo No.";"Approved Imprest Memo No.")
                  {
                      ApplicationArea = Basic;
                  }*/
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Reassign to Another Trip")
                {
                    ApplicationArea = Basic;
                    Image = Refresh;
                    ToolTip = 'Executes the Reassign to Another Trip action.';

                    trigger OnAction()
                    begin
                        if Rec."Reassigned?" = true then
                            Error('The Driver has already been reassigned to another trip');
                        TravelRequ.Reset;
                        TravelRequ.SetRange("Driver Code", Rec."Driver Code");
                        TravelRequ.SetRange("Requisition Number", Rec."Requisition Number");
                        if Dialog.Confirm('Are you sure you want to reasign %1 to another trip?', true, Rec."Driver Name") then
                            Report.Run(Report::"Reasign Driver Trip", true, true, TravelRequ);
                    end;
                }
            }
        }
    }

    var
        DriverAllocation: Record "Vehicle Driver Allocation";
        TravelRequ: Record "Vehicle Driver Allocation";
}


