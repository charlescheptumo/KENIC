#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69135 "Professional Qualifications"
{
    PageType = ListPart;
    SourceTable = "Applicant Background";
    SourceTableView = where(Type = filter("Professional Qualification"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Attainment; Rec.Attainment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attainment field.';
                }
                field(Specialization; Rec.Specialization)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialization field.';
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

