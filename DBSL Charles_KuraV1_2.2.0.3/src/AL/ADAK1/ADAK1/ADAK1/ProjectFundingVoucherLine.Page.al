#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72061 "Project Funding Voucher Line"
{
    PageType = ListPart;
    SourceTable = "Project Funding Voucher Line";
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Link Name field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Estimated Cost field.';
                }
                field("Total Estimated Cost(LCY)"; Rec."Total Estimated Cost(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Estimated Cost(LCY) field.';
                }
                field("Revision Status"; Rec."Revision Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Status field.';
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(Km) field.';
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(Km) field.';
                }
                field("Surface Type"; Rec."Surface Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surface Type field.';
                }
                field("Work Category"; Rec."Work Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Category field.';
                }
                field("Fund Type"; Rec."Fund Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Type field.';
                }
                field("Execution Method"; Rec."Execution Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Execution Method field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Details Of Road Activities")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Add;
                    RunObject = Page "Details Of Road Activities";
                    RunPageLink = "WorkPlan No" = field("Document No"),
                                  "Road Code" = field("Road Code"),
                                  "Section Code" = field("Section Code");
                    ToolTip = 'Executes the Details Of Road Activities action.';
                }
                action("Work Schedule(%)")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Suggest;
                    RunObject = Page "Work Schedule";
                    RunPageLink = "Workplan No" = field("Document No");
                    ToolTip = 'Executes the Work Schedule(%) action.';
                }
            }
        }
    }
}

