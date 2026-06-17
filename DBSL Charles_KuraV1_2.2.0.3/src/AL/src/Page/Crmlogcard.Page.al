#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69502 "Crm log card"
{
    PageType = Card;
    SourceTable = "General Equiries.";
    SourceTableView = where(Send = const(false));
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
                field("CaseEmployer:=TRUE;"; Rec."Calling As")
                {
                    ApplicationArea = Basic;
                    Caption = 'Equiring As';
                    OptionCaption = ',As Member,As Employer';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Equiring As field.';
                }
                field("<Equiring For>"; Rec."Calling For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Equiring For';
                    ToolTip = 'Specifies the value of the Equiring For field.';
                }
                field("Contact Mode"; Rec."Contact Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Mode field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Captured By field.';
                }
                field("Captured On"; Rec."Captured On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Captured On field.';
                }
            }
            group("Member Information")
            {
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
            }
            group("Employment Info")
            {
                Caption = 'Employment Info';
                field(Control22; Rec."Employment Info")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Employment Info field.';

                    trigger OnValidate()
                    begin
                        if Rec."Employment Info" = Rec."employment info"::Employed then begin
                            EmployerCodeEditable := true;
                            DepartmentEditable := true;
                            TermsofEmploymentEditable := true;
                            ContractingEditable := false;
                            EmployedEditable := false;
                            OccupationEditable := false;
                            PositionHeldEditable := true;
                            EmploymentDateEditable := true;
                            EmployerAddressEditable := true;
                            NatureofBussEditable := false;
                            IndustryEditable := false;
                            BusinessNameEditable := false;
                            PhysicalBussLocationEditable := false;
                            YearOfCommenceEditable := false;



                        end else
                            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                                ContractingEditable := true;
                                EmployerCodeEditable := false;
                                DepartmentEditable := false;
                                TermsofEmploymentEditable := false;
                                OccupationEditable := false;
                                PositionHeldEditable := false;
                                EmploymentDateEditable := false;
                                EmployerAddressEditable := false;
                                NatureofBussEditable := false;
                                IndustryEditable := false;
                                BusinessNameEditable := false;
                                PhysicalBussLocationEditable := false;
                                YearOfCommenceEditable := false;
                            end else
                                if Rec."Employment Info" = Rec."employment info"::Others then begin
                                    OthersEditable := true;
                                    ContractingEditable := false;
                                    EmployerCodeEditable := false;
                                    DepartmentEditable := false;
                                    TermsofEmploymentEditable := false;
                                    OccupationEditable := false;
                                    PositionHeldEditable := false;
                                    EmploymentDateEditable := false;
                                    EmployerAddressEditable := false
                                end else
                                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                                        OccupationEditable := true;
                                        EmployerCodeEditable := false;
                                        DepartmentEditable := false;
                                        TermsofEmploymentEditable := false;
                                        ContractingEditable := false;
                                        EmployedEditable := false;
                                        NatureofBussEditable := true;
                                        IndustryEditable := true;
                                        BusinessNameEditable := true;
                                        PhysicalBussLocationEditable := true;
                                        YearOfCommenceEditable := true;
                                        PositionHeldEditable := false;
                                        EmploymentDateEditable := false;
                                        EmployerAddressEditable := false

                                    end;




                        /*IF "Identification Document"="Identification Document"::"Nation ID Card" THEN BEGIN
                          PassportEditable:=FALSE;
                          IDNoEditable:=TRUE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Passport Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=FALSE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Aliens Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=TRUE;
                        END;*/

                    end;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Employer Code field.';
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    ApplicationArea = Basic;
                    Editable = EmployedEditable;
                    ToolTip = 'Specifies the value of the Employer Name field.';
                }
                field("Employer Address"; Rec."Employer Address")
                {
                    ApplicationArea = Basic;
                    Editable = EmployerAddressEditable;
                    ToolTip = 'Specifies the value of the Employer Address field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'WorkStation / Depot';
                    Editable = DepartmentEditable;
                    ToolTip = 'Specifies the value of the WorkStation / Depot field.';
                }
                field("Terms of Employment"; Rec."Terms of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = TermsofEmploymentEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Terms of Employment field.';
                }
                field("Date of Employment"; Rec."Date of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = EmploymentDateEditable;
                    ToolTip = 'Specifies the value of the Date of Employment field.';
                }
                field("Position Held"; Rec."Position Held")
                {
                    ApplicationArea = Basic;
                    Editable = PositionHeldEditable;
                    ToolTip = 'Specifies the value of the Position Held field.';
                }
                field("Nature Of Business"; Rec."Nature Of Business")
                {
                    ApplicationArea = Basic;
                    Editable = NatureofBussEditable;
                    ToolTip = 'Specifies the value of the Nature Of Business field.';
                }
                field(Industry; Rec.Industry)
                {
                    ApplicationArea = Basic;
                    Editable = IndustryEditable;
                    ToolTip = 'Specifies the value of the Industry field.';
                }
                field("Business Name"; Rec."Business Name")
                {
                    ApplicationArea = Basic;
                    Editable = BusinessNameEditable;
                    ToolTip = 'Specifies the value of the Business Name field.';
                }
                field("Physical Business Location"; Rec."Physical Business Location")
                {
                    ApplicationArea = Basic;
                    Editable = PhysicalBussLocationEditable;
                    ToolTip = 'Specifies the value of the Physical Business Location field.';
                }
                field("Year of Commence"; Rec."Year of Commence")
                {
                    ApplicationArea = Basic;
                    Editable = YearOfCommenceEditable;
                    ToolTip = 'Specifies the value of the Year of Commence field.';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = Basic;
                    Editable = OccupationEditable;
                    ToolTip = 'Specifies the value of the Occupation field.';
                }
                field("Others Details"; Rec."Others Details")
                {
                    ApplicationArea = Basic;
                    Editable = OthersEditable;
                    ToolTip = 'Specifies the value of the Others Details field.';
                }
            }
            group("Referee Details")
            {
                Caption = 'Referee Details';
                field("Referee Member No"; Rec."Referee Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Customer No field.';
                }
                field("Referee Name"; Rec."Referee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee Name field.';
                }
                field("Referee ID No"; Rec."Referee ID No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee ID No field.';
                }
                field("Referee Mobile Phone No"; Rec."Referee Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee Mobile Phone No field.';
                }
            }
            group("Case Information")
            {
                field("Type of Cases"; Rec."Type of Cases")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Cases field.';

                    trigger OnValidate()
                    begin
                        LoanNoVisible := false;
                        if Rec."Type of Cases" = Rec."type of cases"::Loan then begin
                            LoanNoVisible := true;
                        end;
                    end;
                }
                field("Employer Cases types"; Rec."Employer Cases types")
                {
                    ApplicationArea = Basic;
                    Editable = CaseEmployer;
                    ToolTip = 'Specifies the value of the Employer Cases types field.';
                }
                field("Case Description"; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Source field.';
                }
                field("Caller Reffered To"; Rec."Caller Reffered To")
                {
                    ApplicationArea = Basic;
                    Caption = ' Escalate Case to:';
                    ToolTip = 'Specifies the value of the  Escalate Case to: field.';
                }
                field("Escalated User Email"; Rec."Escalated User Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated User Email field.';
                }
                field("Date of Escalation"; Rec."Date of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Escalation field.';
                }
                field("Time of Escalation"; Rec."Time of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time of Escalation field.';
                }
                field("Date Resolved"; Rec."Date Resolved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Resolved field.';
                }
                field("Time Resolved"; Rec."Time Resolved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Resolved field.';
                }
                field("Resolved User"; Rec."Resolved User")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resolved By';
                    ToolTip = 'Specifies the value of the Resolved By field.';
                }
            }
            group("Employer Information")
            {
                Visible = false;
                field("Company No"; Rec."Company No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company No field.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Name field.';
                }
                field("Company Address"; Rec."Company Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Address field.';
                }
                field("Company postal code"; Rec."Company postal code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company postal code field.';
                }
                field("Company Telephone"; Rec."Company Telephone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Telephone field.';
                }
                field("Company Email"; Rec."Company Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Email field.';
                }
                field("Company website"; Rec."Company website")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company website field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Detailed Member Page")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = New;
                ToolTip = 'Executes the Detailed Member Page action.';
            }
            action("Escalate Case")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Escalate Case action.';

                trigger OnAction()
                begin
                    //Check if Issue already escalated
                    if Rec."Date of Escalation" <> 0D then begin
                        Error('Case already Escalated to %1', Rec."Caller Reffered To");
                    end;




                    //Get Case Information===============================================================================================
                    // IF "Calling As"="Calling As"::"As Member" THEN

                    if Confirm('Create a case  for ' + Rec."Member Name" + '.The case  will be given a new case Number. Continue?', false) = true then begin
                        //Create Invest Account
                        if CaseSetup.Get then begin
                            CaseSetup.TestField(CaseSetup."Cases nos");
                            CaseNO := NoSeriesMgt.GetNextNo(CaseSetup."Cases nos", 0D, true);
                            if CaseNO <> '' then begin
                                CASEM.Init;
                                CASEM."Enquiry Number" := CaseNO;
                                CASEM."Member No." := Rec."Member No";
                                CASEM."Member No" := Rec."Member No";
                                CASEM."Member Name" := Rec."Member Name";
                                CASEM."Loan Balance" := Rec."Loan Balance";
                                CASEM."Share Capital" := Rec."Share Capital";
                                CASEM."Current Deposits" := Rec."Current Deposits";
                                CASEM."ID No" := Rec."ID No";
                                CASEM.Gender := Rec.Gender;
                                CASEM."FOSA Account." := Rec."Fosa account";
                                CASEM."Account Name." := Rec."Member Name";
                                CASEM."Loan No" := Rec."Loan No";
                                CASEM."Date of Complaint" := Today;
                                CASEM."Type of cases" := Rec."Type of Cases";
                                CASEM."Case Description" := Rec.Description;
                                CASEM."Time Sent" := Time;
                                CASEM."Date Sent" := Today;
                                CASEM."Case Received  Date" := Today;
                                CASEM."Captured On" := Rec."Captured On";
                                CASEM."Captured By" := Rec."Captured By";
                                CASEM."Date of Escalation" := Rec."Date of Escalation";
                                CASEM."Time of Escalation" := Rec."Time of Escalation";
                                CASEM."Receive date" := Today;
                                CASEM."Caller Reffered To" := Rec."Caller Reffered To";
                                CASEM."Case Description" := Rec.Description;
                                CASEM."Employment Info" := Rec."Employment Info";
                                //CASEM."Employer Code":="Employer Code";
                                CASEM."Employer Name" := Rec."Employer Name";
                                CASEM."Others Details" := Rec."Others Details";
                                CASEM."Employment Terms" := Rec."Employment Terms";
                                CASEM."Employer Type" := Rec."Employer Type";
                                CASEM."Business Name" := Rec."Business Name";
                                CASEM."Nature Of Business" := Rec."Nature Of Business";
                                CASEM."Expected Monthly Income" := Rec."Expected Monthly Income";
                                CASEM.Industry := Rec.Industry;
                                CASEM."Physical Business Location" := Rec."Physical Business Location";
                                CASEM."Date of Employment" := Rec."Date of Employment";
                                CASEM."Year of Commence" := Rec."Year of Commence";
                                CASEM."Date of Employment" := Rec."Date of Employment";
                                CASEM."Referee Member No" := Rec."Referee Member No";
                                CASEM."Referee Name" := Rec."Referee Name";
                                CASEM."Referee ID No" := Rec."Referee ID No";
                                CASEM."Referee Mobile Phone No" := Rec."Referee Mobile Phone No";
                                if CASEM."Enquiry Number" <> '' then
                                    Rec.Send := true;

                                //Update Case Details==============================================
                                ObjCaseDetails.Reset;
                                ObjCaseDetails.SetRange(ObjCaseDetails."Case No", Rec.No);
                                if ObjCaseDetails.FindSet then begin
                                    repeat
                                        ObjCaseDetails2.Init;
                                        ObjCaseDetails2."Case No" := CaseNO;
                                        ObjCaseDetails2."Case Type" := ObjCaseDetails."Case Type";
                                        ObjCaseDetails2."Case Details" := ObjCaseDetails."Case Details";
                                        ObjCaseDetails2.Insert;
                                    until ObjCaseDetails.Next = 0;
                                end;
                                //End Update Case Details==============================================
                            end;
                            CASEM.Insert(true);
                            Message('Member Case successfully Escalated ');
                            Rec."Date of Escalation" := Today;
                            Rec."Time of Escalation" := Time;
                            FnSendEmailNotification();
                        end;
                    end;
                    //END;

                    //Company Case============================================================================================================
                    if Rec."Calling As" = Rec."calling as"::"As Employer" then begin
                        if (Rec."Calling For" = Rec."calling for"::Appreciation) or (Rec."Calling For" = Rec."calling for"::Criticism) or (Rec."Calling For" = Rec."calling for"::Payment) or (Rec."Calling For" = Rec."calling for"::" ") then begin
                            Rec.TestField("Employer Cases types");
                            Rec.TestField("Query Code");
                            Sure := Confirm('Create a case  for ' + Rec."Member Name" + '.The case  will be given a new case Number. Continue?');
                            if Sure then begin

                                if CaseSetup.Get then begin
                                    CaseSetup.TestField(CaseSetup."Cases nos");
                                    CaseNO := NoSeriesMgt.GetNextNo(CaseSetup."Cases nos", 0D, true);
                                    if CaseNO <> '' then begin
                                        CASEM.Init;
                                        CASEM."Enquiry Number" := CaseNO;
                                        CASEM."Company No" := Rec."Query Code";
                                        CASEM."Company Name" := Rec."Company Name";
                                        CASEM."Company Address" := Rec."Company Address";
                                        CASEM."Company Email" := Rec."Company Email";
                                        CASEM."Date of Complaint" := Today;
                                        CASEM."Case Received  Date" := Today;
                                        CASEM."Company postal code" := Rec."Company postal code";
                                        CASEM."Company Telephone" := Rec."Company Telephone";
                                        CASEM."Type of cases" := Rec."Employer Cases types";
                                        CASEM."Time Sent" := Time;
                                        CASEM."Date Sent" := Today;
                                        CASEM."Receive date" := Today;
                                        CASEM."Caller Reffered To" := Rec."Caller Reffered To";
                                        CASEM."Case Description" := Rec.Description;
                                        if CASEM."Enquiry Number" <> '' then
                                            Rec.Send := true;
                                        Message('Employer Case created ');
                                    end;
                                    CASEM.Insert(true);
                                end;
                            end;
                        end;
                    end;
                end;
            }
            action("Mark Resolved")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Mark Resolved action.';

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Resolved then begin
                        Error('Case already resolved');
                    end;

                    if Confirm('Are you sure you want to mark this case as resolved?', false) = true then begin
                        Rec.Status := Rec.Status::Resolved;
                        Rec."Date Resolved" := Today;
                        Rec."Time Resolved" := Time;
                    end;
                end;
            }
            action("Additional Case Details")
            {
                ToolTip = 'Executes the Additional Case Details action.';
                // ApplicationArea = Basic;
                // Image = Form;
                // Promoted = true;
                // PromotedCategory = Process;
                // RunObject = Page "HR Job Applications Card";
                // RunPageLink = "Application No"=field(No);
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AsEmployer := false;
        Asmember := false;
        AsNonmember := false;
        Asother := false;
        Ascase := false;
        CaseEmployer := false;
        CaseEnabled := false;
        if Rec."Calling As" = Rec."calling as"::"As Member" then begin
            Asmember := true;
            AsEmployer := true;
            Ascase := true;
            CaseEnabled := true;

        end;
        if Rec."Calling As" = Rec."calling as"::"As Non Member" then begin
            AsNonmember := true;
            Asother := true;
        end;
        if Rec."Calling As" = Rec."calling as"::"As Employer" then begin
            AsEmployer := true;
            Asother := true;
            Ascase := true;
            CaseEmployer := true;
        end;

        if Rec."Employment Info" = Rec."employment info"::Employed then begin
            EmployerCodeEditable := false;
            DepartmentEditable := false;
            TermsofEmploymentEditable := true;
            ContractingEditable := false;
            EmployedEditable := false;
            OccupationEditable := false;
            PositionHeldEditable := false;
            EmploymentDateEditable := false;
            EmployerAddressEditable := false;
            NatureofBussEditable := false;
            IndustryEditable := false;
            BusinessNameEditable := false;
            PhysicalBussLocationEditable := false;
            YearOfCommenceEditable := false;



        end else
            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                ContractingEditable := false;
                EmployerCodeEditable := false;
                DepartmentEditable := false;
                TermsofEmploymentEditable := false;
                OccupationEditable := false;
                PositionHeldEditable := false;
                EmploymentDateEditable := false;
                EmployerAddressEditable := false;
                NatureofBussEditable := false;
                IndustryEditable := false;
                BusinessNameEditable := false;
                PhysicalBussLocationEditable := false;
                YearOfCommenceEditable := false;
            end else
                if Rec."Employment Info" = Rec."employment info"::Others then begin
                    OthersEditable := false;
                    ContractingEditable := false;
                    EmployerCodeEditable := false;
                    DepartmentEditable := false;
                    TermsofEmploymentEditable := false;
                    OccupationEditable := false;
                    PositionHeldEditable := false;
                    EmploymentDateEditable := false;
                    EmployerAddressEditable := false
                end else
                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                        OccupationEditable := false;
                        EmployerCodeEditable := false;
                        DepartmentEditable := false;
                        TermsofEmploymentEditable := false;
                        ContractingEditable := false;
                        EmployedEditable := false;
                        NatureofBussEditable := false;
                        IndustryEditable := false;
                        BusinessNameEditable := false;
                        PhysicalBussLocationEditable := true;
                        YearOfCommenceEditable := false;
                        PositionHeldEditable := false;
                        EmploymentDateEditable := false;
                        EmployerAddressEditable := false

                    end;


        LoanNoVisible := false;
        if Rec."Type of Cases" = Rec."type of cases"::Loan then begin
            LoanNoVisible := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        AsEmployer := false;
        Asmember := false;
        AsNonmember := false;
        Asother := false;
        Ascase := false;
        CaseEmployer := false;
        CaseEnabled := false;

        if Rec."Calling As" = Rec."calling as"::"As Member" then begin
            Asmember := true;
            AsEmployer := false;
            Ascase := true;
            CaseEnabled := true;

        end;
        if Rec."Calling As" = Rec."calling as"::"As Employer" then begin
            AsEmployer := true;
            Ascase := true;
            CaseEmployer := true;

        end;

        if Rec."Employment Info" = Rec."employment info"::Employed then begin
            EmployerCodeEditable := false;
            DepartmentEditable := false;
            TermsofEmploymentEditable := true;
            ContractingEditable := false;
            EmployedEditable := false;
            OccupationEditable := false;
            PositionHeldEditable := false;
            EmploymentDateEditable := false;
            EmployerAddressEditable := false;
            NatureofBussEditable := false;
            IndustryEditable := false;
            BusinessNameEditable := false;
            PhysicalBussLocationEditable := false;
            YearOfCommenceEditable := false;



        end else
            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                ContractingEditable := false;
                EmployerCodeEditable := false;
                DepartmentEditable := false;
                TermsofEmploymentEditable := false;
                OccupationEditable := false;
                PositionHeldEditable := false;
                EmploymentDateEditable := false;
                EmployerAddressEditable := false;
                NatureofBussEditable := false;
                IndustryEditable := false;
                BusinessNameEditable := false;
                PhysicalBussLocationEditable := false;
                YearOfCommenceEditable := false;
            end else
                if Rec."Employment Info" = Rec."employment info"::Others then begin
                    OthersEditable := false;
                    ContractingEditable := false;
                    EmployerCodeEditable := false;
                    DepartmentEditable := false;
                    TermsofEmploymentEditable := false;
                    OccupationEditable := false;
                    PositionHeldEditable := false;
                    EmploymentDateEditable := false;
                    EmployerAddressEditable := false
                end else
                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                        OccupationEditable := false;
                        EmployerCodeEditable := false;
                        DepartmentEditable := false;
                        TermsofEmploymentEditable := false;
                        ContractingEditable := false;
                        EmployedEditable := false;
                        NatureofBussEditable := false;
                        IndustryEditable := false;
                        BusinessNameEditable := false;
                        PhysicalBussLocationEditable := true;
                        YearOfCommenceEditable := false;
                        PositionHeldEditable := false;
                        EmploymentDateEditable := false;
                        EmployerAddressEditable := false

                    end;

        LoanNoVisible := false;
        if Rec."Type of Cases" = Rec."type of cases"::Loan then begin
            LoanNoVisible := true;
        end;
    end;

    var
        Cust: Record Customer;
        CustCare: Record "General Equiries.";
        CQuery: Record "General Equiries.";
        LeadM: Record "Lead Management";
        entry: Integer;
        vend: Record Vendor;
        CASEM: Record "Cases Management";
        AsEmployer: Boolean;
        Asmember: Boolean;
        AsNonmember: Boolean;
        Asother: Boolean;
        Ascase: Boolean;
        Leadacc: Record "Lead Management";
        LeadAcc2: Record "Lead Management";
        OK: Boolean;
        LeadSetup: Record "Crm General Setup.";
        LeadNo: Code[10];
        NoSeriesMgt: Codeunit "No. Series";
        CaseNO: Code[10];
        CaseSetup: Record "Crm General Setup.";
        Sure: Boolean;
        Yah: Boolean;
        CaseEnabled: Boolean;
        CaseEmployer: Boolean;
        EmploymentInfoEditable: Boolean;
        EmployedEditable: Boolean;
        ContractingEditable: Boolean;
        NatureofBussEditable: Boolean;
        IndustryEditable: Boolean;
        BusinessNameEditable: Boolean;
        PhysicalBussLocationEditable: Boolean;
        YearOfCommenceEditable: Boolean;
        PositionHeldEditable: Boolean;
        EmploymentDateEditable: Boolean;
        EmployerAddressEditable: Boolean;
        EmployerCodeEditable: Boolean;
        DepartmentEditable: Boolean;
        TermsofEmploymentEditable: Boolean;
        OccupationEditable: Boolean;
        OthersEditable: Boolean;
        MonthlyIncomeEditable: Boolean;
        LoanNoVisible: Boolean;
        ObjCaseDetails: Record "Case Details";
        ObjCaseDetails2: Record "Case Details";
        CaseNotification: label '<p style="font-family:Verdana,Arial;font-size:10pt">Dear<b> %1,</b></p><p style="font-family:Verdana,Arial;font-size:9pt">Case Resolution Notification</p><p style="font-family:Verdana,Arial;font-size:9pt">You have been assigned a Member case no: %2  belonging to Member No  %3  by %4.Login to the case management module to see full details of the case,</p><p style="font-family:Verdana,Arial;font-size:9pt"> </b></p><br>Regards<p>%5</p><p><b>KINGDOM SACCO LTD</b></p>';

    local procedure FnSendEmailNotification()
    var
    // SMTPSetup: Record "Email Account";
    // SMTPMail: Codeunit Mail;
    // FileName: Text[100];
    // Attachment: Text[250];
    // CompanyInfo: Record "Company Information";
    begin
        /*SMTPSetup.GET();
        
          IF "Escalated User Email"='' THEN
            BEGIN
              ERROR ('Email Address Missing for User' +'-'+ "Caller Reffered To");
            END;
          IF "Escalated User Email"<>'' THEN
            //SMTPMail.CreateMessage(SMTPSetup."Email Sender Name",SMTPSetup."Email Sender Address","Escalated User Email",'Case Resolution Notification','',TRUE);
            //SMTPMail.AddBodyline(STRSUBSTNO(CaseNotification,"Caller Reffered To",No,"Member No",USERID,USERID));
            //SMTPMail.AddBodyline(SMTPSetup."Email Sender Name");
            //SMTPMail.AddBodyline('<br><br>');
            SMTPMail.AddAttachment(FileName,Attachment);
            //SMTPMail.Send;
            MESSAGE('Email Sent');*/

    end;
}

