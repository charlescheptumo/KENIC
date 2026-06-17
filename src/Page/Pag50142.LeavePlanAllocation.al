page 50142 "Leave Plan Allocation"
{
    ApplicationArea = All;
    Caption = 'Leave Plan Allocation';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            grid(General)
            {
                Caption = 'General';
                group(Control2)
                {
                    ShowCaption = false;
                    field(TotalQty; TotalQty)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Total Quantity';
                        Editable = false;
                        ToolTip = 'Specifies the allocation of posted Leave Plan lines.';
                    }
                    field(AllocatedQty; AllocatedQty)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Allocated Quantity';
                        Editable = false;
                        ToolTip = 'Specifies the sum of the hours that have been allocated on the Leave Plan. The allocated number of hours must equal the total number of hours.';
                    }
                }
            }
            grid("Leave Plan Period")
            {
                Caption = 'Leave Plan Period';
                group(Control13)
                {
                    ShowCaption = false;
                    field(DateQuantity1; DateQuantity[1])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[1];
                        ToolTip = 'Specifies the value of the DateQuantity[1] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                    field(DateQuantity2; DateQuantity[2])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[2];
                        ToolTip = 'Specifies the value of the DateQuantity[2] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                    field(DateQuantity3; DateQuantity[3])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[3];
                        ToolTip = 'Specifies the value of the DateQuantity[3] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                    field(DateQuantity4; DateQuantity[4])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[4];
                        ToolTip = 'Specifies the value of the DateQuantity[4] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                    field(DateQuantity5; DateQuantity[5])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[5];
                        ToolTip = 'Specifies the value of the DateQuantity[5] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                    field(DateQuantity6; DateQuantity[6])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[6];
                        ToolTip = 'Specifies the value of the DateQuantity[6] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                    field(DateQuantity7; DateQuantity[7])
                    {
                        ApplicationArea = Jobs;
                        CaptionClass = '3,' + DateDescription[7];
                        ToolTip = 'Specifies the value of the DateQuantity[7] field.';

                        trigger OnValidate()
                        begin
                            UpdateQty();
                        end;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        Calendar: Record Date;
        i: Integer;
    begin
        Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
        Calendar.SetRange("Period Start", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
        if Calendar.FindSet() then
            repeat
                i += 1;
                DateDescription[i] := LeavePlanMgt.FormatDate(Calendar."Period Start", 0);
                if LeavePlanDetail.Get(LeavePlanLine."Leave Plan No.", LeavePlanLine."Line No.", Calendar."Period Start") then
                    DateQuantity[i] := LeavePlanDetail.Quantity;
            until Calendar.Next() = 0;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then
            if TotalQty <> AllocatedQty then
                Error(Text001);
    end;

    var
        LeavePlanHeader: Record "Leave Plan Header";
        LeavePlanLine: Record "Leave Plan Lines";
        LeavePlanDetail: Record "Leave Plan Detail";
        LeavePlanMgt: Codeunit "Leave Plan Management";
        DateDescription: array[7] of Text[30];
        DateQuantity: array[7] of Decimal;
        TotalQty: Decimal;
        AllocatedQty: Decimal;
        Text001: Label 'Allocated quantity must be equal to total quantity.';

    procedure InitParameters(LeavePlanNo: Code[20]; LeavePlanLineNo: Integer; QtyToAllocate: Decimal)
    begin
        LeavePlanHeader.Get(LeavePlanNo);
        LeavePlanLine.Get(LeavePlanNo, LeavePlanLineNo);
        TotalQty := QtyToAllocate;
        AllocatedQty := QtyToAllocate;
    end;

    local procedure UpdateQty()
    var
        i: Integer;
    begin
        AllocatedQty := 0;
        for i := 1 to 7 do
            AllocatedQty += DateQuantity[i];
    end;

    procedure GetAllocation(var Quantity: array[7] of Decimal)
    begin
        CopyArray(Quantity, DateQuantity, 1);
    end;
}
