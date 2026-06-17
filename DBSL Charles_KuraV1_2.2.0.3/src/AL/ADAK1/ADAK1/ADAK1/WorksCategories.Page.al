#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75099 "Works Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Works Category";
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
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default BoQ Template Code"; Rec."Default BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default BoQ Template Code field.';
                }
                field("Default Directorate"; Rec."Default Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Directorate field.';
                }
                field("Default Department"; Rec."Default Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Department field.';
                }
                field("Default Procurement Category"; Rec."Default Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Procurement Category field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

