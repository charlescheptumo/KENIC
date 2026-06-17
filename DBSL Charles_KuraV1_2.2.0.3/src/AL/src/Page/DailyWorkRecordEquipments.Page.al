#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72441 "Daily Work Record Equipments"
{
    CardPageID = "Daily Work Record Equipment";
    PageType = List;
    SourceTable = "Daily Work Record Equipment";
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Equipment No."; Rec."Equipment No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Equipment No. field.';
                }
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial/Registration No."; Rec."Serial/Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial/Registration No. field.';
                }
                field("Photo No."; Rec."Photo No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo No. field.';
                }
                field("Equipment Utilization"; Rec."Equipment Utilization")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Utilization field.';
                }
                field("Equipment Usage Hours"; Rec."Equipment Usage Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Usage Hours field.';
                }
                field("Equipment Idle Hours"; Rec."Equipment Idle Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Idle Hours field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Work Execution Programme ID"; Rec."Work Execution Programme ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Programme ID field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
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

