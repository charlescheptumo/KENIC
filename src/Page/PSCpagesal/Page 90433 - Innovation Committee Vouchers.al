page 90433 "Innovation Committee Vouchers"
{
    CardPageID = "Innovation Committee Voucher";
    PageType = List;
    SourceTable = 80257;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Min Required No. of Members"; Rec."Min Required No. of Members")
                {
                    ToolTip = 'Specifies the value of the Min Required No. of Members field.';
                }
                field("Actual No. of Committee Memb"; Rec."Actual No. of Committee Memb")
                {
                    ToolTip = 'Specifies the value of the Actual No. of Committee Members field.';
                }
                field(Duration; Rec.Duration)
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
            }
        }
    }

    actions
    {
    }
}

