namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Projects.Project.Job;

pageextension 50054 "Purch. Invoice Subform Ext." extends "Purch. Invoice Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("No. of People"; Rec."No. of People")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. of People field.';
            }
            field("No. of Days"; Rec."No. of Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. of Days field.';
            }
            // field("Project Planning Description"; Rec."Project Planning Description")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Project Planning Description field.';
            // }
        }
             addafter("Job Planning Line No.")
        {
            field(ProjectPlanningDescription; ProjectPlanningDescription)
            {
                ApplicationArea = Jobs;
                Caption = 'Project Planning Description';
                Editable = false;
                ToolTip = 'Displays the description of the related project task.';
            }
        
            
        }
        modify("Job Planning Line No.")
        {
            Visible = true;
        }
     
    
}
trigger OnAfterGetCurrRecord()
    begin
        UpdateProjectPlanningDescription();
    end;

     local procedure UpdateProjectPlanningDescription()
    var
        JobTask: Record "Job Task";
    begin
        ProjectPlanningDescription := '';

        if (Rec."Job No." = '') or (Rec."Job Task No." = '') then
            exit;
        if JobTask.Get(Rec."Job No.", Rec."Job Task No.") then
            ProjectPlanningDescription := JobTask.Description;
    end;
var
        ProjectPlanningDescription: Text[100];
}