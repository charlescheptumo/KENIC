#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72019 "Road Study Conclusions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Road Study Result";
    SourceTableView = where("Result Type" = filter(Conclusion));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field("Study Task ID"; Rec."Study Task ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Task ID field.';
                }
                field("Result Type"; Rec."Result Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Result Type field.';
                }
                field("Report Type"; Rec."Report Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Report Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

