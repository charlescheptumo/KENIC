#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75060 "Procurement Plan Schedule"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "PP Purchase Activity Schedule";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PP Entry"; Rec."PP Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Entry field.';
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Category field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Planned Days"; Rec."Planned Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Days field.';
                }
                field("Actual Days"; Rec."Actual Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Days field.';
                }
                field("Planned Dates"; Rec."Planned Dates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Dates field.';
                }
                field("Actual Dates"; Rec."Actual Dates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Dates field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        PurchaseActivityPlanNo: Code[20];
       // [InDataSet]
        PurchaseActivityPlanNoVisible: Boolean;
       // [InDataSet]
        PurchaseActivityPlanLineNoVisible: Boolean;


    procedure SetPurchaseActivityNo(No: Code[20])
    begin
        PurchaseActivityPlanNo := No;
    end;


    procedure SetPurchaseActivityNoVisible(NewJobNoVisible: Boolean)
    begin
        PurchaseActivityPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetPurchaseActivityLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        PurchaseActivityPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

