#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52023 "Project Funding Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Funding Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Approved Funding Limit"; Rec."Approved Funding Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Funding Limit field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Start Date field.';
                }
                field("Budget End Date"; Rec."Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget End Date field.';
                }
                field("Funding Currency"; Rec."Funding Currency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Currency field.';
                }
                field("Funding Customer"; Rec."Funding Customer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Customer field.';
                }
                field("Job Status"; Rec."Job Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Status field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Project Contract No."; Rec."Project Contract No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Contract No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

