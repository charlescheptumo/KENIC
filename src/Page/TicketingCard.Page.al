#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60038 "Ticketing Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Front Office Management";
    DelayedInsert = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the No. field.';

                    trigger OnAssistEdit()
                    begin
                        // IF AssistEdit(xRec) THEN
                        IF Rec.AssistEdit() THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = isNew;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';

                    trigger OnValidate()
                    begin
                        Rec.Date := Today;
                    end;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Customer Group field.';
                }
            }
            group("Enquiry Information")
            {
                Caption = 'Enquiry Information';
                field("Mode of Lodging"; Rec."Mode of Lodging")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Lodging field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Complaint Issue';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Complaint Issue field.';
                }
                field("Services Sought"; Rec."Services Sought")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Services Sought field.';
                }
                field("Case Location"; Rec."Case Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Location field.';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Assignment Details")
            {
                Caption = 'Assignment Details';
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign To field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    // Editable = Corpo;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    // Editable = Corpo;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Assigned Officer No."; Rec."Assigned Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer No. field.';
                }
                field("Assigned Officer Name"; Rec."Assigned Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Assigned Officer Email"; Rec."Assigned Officer Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Email field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Level of Priority"; Rec."Level of Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level of Priority field.';
                }
            }
            group("Ticket Resolution")
            {
                Caption = 'Ticket Resolution';
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
                field("Follow up Actions"; Rec."Follow up Actions")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Follow up Actions field.';
                }
            }
            part("Ticket Assignment Matrix"; "Ticket Assignment Matrix")
            {
                SubPageLink = "No." = FIELD("No."),
                            "Document Type" = FIELD("Document Type");
                Editable = FALSE;
            }
        }
        area(factboxes)
        {
            systempart(Control30; Notes)
            {
            }
            systempart(Control31; MyNotes)
            {
            }
            systempart(Control32; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Additional Case Details")
            {
                ApplicationArea = Basic;
                Caption = 'Additional Complaints Details';
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Additional Complaints Details action.';
            }
            action("Assign Ticket to HOD ")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Corpo;
                ToolTip = 'Executes the Assign Ticket to HOD  action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.Testfield("Assign To", Rec."assign to"::HOD);
                    Rec.Testfield("Level of Priority");
                    Rec.Testfield("Assigned Officer No.");
                    Rec.Testfield("Global Dimension 2 Code");
                    Rec.Testfield("Assigned Officer Email");
                    Rec.Testfield(Comments);

                    Rec.Status := Rec.Status::Assigned;
                    Sendtouser();
                    SendEmailuser();
                    sms();
                    EscalationMatrix.Reset;
                    EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                    EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                    intNo := EscalationMatrix.Count;
                    EscalationMatrix.Init;
                    EscalationMatrix."No." := Rec."No.";
                    EscalationMatrix."Document Type" := Rec."Document Type";
                    EscalationMatrix.Level := intNo + 1;
                    EscalationMatrix."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    EscalationMatrix."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                    EscalationMatrix."Assign To" := Rec."Assign To";
                    //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                    //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                    EscalationMatrix.Comment := Rec.Comments;
                    EscalationMatrix."Assigned Officer No." := Rec."Assigned Officer No.";
                    EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                    EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                    EscalationMatrix."Assigned At" := CurrentDatetime;
                    EscalationMatrix."Assigned By" := UserId;
                    EscalationMatrix.Insert;
                    Rec."Currently Assign To" := Rec."Assign To";
                    Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                    Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                    //"Assigned Officer No." := '';
                    //"Assigned Officer Name" := '';
                    //"Assigned Officer Email" := '';
                    Rec."Assigned to Department" := true;
                    NotifyAssigned(Rec."Assigned Officer Email");
                    // Comments := '';
                    Rec.Modify(true);

                    Message('Case has been Assigned');
                    CurrPage.Close;
                end;
            }
            action("Assign Ticket to CEO")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Corpo;
                ToolTip = 'Executes the Assign Ticket to CEO action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.Testfield("Assign To", Rec."assign to"::CEO);
                    Rec.Testfield("Level of Priority");
                    Rec.Testfield("Assigned Officer No.");
                    Rec.Testfield("Assigned Officer Email");
                    Rec.Testfield("Global Dimension 2 Code");

                    Rec.Testfield(Comments);
                    Rec.Status := Rec.Status::Assigned;
                    Sendtouser();
                    SendEmailuser();
                    sms();
                    EscalationMatrix.Reset;
                    EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                    EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                    intNo := EscalationMatrix.Count;
                    EscalationMatrix.Init;
                    EscalationMatrix."No." := Rec."No.";
                    EscalationMatrix."Document Type" := Rec."Document Type";
                    EscalationMatrix.Level := intNo + 1;
                    EscalationMatrix."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    EscalationMatrix."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                    EscalationMatrix."Assign To" := Rec."Assign To";
                    //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                    //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                    EscalationMatrix.Comment := Rec.Comments;
                    EscalationMatrix."Assigned Officer No." := Rec."Assigned Officer No.";
                    EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                    EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                    EscalationMatrix."Assigned At" := CurrentDatetime;
                    EscalationMatrix."Assigned By" := UserId;
                    EscalationMatrix.Insert;
                    Rec."Currently Assign To" := Rec."Assign To";
                    Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                    Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                    // "Assigned Officer No." := '';
                    // "Assigned Officer Name" := '';
                    // "Assigned Officer Email" := '';
                    Rec."Assigned to Department" := true;
                    NotifyAssigned(Rec."Assigned Officer Email");
                    //Comments := '';
                    Rec.Modify(true);

                    Message('Case has been Assigned');
                    CurrPage.Close;
                end;
            }
            action("Assign Ticket to Staff")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Corpo;
                ToolTip = 'Executes the Assign Ticket to Staff action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.Testfield("Assign To", Rec."assign to"::Staff);
                    Rec.Testfield("Assigned Officer No.");
                    Rec.Testfield("Global Dimension 2 Code");
                    Rec.Testfield("Level of Priority");
                    Rec.Testfield("Assigned Officer Email");
                    Rec.Testfield(Comments);
                    Rec.Status := Rec.Status::Assigned;
                    Sendtouser();
                    SendEmailuser();
                    sms();
                    EscalationMatrix.Reset;
                    EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                    EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                    intNo := EscalationMatrix.Count;
                    EscalationMatrix.Init;
                    EscalationMatrix."No." := Rec."No.";
                    EscalationMatrix."Document Type" := Rec."Document Type";
                    EscalationMatrix.Level := intNo + 1;
                    EscalationMatrix."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    EscalationMatrix."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                    EscalationMatrix."Assign To" := Rec."Assign To";
                    //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                    //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                    EscalationMatrix.Comment := Rec.Comments;
                    EscalationMatrix."Assigned Officer No." := Rec."Assigned Officer No.";
                    EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                    EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                    EscalationMatrix."Assigned At" := CurrentDatetime;
                    EscalationMatrix."Assigned By" := UserId;
                    EscalationMatrix.Insert;
                    Rec."Currently Assign To" := Rec."Assign To";
                    Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                    Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                    //"Assigned Officer No." := '';
                    //"Assigned Officer Name" := '';
                    //"Assigned Officer Email" := '';
                    NotifyAssigned(Rec."Assigned Officer Email");
                    Rec."Assigned to Department" := true;
                    // Comments := '';
                    Rec.Modify(true);

                    Message('Case has been Assigned');
                    CurrPage.Close;
                end;
            }
            action("Return Ticket to Corporate")
            {
                ApplicationArea = Basic;
                Enabled = HOD;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Return Ticket to Corporate action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    if Confirm('Do you want to return this ticket to Corporate for re-roughting?', true) then begin
                        Rec.Testfield(Comments);
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Testfield("Assign To", Rec."assign to"::HOD);
                        Sendtouser();

                        sms();
                        EscalationMatrix.Reset;
                        EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                        EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                        intNo := EscalationMatrix.Count;
                        EscalationMatrix.Init;
                        EscalationMatrix."No." := Rec."No.";
                        EscalationMatrix."Document Type" := Rec."Document Type";
                        EscalationMatrix.Level := intNo + 1;
                        EscalationMatrix."Global Dimension 1 Code" := '';
                        EscalationMatrix."Assign To" := Rec."Assign To";
                        EscalationMatrix."Global Dimension 2 Code" := 'CA';
                        //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                        //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                        EscalationMatrix.Comment := Rec.Comments;
                        EscalationMatrix."Assigned Officer No." := '189';
                        if Emp.Get(EscalationMatrix."Assigned Officer No.") then begin
                            Rec."Assigned Officer Name" := Emp.FullName;
                            Rec."Assigned Officer No." := Emp."No.";
                            Rec."Assigned Officer Email" := Emp."E-Mail";
                        end;
                        EscalationMatrix.Validate("Assigned Officer No.");
                        EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                        EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                        EscalationMatrix."Assigned At" := CurrentDatetime;
                        EscalationMatrix."Assigned By" := UserId;
                        EscalationMatrix.Insert;
                        SendEmailuser();
                        Rec."Currently Assign To" := Rec."Assign To";
                        Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                        Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                        //"Assigned Officer No." := '';
                        //"Assigned Officer Name" := '';
                        //"Assigned Officer Email" := '';
                        Rec."Assigned to Department" := false;
                        // "Global Dimension 1 Code" := '';
                        //"Global Dimension 2 Code" := '';
                        Rec.Comments := '';
                        Rec.Modify(true);
                        NotifyAssigned(Rec."Assigned Officer Email");
                        Message('Case has been Assigned to %1', Rec."Assigned Officer Name");
                        CurrPage.Close;
                    end;
                end;
            }
            action("Assign  Ticket to Legal")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Assign  Ticket to Legal action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.Testfield("Assigned Officer No.");
                    Rec.Testfield(Comments);
                    Rec.Testfield("Level of Priority");
                    //Rec.Testfield("Assign To","Assign To"::Staff);
                    Rec.Testfield("Assign To", Rec."assign to"::Legal);
                    //Status:=Status::Assigned;
                    Rec.Modify;
                    Sendtouser();
                    SendEmailuser();
                    sms();
                    EscalationMatrix.Reset;
                    EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                    EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                    intNo := EscalationMatrix.Count;
                    EscalationMatrix.Init;
                    EscalationMatrix."No." := Rec."No.";
                    EscalationMatrix."Document Type" := Rec."Document Type";
                    EscalationMatrix.Level := intNo + 1;
                    EscalationMatrix."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    EscalationMatrix."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                    //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                    //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                    EscalationMatrix.Comment := Rec.Comments;
                    EscalationMatrix."Assigned Officer No." := Rec."Assigned Officer No.";
                    EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                    EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                    EscalationMatrix."Assign To" := Rec."Assign To";
                    EscalationMatrix."Assigned At" := CurrentDatetime;
                    EscalationMatrix."Assigned By" := UserId;
                    EscalationMatrix.Insert;
                    Rec."Currently Assign To" := Rec."Assign To";
                    Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                    Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                    //"Assigned Officer No." := '';
                    //"Assigned Officer Name" := '';
                    //"Assigned Officer Email" := '';
                    Rec."Assigned to Department" := true;
                    Rec."Assigned to Staff" := true;
                    //Comments := '';
                    Rec.Modify(true);
                    NotifyAssigned(Rec."Assigned Officer Email");
                    Message('Case has been Assigned to %1', Rec."Assigned Officer Name");
                    CurrPage.Close;
                end;
            }
            action("Assign  Ticket to Staff")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Rec."Currently Assign To" = Rec."Currently Assign To"::HOD;
                ToolTip = 'Executes the Assign  Ticket to Staff action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.Testfield("Assigned Officer No.");
                    Rec.Testfield(Comments);
                    Rec.Testfield("Level of Priority");
                    Rec.Testfield("Assign To", Rec."assign to"::Staff);
                    //Status:=Status::Assigned;
                    Rec.Modify;
                    Sendtouser();
                    SendEmailuser();
                    sms();
                    EscalationMatrix.Reset;
                    EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                    EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                    intNo := EscalationMatrix.Count;
                    EscalationMatrix.Init;
                    EscalationMatrix."No." := Rec."No.";
                    EscalationMatrix."Document Type" := Rec."Document Type";
                    EscalationMatrix.Level := intNo + 1;
                    EscalationMatrix."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    EscalationMatrix."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                    //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                    //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                    EscalationMatrix.Comment := Rec.Comments;
                    EscalationMatrix."Assigned Officer No." := Rec."Assigned Officer No.";
                    EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                    EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                    EscalationMatrix."Assign To" := Rec."Assign To";
                    EscalationMatrix."Assigned At" := CurrentDatetime;
                    EscalationMatrix."Assigned By" := UserId;
                    EscalationMatrix.Insert;
                    Rec."Currently Assign To" := Rec."Assign To";
                    Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                    Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                    //"Assigned Officer No." := '';
                    //"Assigned Officer Name" := '';
                    //"Assigned Officer Email" := '';
                    Rec."Assigned to Department" := true;
                    Rec."Assigned to Staff" := true;
                    //Comments := '';
                    Rec.Modify(true);
                    NotifyAssigned(Rec."Assigned Officer Email");
                    Message('Case has been Assigned to %1', Rec."Assigned Officer Name");
                    CurrPage.Close;
                end;
            }
            action("Mark Resolved")
            {
                ApplicationArea = Basic;
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Mark Resolved action.';

                trigger OnAction()
                begin

                    if Rec.Status = Rec.Status::Resolved then
                        Error('Case already resolved');
                    Rec.Testfield(Comments);
                    Rec.Testfield("Level of Priority");
                    Rec.Testfield(Recommendations);
                    Rec.Testfield(Recommendations);
                    Rec.Testfield("Follow up Actions");


                    if Confirm('Are you sure you want to mark this case as resolved?', true) then begin
                        Rec.Status := Rec.Status::Resolved;
                        Rec."Resolved Date" := Today;
                        Rec."Resolved Time" := Rec.Time;
                        Rec."Resolved User" := UserId;
                        Rec."Turn Around Time" := Today - Rec."Date Created";
                        Rec.Modify(true);

                    end;
                    // SendEmailuserResolved();
                    NotifyResolve(Rec.Email);
                    Message('Case resolved');
                    CurrPage.Close;
                end;
            }
            action("Return to HOD ")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Return to HOD  action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.Testfield("Assign To", Rec."assign to"::HOD);
                    Rec.Testfield("Assigned Officer No.");
                    Rec.Testfield("Global Dimension 2 Code");
                    Rec.Testfield(Comments);
                    Rec.Testfield("Level of Priority");
                    Rec.Status := Rec.Status::Assigned;
                    Sendtouser();
                    SendEmailuser();
                    sms();
                    EscalationMatrix.Reset;
                    EscalationMatrix.SetRange(EscalationMatrix."Document Type", Rec."Document Type");
                    EscalationMatrix.SetRange(EscalationMatrix."No.", Rec."No.");
                    intNo := EscalationMatrix.Count;
                    EscalationMatrix.Init;
                    EscalationMatrix."No." := Rec."No.";
                    EscalationMatrix."Document Type" := Rec."Document Type";
                    EscalationMatrix.Level := intNo + 1;
                    EscalationMatrix."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    EscalationMatrix."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                    EscalationMatrix."Assign To" := Rec."Assign To";
                    //EscalationMatrix.VALIDATE("Global Dimension 1 Code");
                    //EscalationMatrix.VALIDATE("Global Dimension 2 Code");
                    EscalationMatrix.Comment := Rec.Comments;
                    EscalationMatrix."Assigned Officer No." := Rec."Assigned Officer No.";
                    EscalationMatrix."Assigned Officer Name" := Rec."Assigned Officer Name";
                    EscalationMatrix."Assigned Officer Email" := Rec."Assigned Officer Email";
                    EscalationMatrix."Assigned At" := CurrentDatetime;
                    EscalationMatrix."Assigned By" := UserId;
                    EscalationMatrix.Insert;
                    Rec."Currently Assign To" := Rec."Assign To";
                    Rec."Currently Assigned Officer No." := Rec."Assigned Officer No.";
                    Rec."Current Assigned Officer Name" := Rec."Assigned Officer Name";
                    Rec."Assigned Officer No." := '';
                    Rec."Assigned Officer Name" := '';
                    Rec."Assigned Officer Email" := '';
                    Rec."Assigned to Department" := true;
                    Rec.Comments := '';
                    Rec.Modify(true);

                    Message('Case has been Returned');
                    CurrPage.Close;
                end;
            }
            action("Close Ticket")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Close Ticket action.';

                trigger OnAction()
                begin

                    if Rec.Status = Rec.Status::Closed then
                        Error('Case already Closed');
                    Rec.Testfield(Comments);
                    Rec.Testfield("Level of Priority");

                    //IF ("Global Dimension 1 Code"<>'CA') THEN BEGIN
                    //  ERROR('Only Corporate Affairs Department is allowed to close a Ticket');
                    //END;

                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    UserSetup.SetRange("Corporate Affairs", false);
                    if UserSetup.FindSet then begin
                        Error('Only Corporate Affairs Department is allowed to close a Ticket');
                    end;

                    if Confirm('Are you sure you want to mark this case as closed?', true) then begin
                        Rec.Status := Rec.Status::Closed;

                        Rec.Modify;
                        //"Date Resolved":=TODAY;
                        //"Time Resolved":=TIME;
                        //"Case Solved" := TRUE;
                        CurrPage.Close;
                    end;
                    //SendEmailuserResolved
                    // FnSendEmaiCustomer2();
                    NotifyComplaint(Rec.Email);
                end;
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(56202, true, true, Rec)
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //SETRANGE("Document Type","Document Type"::Enquiries);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //"Document Type" := "Document Type"::Enquiries;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //"Document Type" := "Document Type"::Enquiries;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Document Type" := "Document Type"::Enquiries;
        Rec."Date Created" := Today;

        if Rec."Document Type" = Rec."Document type"::Complaints then begin
            if Rec."No." <> xRec."No." then
                NoseriesMgt.TestManual(CRMSetup."Complaints No.");
        end;

        if Rec."Document Type" = Rec."Document type"::Complements then begin
            if Rec."No." <> xRec."No." then
                NoseriesMgt.TestManual(CRMSetup."Compliments No.");

        end;

        if Rec."Document Type" = Rec."Document type"::Feedback then begin
            if Rec."No." <> xRec."No." then
                NoseriesMgt.TestManual(CRMSetup."Feedback No.");
        end;

        if Rec."Document Type" = Rec."Document type"::Enquiries then begin
            if Rec."No." <> xRec."No." then
                NoseriesMgt.TestManual(CRMSetup."Enquiries No.");
        end;
    end;

    trigger OnOpenPage()
    begin
        HOD := false;
        isNew := false;
        if Rec."Assigned to Department" = true then begin
            HOD := true;
            Corpo := false;
        end else if Rec."Assigned to Department" = false then begin
            HOD := false;
            Corpo := true;
        end;
        if Rec.Description = '' then
            isNew := true;
    end;

    var
        CustCare: Record "General Equiries.";
        AssignedReas: Record "Cases Management";
        lineno: Integer;
        // notifymail: Codeunit UnknownCodeunit400;
        Asmember: Boolean;
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
        // SMTSetup: Record "SMTP Mail Setup";
        DetaileVisible: Boolean;
        EscalationMatrix: Record "Assignment Escalation Matrix";
        HOD: Boolean;
        Corpo: Boolean;
        Emp: Record Employee;
        isNew: Boolean;
        UserSetup: Record "User Setup";
        TXT: label 'Level of priority have a value in assignment details';
        Emai: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Recepient, Subj, Body : Text;
        NoSeriesMgt: Codeunit "No. Series";
        CRMSetup: Record "CRM Setups";

    procedure NotifyComplaint(Recepient: Text)
    begin
        // Rec.TestField(Rec.Email);
        // Recepient := Rec.Email;
        if Recepient = '' then
            Error('Kindly insert email to send to!');
        Subj := 'Comments on the Resolved Complaint ' + Rec."No.";
        Body := 'Dear ' + Rec."Received From" + ',<BR>';
        Body += 'Your case/complain has been fully resolved on '
        + Format(Today) + '.<BR> Below are the comments:-<br>' + Rec.Comments + '.<BR><BR>Kind Regards,<BR> Anti-Doping Agency of Kenya.';

        EmailMess.Create(Recepient, Subj, Body, true);
        Emai.Send(EmailMess, EmailScen::Default);
    end;

    procedure NotifyAssigned(Recepient: Text)
    begin
        // Rec.TestField(Rec.Email);
        // Recepient := Rec.Email;
        if Recepient = '' then
            Error('Kindly insert email to send to!');
        Subj := 'Assignment of Complaint ' + Rec."No.";
        Body := 'Dear ' + Rec."Received From" + ',<BR>';
        Body += 'You have been assigned the ticket ' + Rec."No." + ' on '
        + Format(Today) + '.<BR> Below are the comments:-<br>' + Rec.Comments + '.<BR><BR>Kind Regards,<BR> Anti-Doping Agency of Kenya.';

        EmailMess.Create(Recepient, Subj, Body, true);
        Emai.Send(EmailMess, EmailScen::Default);
    end;

    procedure NotifyResolve(Recepient: Text)
    begin
        // Rec.TestField(Rec.Email);
        // Recepient := Rec.Email;
        if Recepient = '' then
            Error('Kindly insert email to send to!');
        Subj := 'Resolvement of Complaint ' + Rec."No.";
        Body := 'Dear ' + Rec."Received From" + ',<BR>';
        Body += 'Your ticket' + Rec."No." + ' has been resolved' + ' on '
        + Format(Today) + '.<BR> Below are the comments:-<br>' + '.<BR><BR>Kind Regards,<BR> Anti-Doping Agency of Kenya.';

        EmailMess.Create(Recepient, Subj, Body, true);
        Emai.Send(EmailMess, EmailScen::Default);
    end;

    local procedure sms()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /*  SMSMessages.RESET;
           IF SMSMessages.FIND('+') THEN BEGIN
           iEntryNo:=SMSMessages."Entry No";
           iEntryNo:=iEntryNo+1;
           END
           ELSE BEGIN
           iEntryNo:=1;
           END;

           SMSMessages.RESET;
           SMSMessages.INIT;
           SMSMessages."Entry No":=iEntryNo;
           SMSMessages."Account No":="Member No";
           SMSMessages."Date Entered":=TODAY;
           SMSMessages."Time Entered":=TIME;
           SMSMessages.Source:='Cases';
           SMSMessages."Entered By":=USERID;
           SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
           //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
           SMSMessages."SMS Message":='Your case/complain has been received and assigned to.'+"Resource#1"+
                                     ' kindly contact the resource for follow ups';
           Cust.RESET;
           IF Cust.GET("Member No") THEN
           SMSMessages."Telephone No" := Cust."Phone No.";
           SMSMessages.INSERT;*/

    end;

    local procedure smsResolved()
    var
        iEntryNo: Integer;
        Usersetup: Record User;
        phoneNo: Code[20];
        userAuthorizer: Text;
    begin

        //SMS MESSAGE
        /* SMSMessages.RESET;
         IF SMSMessages.FIND('+') THEN BEGIN
         iEntryNo:=SMSMessages."Entry No";
         iEntryNo:=iEntryNo+1;
         END
         ELSE BEGIN
         iEntryNo:=1;
         END;

         SMSMessages.RESET;
         SMSMessages.INIT;
         SMSMessages."Entry No":=iEntryNo;
         SMSMessages."Account No":="Member No";
         SMSMessages."Date Entered":=TODAY;
         SMSMessages."Time Entered":=TIME;
         SMSMessages.Source:='Cases';
         SMSMessages."Entered By":=USERID;
         SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
         //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
         SMSMessages."SMS Message":='Your case/complain has been resolved by.'+"Resolved User"+
                                   ' Thank you for your being our priority customer';
         Cust.RESET;
         IF Cust.GET("Member No") THEN
         SMSMessages."Telephone No" := Cust."Phone No.";
         SMSMessages.INSERT;*/

    end;

    local procedure Sendtouser()
    var
        iEntryNo: Integer;
        Usersetup: Record User;
        phoneNo: Code[20];
        userAuthorizer: Text;
    begin
        /*Usersetup.RESET;
        Usersetup.SETRANGE(Usersetup."User Name","Resource Assigned");
        IF Usersetup.FIND('-')THEN BEGIN
        phoneNo:=Usersetup."Phone No";
        END;
            IF SMSMessage.FIND('+') THEN BEGIN
              iEntryNo:=SMSMessage."Entry No";
              iEntryNo:=iEntryNo+1;
              END
              ELSE BEGIN
              iEntryNo:=1;
              END;
        
              SMSMessage.RESET;
              SMSMessage.INIT;
              SMSMessage."Entry No":=iEntryNo;
              SMSMessage."Account No":=userAuthorizer;
              SMSMessage."Date Entered":=TODAY;
              SMSMessage."Time Entered":=TIME;
              SMSMessage.Source:= 'CASES';
              SMSMessage."Entered By":=USERID;
              SMSMessage."Sent To Server":=SMSMessage."Sent To Server"::No;
              SMSMessage."SMS Message":='Your have been assigned a cases of '+ "Member No"+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority' ;
              SMSMessage."Telephone No":=phoneNo;
              SMSMessage.INSERT;
              */

    end;

    local procedure SendEmailuser()
    var
        Usersetup: Record "User Setup";
        phoneNo: Code[20];
        UserEmail: Text;
        CaseRec: Record "Cases Management";
    begin

        // SMTSetup.Get;
        //IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
        // notifymail.CreateMessage('Corporate Communication Department', SMTSetup."Email Sender Address", "Assigned Officer Email", 'Case Reported', 'Dear ' + "Assigned Officer Name" + ',  Your have been assigned a complaint from, ' + "Received From" + ' Subject: ' +
        // Subject +


        // Format(Today) + '. Kindly Login to Navision (My Assigned Tickets) and action.', false);
        //notifymail.AddCC(Email);
        // notifymail.Send;

        //END;
    end;

    local procedure Emailcustomer()
    var
        CustomerEmailtext: Text;
    begin
        // SMTSetup.Get;
        CustomerEmailtext := Rec.Email;
        // notifymail.CreateMessage(UserId, SMTSetup."Email Sender Address", CustomerEmailtext, 'Case Reported', 'Dear ' + "Received From" + ' <BR>Your case/complain has been fully resolved by ' + ' User: ' + UserId + '  on '
        // + Format(Today) + '.<BR> Below are the comments:-<br>' + Comments + '.<BR><BR>Kind Regards,<BR> Commission for University Education.', false);
        // notifymail.Send;
    end;

    local procedure SendEmailuserResolved()
    var
        Usersetup: Record "User Setup";
        phoneNo: Code[20];
        UserEmail: Text;
        CaseRec: Record "Cases Management";
    begin

        // SMTSetup.Get;
        //IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
        // notifymail.CreateMessage('CRM Notification', SMTSetup."Email Sender Address", "Assigned Officer Email", 'Case Reported', 'Dear ' + "Assigned Officer Name" + '<BR>,Complaint of ' + "Received From" + ' ' + Description +
        // Format(Today) + ' has been resoved successfully. Kindly Log in to the ERP and check.', false);

        // notifymail.Send;

        //END;
    end;


    procedure FnSendEmaiCustomer2()
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit UnknownCodeunit412;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit UnknownCodeunit400;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        RandomDigit: Text[50];
    begin
        ///Notifying Procurement Team on supplier Request
        // SMTSetup.Get;
        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        Window.Open('Sending...');
        WindowisOpen := true;
        // SenderAddress := SMTSetup."Email Sender Address";
        CustEmail := Rec.Email;
        CompanyDetails := 'Dear ' + Rec."Received From" + ',<BR>';
        SenderMessage := 'Your case/complain has been fully resolved on '
        + Format(Today) + '.<BR> Below are the comments:-<br>' + Rec.Comments + '.<BR><BR>Kind Regards,<BR> Anti-Doping Agency of Kenya.';
        if CustEmail = '' then
            exit;
        emailhdr := 'Case Reported';

        // cu400.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage, true);

        //cu400.AddCC(RequesterEmail);

        // cu400.AppendBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Rec.Time;

        Sleep(1000);
        Window.Close;
    end;
}

