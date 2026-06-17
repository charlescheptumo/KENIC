#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

PageExtension 50031 "pageextension50031" extends "User Setup"
{
    Editable = true;
    layout
    {
        addafter("User ID")
        {
            field(CIDO; Rec.CIDO)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the CIDO field.';
            }
        }
        addafter("Allow Posting To")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee No. field.';
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Name field.';
            }
            field(Receiptionist; Rec.Receiptionist)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Receiptionist field.';
            }
            field("Accounts User"; Rec."Accounts User")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Accounts User field.';
            }
            field("Accounts Administrator"; Rec."Accounts Administrator")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Accounts Administrator field.';
            }
            field("SCM Administrator"; Rec."SCM Administrator")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the SCM Administrator field.';
            }
            field(Leave; Rec.Leave)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave field.';
            }
            field("Leave Plan Admin."; Rec."Leave Plan Admin.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leave Plan Admin. field.', Comment = '%';
            }
            field("Approver ID"; Rec."Approver ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approver ID field.';

            }
            field("Resource No"; Rec."Resource No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Resource No field.';
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Imprest Account field.';
            }
            field("Payroll View"; Rec."Payroll View")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Payroll View field.';
            }
            field("Post Memo"; Rec."Post Memo")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Post Memo field.';
            }
            field("Post Requisition"; Rec."Post Requisition")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Post Requisition field.';
            }
            field("Procurement officer"; Rec."Procurement officer")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Procurement officer field.';
            }
            field("Procurement Manager"; Rec."Procurement Manager")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Procurement Manager field.';
            }
            field("Corporate Affairs"; Rec."Corporate Affairs")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Corporate Affairs field.', Comment = '%';
            }
            field("Secretary to Committee"; Rec."Secretary to Committee")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Secretary to Committee field.', Comment = '%';
            }
            field("post surrender"; Rec."post surrender")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the post surrender field.';
            }
            field("Allowed To Auto Reverse"; Rec."Allowed To Auto Reverse")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Allowed To Auto Reverse field.';
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Approval Administrator field.';
            }
            field("Accounts Approver"; Rec."Accounts Approver")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Accounts Approver field.';
            }
            field("Imprest Amount Approval Limit"; Rec."Imprest Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Imprest Amount Approval Limit field.';
            }
            field("ImprestSurr Amt Approval Limit"; Rec."ImprestSurr Amt Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the ImprestSurr Amt Approval Limit field.';
            }
            field("Interbank Amt Approval Limit"; Rec."Interbank Amt Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Interbank Amt Approval Limit field.';
            }
            field("PV Amount Approval Limit"; Rec."PV Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PV Amount Approval Limit field.';
            }
            field("Petty C Amount Approval Limit"; Rec."Petty C Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Petty C Amount Approval Limit field.';
            }
            field("Post Receipts"; Rec."Post Receipts")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Post Receipts field.';
            }
            field("Process Claims"; Rec."Process Claims")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Process Claims field.';
            }
            field("Fuel Reminder"; Rec."Fuel Reminder")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Fuel Reminder field.';
            }
            field(Projects; Rec.Projects)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Projects field.';
            }
            field("Purchase Amount Approval Limit"; Rec."Purchase Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum amount in LCY that this user is allowed to approve for this record.';
            }
            field("Relieved Approver"; Rec."Relieved Approver")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Relieved Approver field.';
            }
            field("Reopen Document"; Rec."Reopen Document")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reopen Document field.';
            }
            field("Request Amount Approval Limit"; Rec."Request Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum amount in LCY that this user is allowed to approve for this record.';
            }
            field("Selected Substitute"; Rec."Selected Substitute")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Selected Substitute field.';
            }
            field("Sales Amount Approval Limit"; Rec."Sales Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum amount in LCY that this user is allowed to approve for this record.';
            }
            field("Store Requisitioner"; Rec."Store Requisitioner")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store Requisitioner field.';
            }
            field("Store Req. Amt Approval Limit"; Rec."Store Req. Amt Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store Req. Amt Approval Limit field.';
            }
            field("Unlimited Imprest Amt Approval"; Rec."Unlimited Imprest Amt Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited Imprest Amt Approval field.';
            }
            field("To Date"; Rec."To Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the To Date field.';
            }
            field("Unlimited ImprestSurr Amt Appr"; Rec."Unlimited ImprestSurr Amt Appr")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited ImprestSurr Amt Appr field.';
            }
            field("Unlimited Interbank Amt Appr"; Rec."Unlimited Interbank Amt Appr")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited Interbank Amt Appr field.';
            }
            field("Unlimited PV Amount Approval"; Rec."Unlimited PV Amount Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited PV Amount Approval field.';
            }
            field("Unlimited Sales Approval"; Rec."Unlimited Sales Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies that the user on this line is allowed to approve sales records with no maximum amount. If you select this check box, then you cannot fill the Sales Amount Approval Limit field.';
            }
            field("Unlimited Request Approval"; Rec."Unlimited Request Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies that the user on this line can approve all purchase quotes regardless of their amount. If you select this check box, then you cannot fill the Request Amount Approval Limit field.';
            }
            field("Unlimited Purchase Approval"; Rec."Unlimited Purchase Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies that the user on this line is allowed to approve purchase records with no maximum amount. If you select this check box, then you cannot fill the Purchase Amount Approval Limit field.';
            }
            field("Unlimited PettyAmount Approval"; Rec."Unlimited PettyAmount Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited PettyAmount Approval field.';
            }
            field("Unlimited Store RqAmt Approval"; Rec."Unlimited Store RqAmt Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited Store RqAmt Approval field.';
            }
        }
        addafter(Email)
        {
            field("Portal User"; Rec."Portal User")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Portal User field.';
            }
            field("Create New Job"; Rec."Create New Job")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Create New Job field.';
            }
            field("Update Job Status"; Rec."Update Job Status")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Update Job Status field.';
            }
            field("Archive Document"; Rec."Archive Document")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Archive Document field.';
            }
            // field("Region Code"; Rec."Region Code")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Authorize IFS Creator"; Rec."Authorize IFS Creator")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Authorize IFS Creator field.';
            }
            field("Cancel Invitation For Supply"; Rec."Cancel Invitation For Supply")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Cancel Invitation For Supply field.';
            }
            field("View AIE"; Rec."View AIE")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the View AIE field.';
            }
            field("View Imprest"; Rec."View Imprest")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the View Imprest field.';
            }
            // field("Road Planner No"; Rec."Road Planner No")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Create Maintenance Budget Book"; Rec."Create Maintenance Budget Book")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Create Development Budget Book"; Rec."Create Development Budget Book")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Create Regional WorkPlan"; Rec."Create Regional WorkPlan")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Create Regional WorkPlan field.';
            }
            // field("Create Constituency WorkPlan"; Rec."Create Constituency WorkPlan")
            // {
            //     ApplicationArea = Basic;
            // }
            field("AIE Creation & Posting"; Rec."AIE Creation & Posting")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the AIE Creation & Posting field.';
            }
            field("Principal Accountant"; Rec."Principal Accountant")
            {
                ApplicationArea = Basic;
                Editable = true;
                ToolTip = 'Specifies the value of the Principal Accountant field.';
            }
            field("Amend Bank Account Details"; Rec."Amend Bank Account Details")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Amend Bank Account Details field.';
            }
            field("Unapply Entries"; Rec."Unapply Entries")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Unapply Entries field.';
            }
            field("Discount Bill"; Rec."Discount Bill")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Discount Bill field.';
            }
            field("Ammend Vacancy Adverts"; Rec."Ammend Vacancy Adverts")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Ammend Vacancy Adverts field.';
            }
            field("View Appraisals"; Rec."View Appraisals")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the View Appraisals field.';
            }
            field("Access Retention Account"; Rec."Access Retention Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Access Retention Account field.';
            }
            field("Retention Donor"; Rec."Retention Donor")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Retention Donor field.';
            }
            // field("View Works Inspections"; Rec."View Works Inspections")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("View Lab Works Inspections"; Rec."View Lab Works Inspections")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("View Survey Works Inspections"; Rec."View Survey Works Inspections")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Allow Create Road Links"; Rec."Allow Create Road Links")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Allow Open My Settings"; Rec."Allow Open My Settings")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Allow Change Role"; Rec."Allow Change Role")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Allow Change Company"; Rec."Allow Change Company")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Allow Change Work Day"; Rec."Allow Change Work Day")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Allow Create Imprest"; Rec."Allow Create Imprest")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Allow Create Imprest field.';
            }
            field("Allow Create Standing Imprest";Rec."Allow Create Standing Imprest")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Allow Create Standing Imprest field.';
            }
            field("Authorize Tickets"; Rec."Authorize Tickets")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Authorize Tickets field.', Comment = '%';
            }
            field("System Admin"; Rec."System Admin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the System Admin field.', Comment = '%';
            }
            field("HOD Human Resource"; Rec."HOD Human Resource")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD Human Resource field.', Comment = '%';
            }
            field("HOD Supply Chain"; Rec."HOD Supply Chain")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD Supply Chain field.', Comment = '%';
            }
            field("HOD Legal"; Rec."HOD Legal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD Legal field.', Comment = '%';
            }
        }
    }




}



