#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80062 "Perfomance Rating Scales"
{
    ApplicationArea = Basic;
    CardPageID = "Perfomance Rating Scale";
    PageType = List;
    SourceTable = "Perfomance Rating Scale";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scale Type field.';
                }
                field("Max Excellent Raw Score"; Rec."Max Excellent Raw Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Excellent Raw Score field.';
                }
                field("Least Poor Raw Score"; Rec."Least Poor Raw Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Least Poor Raw Score field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
    }

    actions
    {
    }
}

