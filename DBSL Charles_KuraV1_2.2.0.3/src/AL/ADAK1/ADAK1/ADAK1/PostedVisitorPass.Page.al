#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56069 "Posted Visitor Pass"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Visitors Pass";
    SourceTableView = where(Status = filter(Released));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile No. field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("Officer to see No"; Rec."Officer to see No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer to see No field.';
                }
                field("Officer to see Name"; Rec."Officer to see Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer to see Name field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(56236, true, true, Rec);
                end;
            }
        }
    }
}

