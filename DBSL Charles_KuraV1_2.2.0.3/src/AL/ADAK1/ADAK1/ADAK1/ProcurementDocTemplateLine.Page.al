#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75025 "Procurement Doc Template Line"
{
    Caption = 'Procurement Document Template Line';
    PageType = ListPart;
    SourceTable = "Procurement Doc Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Process"; Rec."Procurement Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Process field.';
                }
                field("Procurement Document Type"; Rec."Procurement Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Type field.';
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
                field("Part of Contract Document"; Rec."Part of Contract Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part of Contract Document field.';
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Certificate Expiry field.';
                }
                field("Guidelines/Instruction"; Rec."Guidelines/Instruction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guidelines/Instruction field.';
                }
            }
        }
    }

    actions
    {
    }
}

