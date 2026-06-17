#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72369 "Posted  Measurement Sheet"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Visible = Rec."Document Type" = Rec."Document Type"::"Payment Certificate";
                    ToolTip = 'Specifies the value of the Payment Certificate Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Reason For Reversal"; Rec."Reason For Reversal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Reversal field.';
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed By field.';
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
            part(Control44; "Measurement & Payment Line")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
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
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer No. field.';
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer Name field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Representative No. field.';
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Representative Name field.';
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
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Funder Name"; Rec."Funder Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Funder Name field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Section Start Chainage"; Rec."Section Start Chainage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Section Start Chainage field.';
                }
                field("Section End Chainage"; Rec."Section End Chainage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Section End Chainage field.';
                }
                field("Total  Section Length (KMs)"; Rec."Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total  Section Length (KMs) field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Measurement Sheet Bill Codes")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Bins;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Measurement Sheet Bill Codes";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No."),
                              "Job No" = field("Project ID");
                Visible = false;
                ToolTip = 'Executes the Measurement Sheet Bill Codes action.';
            }
            action("Import Lines")
            {
                ApplicationArea = Basic;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Measurement Lines";
                Visible = false;
                ToolTip = 'Executes the Import Lines action.';
            }
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Suggest Lines action.';

                trigger OnAction()
                begin
                    //RMSManagement.FnSuggestMeasurementLines(JobPlanningLine,Rec,Rec);

                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange("Job No.", Rec."Project ID");
                    if JobPlanningLine.FindSet then begin
                        repeat
                            MeasurementSheetBillCode.Reset;
                            MeasurementSheetBillCode.SetRange("Bill Item Category Code", JobPlanningLine."Road Activity Categories");
                            if MeasurementSheetBillCode.FindSet then begin
                                MeasurementPaymentLine.Init;
                                MeasurementPaymentLine."Document No" := Rec."Document No.";
                                MeasurementPaymentLine."Document Type" := Rec."Document Type";
                                MeasurementPaymentLine."Job No." := Rec."Project ID";
                                MeasurementPaymentLine."Job Task No." := JobPlanningLine."Job Task No.";
                                MeasurementPaymentLine."Line No." := MeasurementPaymentLine.Count + 100;
                                MeasurementPaymentLine.Type := MeasurementPaymentLine.Type::Item;
                                MeasurementPaymentLine."No." := JobPlanningLine."No.";
                                MeasurementPaymentLine.Description := JobPlanningLine.Description;
                                MeasurementPaymentLine."Bill Item Category Code" := JobPlanningLine."Road Activity Categories";
                                MeasurementPaymentLine."Technology Type" := JobPlanningLine."Road Technology";
                                MeasurementPaymentLine."Unit of Measure Code" := JobPlanningLine."Unit of Measure";
                                MeasurementPaymentLine."Unit of Measure Code" := JobPlanningLine."Unit of Measure Code";
                                MeasurementPaymentLine.Validate("Unit of Measure Code");
                                MeasurementPaymentLine."Contract Quantity" := JobPlanningLine.Quantity;
                                MeasurementPaymentLine.Validate("Contract Quantity");
                                MeasurementPaymentLine."Direct Unit Cost (LCY)" := JobPlanningLine."Unit Cost";
                                MeasurementPaymentLine."Unit Cost (LCY)" := JobPlanningLine."Unit Cost";
                                MeasurementPaymentLine."Total Cost (LCY)" := JobPlanningLine."Total Cost";
                                MeasurementPaymentLine."Previous Measured Quantity" := JobPlanningLine."Total Cost";
                                MeasurementPaymentLine.Insert;
                            end;
                        until JobPlanningLine.Next = 0;
                    end;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    //RMSManagement.FnPostMeasurementSheet(MeasurementPaymentEntry,MeasurementPaymentLine,Rec);
                    ObjMPLine.Reset;
                    ObjMPLine.SetRange(ObjMPLine."Document Type", Rec."Document Type");
                    ObjMPLine.SetRange(ObjMPLine."Document No", Rec."Document No.");
                    if ObjMPLine.FindSet(true) then begin
                        repeat
                            ObjMPEntry.Init;
                            //ObjMPEntry.TRANSFERFIELDS(ObjMPLine);
                            ObjMPEntry.Reset;
                            ObjMPEntry.SetRange("Document No", Rec."Document No.");
                            ObjMPEntry.SetRange("Document Type", Rec."Document Type");
                            if ObjMPEntry.FindLast then
                                ObjMPEntry."Entry No" := ObjMPEntry."Entry No" + 100;
                            ObjMPEntry."Document No" := Rec."Document No.";
                            ObjMPEntry."Document Type" := Rec."Document Type";
                            ObjMPLine."Job No." := Rec."Project ID";
                            ObjMPEntry."Job Task No." := ObjMPLine."Job Task No.";
                            ObjMPEntry.Type := ObjMPEntry.Type::Item;
                            ObjMPEntry."No." := ObjMPLine."No.";
                            ObjMPEntry.Description := ObjMPLine.Description;
                            ObjMPEntry."Unit of Measure Code" := ObjMPLine."Unit of Measure Code";
                            ObjMPEntry."Measurement Type" := ObjMPLine."Measurement Type";
                            ObjMPEntry."Measured Quantity" := ObjMPLine."Measured Quantity";
                            ObjMPEntry."Linear/Unit Quantity" := ObjMPLine."Linear/Unit Quantity";
                            ObjMPEntry."Length (m)" := ObjMPLine."Length (m)";
                            ObjMPEntry."Width (m)" := ObjMPLine."Width (m)";
                            ObjMPEntry."Height/Depth (m)" := ObjMPLine."Height/Depth (m)";
                            ObjMPEntry."Contract Quantity" := ObjMPLine."Contract Quantity";
                            ObjMPEntry."Direct Unit Cost (LCY)" := ObjMPLine."Direct Unit Cost (LCY)";
                            ObjMPEntry."Unit Cost (LCY)" := ObjMPLine."Unit Cost (LCY)";
                            ObjMPEntry."Total Cost (LCY)" := ObjMPLine."Total Cost (LCY)";
                            ObjMPEntry."Gen. Prod. Posting Group" := ObjMPLine."Gen. Prod. Posting Group";
                            ObjMPEntry."Technology Type" := ObjMPLine."Technology Type";
                            ObjMPEntry."Bill Item Category Code" := ObjMPLine."Bill Item Category Code";
                            ObjMPEntry."Works Start Chainage" := ObjMPLine."Works Start Chainage";
                            ObjMPEntry."Works End Chainage" := ObjMPLine."Works End Chainage";
                            ObjMPEntry."Posting Date" := Rec."Document Date";
                            ObjMPEntry."Posted By" := UpperCase(UserId);
                            ObjMPEntry."Line No." := ObjMPLine."Line No.";
                            ObjMPEntry.Posted := true;
                            ObjMPEntry.Insert(true);
                        until ObjMPLine.Next = 0;
                    end;

                    Rec.Posted := true;
                    Rec.Validate(Posted);
                    Rec."Posted By" := UpperCase(UserId);
                    Rec.Modify;
                    Message('Posted Successfully');
                end;
            }
            action("Send Approval Request ")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Send Approval Request  action.';

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
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
            action(Reverse)
            {
                ApplicationArea = Basic;
                Image = ReverseLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Reverse action.';

                trigger OnAction()
                begin
                    Message('Reversed');
                end;
            }
        }
    }

    var
        RMSManagement: Codeunit "RMS Management";
        JobPlanningLine: Record "Job Planning Line";
        MeasurementPaymentEntry: Record "Measurement & Payment Entry";
        MeasurementPaymentLine: Record "Measurement & Payment Line";
        MeasurementSheetBillCode: Record "Measurement Sheet Bill Code";
        ObjMPLine: Record "Measurement & Payment Line";
        ObjMPEntry: Record "Measurement & Payment Entry";
}

