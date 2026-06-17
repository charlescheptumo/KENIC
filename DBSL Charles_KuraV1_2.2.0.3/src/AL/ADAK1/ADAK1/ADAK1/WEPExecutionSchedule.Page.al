#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72265 "WEP Execution Schedule"
{
    PageType = ListPart;
    SourceTable = "WEP Execution Schedule";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'BOQ No.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the BOQ No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Scheduled Start Date"; Rec."Scheduled Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled Start Date field.';
                }
                field("Scheduled End Date"; Rec."Scheduled End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled End Date field.';
                }
                field("Budget (Total Cost)"; Rec."Budget (Total Cost)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget (Total Cost) field.';
                }
                field("Job Task Type"; Rec."Job Task Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Type';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

