
page 99667 "Workplan Consultancy Projects"
{
    PageType = List;
    SourceTable = "Workplan Consultancy Projects";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Consultancy Project Type"; Rec."Consultancy Project Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consultancy Project Type field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Consultancy Project Category"; Rec."Consultancy Project Category")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consultancy Project Category field.';
                }
                field("Bridge Location (KM)"; Rec."Bridge Location (KM)")
                {
                    Enabled = Rec."Consultancy Project Category" = Rec."Consultancy Project Category"::"Geotechnical Investigations";
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bridge Location (KM) field.';
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
            }
        }
    }

    actions
    {
    }
}



