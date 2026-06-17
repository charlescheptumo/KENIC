#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69775 "Phone Interview Header"
{
    Caption = 'Phone Interview Header';
    PageType = Card;
    SourceTable = "PreScreen Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("No. of Openings"; Rec."No. of Openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Openings field.';
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
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Phone Interview Template ID"; Rec."Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Template ID field.';
                }
                field("Maximum Test Duration(Min)"; Rec."Maximum Test Duration(Min)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Test Duration(Min) field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control29; "Phone Interview Lines")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
            }
        }
        area(factboxes)
        {
            systempart(Control25; Outlook)
            {
            }
            systempart(Control26; Notes)
            {
            }
            systempart(Control27; MyNotes)
            {
            }
            systempart(Control28; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Job Applicants")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Job Applicants action.';

                trigger OnAction()
                begin
                    Rec.TestField("Vacancy ID");
                    if Confirm('Are you sure you want to suggest applicants for  phone interviews?') = true then begin
                        Recruitment.SuggestPhoneInterviewApplicants(Rec);
                    end
                end;
            }
            action("E-Notify Job Applicants")
            {
                ApplicationArea = Basic;
                Image = ElectronicVATExemption;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the E-Notify Job Applicants action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to notify the applicants on the scheduled phone interviews?') = true then begin
                        Recruitment.NotifyPhoneInterviewApplicants(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to post the report?') = true then begin
                        Recruitment.PostPhoneApplicants(Rec);
                    end
                end;
            }
        }
        area(navigation)
        {
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Dimensions action.';
            }
        }
        area(reporting)
        {
            action("Print Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print Summary action.';
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69619, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Phone Interview Report";
    end;

    var
        Recruitment: Codeunit Recruitment;
}

