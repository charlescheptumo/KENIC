#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69838 "Hand Over Item Lines"
{
    PageType = ListPart;
    SourceTable = "Hand over Item Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Directorate Name field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Department Name field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Receieve)
            {
                ApplicationArea = Basic;
                Image = Return;
                ToolTip = 'Executes the Receieve action.';

                trigger OnAction()
                begin
                    Rec.TestField("Return Date");
                    Rec."Received By" := UserId;
                    Rec."Received Date" := Today;
                    Rec.Receiveved := true;
                    Rec.Modify;
                    Message('Received successfully');
                end;
            }
        }
    }
}

