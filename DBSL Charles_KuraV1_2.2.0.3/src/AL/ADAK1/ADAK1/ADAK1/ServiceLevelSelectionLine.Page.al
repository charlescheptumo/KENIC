#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72077 "Service Level Selection Line"
{
    PageType = ListPart;
    SourceTable = "Service Level Selection Line";
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
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Service Scope"; Rec."Service Scope")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Scope field.';
                }
                field("Service Creteria"; Rec."Service Creteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Creteria field.';
                }
                field("Items To Apply"; Rec."Items To Apply")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Items To Apply field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
            }
        }
    }

    actions
    {
    }
}

