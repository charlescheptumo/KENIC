#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99295 "Training Need Request"
{
    PageType = Card;
    SourceTable = 69194;
    Caption = 'Training Needs Assessment';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("FY Code"; Rec."FY Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                    Visible = false;
                }
                field("Date of First Appointment"; Rec."Date of First Appointment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date of First Appointment field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Training Plan No"; Rec."Training Plan No")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Status = Rec.Status::Released;
                    ToolTip = 'Specifies the value of the Training Plan No field.';
                    Visible = false;
                }
                field("Type of Training"; Rec."Type of Training")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Training field.', Comment = '%';
                }
                field("Years Worked"; Rec."Years Worked")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Years in Current Job Grade field.';
                    Visible = false;
                }
                field("Age Bracket"; Rec."Age Bracket")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Age Bracket field.';
                    Visible = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                    Visible = false;
                }
                field("Career Aspirations"; Rec."Career Aspirations")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Career Aspirations field.';
                    Visible = false;
                }
                field("Training Programme Required"; Rec."Training Programme Required")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Training Required (to Achieve aspirations) field.';
                    Visible = false;
                }
                field("Training Attended"; Rec."Training Attended")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Training Attended (Last 3yrs) field.';
                    Visible = false;
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Archive Document field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
            }
            part("Education/Professional Qualifications"; CoursesPursuingPage)
            {
                SubPageLink = "Document No." = field(Code);
                Caption = 'Education/Professional Qualifications';
                Visible = false;
            }
            part("Job Requirements"; DuttyPerformanceChallengesSF)
            {
                SubPageLink = "Document No." = field(Code);
                Caption = 'Job Requirements';
                Visible = false;
            }
            part(Control9; "Need Requests")
            {
                SubPageLink = "Training Header No." = field(Code);
            }
            part("Training Attended Subform"; EmpTrainingAttendedCard)
            {
                SubPageLink = "Document No." = field(Code);
                Caption = 'Training Attended';
                Visible = false;
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control26; Notes)
            {
            }
            systempart(Control25; MyNotes)
            {
            }
            systempart(Control21; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Need Application")
            {
                Caption = 'Need Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
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
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::"Pending Approval";
                        Message('Approval Request Sent Successfully');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Released);
                        Rec.Status := Rec.Status::Open;
                        Message('Cancelled Successfully');
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = Rec.Status = Rec.Status::Released;
                    ToolTip = 'Executes the Post action.';

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        //Rec.TestField("Training Plan No");
                       // Rec.TestField("Training Plan No");
                        TrainingNeedsRequests.Reset;
                        TrainingNeedsRequests.SetRange("Training Header No.", Rec.Code);
                        if TrainingNeedsRequests.FindSet then begin
                            repeat
                                TrainingPlanLines.Reset;
                                TrainingPlanLines.SetRange("Training Plan Code", Rec."Training Plan No");
                                TrainingPlanLines.SetRange("Course Title", TrainingNeedsRequests."Course ID");
                                if not TrainingPlanLines.FindSet then begin
                                    TrainingPlanLines2.Init;
                                    TrainingPlanLines3.Reset;
                                    if TrainingPlanLines3.FindLast then
                                        TrainingPlanLines2."Task No" := TrainingPlanLines3."Task No" + 1;
                                    TrainingPlanLines2."Training Plan Code" := Rec."Training Plan No";
                                    TrainingPlanLines2."Course Title" := TrainingNeedsRequests."Course ID";
                                    TrainingPlanLines2."Course Description" := TrainingNeedsRequests.Description;
                                    TrainingPlanLines2.Institution := TrainingNeedsRequests.Institution;
                                    TrainingPlanLines2."Name of Course" := TrainingNeedsRequests."Name of Course";
                                    TrainingPlanLines2."Planned Date" := TrainingNeedsRequests."Planned Date";
                                    // TrainingPlanLines2.Source:=TrainingNeedsRequests.Source;
                                    TrainingPlanLines2.Insert(true);
                                end;
                                TrainingNeedsRegister.Init;
                                TrainingNeedsReg.Reset;
                                if TrainingNeedsReg.FindLast then
                                    TrainingNeedsRegister."Entry No." := TrainingNeedsReg."Entry No." + 1;
                                TrainingNeedsRegister."Training Plan No" := Rec."Training Plan No";
                                TrainingNeedsRegister."Course ID" := TrainingNeedsRequests."Course ID";
                                TrainingNeedsRegister.Description := TrainingNeedsRequests.Description;
                                TrainingNeedsRegister.Source := TrainingNeedsRequests.Source;
                                TrainingNeedsRegister.Comments := TrainingNeedsRequests.Comments;
                                TrainingNeedsRegister."Training Header No." := Rec.Code;
                                TrainingNeedsRegister."Employee No" := Rec."Employee No";
                                TrainingNeedsRegister."Employee Name" := Rec."Employee Name";
                                TrainingNeedsRegister.Insert(true);
                            until TrainingNeedsRequests.Next = 0;
                        end;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Message('Posted Successfully');
                    end;
                }
            }
        }
    }

    var
        TrainingNeedsRegister: Record 69187;
        TrainingNeedsRequests: Record "Training Needs Requests";
        TrainingNeedsReg: Record 69187;
        TrainingPlanLines: Record "Training Plan Lines";
        TrainingNeedsReq: Record "Training Needs Requests";
        TrainingPlanLines2: Record "Training Plan Lines";
        TrainingPlanLines3: Record "Training Plan Lines";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

#pragma implicitwith restore
