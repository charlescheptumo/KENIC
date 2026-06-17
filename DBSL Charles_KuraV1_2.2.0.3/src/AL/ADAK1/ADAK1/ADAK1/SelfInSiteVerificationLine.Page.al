#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72102 "Self In Site Verification Line"
{
    PageType = ListPart;
    SourceTable = "Self In Site Verification Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service field.';
                }
                field("Service Scope"; Rec."Service Scope")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Scope field.';
                }
                field(Selection; Rec.Selection)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selection field.';
                }
                field("Service Criteria"; Rec."Service Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Criteria field.';
                }
                field("Total Complied(Km)"; Rec."Total Complied(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Complied(Km) field.';
                }
                field("Total Non Complied(Km)"; Rec."Total Non Complied(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Non Complied(Km) field.';
                }
            }
        }
    }

    actions
    {
    }
}

