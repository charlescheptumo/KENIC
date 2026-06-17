#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59028 "Fuel Card"
{
    //DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel Card";
    ApplicationArea = All;
    // SourceTableView = where(closed = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;

                    LookupPageID = "Fleet Vehicles List";
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Card Type field.';
                }
                field(lowerlimit; Rec.lowerlimit)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Litre Lower Limit';
                    ToolTip = 'Specifies the value of the Litre Lower Limit field.';
                }
                field("Total Allocated Limit"; Rec."Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "Limit Types";
                    ToolTip = 'Specifies the value of the Total Allocated Limit field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Requisition Interval"; Rec."Requisition Interval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Interval field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                }
                field("Vehicle Number"; Rec."Vehicle Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet No.';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Fleet No. field.';
                }
                field("Driver Details"; Rec."Driver Details")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Driver Details field.';
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Fuel Card No. field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Total Amount Spend"; Rec."Total Amount Spend")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount Spend field.';
                }
                field("Total Balance"; Rec."Total Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Balance field.';
                }
                field("TotalBalance"; Rec."Total Balance1")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Balance field.';
                }
                field("Allocated Vehicle Limit"; Rec."Allocated Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Allocated Vehicle Limit field.';
                }
                field("Total Amt Spend per Vehicle"; Rec."Total Amt Spend per Vehicle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Amt Spend per Vehicle field.';
                }
                field("Vehicle Balance"; Rec."Vehicle Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vehicle Balance field.';
                }
            }
            part(Control1000000015; "Fuel Card Lines")
            {
                SubPageLink = "No." = field(No), Posted = const(true);
                UpdatePropagation = Both;
                Editable = false;

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Test Reminder")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Test Reminder action.';

                trigger OnAction()
                begin
                    Report.run(50050, true, true, Rec);
                end;
            }
            action("Fuel Post")
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Approval Status MUST be Approved');
                end;
            }
            action("Close Document")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Close Document action.';

                trigger OnAction()
                begin

                    FuelCardLines.Reset;
                    FuelCardLines.SetRange(FuelCardLines."No.", Rec.No);
                    if FuelCardLines.Find('-') then begin
                        repeat
                            FuelCardLines.closed := true;
                            FuelCardLines.Modify;
                        until FuelCardLines.Next = 0;
                    end;


                    DetailedFD.Reset;
                    DetailedFD.SetRange(No, Rec.No);
                    if DetailedFD.Find('-') then begin
                        repeat
                            DetailedFD.closed := true;
                            DetailedFD.Modify;
                        until DetailedFD.Next = 0;
                    end;


                    Rec.closed := true;
                    Rec.Modify;

                    Message('Fuel Card Document Closed successfully');
                end;
            }
        }
        area(Navigation)
        {
            action("Top ups")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                RunObject = Page "Fuel Top Up List";
                RunPageLink = "Card No." = field(No);
                ToolTip = 'Executes the Top ups action.';
            }
            action(Expense)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                RunObject = Page "Fuel Expenses";
                RunPageLink = "No." = field(No);
                ToolTip = 'Executes the Expense action.';
            }
        }
        area(creation)
        {
            action("Send Request Approval")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                ToolTip = 'Executes the Send Request Approval action.';

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error('Status must be open');
                    //ApprovalMgt.SendFuelCardApprovalRequest(Rec)
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                    Message('Document Approved Successfully');
                end;
            }
            action("Cancel  Request Approval")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                ToolTip = 'Executes the Cancel  Request Approval action.';

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelFuelCardRequest(Rec,TRUE,TRUE);
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.CalcFields("Total Amount Spend", "Total Topups");
        Rec."Total Balance" := Rec."Total Allocated Limit" + Rec."Total Topups" - Rec."Total Amount Spend";
        Rec.CalcFields("Total Amt Spend per Vehicle");
        Rec."Vehicle Balance" := Rec."Allocated Vehicle Limit" - Rec."Total Amt Spend per Vehicle";
        Rec.CalcFields(check);
    end;

    trigger OnOpenPage()
    begin
        /*IF "Total Amount Spend">"Allocated vehicle Limit" THEN BEGIN
        ERROR('Total amount spend can not be more that allocated amount');
        END;*/

    end;

    var
        DetailedFD: Record "Fuel Card Entries";
        FuelCardLines: Record "Vehicle Fuel Card Lines";
        FuelCard: Record "Fuel Card";
        CheckLimit: Decimal;
        LowerLimit: Record "Limit Types";
        lowercheck: Decimal;
    // ApprovalMgt: Codeunit "Approvals Mgmt.";
}



