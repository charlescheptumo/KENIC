#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80149 "Group Appraisal-Evaluation"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type" = const("Performance Appraisal"),
                            "Document Status" = const(Evaluation),
                            "Evaluation Type" = const("360-Degree/Group Appraisal"));
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Mgt Plan ID field.';
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Task ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Designation field.';
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Grade field.';
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Personal Scorecard ID field.';
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Staff No. field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Competency Template ID field.';
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
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            part("Objectives and Outcomes"; "Group Objective and Outcome-E")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
            }
            part(Control39; "Group Proficiency E")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
            }
            group(Statistics)
            {
                Caption = 'Appraisal Confirmation';
                Visible = true;
                field("Employee Confirm"; Rec."Employee Confirm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Confirm field.';
                }
                field("Supervisor Confirm"; Rec."Supervisor Confirm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Confirm field.';
                }
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
            action("Submit Appraisal")
            {
                ApplicationArea = Basic;
                Image = Delivery;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Submit Appraisal action.';

                trigger OnAction()
                begin
                    // Rec.TestField("Employee Confirm", true);
                    Rec.TestField("Supervisor Confirm", true);
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify;
                    Message('Appraisal Submitted Sucessfully');
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
                    TrnNeedHeader.Reset();
                    TrnNeedHeader.SetRange("Perfomance Header No", Rec.No);
                    if TrnNeedHeader.FindSet() then begin
                        repeat
                            TrnNeedReq.Reset();
                            TrnNeedReq.SetRange("Training Header No.", TrnNeedHeader.Code);
                            TrnNeedReq.DeleteAll();

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

                            Message('Successfully updated Training Needs Request %1', TrnNeedHeader.Code);
                        until TrnNeedHeader.Next = 0;
                    end else begin
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
                        Message('Successfully created Training Needs Request %1', TrnNeedHeader.Code);
                    end;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"360-Degree/Group Appraisal";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"360-Degree/Group Appraisal";
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";

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
}

