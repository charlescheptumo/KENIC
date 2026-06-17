#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69191 "HR Salary Increament Card"
{
    PageType = Card;
    SourceTable = "HR Salary Increament Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = editability;
                field("Batch No"; Rec."Batch No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batch No field.';
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Descriptions field.';
                }
                field("Effective Start  Date"; Rec."Effective Start  Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Start  Date field.';
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective End Date field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Run By"; Rec."Run By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Run By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control10; "Hr Salary Increament Lines")
            {
                Editable = editability;
                Enabled = editability;
                SubPageLink = "Batch No" = field("Batch No");
                UpdatePropagation = SubPart;
            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
            }
            systempart(Control9; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Populate Salary Scale Details")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Populate Salary Scale Details action.';

                trigger OnAction()
                begin
                    Employee.Reset;
                    Employee.SetFilter("Salary Scale", '<>%1', '');
                    Employee.SetFilter(Present, '<>%1', '');
                    if Employee.Find('-') then begin
                        repeat
                            ScaleBenefits.Reset;
                            ScaleBenefits.SetRange("Salary Scale", Employee."Salary Scale");
                            ScaleBenefits.SetRange("Salary Pointer", Employee.Present);
                            if ScaleBenefits.Find('-') then begin
                                Lines.Init;
                                Lines."Batch No" := Rec."Batch No";
                                Lines."Employee No" := Employee."No.";
                                Lines.Validate("Employee No");
                                Lines."Current Salary Scale" := Employee."Salary Scale";
                                Lines."Current Present" := Employee.Present;
                                Lines."New Salary Scale" := Employee."Salary Scale";
                                SalaryPointers.Reset;
                                SalaryPointers.SetRange(SalaryPointers."Salary Scale", ScaleBenefits."Salary Scale");
                                SalaryPointers.SetRange(SalaryPointers."Salary Pointer", ScaleBenefits."Salary Pointer");
                                if SalaryPointers.FindFirst then begin
                                    NextInt := SalaryPointers."Pointer Int" + 1;
                                    SalaryPointers1.Reset;
                                    SalaryPointers1.SetRange(SalaryPointers1."Pointer Int", NextInt);
                                    SalaryPointers1.SetRange(SalaryPointers1."Salary Scale", SalaryPointers."Salary Scale");
                                    if SalaryPointers1.FindSet then begin
                                        Lines."New Present" := SalaryPointers1."Salary Pointer";
                                    end else
                                        Lines."New Present" := SalaryPointers."Salary Pointer";
                                end;
                                if not Lines.Insert then
                                    Lines.Modify;
                            end;
                        until Employee.Next = 0;
                    end;
                end;
            }
            action("Effect Salary Increament")
            {
                ApplicationArea = Basic;
                Enabled = editability;
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Effect Salary Increament action.';

                trigger OnAction()
                begin
                    if Rec."Effective Start  Date" = 0D then
                        Error('Please select effective date');
                    Rec.TestField(Status, Rec.Status::Open);
                    Lines.Reset;
                    Lines.SetRange("Batch No", Rec."Batch No");
                    Lines.SetRange("Effective Start Date", Rec."Effective Start  Date");
                    if Lines.Find('-') then begin
                        repeat
                            Lines.Validate("New Present");
                            Lines.Validate("New Salary Scale");
                            Employee.Reset;
                            Employee.SetRange("No.", Lines."Employee No");
                            if Employee.FindSet then begin
                                Employee."Salary Scale" := Lines."New Salary Scale";
                                Employee.Present := Lines."New Present";
                                Employee.Validate(Employee.Present);
                                Employee.Previous := Lines."Current Present";
                                Employee.Modify;
                            end;
                        until Lines.Next = 0;
                        Message('Salary Increament Completed..');
                        if Dialog.Confirm('You can now close this batch,\Do you want to close the batch?', true) then
                            Rec.Status := Rec.Status::"Pending Approval";
                    end;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                CustomApprovals: Codeunit "Custom Approvals Codeunit";
                VarVariant: Variant;
                begin
                    //MESSAGE('%1',ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec));
                    //   if ApprovalsMgmt.CheckIncSalaryApprovalsWorkflowEnabled(Rec) then
                    //  ApprovalsMgmt.OnSendIncSalaryForApproval(Rec);
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OnCancelIncSalaryApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //  ApprovalEntries.Setfilters(DATABASE::"Payroll HeaderT",19,"No.");
                    //  

                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        editability := true;
        if Rec.Status = Rec.Status::"Pending Approval" then
            editability := false;
    end;

    var
        Employee: Record Employee;
        Header: Record "HR Salary Increament Header";
        Lines: Record "HR Salary Increament Lines";
        editability: Boolean;
        ScaleBenefits: Record "Scale Benefits";
        SalaryPointers: Record "Salary Pointers";
        NextInt: Integer;
        SalaryPointers1: Record "Salary Pointers";
       // [InDataSet]
        OpenApprovalEntriesExist: Boolean;
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

