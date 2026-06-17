#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65024 "Research Activities List"
{
    CardPageID = "Research Activities Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Output ID"; Rec."Research Output ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output ID field.';
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
            }
        }
    }

    actions
    {
    }
}

