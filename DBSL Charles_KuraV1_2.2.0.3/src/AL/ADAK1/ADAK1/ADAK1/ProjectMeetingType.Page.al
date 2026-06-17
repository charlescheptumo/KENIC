#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72250 "Project Meeting Type"
{
    PageType = Card;
    SourceTable = "Project Meeting Type";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project Stage"; Rec."Project Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Stage field.';
                }
                field("Additional Notes"; Rec."Additional Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Notes field.';
                }
                field("No. Planned"; Rec."No. Planned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Planned field.';
                }
                field("No. Held"; Rec."No. Held")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Held field.';
                }
                field("No. Cancelled"; Rec."No. Cancelled")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Cancelled field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control12; "Project Meeting Agenda Line")
            {
                Caption = 'Default Meeting Agenda';
                SubPageLink = "Project Meeting Type" = field(Code);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Notify RE")
            {
                ApplicationArea = Basic;
                Image = Notes;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Notify RE action.';

                trigger OnAction()
                begin


                    //MESSAGE('Rejected successfully.');
                end;
            }
        }
    }

    var
        ProcProcess: Codeunit "Procurement Processing";
}

