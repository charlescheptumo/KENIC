#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99456 "Impact of Road Intervantion"
{
    PageType = ListPart;
    SourceTable = "Impact OF Road Intervention";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Extent Of Agrrement Measure"; Rec."Extent Of Agrrement Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agrrement Measure On Impact Code';
                    ToolTip = 'Specifies the value of the Extent Of Agrrement Measure On Impact Code field.';
                }
                field("Extent Description"; Rec."Extent Description")
                {
                    ApplicationArea = basic;
                    Caption = 'Extent Of Agrrement Measure On Impact Description';
                    ToolTip = 'Specifies the value of the Extent Of Agrrement Measure On Impact Description field.';
                }
                field("Respondent Answer"; Rec."Respondent Answer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Respondent Answer field.';
                }
                field("Measure Value"; Rec."Measure Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Measure Value field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

