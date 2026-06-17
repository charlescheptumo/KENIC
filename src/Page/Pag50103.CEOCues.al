page 50103 "CEO Cues"
{
    ApplicationArea = All;
    Caption = 'CEO Cues';
    PageType = CardPart;
    SourceTable = "CEO Cues";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(CEOOffice)
            {

                field("Number of Pending Appointments"; Rec."Number of Pending Appointments")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "CEO Appointments";
                    ToolTip = 'Specifies the value of the Number of Pending Appointments field.', Comment = '%';
                }
                field("Number of Accepted Appointments"; Rec."Number of Accepted Appointments")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "CEO Appointments";
                    ToolTip = 'Specifies the value of the Number of Accepted Appointments field.', Comment = '%';
                }
                field("Number of Rescheduled Appointments"; Rec."Number of Rescheduled Appointments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Rescheduled Appointments field.', Comment = '%';
                }
                field("Total Appointments"; Rec."Total Appointments")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "CEO Appointments";
                    ToolTip = 'Specifies the value of the Total Appointments field.', Comment = '%';
                }
                field("Completed Assigned Tasks"; Rec."Completed Assigned Tasks")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "CEO Assign Tasks";
                    ToolTip = 'Specifies the value of the Completed Assigned Tasks field.', Comment = '%';
                }
                field("Uncompleted Assigned Tasks"; Rec."Uncompleted Assigned Tasks")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "CEO Assign Tasks";
                    ToolTip = 'Specifies the value of the Uncompleted Assigned Tasks field.', Comment = '%';
                }
                field("Total Assigned Tasks"; Rec."Total Assigned Tasks")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "CEO Assign Tasks";
                    ToolTip = 'Specifies the value of the Total Assigned Tasks field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;


    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Number of Accepted Appointments");
        Rec.CalcFields("Number of Pending Appointments");
        Rec.CalcFields("Number of Rescheduled Appointments");
        Rec.CalcFields("Total Appointments");
        Rec.CalcFields("Completed Assigned Tasks");
        Rec.CalcFields("Uncompleted Assigned Tasks");
        Rec.CalcFields("Total Assigned Tasks");
        // Rec.CalcFields();
        // Rec.CalcFields();

    end;
}
