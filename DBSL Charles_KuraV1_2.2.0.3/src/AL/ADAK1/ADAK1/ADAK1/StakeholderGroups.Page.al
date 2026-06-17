#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80006 "Stakeholder Groups"
{
    PageType = List;
    SourceTable = "Stakeholder Group";
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
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Page To field.';
                }
                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Object ID field.';
                }
                field("No. of Sub-Groups"; Rec."No. of Sub-Groups")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Sub-Groups field.';
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked? field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Go To List")
            {
                ApplicationArea = Basic;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Go To List action.';

                trigger OnAction()
                begin
                    RunReportOrPageLink;
                end;
            }
            action("Sub-Groups")
            {
                ApplicationArea = Basic;
                Image = Route;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Stakeholder Sub-Groups";
                RunPageLink = "Stakeholder Group" = field(Code);
                ToolTip = 'Executes the Sub-Groups action.';
            }
        }
    }

    local procedure RunReportOrPageLink()
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        if (Rec."Object Type" = 0) or (Rec."Object ID" = 0) then
            exit;
        if Rec."Object Type" = AllObjWithCaption."object type"::Page then
            Page.Run(Rec."Object ID")
        else
            Report.Run(Rec."Object ID");
    end;
}

