
Page 80090 "Standard Perform Appraisal"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type" = const("Performance Appraisal"),
                            "Document Status" = const(Draft));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                group("Section 1")
                {
                    field("Review Period"; Rec."Review Period")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Review Period field.';
                    }
                    field("Personal No."; Rec."Employee No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee No. field.';
                    }
                    field(Name; Rec."Employee Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee Name field.';
                    }
                    field(Directorate; Rec.Directorate)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Directorate field.';
                    }
                    field(Department; Rec.Department)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Department field.';
                    }
                    field("Work Station"; Rec."Work Station")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Work Station field.';
                    }
                    field("Current Designation"; Rec."Current Designation")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Current Designation field.';
                    }
                    field("Terms of Service"; Rec."Employement Terms")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employement Terms field.';
                    }
                    field("Job Group"; Rec."Job Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Job Group field.';
                    }
                    field("Salary Scale"; Rec."Salary Scale")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Salary Scale field.';
                    }
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                    Visible = false;
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Mgt Plan ID field.';
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Task ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Evaluation Start Date"; Rec."Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Start Date field.';
                }
                field("Evaluation End Date"; Rec."Evaluation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation End Date field.';
                }
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal Template ID field.';
                }

                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal Scorecard ID field.';
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Staff No. field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("First Supervisor Cooment's"; Rec."First Supervisor Comment")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Supervisor Comment field.';
                }
                field("Second Supervisor Staff No."; Rec."Second Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Staff No. field.';

                }
                field("Second Supervisor Name"; Rec."Second Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Name field.';

                }
                field("Second Supervisor Cooment's"; Rec."Second Supervisor Comment")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Second Supervisor Comment field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Template ID field.';
                    // Editable = false;
                }
                field("Managerial Template ID"; Rec."Managerial Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Core Values Template ID"; Rec."Core Values Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the General Assessment Template ID field.';
                }
                field("Objective & Outcome Weight %"; Rec."Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Objective & Outcome Weight % field.';
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Competency Weight % field.';
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Weight % field.';
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Rating Scale field.';
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Proficiency Rating Scale field.';
                }

                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                    //Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked? field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            // part(Objectives; "Departmental Objectives")
            // {
            //     SubPageLink = "Department Code" = field(Department), "Appraisal Period" = field("Review Period");
            //     UpdatePropagation = Both;
            //     Editable =false;
            // }
            // part("Department Objectives"; "Strategy Workplan Lines")
            // {
            //     Caption = 'Department Objectives';
            //     SubPageLink = "Primary Department" = field(Department), "Strategy Plan ID" = field("Strategy Plan ID");
            //     UpdatePropagation = Both;
            //     Editable =false;
            // }
            part("Department Objectives"; "AppraisalDept.ObjectivesSF")
            {
                Caption = 'Department Defined Targets';
                SubPageLink = "Primary Department" = field(Department), "Appraisal Period" = field("Review Period");
                UpdatePropagation = Both;
                Editable = false;
                Visible = false;
            }
            part("Objectives and Outcomes"; "Objectives and Outcomes")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                Caption = 'Targets and Outcomes';
                // Editable =false;
            }
            part(Control39; "Proficiency Evalulation")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
            }
            part("Evaluation Improvement Plan"; "Evaluation Improvement Plan")
            {
                Caption = 'Performance Improvement Plan';
                SubPageLink = "Perfomance Evaluation No" = field(No);
            }
            part(Control47; "Evaluation Training Needs")
            {
                SubPageLink = "Perfomance Evaluation No" = field(No);
            }
            part("MidYear Appraisal"; NewAndChangedApprTargets)
            {
                Caption = 'Mid-Year Performance Appraisal';
                SubPageLink = "Document No." = field(No);
            }
            part("Managerial Attributes PA"; "Managerial Attributes PA")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                Caption = 'Managerial Attributes';
                // Editable =false;
            }
            part("Core attributes&Attributes"; "Core attributes&Attributes")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                Caption = 'Core Values,Attributes and Behaviorsl Achors';
                // Editable =false;
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(80079), "No." =
                FIELD(No);
            }
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }

        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(creation)
        {
            //     action("Suggest Officers Performance Targets")
            //     {
            //         ApplicationArea = Basic;
            //         Image = Suggest;
            //         Promoted = true;
            //         PromotedCategory = Process;
            //         PromotedIsBig = true;
            //         ToolTip = 'Executes the Suggest Officers Performance Targets action.';

            //         trigger OnAction()
            //         begin
            //             if not Confirm('Are you sure you want to Suggest Officers Performance Targets?', true) then
            //                 Error('Officers Performance Targets not Suggested');

            //             ObjectiveOutcome.Reset();
            //             ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
            //             if ObjectiveOutcome.FindSet then
            //                 ObjectiveOutcome.DeleteAll();

            //             SPMGeneralSetup.Get;
            //             SPMGeneralSetup.TestField("Appraisal Based On");

            //             Message('DEBUG 1: Setup Retrieved\Appraisal Based On: %1\Allow CSP: %2\Allow JD: %3',
            // SPMGeneralSetup."Appraisal Based On",
            // SPMGeneralSetup."Allow Loading of  CSP",
            // SPMGeneralSetup."Allow Loading of JD");

            //             if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Direct Input" then begin
            //                 SPMGeneralSetup.Get();
            //                 if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
            //                     PCObjective.Reset;
            //                     PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     if PCObjective.FindFirst then begin
            //                         repeat
            //                             PCObjective.TestField("Due Date");
            //                         until PCObjective.Next = 0;
            //                     end;

            //                     PCObjective.Reset;
            //                     PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     PCObjective.TestField("Due Date");
            //                     PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");

            //                     Message('DEBUG 2: PC Objectives Query\Personal Scorecard ID: %1\Start Date: %2\End Date: %3\Records Found: %4',
            //         Rec."Personal Scorecard ID",
            //         Rec."Evaluation Start Date",
            //         Rec."Evaluation End Date",
            //         PCObjective.Count);
            //                     if PCObjective.FindSet() then begin
            //                         repeat
            //                             ObjectiveOutcome.Init;
            //                             ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
            //                             ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
            //                             ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
            //                             ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
            //                             ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
            //                             ObjectiveOutcome."Departmental Objective" := PCObjective."Departmental Objective";
            //                             ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
            //                             ObjectiveOutcome."Primary Department" := Rec.Department;
            //                             ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
            //                             ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                             ObjectiveOutcome.Outcome := PCObjective."OutCome";
            //                             //ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
            //                             ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
            //                             ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                             ObjectiveOutcome.Validate("Performance Rating Scale");
            //                             ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
            //                             ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
            //                             ObjectiveOutcome.Insert(true);
            //                             //Sub Objective OutCome
            //                             SubPCObjective.Reset;
            //                             SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                             SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
            //                             if SubPCObjective.FindSet then begin
            //                                 repeat
            //                                     SubObjectiveEvaluation.Init;
            //                                     SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
            //                                     SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
            //                                     SubObjectiveEvaluation."Scorecard ID" := PCObjective."Workplan No.";
            //                                     SubObjectiveEvaluation."Intiative No" := PCObjective."Initiative No.";
            //                                     SubObjectiveEvaluation."Objective/Initiative" := PCObjective."Objective/Initiative";
            //                                     SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
            //                                     SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
            //                                     SubObjectiveEvaluation."Primary Directorate" := Rec.Directorate;
            //                                     SubObjectiveEvaluation."Primary Department" := Rec.Department;
            //                                     SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
            //                                     SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                                     SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
            //                                     SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
            //                                     SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                                     SubObjectiveEvaluation.Validate("Performance Rating Scale");
            //                                     SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
            //                                     SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
            //                                     SubObjectiveEvaluation.Insert(true);

            //                                 until SubPCObjective.Next = 0;
            //                             end;
            //                         //End Sub Objective OutCome
            //                         until PCObjective.Next = 0;
            //                     end;

            //                     SecondaryPCObjective.Reset;
            //                     SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     if SecondaryPCObjective.FindFirst then begin
            //                         repeat
            //                         //SecondaryPCObjective.TESTFIELD("Due Date");
            //                         until SecondaryPCObjective.Next = 0;
            //                     end;

            //                     SecondaryPCObjective.Reset;
            //                     SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                     if SecondaryPCObjective.FindFirst then begin
            //                         repeat
            //                             ObjectiveOutcome.Init;
            //                             ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
            //                             ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
            //                             ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
            //                             ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
            //                             ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
            //                             ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
            //                             ObjectiveOutcome."Primary Department" := Rec.Department;
            //                             ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
            //                             ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                             ObjectiveOutcome.Outcome := PCObjective."OutCome";
            //                             //ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
            //                             ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
            //                             ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                             ObjectiveOutcome.Validate("Performance Rating Scale");
            //                             ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
            //                             ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
            //                             ObjectiveOutcome.Insert(true);
            //                             //Insert Sub Objective Outcome
            //                             //Sub Objective OutCome
            //                             SubPCObjective.Reset;
            //                             SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                             SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
            //                             if SubPCObjective.FindSet then begin
            //                                 repeat
            //                                     SubObjectiveEvaluation.Init;
            //                                     SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
            //                                     SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
            //                                     SubObjectiveEvaluation."Scorecard ID" := SecondaryPCObjective."Workplan No.";
            //                                     SubObjectiveEvaluation."Intiative No" := SecondaryPCObjective."Initiative No.";
            //                                     SubObjectiveEvaluation."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
            //                                     SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
            //                                     SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
            //                                     SubObjectiveEvaluation."Primary Directorate" := Rec.Directorate;
            //                                     SubObjectiveEvaluation."Primary Department" := Rec.Department;
            //                                     SubObjectiveEvaluation."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
            //                                     SubObjectiveEvaluation."Key Performance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
            //                                     SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
            //                                     SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
            //                                     SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                                     SubObjectiveEvaluation.Validate("Performance Rating Scale");
            //                                     SubObjectiveEvaluation."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
            //                                     SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
            //                                     SubObjectiveEvaluation.Insert(true);

            //                                 until SubPCObjective.Next = 0;
            //                             end;
            //                         //End Sub Objective OutCome
            //                         //End Insert Sub Objective Outcome

            //                         until SecondaryPCObjective.Next = 0;
            //                     end;
            //                 end;

            //                 if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
            //                     PCJobDescription.Reset;
            //                     PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     //  PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                     if PCJobDescription.FindFirst then begin
            //                         repeat
            //                             ObjectiveOutcome.Init;
            //                             ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
            //                             ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
            //                             ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
            //                             ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
            //                             ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
            //                             ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
            //                             ObjectiveOutcome."Primary Department" := Rec.Department;
            //                             ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
            //                             ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                             ObjectiveOutcome.Outcome := PCObjective."OutCome";
            //                             //ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
            //                             ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
            //                             ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                             ObjectiveOutcome.Validate("Performance Rating Scale");
            //                             ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
            //                             ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
            //                             ObjectiveOutcome.Insert(true);
            //                         until PCJobDescription.Next = 0;
            //                     end;
            //                 end;
            //             end;

            //             if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Plog Input" then begin
            //                 SPMGeneralSetup.Get();
            //                 if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
            //                     PCObjective.Reset;
            //                     PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     if PCObjective.FindFirst then begin
            //                         repeat
            //                             PCObjective.TestField("Due Date");
            //                         until PCObjective.Next = 0;
            //                     end;

            //                     PCObjective.Reset;
            //                     PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     //PCObjective.TESTFIELD("Due Date");
            //                     PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");

            //                     Message('DEBUG 3: Plog Input - PC Objectives\Personal Scorecard ID: %1\Start Date: %2\End Date: %3\Records Found: %4',
            //         Rec."Personal Scorecard ID",
            //         Rec."Evaluation Start Date",
            //         Rec."Evaluation End Date",
            //         PCObjective.Count);
            //                     if PCObjective.FindFirst then begin
            //                         repeat

            //                             AchievedTarget := 0;
            //                             PlogLines.Reset;
            //                             PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
            //                             PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
            //                             PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                             PlogLines.CalcSums("Achieved Target");
            //                             AchievedTarget := PlogLines."Achieved Target";

            //                             /* IF AchievedTarget=0 THEN
            //                                 ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date");*/

            //                             ObjectiveOutcome.Init;
            //                             ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
            //                             ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
            //                             ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
            //                             ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
            //                             ObjectiveOutcome."Objective/Initiative" := PCObjective."Activity Description";
            //                             ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
            //                             ObjectiveOutcome."Primary Department" := Rec.Department;
            //                             ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
            //                             ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                             ObjectiveOutcome.Outcome := PCObjective."OutCome";
            //                             //ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
            //                             ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                             //ObjectiveOutcome.Validate("Performance Rating Scale");
            //                             ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
            //                             ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
            //                             ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
            //                             ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
            //                             ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
            //                             ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
            //                             ObjectiveOutcome.Validate("Final/Actual Qty");
            //                             ObjectiveOutcome.Insert;

            //                             //Sub Objective OutCome
            //                             AchievedSubActivityTarget := 0;
            //                             SubPlogLines.Reset;
            //                             SubPlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
            //                             SubPlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
            //                             SubPlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                             SubPlogLines.CalcSums("Achieved Target");
            //                             AchievedTarget := PlogLines."Achieved Target";

            //                             SubPCObjective.Reset;
            //                             SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                             SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
            //                             if SubPCObjective.FindSet then begin
            //                                 repeat
            //                                     SubObjectiveEvaluation.Init;
            //                                     SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
            //                                     SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
            //                                     SubObjectiveEvaluation."Scorecard ID" := SubPCObjective."Workplan No.";
            //                                     SubObjectiveEvaluation."Intiative No" := SubPCObjective."Initiative No.";
            //                                     SubObjectiveEvaluation."Objective/Initiative" := SubPCObjective."Objective/Initiative";
            //                                     SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
            //                                     SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
            //                                     SubObjectiveEvaluation."Primary Directorate" := Rec.Directorate;
            //                                     SubObjectiveEvaluation."Primary Department" := Rec.Department;
            //                                     SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
            //                                     SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                                     SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
            //                                     SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
            //                                     SubObjectiveEvaluation."Self-Review Qty" := AchievedSubActivityTarget;
            //                                     SubObjectiveEvaluation."AppraiserReview Qty" := AchievedSubActivityTarget;
            //                                     SubObjectiveEvaluation."Final/Actual Qty" := AchievedSubActivityTarget;
            //                                     SubObjectiveEvaluation.Validate("Final/Actual Qty");
            //                                     SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                                     SubObjectiveEvaluation.Validate("Performance Rating Scale");
            //                                     SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
            //                                     SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
            //                                     SubObjectiveEvaluation.Insert(true);

            //                                 until SubPCObjective.Next = 0;
            //                             end;
            //                         //End Sub Objective OutCome


            //                         until PCObjective.Next = 0;
            //                     end;

            //                     SecondaryPCObjective.Reset;
            //                     SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     if SecondaryPCObjective.FindFirst then begin
            //                         repeat
            //                         //SecondaryPCObjective.TESTFIELD("Due Date");
            //                         until SecondaryPCObjective.Next = 0;
            //                     end;

            //                     SecondaryPCObjective.Reset;
            //                     SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                     if SecondaryPCObjective.FindFirst then begin
            //                         repeat
            //                             AchievedTarget := 0;
            //                             PlogLines.Reset;
            //                             PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
            //                             PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
            //                             PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                             PlogLines.CalcSums("Achieved Target");
            //                             AchievedTarget := PlogLines."Achieved Target";

            //                             /* IF AchievedTarget=0 THEN
            //                                 ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */


            //                             ObjectiveOutcome.Init;
            //                             ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
            //                             ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
            //                             ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
            //                             ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
            //                             ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
            //                             ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
            //                             ObjectiveOutcome."Primary Department" := Rec.Department;
            //                             ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
            //                             ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                             ObjectiveOutcome.Outcome := PCObjective."OutCome";
            //                             //ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
            //                             ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
            //                             ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                             ObjectiveOutcome.Validate("Performance Rating Scale");
            //                             ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
            //                             ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
            //                             ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
            //                             ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
            //                             ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
            //                             ObjectiveOutcome.Insert(true);
            //                         until SecondaryPCObjective.Next = 0;
            //                     end;
            //                 end;
            //                 if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
            //                     PCJobDescription.Reset;
            //                     PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
            //                     PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                     if PCJobDescription.FindFirst then begin
            //                         repeat
            //                             AchievedTarget := 0;
            //                             PlogLines.Reset;
            //                             PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
            //                             PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
            //                             PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
            //                             PlogLines.CalcSums("Achieved Target");
            //                             AchievedTarget := PlogLines."Achieved Target";

            //                             /*IF AchievedTarget=0 THEN
            //                                ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */

            //                             ObjectiveOutcome.Init;
            //                             ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
            //                             ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
            //                             ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
            //                             ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
            //                             ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
            //                             ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
            //                             ObjectiveOutcome."Primary Department" := Rec.Department;
            //                             //ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
            //                             ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
            //                             ObjectiveOutcome.Outcome := PCObjective."OutCome";
            //                             //ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
            //                             ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
            //                             ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
            //                             ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
            //                             //ObjectiveOutcome.Validate("Performance Rating Scale");
            //                             ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
            //                             ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
            //                             ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
            //                             ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
            //                             //ObjectiveOutcome.Validate("Final/Actual Qty");
            //                             ObjectiveOutcome.Insert(true);
            //                         until PCJobDescription.Next = 0;
            //                     end;
            //                 end;
            //             end;


            //             Message('Objectives and Outcomes Populated Successfully');

            //         end;
            //     }

            action("Suggest Objectives & Outcomes")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MidYearPerformance: Record NewAndChangedApprTargets;
                    InsertedCount: Integer;
                    LastLineNo: Integer;
                begin
                    if not Confirm('Are you sure you want to Suggest Objectives & Outcomes?', true) then
                        Error('Objectives & Outcomes not Suggested');

                    Rec.TestField("Personal Scorecard ID");
                    Rec.TestField("Evaluation Start Date");
                    Rec.TestField("Evaluation End Date");

                    ObjectiveOutcome.Reset();
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.FindSet then
                        ObjectiveOutcome.DeleteAll();

                    MidYearPerformance.Reset();
                    MidYearPerformance.SetRange("Document No.", Rec.No);
                    if MidYearPerformance.FindSet then
                        MidYearPerformance.DeleteAll();

                    SPMGeneralSetup.Get;
                    SPMGeneralSetup.TestField("Appraisal Based On");

                    InsertedCount := 0;
                    LastLineNo := 0;

                    if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."Appraisal Based On"::"Direct Input" then begin
                        if SPMGeneralSetup."Allow Loading of  CSP" then begin
                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");

                            if PCObjective.FindSet then begin
                                repeat
                                    LastLineNo += 10000;

                                    ObjectiveOutcome.Init();
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Appraisal Period" := Rec."Review Period";
                                    ObjectiveOutcome."Line No" := LastLineNo;
                                    ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Primary Department" := PCObjective."Department Plan ID";
                                    ObjectiveOutcome."Departmental Objective" := PCObjective."Departmental Objective";
                                    ObjectiveOutcome."Objective/Initiative" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    ObjectiveOutcome.Outcome := PCObjective.OutCome;
                                    ObjectiveOutcome."Unit of Measure" := PCObjective."Unit of Measure";
                                    ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome.Insert(true);

                                    InsertedCount += 1;

                                    MidYearPerformance.Init();
                                    MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                    MidYearPerformance."Line No." := LastLineNo;
                                    MidYearPerformance."Objective/Initiative" := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                    MidYearPerformance.Target := ObjectiveOutcome."Key Performance Indicator";
                                    MidYearPerformance.Insert(true);

                                    SubPCObjective.Reset;
                                    SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    if SubPCObjective.FindSet then
                                        repeat
                                            SubObjectiveEvaluation.Init;
                                            SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
                                            SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                            SubObjectiveEvaluation."Scorecard ID" := PCObjective."Workplan No.";
                                            SubObjectiveEvaluation."Intiative No" := PCObjective."Initiative No.";
                                            SubObjectiveEvaluation."Objective/Initiative" := PCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                            SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Primary Department" := Rec.Department;
                                            SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                            SubObjectiveEvaluation."Unit of Measure" := PCObjective."Unit of Measure";
                                            SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                            SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
                                            SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
                                            SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                            SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                            SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                            SubObjectiveEvaluation.Insert(true);
                                        until SubPCObjective.Next = 0;
                                until PCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if SecondaryPCObjective.FindSet then
                                repeat
                                    LastLineNo += 10000;

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Appraisal Period" := Rec."Review Period";
                                    ObjectiveOutcome."Line No" := LastLineNo;
                                    ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Unit of Measure" := SecondaryPCObjective."Unit of Measure";
                                    ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome.Insert(true);

                                    InsertedCount += 1;

                                    MidYearPerformance.Init();
                                    MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                    MidYearPerformance."Line No." := LastLineNo;
                                    MidYearPerformance."Objective/Initiative" := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                    MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance.Insert(true);

                                    SubPCObjective.Reset;
                                    SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                                    SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                                    if SubPCObjective.FindSet then
                                        repeat
                                            SubObjectiveEvaluation.Init;
                                            SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
                                            SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                            SubObjectiveEvaluation."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                            SubObjectiveEvaluation."Intiative No" := SecondaryPCObjective."Initiative No.";
                                            SubObjectiveEvaluation."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                            SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Primary Department" := Rec.Department;
                                            SubObjectiveEvaluation."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation."Unit of Measure" := SecondaryPCObjective."Unit of Measure";
                                            SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                            SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
                                            SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
                                            SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                            SubObjectiveEvaluation."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                            SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                            SubObjectiveEvaluation.Insert(true);
                                        until SubPCObjective.Next = 0;
                                until SecondaryPCObjective.Next = 0;
                        end;

                        if SPMGeneralSetup."Allow Loading of JD" then begin
                            PCJobDescription.Reset;
                            PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if PCJobDescription.FindSet then
                                repeat
                                    LastLineNo += 10000;

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Appraisal Period" := Rec."Review Period";
                                    ObjectiveOutcome."Line No" := LastLineNo;
                                    ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                                    ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Key Performance Indicator" := PCJobDescription."Key Performance Indicator";
                                    ObjectiveOutcome."Unit of Measure" := PCJobDescription."Unit of Measure";
                                    ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                                    ObjectiveOutcome.Insert(true);

                                    InsertedCount += 1;

                                    MidYearPerformance.Init();
                                    MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                    MidYearPerformance."Line No." := LastLineNo;
                                    MidYearPerformance."Objective/Initiative" := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                    MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance.Insert(true);
                                until PCJobDescription.Next = 0;
                        end;
                    end;

                    if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."Appraisal Based On"::"Plog Input" then begin
                        if SPMGeneralSetup."Allow Loading of  CSP" then begin
                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");

                            if PCObjective.FindSet then begin
                                repeat
                                    LastLineNo += 10000;

                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Appraisal Period" := Rec."Review Period";
                                    ObjectiveOutcome."Line No" := LastLineNo;
                                    ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Departmental Objective" := PCObjective."Departmental Objective";
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    ObjectiveOutcome.Outcome := PCObjective.OutCome;
                                    ObjectiveOutcome."Unit of Measure" := PCObjective."Unit of Measure";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                                    ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                                    ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                                    ObjectiveOutcome.Validate("Final/Actual Qty");
                                    ObjectiveOutcome.Insert(true);

                                    InsertedCount += 1;

                                    MidYearPerformance.Init();
                                    MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                    MidYearPerformance."Line No." := LastLineNo;
                                    MidYearPerformance."Objective/Initiative" := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                    MidYearPerformance.Target := ObjectiveOutcome."Key Performance Indicator";
                                    MidYearPerformance.Insert(true);

                                    AchievedSubActivityTarget := 0;
                                    SubPlogLines.Reset;
                                    SubPlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                                    SubPlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    SubPlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    SubPlogLines.CalcSums("Achieved Target");
                                    AchievedSubActivityTarget := SubPlogLines."Achieved Target";

                                    SubPCObjective.Reset;
                                    SubPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    if SubPCObjective.FindSet then
                                        repeat
                                            SubObjectiveEvaluation.Init;
                                            SubObjectiveEvaluation."Performance Evaluation ID" := Rec.No;
                                            SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                            SubObjectiveEvaluation."Scorecard ID" := SubPCObjective."Workplan No.";
                                            SubObjectiveEvaluation."Intiative No" := SubPCObjective."Initiative No.";
                                            SubObjectiveEvaluation."Objective/Initiative" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                            SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                            SubObjectiveEvaluation."Primary Department" := Rec.Department;
                                            SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                            SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                            SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                            SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
                                            SubObjectiveEvaluation."Self-Review Qty" := AchievedSubActivityTarget;
                                            SubObjectiveEvaluation."AppraiserReview Qty" := AchievedSubActivityTarget;
                                            SubObjectiveEvaluation."Final/Actual Qty" := AchievedSubActivityTarget;
                                            SubObjectiveEvaluation.Validate("Final/Actual Qty");
                                            SubObjectiveEvaluation."Performance Rating Scale" := Rec."Performance Rating Scale";
                                            SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                            SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                            SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                            SubObjectiveEvaluation.Insert(true);
                                        until SubPCObjective.Next = 0;
                                until PCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if SecondaryPCObjective.FindFirst then
                                repeat
                                    LastLineNo += 10000;

                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Appraisal Period" := Rec."Review Period";
                                    ObjectiveOutcome."Line No" := LastLineNo;
                                    ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Unit of Measure" := SecondaryPCObjective."Unit of Measure";
                                    ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                                    ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                                    ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                                    ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome.Insert(true);

                                    InsertedCount += 1;

                                    MidYearPerformance.Init();
                                    MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                    MidYearPerformance."Line No." := LastLineNo;
                                    MidYearPerformance."Objective/Initiative" := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                    MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance.Insert(true);
                                until SecondaryPCObjective.Next = 0;
                        end;

                        if SPMGeneralSetup."Allow Loading of JD" then begin
                            PCJobDescription.Reset;
                            PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCJobDescription.FindFirst then
                                repeat
                                    LastLineNo += 10000;

                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Appraisal Period" := Rec."Review Period";
                                    ObjectiveOutcome."Line No" := LastLineNo;
                                    ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                                    ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                                    ObjectiveOutcome."Key Performance Indicator" := PCJobDescription."Key Performance Indicator";
                                    ObjectiveOutcome."Unit of Measure" := PCJobDescription."Unit of Measure";
                                    ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                                    ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                                    ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                                    ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                                    ObjectiveOutcome.Validate("Final/Actual Qty");
                                    ObjectiveOutcome.Insert(true);

                                    InsertedCount += 1;

                                    MidYearPerformance.Init();
                                    MidYearPerformance."Document No." := ObjectiveOutcome."Performance Evaluation ID";
                                    MidYearPerformance."Line No." := LastLineNo;
                                    MidYearPerformance."Objective/Initiative" := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance."Target Qty" := ObjectiveOutcome."Target Qty";
                                    MidYearPerformance.Target := ObjectiveOutcome."Objective/Initiative";
                                    MidYearPerformance.Insert(true);
                                until PCJobDescription.Next = 0;
                        end;
                    end;

                    Message('Successfully populated %1 objectives and outcomes', InsertedCount);
                end;
            }

            action("Load Competency Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Load Competency Templates action.';

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to load Competency Templates', true) then
                        Error('Competency Templates not loaded');

                    ProEvaluation.Reset();
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.FindSet() then
                        ProEvaluation.DeleteAll();

                    CompetencyLines.Reset;
                    CompetencyLines.SetRange("Competency Template ID", Rec."Competency Template ID");
                    //MESSAGE('%1, %2', "Current Grade", CompetencyLines."Job Grade");
                    // CompetencyLines.SetRange("Job Grade", Rec."Current Grade");
                    if CompetencyLines.FindSet() then begin
                        repeat
                            ProEvaluation.Init;
                            ProEvaluation."Performance Evaluation ID" := Rec.No;
                            ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                            ProEvaluation."Competency Template ID" := Rec."Competency Template ID";
                            ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                            ProEvaluation.Validate("Competency Code");
                            ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                            ProEvaluation."Competency Description" := CompetencyLines."Competency Description";
                            ProEvaluation.Description := CompetencyLines.Description;
                            ProEvaluation."Profiency Rating Scale" := Rec."Proficiency Rating Scale";
                            ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                            ProEvaluation."Weight %" := CompetencyLines."Weight %";
                            ProEvaluation.Insert(true);
                        until CompetencyLines.Next = 0;
                    end;
                    Message('Competency Templates loaded Successfully');
                    /*
                    CompetencyLines.RESET;
                    CompetencyLines.SETRANGE("Competency Template ID","Competency Template ID");
                    IF CompetencyLines.FIND('-') THEN BEGIN
                      REPEAT
                          ProEvaluation.INIT;
                          ProEvaluation."Performance Evaluation ID":=No;
                          ProEvaluation."Line No":=FnGetLastLineNoB+1;
                          ProEvaluation."Competency Template ID":="Competency Template ID";
                          ProEvaluation."Competency Code":=CompetencyLines."Competency Code";
                          ProEvaluation.VALIDATE("Competency Code");
                          ProEvaluation."Competency Category":=CompetencyLines."Competency Category";
                          ProEvaluation.Description:=CompetencyLines.Description;
                          ProEvaluation."Profiency Rating Scale":="Proficiency Rating Scale";
                          ProEvaluation."Target Qty":=CompetencyLines."Weight %";
                          ProEvaluation."Weight %":=CompetencyLines."Weight %";
                          ProEvaluation.INSERT(TRUE);
                        UNTIL CompetencyLines.NEXT=0;
                     END;
                       MESSAGE('Competency Templates loaded Successfully');
                    */

                end;
            }

            action("Load Managerial Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Load Managerial Templates action';

                trigger OnAction()
                var

                begin
                    if not Confirm('Are you sure you want to Load Managerial Templates', true) then
                        Error('Managerial Templates not loaded');

                    ManagerialAttributes.Reset();
                    ManagerialAttributes.SetRange("Performance Evaluation ID", Rec.No);
                    if ManagerialAttributes.FindSet() then
                        ManagerialAttributes.DeleteAll();

                    ManagerialAttributesline.Reset;
                    ManagerialAttributesline.SetRange("Managerial Template ID", Rec."Managerial Template ID");
                    if ManagerialAttributesline.FindSet() then begin
                        repeat
                            ManagerialAttributes.Init;
                            ManagerialAttributes."Performance Evaluation ID" := Rec.No;
                            ManagerialAttributes."Line No" := FnGetLastLineNoMA();
                            ManagerialAttributes."Managerial Template ID" := Rec."Managerial Template ID";
                            ManagerialAttributes.Description := ManagerialAttributesline.Description;
                            ManagerialAttributes.Insert(true);
                        until ManagerialAttributesline.Next = 0;
                    end;
                    Message('Managerial Templates loaded Successfully');
                end;
            }
            action("Load Core Values Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Load core values Templates action';

                trigger OnAction()
                var
                    CoreValues: Record "Core Values & Attributes PA";
                    CoreValuesLine: Record "Attributes and Behavioral";
                    CoreValuesPA: Record "Core Values & Attributes PA";

                begin
                    if not Confirm('Are you sure you want to Load Core Values Templates', true) then
                        Error('Core Values Templates not loaded');

                    CoreValues.Reset();
                    CoreValues.SetRange("Performance Evaluation ID", Rec.No);
                    if CoreValues.FindSet() then
                        CoreValues.DeleteAll();

                    CoreValuesLine.Reset;
                    CoreValuesLine.SetRange("Attributes Template ID", Rec."Core Values Template ID");
                    if CoreValuesLine.FindSet() then begin
                        repeat
                            CoreValuesPA.Init;
                            CoreValuesPA."Performance Evaluation ID" := Rec.No;
                            CoreValuesPA."Line No" := FnGetLastLineNoCV();
                            CoreValuesPA."Core values Template ID" := Rec."Competency Template ID";
                            CoreValuesPA.Description := CoreValuesLine.Description;
                            CoreValuesPA."Explanatory Note" := CoreValuesLine."Explanatory Notes";
                            CoreValuesPA.Insert(true);
                        until CoreValuesLine.Next = 0;
                    end;
                    Message('Managerial Templates loaded Successfully');
                end;
            }
            separator(Action42)
            {
            }
            action("Print Appraisal Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Appraisal Report action.';

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange(No, Rec.No);
                    // Report.Run(50022,true,true,Rec)
                    Report.Run(report::"Staff Performance Appraisal", true, true, Rec);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attach Documents';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    // Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
            action("Create Training Needs")
            {
                ApplicationArea = All;
                Caption = 'Create Training Needs', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = NewDocument;
                ToolTip = 'Executes the Create Training Needs action.';
                Visible = false;

                trigger OnAction()
                var
                    TrnNeedReq: Record "Training Needs Requests";
                    HRSetup: Record "Human Resources Setup";
                    TrnNeedHeader: Record "Training Needs Header";
                    NoSeriesMgt: Codeunit "No. Series";
                    EvalTrainNeeds: Record "Evaluation Training Needs";
                    TrnNeedReq1: Record "Training Needs Requests";
                    i: Integer;
                begin
                    TrnNeedHeader.Init;
                    HRSetup.Get();
                    HRSetup.TestField("Training Request Nos");
                    //   TrnNeedHeader.Code := NoSeriesMgt.DoGetNextNo(HRSetup."Training Request Nos", Today, true, true);
                    TrnNeedHeader.Code := NoSeriesMgt.GetNextNo(HRSetup."Training Request Nos", WorkDate(), true);
                    TrnNeedHeader."Created By" := UserId;
                    TrnNeedHeader."Created On" := CurrentDatetime;
                    TrnNeedHeader."Employee No" := Rec."Employee No.";
                    TrnNeedHeader."Employee Name" := Rec."Employee Name";
                    TrnNeedHeader.Department := Rec.Department;
                    TrnNeedHeader."Perfomance Header No" := Rec.No;
                    if TrnNeedHeader.Insert(true) then begin
                        EvalTrainNeeds.Reset();
                        EvalTrainNeeds.SetRange("Perfomance Evaluation No", Rec.No);
                        if EvalTrainNeeds.FindSet then begin
                            repeat
                                message('%1', EvalTrainNeeds."Perfomance Evaluation No");
                                message('Need No %1', EvalTrainNeeds."Training Need Number");
                                TrnNeedReq1.Reset;
                                if TrnNeedReq1.FindLast() then
                                    i := TrnNeedReq1."Entry No.";
                                TrnNeedReq.Init;
                                TrnNeedReq."Entry No." := i + 1;
                                TrnNeedReq."Course ID" := EvalTrainNeeds.Course;
                                TrnNeedReq.validate("Course ID");
                                //TrnNeedReq.Description := EvalTrainNeeds.Description;
                                TrnNeedReq.Source := TrnNeedReq.Source::Appraisal;
                                TrnNeedReq.Comments := EvalTrainNeeds."Supervisor's Comments";
                                TrnNeedReq."Training Header No." := TrnNeedHeader.Code;
                                if TrnNeedReq.insert = true then
                                    Message('%1', TrnNeedReq."Entry No.");
                            until EvalTrainNeeds.Next() = 0;
                        end;

                    end;

                    Message('Successfully created Training Needs Assessment %1', TrnNeedHeader.Code);
                end;
            }
            separator(Action40)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
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
                    //   ApprovalMgt: Codeunit "Approvals Mgmt.";
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    // Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Performance Mgt Plan ID");
                    Rec.TestField("Performance Task ID");
                    Rec.TestField("Employee No.");
                    Rec.TestField("Personal Scorecard ID");
                    Rec.TestField("Supervisor Staff No.");
                    Rec.TestField("Annual Reporting Code");
                    Rec.TestField(Closed, false);


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome.TestField("Target Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("Target Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    //status must be open.
                    Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                                                         // IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                                                         //   ApprovalsMgmt.OnSendGFAForApproval(Rec);
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);


                    //Rec."Approval Status" := Rec."approval status"::Released;
                    // Rec."Document Status" := Rec."document status"::Evaluation;
                    // Rec.Modify;

                    // Message('Document has been approved Automatically');

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
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                ApprovalsMgmt.""(Rec);*/
                                                                                                // "Approval Status":="Approval Status"::Open;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    // Rec."Document Status" := Rec."document status"::Draft;
                    // Rec.Modify;
                    //Rec.Modify;
                    // Message('Document has been Re-Opened');

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Standard Appraisal/Supervisor Score Only";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Standard Appraisal/Supervisor Score Only";
        // Rec.Validate("Employee No.");
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        SubObjectiveEvaluation: Record "Sub Objective Evaluation";
        SubPCObjective: Record "Sub PC Objective";
        AchievedSubActivityTarget: Decimal;
        SubPlogLines: Record "Sub Plog Lines";
        ManagerialAttributes: Record "Managerial Attributes PA";
        ManagerialAttributesline: Record "Managerial Attributes Lines";

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Objective Evaluation Result";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoMidY() LineNumber: Integer
    var
        MidY: Record NewAndChangedApprTargets;
    begin
        MidY.Reset;
        if MidY.Find('+') then
            LineNumber := MidY."Line No."
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
            LineNumber := ProEvalution."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoMA() LineNumber: Integer
    var
        MAttributes: Record "Managerial Attributes PA";
    begin
        MAttributes.Reset;
        if MAttributes.Findlast then
            LineNumber := MAttributes."Line No" + 1
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoCV() LineNumber: Integer
    var
        CVAttributes: Record "Core Values & Attributes PA";
    begin
        CVAttributes.Reset;
        if CVAttributes.Findlast then
            LineNumber := CVAttributes."Line No" + 1
        else
            LineNumber := 1;
        exit(LineNumber);
    end;


    local procedure FnGetLastSubPcLineNo() LineNumber: Integer
    var
        Billable: Record "Sub Objective Evaluation";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;
}



