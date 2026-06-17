#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60072 "Board Room Mgt Alloc"
{
    PageType = List;
    SourceTable = "Board Room Management Alloc";
    ApplicationArea = All;

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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Resource No"; Rec."Resource No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No field.';
                }
                field("Allocated Employee"; Rec."Allocated Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated Employee field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Resource Tag"; Rec."Board Room Tag")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Room Tag field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date/Time"; Rec."End Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date/Time field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Return Resource")
            {
                ApplicationArea = Basic;
                Image = ReturnOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Return Resource action.';

                trigger OnAction()
                begin
                    if Confirm('') then begin
                    end;
                end;
            }
        }
    }
}

