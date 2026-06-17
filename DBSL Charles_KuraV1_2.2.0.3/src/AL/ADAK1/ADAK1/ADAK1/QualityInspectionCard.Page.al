#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72551 "Quality Inspection Card"
{
    PageType = Card;
    SourceTable = "Inspection Headersss";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Contractor Request No"; Rec."Contractor Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Request No field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Work Execution Plan 1D"; Rec."Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan 1D field.';
                }
                field("Commencement Order No"; Rec."Commencement Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order No field.';
                }
                field("Works Inspection Template No."; Rec."Works Inspection Template No.")
                {
                    ApplicationArea = Basic;
                    Visible = WorksVisible;
                    ToolTip = 'Specifies the value of the Works Inspection Template No. field.';
                }
                field("Survey Works Template No."; Rec."Survey Works Template No.")
                {
                    ApplicationArea = Basic;
                    Visible = SurveyWorksVisible;
                    ToolTip = 'Specifies the value of the Survey Works Template No. field.';
                }
                field("Lab Works Template No."; Rec."Lab Works Template No.")
                {
                    ApplicationArea = Basic;
                    Visible = LabWorksVisible;
                    ToolTip = 'Specifies the value of the Lab Works Template No. field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("DLP Start Date"; Rec."DLP Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Start Date field.';
                }
                field("DLP Period"; Rec."DLP Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Period field.';
                }
                field("DLP End Date"; Rec."DLP End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP End Date field.';
                }
                field("Payments To Date"; Rec."Payments To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payments To Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part(Control41; "Project Inspection Line Subpag")
            {
                Caption = 'Works Inspections';
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type"),
                              Type = filter("Works Inspection");
                Visible = WorksVisible;
            }
            part(Control39; "Inspection Survey Works")
            {
                Caption = 'Survey Works';
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type"),
                              Type = filter("Survey Works");
                Visible = SurveyWorksVisible;
            }
            part(Control40; "Inspection Lab Works")
            {
                Caption = 'Lab Works';
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type"),
                              Type = filter("Lab Works");
                Visible = LabWorksVisible;
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Awarded Tender Sum Inc Tax"; Rec."Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Tender Sum Inc Tax field.';
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field("Primary Contractor Rep."; Rec."Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contractor Rep. field.';
                }
                field("Contractor Representative Role"; Rec."Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Representative Role field.';
                }
                field("Contractor Rep. Email"; Rec."Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Rep. Email field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Project Manager/Engineer"; Rec."Project Manager/Engineer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager/Engineer field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Corrective Orders")
            {
                ApplicationArea = Basic;
                Image = CancelledEntries;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Inspection Corrective Orders";
                RunPageLink = "Inpection Type" = field("Inspection Type"),
                              "Inspection No" = field("Inspection No");
                ToolTip = 'Executes the Corrective Orders action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    // RMSManagement.FnPostQualityInspection(InspectionPlanLine,Rec,InspectionLine);
                    Message('Quality Inspection %1 Posted Successfully', Rec."Inspection No");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        WorksVisible := false;
        LabWorksVisible := false;
        SurveyWorksVisible := false;
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := false;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := false;
                SurveyWorksVisible := true;
            end;
            if UserSetup."View Lab Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := true;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Works Inspections" = true and UserSetup."View Lab Works Inspections" = true and UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := true;
                SurveyWorksVisible := true;
            end;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        WorksVisible := false;
        LabWorksVisible := false;
        SurveyWorksVisible := false;
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := false;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := false;
                SurveyWorksVisible := true;
            end;
            if UserSetup."View Lab Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := true;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Works Inspections" = true and UserSetup."View Lab Works Inspections" = true and UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := true;
                SurveyWorksVisible := true;
            end;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Inspection Type" := Rec."inspection type"::" ";
    end;

    trigger OnOpenPage()
    begin
        WorksVisible := false;
        LabWorksVisible := false;
        SurveyWorksVisible := false;
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := false;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := false;
                SurveyWorksVisible := true;
            end;
            if UserSetup."View Lab Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := true;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Works Inspections" = true and UserSetup."View Lab Works Inspections" = true and UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := true;
                SurveyWorksVisible := true;
            end;
        end;
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        InspectionPlanLine: Record "Inspection Plan Line";
        InspectionHeadersss: Record "Inspection Headersss";
        InspectionLine: Record "Inspection Line";
        LabWorksVisible: Boolean;
        SurveyWorksVisible: Boolean;
        WorksVisible: Boolean;
        UserSetup: Record "User Setup";
}

