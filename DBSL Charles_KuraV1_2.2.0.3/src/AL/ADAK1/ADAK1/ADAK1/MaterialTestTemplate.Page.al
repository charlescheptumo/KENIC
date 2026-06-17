#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72430 "Material Test Template"
{
    PageType = Card;
    SourceTable = "Material Test Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Material ID"; Rec."Material ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control8; "Material Test Template Lines")
            {
                SubPageLink = "Template ID" = field("Template ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Materials Deivered To Site")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Materials Deivered To Site action.';
            }
            action("Materials Removed From Site")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Materials Removed From Site action.';
            }
            action("Plant & Equipment")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Plant & Equipment action.';
            }
            action("Key Contractor Staff")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Key Contractor Staff action.';
            }
            action("Visitors Register")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Visitors Register action.';
            }
            action("Risk Incidents")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Risk Incidents action.';
            }
            action("Site Meetings")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Site Meetings action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Send Approval Request action.';
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Cancel Approval Request action.';
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Approvals action.';
            }
            action(Release)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Release action.';
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Reopen action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Print action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Dimensions action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Post action.';
            }
        }
    }
}

