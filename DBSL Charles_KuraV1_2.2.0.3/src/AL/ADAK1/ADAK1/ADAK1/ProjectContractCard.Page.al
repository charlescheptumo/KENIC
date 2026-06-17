#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65078 "Project Contract Card"
{
    PageType = Card;
    SourceTable = "Project Contract Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Contract No"; Rec."Project Contract No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Contract No field.';
                }
                field("Grant Application ID"; Rec."Grant Application ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Application ID field.';
                }
                field("External Contract No"; Rec."External Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Contract No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Contract Customer No"; Rec."Primary Contract Customer No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Contract Customer No field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Principal Investigator field.';
                }
                field("Grant Administrator"; Rec."Grant Administrator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Administrator field.';
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Type field.';
                }
                field("Primary Funding Sponsor ID"; Rec."Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Funding Sponsor ID field.';
                }
                field("Primary Sponsor Name"; Rec."Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Sponsor Name field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
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
            part(Control30; "Contract Funding Lines")
            {
                SubPageLink = "Project Contract No." = field("Project Contract No");
            }
            systempart(Control32; Links)
            {
                Visible = false;
            }
            systempart(Control31; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action39)
            {
            }
            action("Print Project Contract")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Executes the Print Project Contract action.';

                trigger OnAction()
                begin
                    Rec.SetRange("Project Contract No", Rec."Project Contract No");
                    Report.Run(65019, true, true, Rec)
                end;
            }
            action("Notify Contract Award")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Notify Contract Award action.';

                trigger OnAction()
                begin
                    Message('Nofity Team');
                end;
            }
            action("Si&gn Contract")
            {
                ApplicationArea = Service;
                Caption = 'Si&gn Contract';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Confirm the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    Rec."Contract Status" := Rec."contract status"::Signed;
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action("Cancel Contract")
            {
                ApplicationArea = Service;
                Caption = 'Cancel Contract';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Cancel  the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    Rec."Contract Status" := Rec."contract status"::Signed;
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                var
                //    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);//status must be open.
                                                                                  //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                  //    if ApprovalsMgmt.CheckProjectContractApprovalsWorkflowEnabled(Rec) then
                                                                                  //      ApprovalsMgmt.OnSendProjectContractForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //       ApprovalsMgmt.OnCancelProjectContractApprovalRequest(Rec);
                end;
            }
            separator(Action35)
            {
            }
        }
    }

    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

