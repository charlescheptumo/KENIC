#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56068 "Posted Visitor Pass List"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Visitor Pass";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Visitors Pass";
    SourceTableView = where(Status = filter(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Date of visit"; Rec."Date of visit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of visit field.';
                }
                field("Time of visit"; Rec."Time of visit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of visit field.';
                }
                field("Visitor Name"; Rec."Visitor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitor Name field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
            }
        }
    }

    actions
    {
    }
}

