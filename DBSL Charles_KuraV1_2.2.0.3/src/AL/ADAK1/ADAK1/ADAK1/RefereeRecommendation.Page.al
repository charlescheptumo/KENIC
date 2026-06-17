#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69755 "Referee Recommendation"
{
    ApplicationArea = Basic;
    CardPageID = "Referee Recommendation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Referee Recommendation";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Background Checks Invitation"; Rec."Background Checks Invitation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Background Checks Invitation field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Referee Id"; Rec."Referee Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Id field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title/Designation field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Known From"; Rec."Known From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Known From field.';
                }
                field("Known To"; Rec."Known To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Known To field.';
                }
                field("Candidate Last Job Title"; Rec."Candidate Last Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Last Job Title field.';
                }
                field("Staff Exit Reason Code"; Rec."Staff Exit Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Exit Reason Code field.';
                }
                field("Recommend For Hire"; Rec."Recommend For Hire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommend For Hire field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

