#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69635 "Vacancy Requirements"
{
    PageType = ListPart;
    SourceTable = "Recruitment Req Requirement";
    SourceTableView = where("Document Type" = filter("Job Vacancy"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Mandatory,Added Advantage,Affirmative Action,PWD';
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Substitute Qualification Exist"; Rec."Substitute Qualification Exist")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Substitute Qualification Exist field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Job Vacancy";
    end;
}

