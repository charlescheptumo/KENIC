#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72460 "Daily Work Record Labours"
{
    PageType = List;
    SourceTable = "Daily Work Record Labor";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Caption = 'Gender';
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Labour Type"; Rec."Labour Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Labour Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Total No. of Staff"; Rec."Total No. of Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Staff field.';
                }
                field("Average ManHours Worked"; Rec."Average ManHours Worked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Average ManHours Worked field.';
                }
                field("Estimate Total Wages Paid"; Rec."Estimate Total Wages Paid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Total Wages Paid (LCY) field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

