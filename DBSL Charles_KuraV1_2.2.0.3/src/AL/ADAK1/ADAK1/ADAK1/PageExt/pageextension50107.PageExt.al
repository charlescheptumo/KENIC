#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
pageextension 50107 "pageextension50107" extends "Responsibility Center List"
{
    layout
    {
        addafter("Location Code")
        {
            field("Operating Unit Type"; Rec."Operating Unit Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Operating Unit Type field.';
            }
            field("Parent Centre Code"; Rec."Direct Reports To")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Direct Reports To field.';
            }
            field("Matrix Centre Code"; Rec."Indirect Reports To")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Indirect Reports To field.';
            }
            field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Hierarchical Level ID field.';
            }
            field("Headed By (Title)"; Rec."Headed By (Title)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Headed By (Title) field.';
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Current Head field.';
            }
            field(HQ; Rec.HQ)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the HQ field.';
            }
        }
    }

    actions
    {
        addlast(reporting)
        {
            action(PrintOrgStructureSummary)
            {
                ApplicationArea = Basic;
                Caption = 'Organization Structure Summary';
                Image = PrintReport;
                ToolTip = 'Prints the summary of the hierarchical operating units within the organization, showing their levels, mandates, and headcount details.';

                trigger OnAction()
                var
                    RespCenter: Record "Responsibility Center";
                begin
                    RespCenter.Reset();
                   
                    Report.RunModal(50134, true, false, RespCenter);
                end;
            }
        }
        addlast(Category_Process)
        {
            actionref(PrintOrgStructureSummary_Promoted; PrintOrgStructureSummary)
            {
            }
        }
    }
}