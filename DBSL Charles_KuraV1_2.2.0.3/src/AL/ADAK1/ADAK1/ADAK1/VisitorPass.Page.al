#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56064 "Visitor Pass"
{
    PageType = Card;
    SourceTable = "Visitors Pass";
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
                field("Visitor Type"; Rec."Visitor Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Visitor Type field.', Comment = '%';
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
                    Caption = 'Organization';
                    ToolTip = 'Specifies the value of the Organization field.';
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
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time Out field.', Comment = '%';
                }
                field("Officers Comment"; Rec."Officers Comment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officers Comment field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.', Comment = '%';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control18; Notes)
            {
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
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostedMemo;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin

                    //Visitor.TESTFIELD(Visitor."Created By",USERID);
                    Rec.TestField(Reason);
                    Rec.TestField("Visitor Name");
                    Rec.TestField("ID No");
                    Rec.TestField("Officer to see Name");
                    Rec.TestField("Officers Comment");

                    Rec.Modify;
                    // if SetCalendar(Rec) = true then
                    //     Message('Posted successfully');
                    SetCalendar(Rec);


                end;
            }
        }
    }

    var
        text001: label 'Status must be Released to allow posting';
        Visitor: Record "Visitors Pass";

    local procedure SetCalendar("Visitors Pass": Record "Visitors Pass")
    begin

    end;


}

