#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60085 "Submitted Reservation Lines"
{
    PageType = ListPart;
    SourceTable = "Board Room Management Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Resource No"; Rec."Resource No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Resource No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Allocated Resource No"; Rec."Allocated Resource No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated Resource No field.';
                }
                field("Allocated Resource Name"; Rec."Allocated Resource Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Allocated Resource Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Time field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Assign Resources")
            {
                RunObject = Page 60072;
                RunPageLink = "Line No" = FIELD("Line No"),
                                  No = FIELD(No);
                ToolTip = 'Executes the Assign Resources action.';
                trigger OnAction()
                BEGIN
                    //IF CONFIRM('Are you sure you want to allocate reosurce',TRUE) THEN BEGIN
                    //PAGE.RUN(60072);
                    //END;
                END;
            }
        }
    }
}

