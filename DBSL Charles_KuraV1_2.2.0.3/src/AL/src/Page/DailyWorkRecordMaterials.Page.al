#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72439 "Daily Work Record Materials"
{
    CardPageID = "Daily Work Record Material";
    PageType = List;
    SourceTable = "Daily Work Record Material";
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
                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Movement Type field.';
                }
                field("Material ID"; Rec."Material ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Base Unit of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Photo No."; Rec."Photo No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo No. field.';
                }
                field("Material Test Record ID"; Rec."Material Test Record ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Test Record ID field.';
                }
                field("Reasons for Removal"; Rec."Reasons for Removal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Where Material was Utilized';
                    Visible = reasonsforremovalisvisible;
                    ToolTip = 'Specifies the value of the Where Material was Utilized field.';
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

    trigger OnAfterGetRecord()
    begin
        reasonsforremovalisvisible := false;
        if Rec."Movement Type" in [Rec."movement type"::"Removed From Site"] then begin
            reasonsforremovalisvisible := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        reasonsforremovalisvisible := false;
        if Rec."Movement Type" in [Rec."movement type"::"Removed From Site"] then begin
            reasonsforremovalisvisible := true;
        end;
    end;

    var
        reasonsforremovalisvisible: Boolean;
}

