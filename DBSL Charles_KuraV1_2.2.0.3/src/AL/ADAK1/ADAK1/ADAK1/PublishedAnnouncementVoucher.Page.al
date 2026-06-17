#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69824 "Published Announcement Voucher"
{
    Caption = 'Published Announcement Voucher';
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Vacancy Announcement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Announcement No."; Rec."Announcement No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Announcement No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("HR Officer User ID"; Rec."HR Officer User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Officer User ID field.';
                }
                field("HR Officer Staff No."; Rec."HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Officer Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
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
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                }
                field("Application Closing  Time"; Rec."Application Closing  Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing  Time field.';
                }
                field("No. of Job Vacancies"; Rec."No. of Job Vacancies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Job Vacancies field.';
                }
                field("Advertisement Cost"; Rec."Advertisement Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Advertisement Cost (LCY) field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Vacancy Status"; Rec."Vacancy Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Status field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part("Advertisement Vacancies"; "Announcement Lines")
            {
                SubPageLink = "Announcement No." = field("Announcement No."),
                              "Posting Type" = field("Posting Type");
            }
            group("Organization Details")
            {
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Organization Overview"; Rec."Organization Overview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Overview field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
            }
            group(Ammendments)
            {
                field(Ammended; Rec.Ammended)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ammended field.';
                }
                field("Ammended By"; Rec."Ammended By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ammended By field.';
                }
                field("Reason for Ammendment"; Rec."Reason for Ammendment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Ammendment field.';
                }
                field("DateTime Ammended"; Rec."DateTime Ammended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime Ammended field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
            }
            systempart(Control42; Notes)
            {
            }
            systempart(Control43; MyNotes)
            {
            }
            systempart(Control44; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Message('Approval Request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify(true);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Message('Approval Request has been cancelled');
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
            action("Re-Open for Ammendment")
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Re-Open for Ammendment action.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    // UserSetup.Reset();
                    // UserSetup.SetRange("User ID",UserId);
                    // UserSetup.FindFirst;
                    // if UserSetup."Ammend Vacancy Adverts" = false then Error('You have not been authorised to ammend vacancy adverts in User Setup');



                    // if Confirm('Do you wish to ammend this vacancy voucher?',false) = false then Error('Process aborted');

                    // TestField("Approval Status","approval status"::Released);
                    // TestField("Reason for Ammendment");
                    // "Approval Status":="approval status"::Open;
                    // "Vacancy Status":="vacancy status"::Draft;
                    // Ammended:=true;
                    // "Ammended By":=UserId;
                    // "DateTime Ammended":=CreateDatetime(Today,Time);
                    // Modify;
                    // //Vacancy Status to Draft
                    // AnnouncementLine.Reset;
                    // AnnouncementLine.SetRange(AnnouncementLine."Announcement No.","Announcement No.");
                    // if AnnouncementLine.FindSet then begin
                    //   //MESSAGE('AnnouncementLine."Announcement No." %1  and "Announcement No."%2',AnnouncementLine."Announcement No.", "Announcement No.");
                    //   repeat
                    //     //advertise no
                    //     Vacancy.Reset;
                    //     Vacancy.SetRange(Vacancy."Document No.",AnnouncementLine."Vacancy ID");
                    //     if Vacancy.FindSet then begin
                    //       //MESSAGE('Vacancy."Document No."%1 and AnnouncementLine."Vacancy ID"%2', Vacancy."Document No.", AnnouncementLine."Vacancy ID");
                    //       Vacancy.Published:=false;
                    //       Vacancy."Date Published":=0D;
                    //       Vacancy."Application Closing Date":=0D;
                    //       Vacancy."Application Closing Time":=0T;
                    //       Vacancy."Vacancy Status":=Vacancy."vacancy status"::Draft;
                    //       Vacancy.Modify(true);
                    //     end
                    //   until
                    // AnnouncementLine.Next=0;
                    // Announcement."Date Published":=0D;
                    // Announcement."Vacancy Status":=Announcement."vacancy status"::Draft;
                    // if not Announcement.Insert(true) then
                    // Announcement.Modify(true);
                    // end;
                    // Message('Ammended Successfully!');
                end;
            }
            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Caption = 'Publish to E-Recruitment Portal';
                Image = PostedPutAway;
                Promoted = true;
                PromotedCategory = Process;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Executes the Publish to E-Recruitment Portal action.';

                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    if Confirm('Are you sure you want to advertise the vacancies on this document?') = true then begin
                        //   Recruitment.AdvertiseVacancy(Rec);
                    end
                    //create ledger entries
                end;
            }
        }
        // Codeunit "Release Purchase Document"Page "Job Board";
        //                     Report                    ReportCodeunit ""
    }


    var
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}