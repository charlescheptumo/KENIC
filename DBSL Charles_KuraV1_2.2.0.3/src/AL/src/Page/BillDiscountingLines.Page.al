#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57216 "Bill Discounting Lines"
{
    PageType = ListPart;
    SourceTable = "Bill Discounting Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Pending Certificates"; Rec."Pending Certificates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Certificates field.';
                }
                field("Certificate value deductions"; Rec."Certificate value deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate value deductions field.';
                }
                field("Certificate Amount"; Rec."Certificate Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Amount field.';
                }
                field("Discounted Amount"; Rec."Discounted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discounted Amount field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions
    {
    }
}

