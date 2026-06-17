#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72708 "Project Correspondences Lines"
{
    PageType = List;
    SourceTable = "Project Correspondence Type";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Initiator Code"; Rec."Default Initiator Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Initiator Code field.';
                }
                field("No of Project Correspondences"; Rec."No of Project Correspondences")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Project Correspondences field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Initiator Designation"; Rec."Initiator Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiator Designation field.';
                }
            }
        }
    }

    actions
    {
    }
}

