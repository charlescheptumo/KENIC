page 95380 "TUE Application Card"
{
    Caption = 'Therapeutic Use Exemption (TUE) Application Form';
    PageType = Card;
    SourceTable = "TUE Application Header";
    UsageCategory = Documents;
    PopulateAllFields = true;
    RefreshOnActivate = true;

    PromotedActionCategories = 'New,Process,Report,Approve,Request Approval,New Document,Navigate,Incoming Documents,Approval Entries,Print';
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = '1. Athlete Information';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Sport; Rec.Sport)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sport field.';
                }
                field(Discipline; Rec.Discipline)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline field.';
                }

            }
            group("Previouss Applications")
            {
                Caption = '2. Previous Applications';
                field("Previous Application?"; Rec.PreviousApplication(Rec."No."))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Application? field.';
                }

            }
            part("Previous Applications"; "TUE Previous Applications")
            {
                Visible = PreviousApplications;
                SubPageLink = "Athlete No." = field("Customer No."), "Document No." = filter(<> ''), Approved = const(true);
                ApplicationArea = All;
            }

            group("Retroactive Applications")
            {
                Caption = '3. Retroactive Applications';
                field("Is this a RetroActive Application?"; Rec."RetroActive Application?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the RetroActive Application? field.';
                }
                field("What date was the treatment started?"; Rec."RetroActive Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the RetroActive Start Date field.';
                }

            }
            part("Appying Exceptions"; "RetroActive Exception")
            {
                Caption = 'Select the Exceptions that apply';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No."), "Athlete No." = field("Customer No.");
            }
            part(Diagnosis; "TUE Diagnosis")
            {
                Caption = '4. Diagnosis';
                //By Evans
                SubPageLink = "Document No." = field("No."), "Athlete No." = field("Customer No.");
                //SubPageLink = "Document No." = field("No."), "Medical Practitioner" = field("Medical Practitioner"), "Athlete No." = field("Customer No.");
                ApplicationArea = All;
            }
            part("Medication Details"; "Medication Details")
            {
                Caption = '5. Medication Details';
                SubPageLink = "Document No." = field("No."), "Athlete No." = field("Customer No.");
                //SubPageLink = "Document No." = field("No."), "Medical Practitioner" = field("Medical Practitioner"), "Athlete No." = field("Customer No.");
                ApplicationArea = All;
            }
            // group("Medical Practitioner Dec")
            // {
            //     Caption = '6. Medical Practitioner';
            //     field("Medical Practitioner"; Rec."Medical Practitioner")
            group("Physician Dec")
            {
                Caption = '6. Physician';
                field(Physician; Rec.Physician)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Physician field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(Name; Rec."Medical Practitioner Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical Practitioner Name field.';
                }
                field("Medical Specialty"; Rec."Medical Specialty")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical Specialty field.';
                }
                field("License Number"; Rec."License Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License Number field.';
                }
                field("License Body"; Rec."License Body")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License Body field.';
                }
                field("MP Address"; Rec."MP Address")
                {
                    Caption = 'Address';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("MP City"; Rec."MP City")
                {
                    Caption = 'City';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("MP Country"; Rec."MP Country")
                {
                    Caption = 'Country';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("MP Post Code"; Rec."MP Post Code")
                {
                    Caption = 'Post Code';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("MP E-Mail"; Rec."MP E-Mail")
                {
                    Caption = 'E-Mail';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Declaration Date"; Rec."MP Declaration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MP Declaration Date field.';
                }

            }
            group("Athletes Declaration")
            {
                field("Athlete Declaration Date"; Rec."Athlete Declaration Date")
                {
                    Caption = 'Declaration Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Declaration Date field.';
                }
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(99213),
                              "No." = field("No.");
            }
            part(Control83; "Customer Signature")
            {
                Visible = not IsUnder18;
                Caption = 'Athlete Signature';
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Customer No.");
            }
            part(Control85; "Guardian Signature")
            {
                Visible = IsUnder18;
                Caption = 'Guardian Signature';
                ApplicationArea = Basic, Suite;
                SubPageLink = "Customer No." = field("Customer No.");
            }
            part(Control84; "Resource Signature")
            {
                Caption = 'Physician Signature';
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Physician);
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }

        }
    }
    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(ApprovalEntries)
            {
                AccessByPermission = TableData "Approval Entry" = R;
                ApplicationArea = Suite;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Print action.';
                Promoted = true;
                PromotedCategory = Category10;
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"TUE form", true, true, Rec);
                    Rec.Reset;
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        if Rec.PreviousApplication(Rec."No.") then
            PreviousApplications := true;
        IsUnder18 := Cust.IsUnder18(Rec."Customer No.");
    end;

    trigger OnOpenPage()
    begin
        if Rec.PreviousApplication(Rec."No.") then
            PreviousApplications := true;
        IsUnder18 := Cust.IsUnder18(Rec."Customer No.");
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable(false);
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.PreviousApplication(Rec."No.") then
            PreviousApplications := true;
        IsUnder18 := Cust.IsUnder18(Rec."Customer No.");
    end;

    var
        PreviousApplications: Boolean;
        IsUnder18: Boolean;
        Cust: Record Customer;
        OpenApprovalEntriesExist: Boolean;
        CalendarMgmt: Codeunit "Calendar Management";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
