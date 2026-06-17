#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50121 "Workflow Reports"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Workflow Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    

    dataset
    {
        dataitem(Workflow;Workflow)
        {
            DataItemTableView = where(Enabled=const(true));
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_Workflow;Workflow.Code)
            {
            }
            column(Description_Workflow;Workflow.Description)
            {
            }
            column(Enabled_Workflow;Workflow.Enabled)
            {
            }
            column(Template_Workflow;Workflow.Template)
            {
            }
            column(Category_Workflow;Workflow.Category)
            {
            }
            dataitem("Workflow Step";"Workflow Step")
            {
                DataItemLink = "Workflow Code"=field(Code);
                DataItemTableView = where("Function Name"=filter('CREATEAPPROVALREQUESTS'));
                column(ReportForNavId_7; 7)
                {
                }
                column(ID_WorkflowStep;"Workflow Step".ID)
                {
                }
                column(WorkflowCode_WorkflowStep;"Workflow Step"."Workflow Code")
                {
                }
                column(Description_WorkflowStep;"Workflow Step".Description)
                {
                }
                column(EntryPoint_WorkflowStep;"Workflow Step"."Entry Point")
                {
                }
                column(PreviousWorkflowStepID_WorkflowStep;"Workflow Step"."Previous Workflow Step ID")
                {
                }
                column(NextWorkflowStepID_WorkflowStep;"Workflow Step"."Next Workflow Step ID")
                {
                }
                column(Type_WorkflowStep;"Workflow Step".Type)
                {
                }
                column(FunctionName_WorkflowStep;"Workflow Step"."Function Name")
                {
                }
                column(Argument_WorkflowStep;"Workflow Step".Argument)
                {
                }
                column(SequenceNo_WorkflowStep;"Workflow Step"."Sequence No.")
                {
                }
                dataitem("Workflow Step Argument";"Workflow Step Argument")
                {
                    DataItemLink = ID=field(Argument);
                    column(ReportForNavId_18; 18)
                    {
                    }
                    column(ID_WorkflowStepArgument;"Workflow Step Argument".ID)
                    {
                    }
                    column(Type_WorkflowStepArgument;"Workflow Step Argument".Type)
                    {
                    }
                    column(GeneralJournalTemplateName_WorkflowStepArgument;"Workflow Step Argument"."General Journal Template Name")
                    {
                    }
                    column(GeneralJournalBatchName_WorkflowStepArgument;"Workflow Step Argument"."General Journal Batch Name")
                    {
                    }
                    column(NotificationUserID_WorkflowStepArgument;"Workflow Step Argument"."Notification User ID")
                    {
                    }
                    column(NotificationUserLicenseType_WorkflowStepArgument;"Workflow Step Argument"."Notification User License Type")
                    {
                    }
                    column(ResponseFunctionName_WorkflowStepArgument;"Workflow Step Argument"."Response Function Name")
                    {
                    }
                    column(LinkTargetPage_WorkflowStepArgument;"Workflow Step Argument"."Link Target Page")
                    {
                    }
                    column(CustomLink_WorkflowStepArgument;"Workflow Step Argument"."Custom Link")
                    {
                    }
                    column(EventConditions_WorkflowStepArgument;"Workflow Step Argument"."Event Conditions")
                    {
                    }
                    column(ApproverType_WorkflowStepArgument;"Workflow Step Argument"."Approver Type")
                    {
                    }
                    column(ApproverLimitType_WorkflowStepArgument;"Workflow Step Argument"."Approver Limit Type")
                    {
                    }
                    column(WorkflowUserGroupCode_WorkflowStepArgument;"Workflow Step Argument"."Workflow User Group Code")
                    {
                    }
                    column(DueDateFormula_WorkflowStepArgument;"Workflow Step Argument"."Due Date Formula")
                    {
                    }
                    column(Message_WorkflowStepArgument;"Workflow Step Argument".Message)
                    {
                    }
                    column(DelegateAfter_WorkflowStepArgument;"Workflow Step Argument"."Delegate After")
                    {
                    }
                    column(ShowConfirmationMessage_WorkflowStepArgument;"Workflow Step Argument"."Show Confirmation Message")
                    {
                    }
                    column(TableNo_WorkflowStepArgument;"Workflow Step Argument"."Table No.")
                    {
                    }
                    column(FieldNo_WorkflowStepArgument;"Workflow Step Argument"."Field No.")
                    {
                    }
                    column(FieldCaption_WorkflowStepArgument;"Workflow Step Argument"."Field Caption")
                    {
                    }
                    column(ApproverUserID_WorkflowStepArgument;"Workflow Step Argument"."Approver User ID")
                    {
                    }
                    column(ResponseType_WorkflowStepArgument;"Workflow Step Argument"."Response Type")
                    {
                    }
                    column(ResponseUserID_WorkflowStepArgument;"Workflow Step Argument"."Response User ID")
                    {
                    }
                    column(ResponseOptionGroup_WorkflowStepArgument;"Workflow Step Argument"."Response Option Group")
                    {
                    }
                    dataitem("Workflow User Group Member";"Workflow User Group Member")
                    {
                        DataItemLink = "Workflow User Group Code"=field("Workflow User Group Code");
                        DataItemTableView = sorting("Workflow User Group Code","Sequence No.","User Name") order(ascending) where("Sequence No."=filter(>0));
                        column(ReportForNavId_43; 43)
                        {
                        }
                        column(WorkflowUserGroupCode_WorkflowUserGroupMember;"Workflow User Group Member"."Workflow User Group Code")
                        {
                        }
                        column(UserName_WorkflowUserGroupMember;"Workflow User Group Member"."User Name")
                        {
                        }
                        column(SequenceNo_WorkflowUserGroupMember;"Workflow User Group Member"."Sequence No.")
                        {
                        }
                    }
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}
