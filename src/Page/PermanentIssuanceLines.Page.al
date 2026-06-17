#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56160 "Permanent Issuance  Lines"
{
    PageType = ListPart;
    SourceTable = 56062;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration of Use start date field.', Comment = '%';
                }
                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No field.', Comment = '%';
                }
                field("Reason For Movement"; Rec."Reason For Movement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Movement field.', Comment = '%';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
                field("Return Reason"; Rec."Return Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Reason field.', Comment = '%';
                }
                field("Return Condition"; Rec."Return Condition")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Return Condition field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
    }
}
