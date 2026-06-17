#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72210 "Staff Role Code"
{
    PageType = List;
    SourceTable = "Project Staff Role Code";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field("Team Type"; Rec."Team Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Type field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Multiple Projects"; Rec."Multiple Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Multiple Projects field.';
                }
                field("Resident Engineer"; Rec."Resident Engineer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Staff Role Supervisors")
            {
                ApplicationArea = Basic;
                Image = ServiceMan;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Staff Role Supervisors";
                RunPageLink = "Staff Role Code" = field("Staff Role Code");
                ToolTip = 'Executes the Staff Role Supervisors action.';
            }
            action("Staff Functions")
            {
                ApplicationArea = Basic;
                Image = ServiceMan;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Staff Appointment Function";
                RunPageLink = "Staff Role Code" = field("Staff Role Code");
                ToolTip = 'Executes the Staff Functions action.';
            }
        }
    }
}

