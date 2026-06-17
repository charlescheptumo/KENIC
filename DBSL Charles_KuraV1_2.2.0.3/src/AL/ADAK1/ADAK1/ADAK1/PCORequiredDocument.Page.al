#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings


Page 72239 "PCO Required Document"
{
    PageType = List;
    SourceTable = "PCO Required Document";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Notice No."; Rec."Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Guidelines/Instructions"; Rec."Guidelines/Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guidelines/Instructions field.';
                }
                field("Due Date Calculation(Days)"; Rec."Due Date Calculation(Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date Calculation(Days) field.';
                }

                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Mobilization Document"; Rec."Mobilization Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobilization Document field.';
                }
                field("Program of Works"; Rec."Program of Works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Program of Works field.';
                }
            }
        }
    }

    actions
    {
    }
}





