#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69802 "Shortlist Score Guide"
{
    PageType = List;
    SourceTable = "Candidate Shortlist Score Guid";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field("Requirement Name"; Rec."Requirement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Requirement Name field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Score Code"; Rec."Score Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Points; Rec.Points)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Points field.';
                }
            }
        }
    }

    actions
    {
    }
}

