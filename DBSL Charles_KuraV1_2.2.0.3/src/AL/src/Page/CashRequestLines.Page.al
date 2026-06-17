#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57213 "Cash Request Lines"
{
    PageType = ListPart;
    SourceTable = "Cash Request Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFMIS CODE"; Rec."IFMIS CODE")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFMIS CODE field.';
                }
                field("Contractor ID"; Rec."Contractor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor ID field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Reference No. (Cert No.)"; Rec."Reference No. (Cert No.)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. (Cert No.) field.';
                }
                field("Cert Amount"; Rec."Cert Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cert Amount field.';
                }
                field("Amount Outstanding"; Rec."Amount Outstanding")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Outstanding field.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field("Previous Budget"; Rec."Previous Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Budget field.';
                }
                field("This Request"; Rec."This Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the This Request field.';
                }
            }
        }
    }

    actions
    {
    }
}

