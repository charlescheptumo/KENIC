#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72476 "Extension of Time Subpage"
{
    PageType = ListPart;
    SourceTable = "Extension of Time Line";
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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Original Planning Date"; Rec."Original Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Planning Date field.';
                }
                field("Extension Period (Days)"; Rec."Extension Period (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extension Period (Days) field.';
                }
                field("Revised Planning Date"; Rec."Revised Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revised Planning Date field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ProjectVariationHeader.Reset;
        ProjectVariationHeader.SetRange(ProjectVariationHeader."Document No.", Rec."Document No.");
        if ProjectVariationHeader.FindSet then begin
            Rec."Job No." := ProjectVariationHeader."Project ID";
        end;
    end;

    var
        ProjectVariationHeader: Record "Project Variation Header";
}

