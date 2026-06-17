#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72582 "Inspection Corrective Orders"
{
    PageType = List;
    SourceTable = "Project Inspection Section";
    SourceTableView = where("Section Type" = filter("Corrective Order"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inpection Type"; Rec."Inpection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inpection Type field.';
                }
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Section Type"; Rec."Section Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Section Type" := Rec."section type"::"Corrective Order";
    end;
}

