pageextension 50008 "Misc. Article Information" extends "Misc. Article Information"
{
    layout
    {
        addafter("To Date")
        {

            field("Type"; Rec."Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Type field.', Comment = '%';
            }
            field(No; Rec.No)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No field.', Comment = '%';
            }
            field("Primary Directorate"; Rec."Primary Directorate")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Directorate field.', Comment = '%';
            }
            field("Primary Directorate Name"; Rec."Primary Directorate Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Directorate Name field.', Comment = '%';
            }
            field("Primary Department"; Rec."Primary Department")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Department field.', Comment = '%';
            }
            field("Primary Department Name"; Rec."Primary Department Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Department Name field.', Comment = '%';
            }


        }
    }
}
