page 50204 "Board Member"
{
    ApplicationArea = All;
    Caption = 'Board Member';
    PageType = Card;
    SourceTable = "Board Members";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Personal No"; Rec."Personal No")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    // Visible = NoFieldVisible;

                    // trigger OnAssistEdit()
                    // begin
                    //     Rec.AssistEdit();
                    // end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = BasicHR;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = BasicHR;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                // field("Job Title"; Rec."Job Title")
                // {
                //     ApplicationArea = BasicHR;
                //     Importance = Promoted;
                //     ToolTip = 'Specifies the employee''s job title.';
                // }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the employee''s initials.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field("Designation/Role"; Rec."Designation/Role")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Designation/Role field.', Comment = '%';
                }
                // field(Gender; Rec.Gender)
                // {
                //     ApplicationArea = Basic, Suite;
                //     ToolTip = 'Specifies the gender with which the employee identifies.';
                // }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.', Comment = '%';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = BasicHR;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the employee''s email address at the company.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = BasicHR;
                    Importance = Additional;
                    ToolTip = 'Specifies when this record was last modified.';
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ApplicationArea = BasicHR;
                    Importance = Additional;
                    Visible = false;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
            }
            group("Address & Contact")
            {
                Caption = 'Address & Contact';
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Phone No.';
                    Importance = Promoted;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Alternative Email';
                    Importance = Promoted;
                    ToolTip = 'Specifies the employee''s Alternative email address.';
                }
            }
            group(Payments)
            {
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                // field("Social Security No."; Rec."Social Security No.")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'N.S.S.F No.';
                //     ToolTip = 'Specifies the social security number of the employee.';
                // }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ID Number field.';
                    Caption = 'ID Number/Passport Number';
                }
                // field("Employee Posting Group"; Rec."Employee Posting Group")
                // {
                //     ApplicationArea = Basic;
                //     ShowMandatory = true;
                //     ToolTip = 'Specifies the employee''s type to link business transactions made for the employee with the appropriate account in the general ledger.';
                // }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Bank Account Number"; Rec."Bank Account Number")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account Number field.';
                    }
                    field("Employee's Bank"; Rec."Employee's Bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank field.';
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name field.';
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch field.';
                    }
                    field("Bank Branch Name"; Rec."Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name field.';
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Employee's Bank 2"; Rec."Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank 2 field.';
                    }
                    field("Bank Name 2"; Rec."Bank Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name 2 field.';
                    }
                    field("Bank Branch 2"; Rec."Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch 2 field.';
                    }
                    field("Bank Branch Name 2"; Rec."Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name 2 field.';
                    }
                    field("Bank Account No. 2"; Rec."Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account No. field.';
                    }
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create Portal User")
            {
                ApplicationArea = Basic;
                Image = CreateInteraction;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Create Portal User action.';
                trigger onaction()
                begin
                    portalusers.RESET;
                    portalusers.SETRANGE("customer No", Rec."Personal No");
                    IF portalusers.FINDSET THEN BEGIN
                        ERROR('The user is already created as a portal user!');
                    END ELSE BEGIN
                        MESSAGE(Rec."Company E-Mail");
                        MESSAGE(Rec."Company E-Mail");
                        portalusers.INIT;
                        portalusers."customer No" := Rec."Personal No";
                        portalusers.Password := FORMAT(hrportal.fnRandomPass);
                        portalusers.usertype := 1; //1 for directors
                        portalusers.Email := Rec."E-Mail";
                        IF portalusers.INSERT(TRUE) THEN BEGIN
                            hrportal.fnSendRegistrationEmail(portalusers.Email);
                            MESSAGE('Portal user created successfully');
                        END ELSE BEGIN
                            ERROR('User could not be created contact ICT.');
                        END;
                    END;
                end;
            }
        }
    }

    var
        portalusers: Record portalusers;
        hrportal: Codeunit HRPortal;
}
