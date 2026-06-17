namespace KICD.KICD;
using Microsoft.Foundation.Company;

report 50089 "Staff Performance Appraisal"
{
    ApplicationArea = All;
    Caption = 'Staff Performance Appraisal';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Performance Appraisal.rdlc';
    dataset
    {
        dataitem(PerfomanceEvaluation; "Perfomance Evaluation")
        {
            column(AnnualReportingCode; "Annual Reporting Code")
            {
            }
            column(AppealedPerformanceEvalid; "Appealed Performance Eval id")
            {
            }
            column(AppraisalTemplateID; "Appraisal Template ID")
            {
            }
            column(AppraiseesComments; "Appraisee's Comments")
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(Blocked; "Blocked?")
            {
            }
            column(Closed; Closed)
            {
            }
            column(ClosedBy; "Closed By")
            {
            }
            column(ClosedOn; "Closed On")
            {
            }
            column(Comments; Comments)
            {
            }
            column(CompetencyTemplateID; "Competency Template ID")
            {
            }
            column(CompetencyWeight; "Competency Weight %")
            {
            }
            column(CoreValuesTemplateID; "Core Values Template ID")
            {
            }
            column(CurrentDesignation; "Current Designation")
            {
            }
            column(CurrentGrade; "Current Grade")
            {
            }
            column(Department; Department)
            {
            }
            column(Description; Description)
            {
            }
            column(Directorate; Directorate)
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentStatus; "Document Status")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(EmployeeConfirm; "Employee Confirm")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EmployementTerms; "Employement Terms")
            {
            }
            column(EvaluationEndDate; "Evaluation End Date")
            {
            }
            column(EvaluationStartDate; "Evaluation Start Date")
            {
            }
            column(EvaluationType; "Evaluation Type")
            {
            }
            column(GeneralAssessmentTemplateID; "General Assessment Template ID")
            {
            }
            column(JobGroup; "Job Group")
            {
            }
            column(LastEvaluationDate; "Last Evaluation Date")
            {
            }
            column(ManagerialTemplateID; "Managerial Template ID")
            {
            }
            column(No; No)
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(ObjectiveOutcomeWeight; "Objective & Outcome Weight %")
            {
            }
            column(PerformanceMgtPlanID; "Performance Mgt Plan ID")
            {
            }
            column(PerformanceRatingScale; "Performance Rating Scale")
            {
            }
            column(PerformanceTaskID; "Performance Task ID")
            {
            }
            column(PersonalScorecardID; "Personal Scorecard ID")
            {
            }
            column(ProficiencyRatingScale; "Proficiency Rating Scale")
            {
            }
            column(ReviewPeriod; "Review Period")
            {
            }
            column(SalaryScale; "Salary Scale")
            {
            }
            column(SecondSupervisorComments; "Second Supervisor Comments")
            {
            }
            column(SecondSupervisorName; "Second Supervisor Name")
            {
            }
            column(SecondSupervisorStaffNo; "Second Supervisor Staff No.")
            {
            }
            column(StrategyPlanID; "Strategy Plan ID")
            {
            }
            column(SupervisorConfirm; "Supervisor Confirm")
            {
            }
            column(SupervisorName; "Supervisor Name")
            {
            }
            column(SupervisorStaffNo; "Supervisor Staff No.")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            
            column(TotalFinalWeightedScore; "Total Final Weighted Score")
            {
            }
            column(TotalProficiencyScore; "Total Proficiency Score")
            {
            }
            column(TotalRawScore; "Total Raw Score")
            {
            }
            column(TotalWeight; "Total Weight %")
            {
            }
            column(WorkStation; "Work Station")
            {
            }
            column(Name_CompanyInformation; "CompInfo".Name)
                {
                }
                column(Name2_CompanyInformation; "CompInfo"."Name 2")
                {
                }
                column(Address_CompanyInformation; "CompInfo".Address)
                {
                }
                column(Address2_CompanyInformation; "CompInfo"."Address 2")
                {
                }
                column(City_CompanyInformation; "CompInfo".City)
                {
                }
                column(Picture_CompanyInformation; "CompInfo".Picture)
                {
                }
                column(PostCode_CompanyInformation; "CompInfo"."Post Code")
                {
                }
                column(PhoneNo_CompanyInformation; "CompInfo"."Phone No.")
                {
                }
                column(Email_CompanyInformation; "CompInfo"."E-Mail")
                {
                }
                column(Website_CompanyInformation; "CompInfo"."Home Page")
                {
                }
                column(About_CompanyInformation;"CompInfo"."About KICD")
                {   
                }
                column(Vision_CompanyInformation;"CompInfo".Vision)
                {   
                }
                column(Mission_CompanyInformation;"CompInfo".Mission)
                {   
                }
                column(Motto_CompanyInformation;"CompInfo".Motto)
                {   
                }
                column(AppraisalStartDate;AppraisalStartDate)
                {

                }
                column(AppraialEndDate;AppraialEndDate)
                {

                }
                dataitem("Objective Evaluation Result"; "Objective Evaluation Result")
                {
                DataItemLink = "Performance Evaluation ID" = field(No);
                    column(AchievedResult_ObjectiveEvaluationResult; "Achieved Result")
                    {
                    }
                    column(AppraisalPeriod_ObjectiveEvaluationResult; "Appraisal Period")
                    {
                    }
                    column(AppraiserReviewQty_ObjectiveEvaluationResult; "AppraiserReview Qty")
                    {
                    }
                    column(AverageQuantity_ObjectiveEvaluationResult; "Average Quantity")
                    {
                    }
                    column(Comments_ObjectiveEvaluationResult; Comments)
                    {
                    }
                    column(DepartmentalObjective_ObjectiveEvaluationResult; "Departmental Objective")
                    {
                    }
                    column(DesiredPerfomanceDirection_ObjectiveEvaluationResult; "Desired Perfomance Direction")
                    {
                    }
                    column(FinalWeightedLineScore_ObjectiveEvaluationResult; "Final Weighted Line Score")
                    {
                    }
                    column(FinalActualQty_ObjectiveEvaluationResult; "Final/Actual Qty")
                    {
                    }
                    column(IntiativeNo_ObjectiveEvaluationResult; "Intiative No")
                    {
                    }
                    column(KeyPerformanceIndicator_ObjectiveEvaluationResult; "Key Performance Indicator")
                    {
                    }
                    column(ObjectiveInitiative_ObjectiveEvaluationResult; "Objective/Initiative")
                    {
                    }
                    column(Outcome_ObjectiveEvaluationResult; Outcome)
                    {
                    }
                    column(OutcomePerfomanceIndicator_ObjectiveEvaluationResult; "Outcome Perfomance Indicator")
                    {
                    }
                    column(PerformanceAppraisal_ObjectiveEvaluationResult; "Performance Appraisal")
                    {
                    }
                    column(PerformanceEvaluationID_ObjectiveEvaluationResult; "Performance Evaluation ID")
                    {
                    }
                    column(PerformanceRatingScale_ObjectiveEvaluationResult; "Performance Rating Scale")
                    {
                    }
                    column(PrimaryDepartment_ObjectiveEvaluationResult; "Primary Department")
                    {
                    }
                    column(PrimaryDirectorate_ObjectiveEvaluationResult; "Primary Directorate")
                    {
                    }
                    column(RatingScale_ObjectiveEvaluationResult; "Rating Scale")
                    {
                    }
                    column(RawPerformanceGrade_ObjectiveEvaluationResult; "Raw Performance Grade")
                    {
                    }
                    column(RawPerformanceScore_ObjectiveEvaluationResult; "Raw Performance Score")
                    {
                    }
                    column(Reasons_ObjectiveEvaluationResult; Reasons)
                    {
                    }
                    column(ScaleType_ObjectiveEvaluationResult; "Scale Type")
                    {
                    }
                    column(ScorecardID_ObjectiveEvaluationResult; "Scorecard ID")
                    {
                    }
                    column(ScorecardLineNo_ObjectiveEvaluationResult; "Scorecard Line No")
                    {
                    }
                    column(SelfReviewQty_ObjectiveEvaluationResult; "Self-Review Qty")
                    {
                    }
                    column(TargetQty_ObjectiveEvaluationResult; "Target Qty")
                    {
                    }
                    column(UnitofMeasure_ObjectiveEvaluationResult; "Unit of Measure")
                    {
                    }
                    column(Weight_ObjectiveEvaluationResult; "Weight %")
                    {
                    }
                }
                dataitem(ManagerialAttributes; "Managerial Attributes PA")
                {
                DataItemLink = "Performance Evaluation ID" = field(No);
                    
                    column(Description_ManagerialAttributes; Description)
                    {
                    }
                    column(ManagerialTemplateID_ManagerialAttributes; "Managerial Template ID")
                    {
                    }
                    column(PerformanceEvaluationID_ManagerialAttributes; "Performance Evaluation ID")
                    {
                    }
                    column(Verygood_ManagerialAttributes; "Very good")
                    {
                    }
                    column(Good_ManagerialAttributes;Good){
                        
                    }
                    column(Fair_ManagerialAttributes; Fair)
                    {
                    }
                    column(Poor_ManagerialAttributes; Poor)
                    {
                    }
                    column(Satifactory_ManagerialAttributes; Satifactory)
                    {
                    }
                    
                }
                dataitem(CoreValuesAttributes; "Core Values & Attributes PA")
                {
                    DataItemLink = "Performance Evaluation ID" = field(No);
                    column(Comments_CoreValuesAttributes; Comments)
                    {
                    }
                    column(CorevaluesTemplateID_CoreValuesAttributes; "Core values Template ID")
                    {
                    }
                    column(Description_CoreValuesAttributes; Description)
                    {
                    }
                    column(ExplanatoryNote_CoreValuesAttributes; "Explanatory Note")
                    {
                    }
                    column(PerformanceEvaluationID_CoreValuesAttributes; "Performance Evaluation ID")
                    {
                    }
                    column(ScoreAttained_CoreValuesAttributes; "Score Attained")
                    {
                    }
                }
                dataitem(EvaluationTrainingneeds; "Evaluation Training needs")
                {
                     DataItemLink = "Perfomance Evaluation No" = field(No);
                    
                    column(AppraiseesComments_EvaluationTrainingneeds; "Appraisee's Comments")
                    {
                    }
                    column(Course_EvaluationTrainingneeds; Course)
                    {
                    }
                    column(Description_EvaluationTrainingneeds; Description)
                    {
                    }
                    column(EvaluationType_EvaluationTrainingneeds; "Evaluation Type")
                    {
                    }
                    column(PerfomanceEvaluationNo_EvaluationTrainingneeds; "Perfomance Evaluation No")
                    {
                    }
                    column(SupervisorsComments_EvaluationTrainingneeds; "Supervisor's Comments")
                    {
                    }
                    column(TrainingDuration_EvaluationTrainingneeds; "Training Duration")
                    {
                    }
                    column(TrainingNeedCategory_EvaluationTrainingneeds; "Training Need Category")
                    {
                    }
                    column(TrainingNeedNumber_EvaluationTrainingneeds; "Training Need Number")
                    {
                    }
                }
                dataitem(NewAndChangedApprTargets; NewAndChangedApprTargets)
                {
                    DataItemLink = "Document No." = field(No);
                    
                    column(DocumentNo_NewAndChangedApprTargets; "Document No.")
                    {
                    }
                    column(PerformanceAppraisal_NewAndChangedApprTargets; "Performance Appraisal")
                    {
                    }
                    column(Reasons_NewAndChangedApprTargets; Reasons)
                    {
                    }
                    column(ResultsAchieved_NewAndChangedApprTargets; "Results Achieved")
                    {
                    }
                    column(Target_NewAndChangedApprTargets; Target)
                    {
                    }
                }
                dataitem(PerfomanceRatingScale; "Perfomance Rating Scale")
                {
                    DataItemLink = "Code" = field("Performance Rating Scale");
                   
                    column(Code_PerfomanceRatingScale; "Code")
                    {
                    }
                    column(CreatedBy_PerfomanceRatingScale; "Created By")
                    {
                    }
                    column(CreatedOn_PerfomanceRatingScale; "Created On")
                    {
                    }
                    column(Description_PerfomanceRatingScale; Description)
                    {
                    }
                    column(EffectiveDate_PerfomanceRatingScale; "Effective Date")
                    {
                    }
                    column(LeastPoorRawScore_PerfomanceRatingScale; "Least Poor Raw Score")
                    {
                    }
                    column(MaxExcellentRawScore_PerfomanceRatingScale; "Max Excellent Raw Score")
                    {
                    }
                    column(ScaleType_PerfomanceRatingScale; "Scale Type")
                    {
                    }
                }
                 dataitem("Perfomance Scale Line"; "Perfomance Scale Line")
                {
                DataItemLink = "Performance Scale ID" = field("Performance Rating Scale");
                column(ReportForNavId_79; 79)
                {
                }
                column(PerformanceScaleID_PerfomanceScaleLine; "Perfomance Scale Line"."Performance Scale ID")
                {
                }
                column(PerfomanceGrade_PerfomanceScaleLine; "Perfomance Scale Line"."Perfomance Grade")
                {
                }
                column(DefaultScoreValue_PerfomanceScaleLine; "Perfomance Scale Line"."Default Score Value")
                {
                }
                column(BehavioralIndicator_PerfomanceScaleLine; "Perfomance Scale Line"."Behavioral Indicator")
                {
                }
                column(LowerLimitTarget_PerfomanceScaleLine; "Perfomance Scale Line"."Lower Limit Target (%)")
                {
                }
                column(UpperLimitTarget_PerfomanceScaleLine; "Perfomance Scale Line"."Upper Limit Target (%)")
                {
                }
                column(LowerLimitCriteriaValue_PerfomanceScaleLine; "Perfomance Scale Line"."Lower Limit Criteria Value")
                {
                }
                column(UpperLimitCriteriaValue_PerfomanceScaleLine; "Perfomance Scale Line"."Upper Limit Criteria Value")
                {
                }
                column(CriteriaValueRangeSpan_PerfomanceScaleLine; "Perfomance Scale Line"."Criteria Value Range Span")
                {
                }
                column(Description_PerfomanceScaleLine; "Perfomance Scale Line".Description)
                {
                }
                column(ScaleType_PerfomanceScaleLine; "Perfomance Scale Line"."Scale Type")
                {
                }
                column(TargetRange_PerfomanceScaleLine;TargetRange_PerfomanceScaleLine)
                {

                }
                 trigger OnAfterGetRecord()
          
               begin
            TargetRange_PerfomanceScaleLine := Format("Perfomance Scale Line"."Lower Limit Target (%)") + '-' + Format("Perfomance Scale Line"."Upper Limit Target (%)") + '%';
              end;
                  
              }
                
            
            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
            end;
            trigger OnAfterGetRecord()
        var
            AppraisalPeriods: Record "Appraisal Periods";
        begin
            // TargetRange_PerfomanceScaleLine := Format("Perfomance Scale Line"."Lower Limit Target (%)") + '-' + Format("Perfomance Scale Line"."Upper Limit Target (%)") + '%';
        end;
        }
        
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var 
    CompInfo:Record "Company Information";
    AppraisalStartDate: Date;
    AppraialEndDate: Date;
    TargetRange_PerfomanceScaleLine: Text[255];
}
