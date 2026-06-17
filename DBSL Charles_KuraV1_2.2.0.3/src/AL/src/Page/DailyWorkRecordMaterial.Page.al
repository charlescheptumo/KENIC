
Page 72440 "Daily Work Record Material"
{
    PageType = Card;
    SourceTable = "Daily Work Record Material";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = Basic;
                    Visible = true;
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
                field("Vehicle Capacity"; Rec."Vehicle Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Capacity field.';
                }
                field("Capacity Unit of Measure"; Rec."Capacity Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capacity Unit of Measure field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';

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
                    ToolTip = 'Specifies the value of the Reasons for Removal field.';
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



