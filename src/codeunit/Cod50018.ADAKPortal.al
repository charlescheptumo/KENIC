codeunit 57009 ADAKPortal
{
    var
        tueApplicationHeader: Record "TUE Application Header";
        medicationDetails: Record "TUE Medication Details";
        diagnosis: Record "TUE Diagnosis";
        exceptions: Record "Retroactive App Exception";
        athletes: Record Customer;
        medPractitioner: Record Vendor;
        sports: Record Sport;
        discipline: Record "Sport Discipline";
        prohibited: Record "Prohibited Substances";
        licenseBody: Record "Licensing Bodies";


    procedure fnCreateTUEApplicationHeader(ApplicationNo: Code[20]; AthleteNo: Code[20]; TelephoneNo: Text; email: Text; Sport: Code[50]; discipline: Code[50]) status: Text
    begin
        if ApplicationNo = '' then begin
            tueApplicationHeader.Init();
            tueApplicationHeader."Customer No." := AthleteNo;
            tueApplicationHeader.Validate("Customer No.");
            tueApplicationHeader.Telephone := TelephoneNo;
            tueApplicationHeader."E-Mail" := email;
            tueApplicationHeader.Sport := Sport;
            tueApplicationHeader.Discipline := discipline;
            tueApplicationHeader."RetroActive Application?" := false;
            if tueApplicationHeader.Insert(true) then begin

                status := 'success*TUE Application has been created succesfully*' + tueApplicationHeader."No.";
            end else begin
                status := 'danger*An error occured while submitting your Application';
            end;
        end
        else begin
            tueApplicationHeader.Reset();
            tueApplicationHeader.SetRange("No.", ApplicationNo);
            if tueApplicationHeader.FindFirst then begin
                tueApplicationHeader."Customer No." := AthleteNo;
                tueApplicationHeader.Validate("Customer No.");
                tueApplicationHeader.Telephone := TelephoneNo;
                tueApplicationHeader."E-Mail" := email;
                tueApplicationHeader.Sport := Sport;
                tueApplicationHeader.Discipline := discipline;
                if tueApplicationHeader.Modify(true) then begin
                    status := 'success*TUE Application has been Modified succesfully*' + tueApplicationHeader."No.";
                end else begin
                    status := 'danger*An error occured while submitting your Application';
                end
            end;
        end;


    end;

    Procedure PreviousApplication(DocNo: Code[20]): Boolean
    var
        TUEHeader: Record "TUE Application Header";
        TUEHeader1: Record "TUE Application Header";
    begin
        TUEHeader.Reset();
        TUEHeader.SetRange("No.", DocNo);
        if TUEHeader.FindFirst() then begin
            TUEHeader1.Reset();
            TUEHeader1.SetFilter("No.", '<>%1', TUEHeader."No.");
            TUEHeader1.SetRange("Customer No.", TUEHeader."Customer No.");
            if TUEHeader1.FindFirst() then
                exit(true)
            else
                exit(false);
        end;
    end;

    procedure fnRetroactiveApplication(applicationNo: Code[20]; status: Boolean)
    begin
        tueApplicationHeader.Reset();
        tueApplicationHeader.SetRange("No.", applicationNo);
        if tueApplicationHeader.FindFirst then begin
            tueApplicationHeader."RetroActive Application?" := status;
        end;
    end;

    procedure fnCreateRetroactiveApplication(documentNo: Code[20]; retroDate: Date) status: Text
    begin
        tueApplicationHeader.Reset();
        tueApplicationHeader.SetRange("No.", documentNo);
        if tueApplicationHeader.FindFirst then begin
            tueApplicationHeader."RetroActive Start Date" := retroDate;
            if tueApplicationHeader.Modify(true) then begin
                status := 'success*Retroactive Added succesfully*' + tueApplicationHeader."No.";
            end else
                status := 'danger*An error occured while submitting your Application';
        end;

    end;


    procedure fnCreateMedicationDetails(documentNo: Code[20]; AthleteNo: Code[20]; prohibitedSubstance: Code[70]; dosage: Decimal; Route: Code[100]; frequency: Code[50]; DurationOfTreatment: Duration; approved: Boolean) status: Text
    begin
        if documentNo <> '' then begin
            medicationDetails.Init();
            medicationDetails."Document No." := documentNo;
            medicationDetails."Athlete No." := AthleteNo;
            medicationDetails."Prohibited Substance" := prohibitedSubstance;
            medicationDetails.Dosage := dosage;
            medicationDetails."Route Of Administration" := Route;
            medicationDetails.Frequency := frequency;
            medicationDetails."Duration of Treatment" := DurationOfTreatment;
            if medicationDetails.Insert(true) then begin
                status := 'success*TUE Medication Details has been Created succesfully*' + medicationDetails."Document No.";
            end else begin
                status := 'danger*An error occured while submitting your Application';
            end
        end;


    end;

    procedure fnCreateDiagnosis(documentNo: Code[20]; AthleteNo: Code[20]; pDiagnosis: Text[400]) status: Text
    begin
        if documentNo <> '' then begin
            diagnosis.Init();
            diagnosis."Document No." := documentNo;
            diagnosis."Athlete No." := AthleteNo;
            diagnosis.Diagnosis := pDiagnosis;
            if diagnosis.Insert(true) then begin
                status := 'success*TUE Medication Diagnosis has been Created succesfully*' + diagnosis."Document No.";
            end else begin
                status := 'danger*An error occured while submitting your Application';
            end
        end;
    end;

    procedure fnCreateExceptions(documentNo: Code[20]; athleteNo: Code[20]; exception: Text[500]) status: Text
    begin
        if documentNo <> '' then begin
            exceptions.Init();
            exceptions."Document No." := documentNo;
            exceptions."Athlete No." := athleteNo;
            exceptions.Exception := exception;
            if exceptions.Insert(true) then begin
                status := 'success*TUE exceptions has been Created succesfully*' + exceptions."Document No.";
            end else begin
                status := 'danger*An error occured while submitting your Application';
            end
        end;
    end;

    procedure fnAddMedicalPractitioner(documentNo: Code[20]; practioner: Code[20]; speciality: Code[70]; licenseNo: Code[50]; licenseBody: Code[50]; email: Text; declaration: Date) status: Text
    begin
        tueApplicationHeader.Reset();
        tueApplicationHeader.SetRange("No.", documentNo);
        if tueApplicationHeader.FindFirst then begin
            // tueApplicationHeader."Medical Practitioner" := practioner;
            tueApplicationHeader.Physician := practioner;
            // tueApplicationHeader.Validate("Medical Practitioner");
            tueApplicationHeader.Validate(Physician);
            tueApplicationHeader."Medical Specialty" := speciality;
            tueApplicationHeader."License Number" := licenseNo;
            tueApplicationHeader."License Body" := licenseBody;
            tueApplicationHeader."MP E-Mail" := email;
            tueApplicationHeader."MP Declaration Date" := declaration;
            if tueApplicationHeader.Modify(true) then begin
                status := 'success*Physician Added succesfully*' + tueApplicationHeader."No.";
            end else
                status := 'danger*An error occured while submitting your Application';
        end;

    end;

    procedure SendApprovalRequest(docNo: Code[20])
    var
        VarVariant: Variant;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
    begin
        tueApplicationHeader.Reset();
        tueApplicationHeader.SetRange("No.", docNo);
        if tueApplicationHeader.FindFirst then begin
            VarVariant := tueApplicationHeader;
            IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                ApprovalsMgmt.OnSendDocForApproval(VarVariant);
        end;
    end;

    procedure fnAddDeclaration(documentNo: Code[20]; Declaration: Date) status: Text
    begin
        tueApplicationHeader.Reset();
        tueApplicationHeader.SetRange("No.", documentNo);
        if tueApplicationHeader.FindFirst then begin
            tueApplicationHeader."Athlete Declaration Date" := declaration;
            if tueApplicationHeader.Modify(true) then begin
                status := 'success*Athlete Declaration Added succesfully*' + tueApplicationHeader."No.";
            end else
                status := 'danger*An error occured while submitting your Application';
        end;

    end;


    // Get
    procedure fnGetAthletesDetails(athleteNo: Code[20]) data: Text
    begin
        athletes.Reset();
        athletes.setrange("No.", athleteNo);
        athletes.SetRange("Customer Type", athletes."Customer Type"::Athlete);
        if athletes.FindFirst then begin
            data := athletes."First Name" + '*' + athletes."Last Name" + '*' + athletes."Post Code" + '*' +
            Format(athletes.Gender) + '*' + Format(athletes."Date of Birth") + '*' +
            athletes.Address + '*' + athletes.City + '*' + athletes.County + '*' + athletes."E-Mail" + '::::';
        end;
        Exit(data);
    end;

    procedure fnGetAthleteExemptions(athleteNo: Code[20]) data: Text
    begin
        tueApplicationHeader.Reset();
        tueApplicationHeader.setrange("No.", athleteNo);
        if tueApplicationHeader.FindFirst then begin
            data += tueApplicationHeader."No." + '*' + tueApplicationHeader."Last Name" + '*' + Format(tueApplicationHeader."Approval Status") + '*' +
            Format(tueApplicationHeader.Sport) + '*' + Format(tueApplicationHeader.Discipline) + '*' +
            tueApplicationHeader.Address + '*' + tueApplicationHeader.City + '*' + tueApplicationHeader."E-Mail" + '::::';
        end;
        Exit(data);
    end;

    procedure fnGetSports() data: Text
    begin
        if sports.FindSet then begin
            repeat
                data += sports."Sport Code" + '*' + sports.Description + '*' + '::::';
            until sports.Next() = 0;
        end;
        Exit(data);
    end;


    procedure fnGetSportsDisciplines() data: Text
    begin
        discipline.Reset();
        if discipline.FindSet then begin
            repeat
                data += discipline."Discipline Code" + '*' + discipline.Description + '*' + '::::';
            until discipline.Next() = 0;
        end;
        Exit(data);
    end;

    procedure fnGetExceptions() data: Text
    begin
        exceptions.Reset();
        if exceptions.FindSet then begin
            repeat
                data += exceptions.Exception + '*' + exceptions."Athlete No." + '::::';
            until exceptions.Next() = 0;
        end;

        Exit(data);
    end;


    procedure fnGetProhibitedSubstance() data: Text
    begin
        prohibited.Reset();
        if prohibited.FindSet then begin
            repeat
                data += prohibited."Substance Code" + '*' + prohibited."Substance Description" + '::::';
            until prohibited.Next() = 0;
        end;
        Exit(data);
    end;

    procedure fnGetLicenseBody() data: Text
    begin
        licenseBody.Reset();
        if licenseBody.FindSet then begin
            repeat
                data += licenseBody."Licensing Body" + '*' + licenseBody.Description + '::::';
            until licenseBody.Next() = 0;
        end;
        Exit(data);
    end;

    procedure fnGetMedicalPractitioners() data: Text
    var
        Resource: Record Resource;
    begin
        Resource.Reset();
        Resource.SetRange("Resource Type", Resource."Resource Type"::Physician);
        if Resource.FindSet then begin
            repeat
                data += Resource."No." + '*' + Resource.Name + '::::';
            until Resource.Next() = 0;
        end;
    end;

    procedure fnGetMedicationDetails(athleteNo: Code[20]) data: Text
    begin
        medicationDetails.Reset();
        medicationDetails.SetRange("Athlete No.", athleteNo);
        if medicationDetails.FindSet then begin
            data += Format(medicationDetails.Type) + '*' + Format(medicationDetails."Substance Description") + '*' + Format(medicationDetails."Route Of Administration") + '*' +
            Format(medicationDetails.Dosage) + '*' + medicationDetails.Frequency + '*' + Format(medicationDetails."Duration of Treatment") + '*' + Format(medicationDetails.Approved) + '::::';
        end;

    end;


}
