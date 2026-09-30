#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
#pragma implicitwith disable

page 58172 "Induction Signoff Card"
{
    PageType = Card;
    SourceTable = "Induction Signoff Form";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = PageEditable;

                field("Induction No."; Rec."Induction No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unique document number for the induction signoff form.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the document was created.';
                }
                field("Offer ID"; Rec."Offer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment offer reference associated with this induction.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the application number linked to the candidate.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the candidate number.';
                }
                field("Intern Name"; Rec."Intern Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the full name of the candidate/intern.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the ID of the position being offered.';
                }
                field("Position Title"; Rec."Position Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the title of the position.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the scheduled reporting or start date.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the related job vacancy ID.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the overall processing status of the signoff document.';
                }
                field("Employee/Facilitator User ID"; Rec."Employee User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the portal user ID of the employee who signed off sections.';
                }
                           }
            group("Supervisor Details")
            {
                Caption = 'Supervisor Details';
                Editable = PageEditable;

                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the supervisor assigned to oversee the induction process.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the name of the assigned supervisor.';
                }
            }
            group("Section Sign-offs")
            {
                Caption = 'Section Sign-offs';
                Editable = PageEditable;

                field("Documentation Signed"; Rec."Documentation Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether documentation clearance is signed off.';
                }
                field("Documentation Employee Signoff"; Rec."Documentation Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off documentation.';
                }
                // field("Documentation Employee UserID"; Rec."Documentation Employee UserID")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the user ID of the employee who signed off documentation.';
                // }
                field("Documentation Facilitator Signoff"; Rec."Documentation Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off documentation.';
                }
                field("Documentation Facilitator UserID"; Rec."Documentation Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off documentation.';
                }

                field("Orientation Signed"; Rec."Orientation Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether orientation modules are signed off.';
                }
                field("Orientation Employee Signoff"; Rec."Orientation Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off orientation.';
                }
                field("Orientation Employee UserID"; Rec."Orientation Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off orientation.';
                }
                field("Orientation Facilitator Signoff"; Rec."Orientation Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off orientation.';
                }
                field("Orientation Facilitator UserID"; Rec."Orientation Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off orientation.';
                }

                field("Health & Safety Signed"; Rec."Health & Safety Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether health & safety orientation is signed off.';
                }
                field("Health & Safety Employee Signoff"; Rec."Health & Safety Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off health & safety.';
                }
                field("Health & Safety Employee UserID"; Rec."Health & Safety Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off health & safety.';
                }
                field("Health & Safety Facilitator Signoff"; Rec."Health & Safety Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off health & safety.';
                }
                field("Health & Safety Facilitator UserID"; Rec."Health & Safety Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off health & safety.';
                }

                field("Marketing & Comm Signed"; Rec."Marketing & Comm Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether marketing & communications overview is signed off.';
                }
                field("Marketing & Comm Employee Signoff"; Rec."Marketing & Comm Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off marketing & comm.';
                }
                field("Marketing & Comm Employee UserID"; Rec."Marketing & Comm Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off marketing & comm.';
                }
                field("Marketing & Comm Facilitator Signoff"; Rec."Marketing & Comm Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off marketing & comm.';
                }
                field("Marketing & Comm Facilitator UserID"; Rec."Marketing & Comm Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off marketing & comm.';
                }

                field("Business Dev Signed"; Rec."Business Dev Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether business development overview is signed off.';
                }
                field("Business Dev Employee Signoff"; Rec."Business Dev Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off business dev.';
                }
                field("Business Dev Employee UserID"; Rec."Business Dev Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off business dev.';
                }
                field("Business Dev Facilitator Signoff"; Rec."Business Dev Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off business dev.';
                }
                field("Business Dev Facilitator UserID"; Rec."Business Dev Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off business dev.';
                }

                field("Data Protection & QA Signed"; Rec."Data Protection & QA Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether data protection and quality assurance orientation is signed off.';
                }
                field("Data Protect Employee Signoff"; Rec."Data Protect Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off data protection & QA.';
                }
                field("Data Protect Employee UserID"; Rec."Data Protect Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off data protection & QA.';
                }
                field("Data Protect Facilitator Signoff"; Rec."Data Protect Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off data protection & QA.';
                }
                field("Data Protect Facilitator UserID"; Rec."Data Protect Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off data protection & QA.';
                }

                field("Conditions of Work Signed"; Rec."Conditions of Work Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether working conditions orientation is signed off.';
                }
                field("Conditions Employee Signoff"; Rec."Conditions Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off conditions of work.';
                }
                field("Conditions Employee UserID"; Rec."Conditions Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off conditions of work.';
                }
                field("Conditions Facilitator Signoff"; Rec."Conditions Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off conditions of work.';
                }
                field("Conditions Facilitator UserID"; Rec."Conditions Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off conditions of work.';
                }

                field("Finance & Strategy Signed"; Rec."Finance & Strategy Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether finance & strategy briefing is signed off.';
                }
                field("Finance & Strategy Employee Signoff"; Rec."Finance & Strategy Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off finance & strategy.';
                }
                field("Finance & Strategy Employee UserID"; Rec."Finance & Strategy Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off finance & strategy.';
                }
                field("Finance & Strategy Facilitator Signoff"; Rec."Finance & Strategy Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off finance & strategy.';
                }
                field("Finance & Strategy Facilitator UserID"; Rec."Finance & Strategy Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off finance & strategy.';
                }

                field("Technical & Security Signed"; Rec."Technical & Security Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether technical and security protocols are signed off.';
                }
                field("Technical & Security Employee Signoff"; Rec."Technical & Security Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off technical & security.';
                }
                field("Technical & Security Employee UserID"; Rec."Technical & Security Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off technical & security.';
                }
                field("Technical & Security Facilitator Signoff"; Rec."Technical & Security Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off technical & security.';
                }
                field("Technical & Security Facilitator UserID"; Rec."Technical & Security Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off technical & security.';
                }

                field("CEO Connect Signed"; Rec."CEO Connect Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the CEO connect briefing is signed off.';
                }
                field("CEO Connect Employee Signoff"; Rec."CEO Connect Employee Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee signed off CEO connect.';
                }
                field("CEO Connect Employee UserID"; Rec."CEO Connect Employee UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the employee who signed off CEO connect.';
                }
                field("CEO Connect Facilitator Signoff"; Rec."CEO Connect Facilitator Signoff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the facilitator signed off CEO connect.';
                }
                field("CEO Connect Facilitator UserID"; Rec."CEO Connect Facilitator UserID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the user ID of the facilitator who signed off CEO connect.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control66; Outlook)
            {
            }
            systempart(Control67; Notes)
            {
            }
            systempart(Control68; MyNotes)
            {
            }
            systempart(Control69; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Complete Signoff")
            {
                ApplicationArea = Basic;
                Caption = 'Complete Signoff';
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Marks the overall induction signoff process as fully completed.';

                trigger OnAction()
                var
                    ConfirmTxt: Label 'Are you sure you want to mark this Induction Signoff as completed?';
                begin
                    Rec.TestField(Status, Rec.Status::"In Progress");

                    if Confirm(ConfirmTxt) then begin
                        Rec.Status := Rec.Status::Completed;
                        Rec.Modify(true);
                        Message('Induction Signoff document %1 has been completed.', Rec."Induction No.");
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print Signoff Form';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Prints the Induction Signoff Form.';

                trigger OnAction()
                begin
                    Rec.SetRange("Induction No.", Rec."Induction No.");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetPageEditability();
    end;

    trigger OnOpenPage()
    begin
        SetPageEditability();
    end;

    var
        PageEditable: Boolean;

    local procedure SetPageEditability()
    begin
        PageEditable := (Rec.Status = Rec.Status::Open) or (Rec.Status = Rec.Status::"In Progress");
    end;
}

#pragma implicitwith restore
