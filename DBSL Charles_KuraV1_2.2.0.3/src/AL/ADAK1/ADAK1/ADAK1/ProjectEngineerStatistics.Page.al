#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72045 "Project Engineer Statistics"
{
    Editable = false;
    PageType = Card;
    SourceTable = Resource;
    SourceTableView = where("Project Engineer" = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("No. Of Ongoing Road Projects"; Rec."No. Of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Ongoing Road Projects field.';
                }
                field("No. Of Finished Road Projects"; Rec."No. Of Finished Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Finished Road Projects field.';
                }
                field("No. Of Planned Road Projects"; Rec."No. Of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Planned Road Projects field.';
                }
            }
            part(Control11; "Grant Funding Sub List")
            {
                SubPageLink = "Principal Investigator" = field("No.");
                Visible = false;
            }
            part(Control12; "Project Funding Con. Sub List")
            {
                SubPageLink = "Person Responsible" = field("No.");
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

