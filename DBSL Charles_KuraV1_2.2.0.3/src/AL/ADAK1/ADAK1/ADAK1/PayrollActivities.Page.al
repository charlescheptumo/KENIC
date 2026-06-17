#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69044 "Payroll Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Employees)
            {
                Caption = 'Employees';
                field("Active Security Officers"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Active Employees';
                    DrillDownPageID = "Employee List-P";
                    ToolTip = 'Specifies the value of the Active Employees field.';
                }
                field("Terminated Employees"; Rec."Terminated Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Terminated Employees';
                    DrillDownPageID = "Employee List-P";
                    ToolTip = 'Specifies the value of the Terminated Employees field.';
                }
                field("Seconded Employees"; Rec."Seconded Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seconded Employees field.';
                }
                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inactive Employees field.';
                }

                actions
                {
                    action("New Employee")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employee';
                        RunObject = Page "Education Backgrounds";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Employee action.';
                    }
                }
            }
            cuegroup("Documents Approvals")
            {
                Caption = 'Documents Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }
                field("Posted Approved Leave"; Rec."Posted Approved Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Approved Leave field.';
                    // DrillDownPageID = "Posted Leave Applications";
                }
            }
            cuegroup("Salary Vouchers Processing")
            {
                Caption = 'Salary Vouchers Processing';
                field("Salary Vouchers"; Rec."Salary Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Payroll Processing List";
                    ToolTip = 'Specifies the value of the Salary Vouchers field.';
                }
                field("Approved Salary Vouchers"; Rec."Approved Salary Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Salary Vouchers";
                    LookupPageID = "Approved Salary Vouchers";
                    ToolTip = 'Specifies the value of the Approved Salary Vouchers field.';
                }
                field(Visitors; Rec.Visitors)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Visitor Pass List";
                    ToolTip = 'Specifies the value of the Visitors field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("Date Filter", '>=%1', WorkDate);
        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;
}

#pragma implicitwith restore

