
#pragma implicitwith disable
Page 80405 "All Performance Contract"
{
    DeleteAllowed = false;
    //  Editable = false;
    //  InsertAllowed = false;
    // ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    PopulateAllFields = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective Setting Due Date field.';
                }
                field("Department Plan ID"; Rec."Department Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';

                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Employee No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Blocked?"; Rec."Blocked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Board PC Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
                Visible = false;
                ApplicationArea = Basic;
            }
            part("Core Activities"; "Workplan Initiatives")
            {
                Caption = 'Core Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity | Board);
            }
            part("Added Activities"; "Secondary Workplan Initiatives")
            {
                Caption = 'Additional Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Year Reporting Code" = field("Annual Reporting Code");
                Visible = false;

            }
            part("Departmental Objectives"; "Additional DP Objectives")
            {
                Caption = 'Departmental Objectives';
                SubPageLink = "Workplan No." = field(No);
                Visible = true;
            }
            part(Control24; "PC Job Description")
            {
                Caption = 'Job Description';
                SubPageLink = "Workplan No." = field(No);
            }
        }


    }

    actions
    {
        area(creation)
        {
            action("Suggest Activity Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Suggest Activity Lines action.';

                trigger OnAction()
                var
                    StrategicIntPlanningLines: Record "Strategy Workplan Lines";
                    WPLines: Record "PC Objective";
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');

                    WPLines.SetRange("Workplan No.", Rec.No);
                    if WPLines.FindSet() then
                        WPLines.DeleteAll();
                    StrategicIntPlanningLines.Reset;
                    StrategicIntPlanningLines.SetRange(No, Rec."Department Plan ID");
                    if StrategicIntPlanningLines.FindSet() then begin
                        repeat
                            WPLines.Init;
                            WPLines."Workplan No." := Rec.No;
                            WPLines."Department Plan ID" := StrategicIntPlanningLines.No;
                            WPLines."Initiative No." := StrategicIntPlanningLines."Activity ID";
                            WPLines."Activity Description" := StrategicIntPlanningLines.Description;
                            WPLines."Key Performance Indicator" := StrategicIntPlanningLines."Perfomance Indicator";
                            WPLines."Outcome" := StrategicIntPlanningLines.Outcome;
                            //WPLines.Validate("Outcome Perfomance Indicator");
                            WPLines."Imported Annual Target Qty" := StrategicIntPlanningLines."Q1 Target";
                            WPLines."Year Reporting Code" := StrategicIntPlanningLines."Year Reporting Code";
                            WPLines."Assigned Weight (%)" := StrategicIntPlanningLines."Departmental Activity Weight";
                            WpLines.Insert(true);
                        until StrategicIntPlanningLines.Next = 0;


                    end;
                    Message('Core Initiatiative Populated Successfully');

                end;
            }


            action("Suggest Job Description")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Suggest Job Description Lines action.';

                trigger OnAction()
                var
                    Employee: Record Employee;
                    JobRes: Record "Positions Responsibility";
                    JobPosition: Code[30];
                    PCJobDescription: Record "PC Job Description";
                begin
                    if not Confirm('Are you sure you want to Job Description Activities', true) then
                        Error('Activities not Suggested');

                    PCJobDescription.SetRange("Workplan No.", Rec.No);
                    if PCJobDescription.FindSet() then
                        PCJobDescription.DeleteAll();
                    Employee.Reset();
                    Employee.SetRange("No.", Rec."Responsible Employee No.");
                    If Employee.FindFirst() then
                        JobPosition := Employee."Current Position ID";


                    JobRes.Reset();
                    JobRes.SetRange("Position ID", JobPosition);
                    if JobRes.FindFirst then begin
                        repeat
                            PCJobDescription.Init;
                            PCJobDescription."Workplan No." := Rec.No;
                            PCJobDescription."Line Number" := Format(JobRes."Line No");
                            PCJobDescription.Description := JobRes.Description;
                            PCJobDescription."Primary Department" := Rec."Responsibility Center";
                            PCJobDescription.Validate("Primary Department");
                            PCJobDescription."Start Date" := Rec."Start Date";
                            PCJobDescription."Due Date" := Rec."End Date";
                            PCJobDescription.Insert;
                        until JobRes.Next = 0;
                    end;
                    Message('Job Description Populated Successfully');

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::Open);

                    Rec.ValidateMinimumObjectives();
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);


                end;
            }

            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin

                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);


                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalEntries.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }


        }


    }


    trigger OnNewRecord(BelowxRec: Boolean)
    var
        myInt: Integer;
    begin
        Rec."Document Type" := Rec."Document Type"::"Individual Scorecard";

    end;
}

#pragma implicitwith restore

