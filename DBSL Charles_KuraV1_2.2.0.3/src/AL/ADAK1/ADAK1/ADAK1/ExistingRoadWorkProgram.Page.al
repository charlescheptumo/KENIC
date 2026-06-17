#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0603,AL0254, AL0424, AW0006 // ForNAV settings
Page 72205 "Existing Road Work Program"
{
    PageType = Card;
    SourceTable = "Road Work Program";
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Gloabal Budget Book ID"; Rec."Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Budget Book ID field.';
                }
                field(Authority; Rec.Authority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authority field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Budget ID field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
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
                field("Total Workplanned Length (Km)"; Rec."Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Workplanned Length (Km) field.';
                }
                field("Total Budget Ceiling"; Rec."Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget Ceiling field.';
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Costs field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Planning Type"; Rec."Planning Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Type field.';
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan ID field.';
                }
            }
            part(Control26; "Existing Road WP Package")
            {
                SubPageLink = "Road Work Program ID" = field(Code),
                              "Planning Type" = filter("Bottom-Up (Existing Works)");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import Work Package")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Config. Packages";
                RunPageView = where(Code = const('ROADPACKAGE'));
                Visible = false;
                ToolTip = 'Executes the Import Work Package action.';

                trigger OnAction()
                begin
                    //MESSAGE('Success');
                end;
            }
            action("Suggest Existing WP")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SuggestBin;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Suggest Existing WP action.';

                trigger OnAction()
                begin
                    /*//Insert Tasks

                    NewRoadWorkProgramPackage.RESET;
                    NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                    IF NewRoadWorkProgramPackage.FINDSET THEN BEGIN
                       PurchaseRequisitionTemplate.RESET;
                       PurchaseRequisitionTemplate.SETRANGE(PurchaseRequisitionTemplate.Code,NewRoadWorkProgramPackage."BoQ Template Code");
                      IF PurchaseRequisitionTemplate.FINDSET THEN BEGIN
                        RequisitionTemplateLine.RESET;
                        RequisitionTemplateLine.SETRANGE(RequisitionTemplateLine."BoQ Template ID",PurchaseRequisitionTemplate.Code);
                        IF RequisitionTemplateLine.FINDSET THEN BEGIN

                      REPEAT
                      NewRoadWorkProgramTask.INIT;
                      NewRoadWorkProgramTask."Road Work Program ID":=Code;
                      NewRoadWorkProgramTask.RESET;
                      NewRoadWorkProgramTask.SETRANGE("Road Work Program ID",Code);
                      IF NewRoadWorkProgramTask.FINDLAST THEN
                        NewRoadWorkProgramTask."Entry No":=NewRoadWorkProgramTask."Entry No"+1000
                      ELSE
                        NewRoadWorkProgramTask."Entry No":=1000;
                      NewRoadWorkProgramTask."Package No.":=NewRoadWorkProgramPackage."Package No.";
                      NewRoadWorkProgramTask."BoQ Template Code":=NewRoadWorkProgramPackage."BoQ Template Code";
                      NewRoadWorkProgramTask."Bill Item Category Code":=RequisitionTemplateLine."Item Category Code";
                      NewRoadWorkProgramTask.Description:=RequisitionTemplateLine.Description;
                      NewRoadWorkProgramTask.INSERT;
                      UNTIL RequisitionTemplateLine.NEXT =0;
                      END;
                      END;
                      END;

                    //Insert Activities
                    TariffCodes1.GET('T14%');
                    NewRoadWorkProgramTask.RESET;
                    NewRoadWorkProgramTask.SETRANGE(NewRoadWorkProgramTask."Road Work Program ID",Code);
                    IF NewRoadWorkProgramTask.FINDSET THEN BEGIN
                      PurchaseRequisitionTemplate.RESET;
                      PurchaseRequisitionTemplate.SETRANGE(PurchaseRequisitionTemplate.Code,NewRoadWorkProgramTask."BoQ Template Code");
                      IF PurchaseRequisitionTemplate.FINDSET THEN BEGIN
                        RequisitionTemplateLine.RESET;
                        RequisitionTemplateLine.SETRANGE(RequisitionTemplateLine."BoQ Template ID",PurchaseRequisitionTemplate.Code);
                        IF RequisitionTemplateLine.FINDSET THEN BEGIN
                          REPEAT
                            NewRoadWorkProgramActivity.INIT;
                            NewRoadWorkProgramActivity."Road Work Program ID":=Code;
                            NewRoadWorkProgramActivity.RESET;
                            NewRoadWorkProgramActivity.SETRANGE(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                            IF NewRoadWorkProgramActivity.FINDLAST THEN
                            NewRoadWorkProgramActivity."Entry No":=NewRoadWorkProgramActivity."Entry No"+1000
                            ELSE NewRoadWorkProgramActivity."Entry No":=1000;
                            NewRoadWorkProgramActivity."Package No.":=NewRoadWorkProgramTask."Package No.";
                            NewRoadWorkProgramActivity."BoQ Template Code":=RequisitionTemplateLine."BoQ Template ID";
                            NewRoadWorkProgramActivity."Bill Item Category Code":=RequisitionTemplateLine."Item Category Code";
                            NewRoadWorkProgramActivity."Activity Code":=RequisitionTemplateLine."No.";
                            NewRoadWorkProgramActivity."Planned Quantity":=1;
                            NewRoadWorkProgramActivity.VALIDATE("Planned Quantity");
                            NewRoadWorkProgramActivity."Unit of Measure Code":=RequisitionTemplateLine."Unit of Measure Code";
                            NewRoadWorkProgramActivity."Planned Rate (Unit Cost)":=RequisitionTemplateLine."Amount Excl. VAT";
                            //NewRoadWorkProgramActivity."Contingency %":=RequisitionTemplateLine."Default Contingency %";
                           // NewRoadWorkProgramActivity."Default Job Task No.":=RequisitionTemplateLine."Default Job Task No.";
                            NewRoadWorkProgramActivity.Description:=RequisitionTemplateLine.Description;
                            NewRoadWorkProgramActivity."Technology Type":=RequisitionTemplateLine.Technology;
                            NewRoadWorkProgramActivity.VALIDATE("Technology Type");
                            NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)":=RequisitionTemplateLine."Amount Excl. VAT";
                            NewRoadWorkProgramActivity.VALIDATE("Engineer's Rate (Unit Cost)");
                            NewRoadWorkProgramActivity."Packaged Quantity":=NewRoadWorkProgramActivity."Planned Quantity";
                            //NewRoadWorkProgramActivity."Gen. Prod. Posting Group":=RequisitionTemplateLine."Gen. Prod. Posting Group";
                            //NewRoadWorkProgramActivity."VAT Prod. Posting Group":=RequisitionTemplateLine."VAT Prod. Posting Group";
                            //NewRoadWorkProgramActivity."Variant Code":=RequisitionTemplateLine."Variant Code";
                            NewRoadWorkProgramActivity."VAT %":=TariffCodes1.Percentage;
                            NewRoadWorkProgramActivity."VAT Amount":=ROUND(NewRoadWorkProgramActivity."Line Amount Excl. VAT"*TariffCodes1.Percentage/100);
                            NewRoadWorkProgramActivity."Line Amount Incl. VAT":=NewRoadWorkProgramActivity."Line Amount Excl. VAT"+NewRoadWorkProgramActivity."VAT Amount";
                            IF NOT NewRoadWorkProgramActivity.GET(NewRoadWorkProgramActivity."Road Work Program ID",NewRoadWorkProgramActivity."Package No.",NewRoadWorkProgramActivity."BoQ Template Code",
                              NewRoadWorkProgramActivity."Bill Item Category Code",NewRoadWorkProgramActivity."Activity Code",NewRoadWorkProgramActivity."Entry No") THEN
                            NewRoadWorkProgramActivity.INSERT(TRUE)
                            ELSE
                            NewRoadWorkProgramActivity.MODIFY(TRUE);

                            UNTIL RequisitionTemplateLine.NEXT=0;
                            END;
                            END;
                            END;
                            MESSAGE('Successfully suggested');
                            */
                    //Insert Job
                    repeat
                        Job.Reset;
                        Job.SetRange(Job."Constituency ID", WPExistingConstituency."Constituency Code");
                        if Job.FindSet then begin
                            repeat
                                ExistingRoadWPPackage.Init;
                                ExistingRoadWPPackage.Reset;
                                if ExistingRoadWPPackage.FindLast then
                                    ExistingRoadWPPackage."Entry No" := ExistingRoadWPPackage."Entry No" + 100
                                else
                                    ExistingRoadWPPackage."Entry No" := 100;
                                ExistingRoadWPPackage."Road Work Program ID" := Rec.Code;
                                ExistingRoadWPPackage."Job No." := Job."No.";
                                ExistingRoadWPPackage.Description := '';
                                ExistingRoadWPPackage."Road Code" := Job."Road Code";
                                ExistingRoadWPPackage."Road Section No." := Job."Road Section No";
                                ExistingRoadWPPackage."Road Class" := Job."Road Class ID";
                                ExistingRoadWPPackage."Section Name" := Job."Section Name";
                                ExistingRoadWPPackage."Start Chainage" := Job."Section Start Chainage(Km)";
                                ExistingRoadWPPackage."End Chainage" := Job."Section End Chainage(KM)";
                                ExistingRoadWPPackage."Road Works Category" := Job."Road Works Category";
                                ExistingRoadWPPackage."Workplanned Length (Km)" := Job."Total Road Section Length (KM)";
                                ExistingRoadWPPackage."Constituency ID" := Job."Constituency ID";
                                ExistingRoadWPPackage."County ID" := Job."County ID";
                                ExistingRoadWPPackage."Region ID" := Job."Region ID";
                                ExistingRoadWPPackage.Insert;
                            until Job.Next = 0;
                        end;
                    until WPExistingConstituency.Next = 0;

                    //Insert Tasks
                    JobTask.Reset;
                    JobTask.SetRange(JobTask."Job No.", ExistingRoadWPPackage."Job No.");
                    if JobTask.FindSet then
                        repeat
                            ExistingRoadWorkPrograTask.Init;
                            ExistingRoadWorkPrograTask."Road Work Program ID" := Rec.Code;
                            ExistingRoadWorkPrograTask."Job No." := ExistingRoadWPPackage."Job No.";
                            ExistingRoadWorkPrograTask."Job Task No." := JobTask."Job Task No.";
                            ExistingRoadWorkPrograTask.Description := JobTask.Description;
                            ExistingRoadWorkPrograTask."Job Task Type" := JobTask."Job Task Type";
                            ExistingRoadWorkPrograTask."Job Posting Group" := JobTask."Job Posting Group";
                            //ExistingRoadWorkPrograTask."Bill Item Category Code":=JobTask.
                            ExistingRoadWorkPrograTask.Insert;
                        until JobTask.Next = 0;

                    //Insert Planning Lines
                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange(JobPlanningLine."Job No.", ExistingRoadWorkPrograTask."Job No.");
                    if JobPlanningLine.FindSet then
                        repeat
                            ExistingRoadWPActivity.Init;
                            ExistingRoadWPActivity."Road Work Program ID" := Rec.Code;
                            ExistingRoadWPActivity."Job No." := ExistingRoadWorkPrograTask."Job No.";
                            ExistingRoadWPActivity."Job Task No." := JobPlanningLine."Job Task No.";
                            ExistingRoadWPActivity."Line No." := JobPlanningLine."Line No.";
                            ExistingRoadWPActivity."Planning Date" := JobPlanningLine."Planning Date";
                            ExistingRoadWPActivity."Document No." := JobPlanningLine."Document No.";
                            //ExistingRoadWPActivity.Type:=JobPlanningLine.Type;
                            ExistingRoadWPActivity."No." := JobPlanningLine."No.";
                            ExistingRoadWPActivity.Description := JobPlanningLine.Description;
                            ExistingRoadWPActivity.Quantity := JobPlanningLine.Quantity;
                            ExistingRoadWPActivity."Direct Unit Cost (LCY)" := JobPlanningLine."Direct Unit Cost (LCY)";
                            ExistingRoadWPActivity."Unit Cost (LCY)" := JobPlanningLine."Unit Cost (LCY)";
                            ExistingRoadWPActivity.Insert;
                        until JobPlanningLine.Next = 0;

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    /*//Insert Jobs
                    JobsSetup.GET;
                    NewRoadWorkProgramPackage.RESET;
                    NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Road Work Program ID",Code);
                    IF NewRoadWorkProgramPackage.FINDSET THEN BEGIN
                      REPEAT
                      Job.INIT;
                      Job."No.":='';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
                      Job.Description:=Description;
                      Job."Road Code":=NewRoadWorkProgramPackage."Road Code";
                      Job."Record Type":=Job."Record Type"::"Road Project";
                      Job.VALIDATE("Road Code");
                      Job."Road Section No":=NewRoadWorkProgramPackage."Road Section No.";
                      Job.VALIDATE("Road Section No");
                      Job."Road Class ID":=NewRoadWorkProgramPackage."Road Class";
                      Job."Bill-to Customer No.":='CUST2006';
                      Job.INSERT(TRUE);
                      UNTIL NewRoadWorkProgramPackage.NEXT =0;
                      END;

                    //Insert Tasks
                       NewRoadWorkProgramTask.RESET;
                       NewRoadWorkProgramTask.SETRANGE(NewRoadWorkProgramTask."Road Work Program ID",NewRoadWorkProgramPackage."Road Work Program ID");
                       IF NewRoadWorkProgramTask.FINDSET(TRUE) THEN
                       REPEAT
                         JobTask.INIT;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."Begin-Total Job Task No.";
                         JobTask.Description:=NewRoadWorkProgramTask.Description;
                         JobTask."Job Task Type":=JobTask."Job Task Type"::"Begin-Total";
                         IF NOT JobTask.GET(JobTask."Job No.",JobTask."Job Task No.") THEN
                         JobTask.INSERT(TRUE);

                         JobTask.INIT;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."Package No.";
                         JobTask.Description:=NewRoadWorkProgramTask.Description;
                         JobTask."Job Task Type":=JobTask."Job Task Type"::Posting;
                         IF NOT JobTask.GET(JobTask."Job No.",JobTask."Job Task No.") THEN
                         JobTask.INSERT(TRUE);

                         JobTask.INIT;
                         JobTask."Job No.":=Job."No.";
                         JobTask."Job Task No.":=NewRoadWorkProgramTask."End-Total Job Task No.";
                         JobTask.Description:=NewRoadWorkProgramTask.Description;
                         JobTask."Job Task Type":=JobTask."Job Task Type"::"End-Total";
                         IF NOT JobTask.GET(JobTask."Job No.",JobTask."Job Task No.") THEN
                         JobTask.INSERT(TRUE);
                        UNTIL NewRoadWorkProgramTask.NEXT =0;

                         //Create Job Planning Lines
                        NewRoadWorkProgramActivity.RESET;
                        NewRoadWorkProgramActivity.SETRANGE(NewRoadWorkProgramActivity."Road Work Program ID",Code);
                        IF NewRoadWorkProgramActivity.FINDSET THEN BEGIN
                        REPEAT
                        JobPlanningLine.INIT;
                        JobPlanningLine."Job No.":=Job."No.";
                        JobPlanningLine."Job Task No.":=NewRoadWorkProgramTask."Package No.";
                        JobPlanningLine.RESET;
                        JobPlanningLine.SETRANGE(JobPlanningLine."Job No.",Job."No.");
                        IF JobPlanningLine.FINDLAST THEN
                        JobPlanningLine."Line No.":=JobPlanningLine."Line No."+1000
                        ELSE
                        JobPlanningLine."Line No.":=1000;
                        JobPlanningLine.Type:=JobPlanningLine.Type::Item;
                        JobPlanningLine."No.":=NewRoadWorkProgramActivity."Activity Code";
                        JobPlanningLine.Status:=JobPlanningLine.Status::Planning;
                        JobPlanningLine."Budget Type":=JobPlanningLine."Budget Type"::Original;
                        JobPlanningLine."Ledger Entry Type":=JobPlanningLine."Ledger Entry Type"::Item;
                        JobPlanningLine.Description:=NewRoadWorkProgramActivity.Description;
                        JobPlanningLine.Quantity:=NewRoadWorkProgramActivity."Packaged Quantity";
                        JobPlanningLine.VALIDATE(Quantity);
                        JobPlanningLine."Road Technology":=NewRoadWorkProgramActivity."Technology Type";
                        JobPlanningLine.VALIDATE("Road Technology");
                        JobPlanningLine."Road Activity Categories":=NewRoadWorkProgramActivity."Bill Item Category Code";
                        JobPlanningLine."Direct Unit Cost (LCY)":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                        JobPlanningLine."Unit Cost":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                        JobPlanningLine.VALIDATE("Unit Cost");
                        JobPlanningLine.INSERT(TRUE);
                        UNTIL NewRoadWorkProgramActivity.NEXT =0;
                        END;

                    MESSAGE('Success');
                    Job.RESET;
                    Job.SETRANGE(Job."No.",Job."No.");
                    IF Job.FINDSET THEN
                      JobList.SETTABLEVIEW(Job);
                    JobList.RUN();
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Post To Consolidated WP")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post To Consolidated WP action.';

                trigger OnAction()
                begin
                    // RoadWorkProgram.TRANSFERFIELDS(ConsolidatedRoadWorkProgram);
                    // RoadWorkProgram.Code:="Consolidated Road W_Program ID";
                    // RoadWorkProgram."Work Program Type":=RoadWorkProgram."Work Program Type"::Consolidated;
                    // RoadWorkProgram.INS




                    /*ConsolidatedExistingRoadWPPackage.TRANSFERFIELDS(ExistingRoadWPPackage);
                    ConsolidatedExistingRoadWPPackage."Road Work Program ID":="Consolidated Road W_Program ID";
                    ConsolidatedExistingRoadWPPackage.INSERT;*/

                end;
            }
            action(Constituencies)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Components;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "WP Existing Constituenies";
                RunPageLink = "Wp No." = field(Code);
                ToolTip = 'Executes the Constituencies action.';
            }
        }
    }

    var
        WPExistingConstituency: Record "WP Existing Constituency";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        RoadWorkProgram: Record "Road Work Program";
        ExistingRoadWPPackage: Record "Existing Road WP Package";
        ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ExistingRoadWPActivity: Record "Existing Road WP Activity";
        ConsolidatedRoadWorkProgram: Record "Road Work Program";
        ConsolidatedExistingRoadWPPackage: Record "Existing Road WP Package";
        ConsolidatedExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ConsolidatedExistingRoadWPActivity: Record "Existing Road WP Activity";
}

