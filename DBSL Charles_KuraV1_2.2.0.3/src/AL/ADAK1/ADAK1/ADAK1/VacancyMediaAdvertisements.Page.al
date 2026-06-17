#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69141 "Vacancy Media Advertisements"
{
    PageType = ListPart;
    SourceTable = "Job Advert Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy No."; Rec."Vacancy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy No. field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Outlet Used"; Rec."Outlet Used")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outlet Used field.';
                }
                field("Media Outlet"; Rec."Media Outlet")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Media Outlet field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the URL field.';
                }
            }
        }
    }

    actions
    {
    }
}

