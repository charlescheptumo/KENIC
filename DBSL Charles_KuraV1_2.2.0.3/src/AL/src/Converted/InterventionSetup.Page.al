#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99454 "Intervention Setup"
{
    PageType = List;
    SourceTable = 99453;
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Intervention Description"; Rec."Intervention Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Intervention Description field.';
                }
            }
        }
    }

    actions
    {
    }
}
Page 99457 "Respondent Category Setup"
{
    PageType = List;
    SourceTable = 99454;
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Respondent Category"; Rec."Respondent Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Respondent Category field.';
                }
            }
        }
    }

    actions
    {
    }
}
Page 99458 "ExtentOfAgreementMeasureSetup"
{
    PageType = List;
    SourceTable = ExtentOfAgreementMeasureSetup;
    Caption = 'Extent Of Agreement Measure Setup';
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(ExtentOfAgreementMeasureSetup; Rec.ExtentOfAgreementMeasureSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agreement Measure Setup';
                    ToolTip = 'Specifies the value of the Extent Of Agreement Measure Setup field.';
                }
            }
        }
    }

    actions
    {
    }
}
Page 99459 "ExtentOfAgrtMeasureOISetup"
{
    PageType = List;
    SourceTable = ExtentOfAgreementOnImpactSetup;
    Caption = 'Extent Of Agreement Measure On Impact Setup';
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(ExtentOfAgreeMeasureSetupOI; Rec.ExtentOfAgreeMeasureSetupOI)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agreement Measure On Impact Setup';
                    visible = true;
                    ToolTip = 'Specifies the value of the Extent Of Agreement Measure On Impact Setup field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

