#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80030 "Strategic Initiatives"
{
    PageType = ListPart;
    SourceTable = "Strategic Initiative";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plan ID field.';
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Result Area';
                    ToolTip = 'Specifies the value of the Key Result Area field.';
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective ID field.';
                }
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy ID field.';
                }
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
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    // Caption = 'KPI';
                    Caption = 'Output Indicator';
                    ToolTip = 'Specifies the value of the Output Indicator field.';
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Output field.';
                }
                field("Key Perfromance Indicator"; Rec."Key Perfromance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Key Perfromance Indicator field.';
                }
                field(Outcomes; Rec.Outcomes)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcomes field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Source Of Fund"; Rec."Source Of Fund")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Of Fund field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("CSP Planned Target"; Rec."CSP Planned Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the CSP Planned Target field.';
                }
                field("Collective Budget"; Rec."Collective target")
                {
                    ApplicationArea = BASIC;
                    Caption = 'Planned Budget';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned Budget field.';
                }
                field("Total Posted Planned Target"; Rec."Total Posted Planned Target")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Posted Planned Target';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Posted Planned Target field.';
                }
                field("Total Achieved Target"; Rec."Total Achieved Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Achieved Target field.';
                }
                field("Total Posted Planned Budget"; Rec."Total Posted Planned Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Posted Planned Budget';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Posted Planned Budget field.';
                }
                field("Total Usage Budget"; Rec."Total Usage Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Usage Budget field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Primary Directorate Name field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Primary Department Name field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Implementation Period")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Strategic Int Planning Lines";
                    RunPageLink = "Strategic Plan ID" = field("Strategic Plan ID"),
                                  "Theme ID" = field("Theme ID"),
                                  "Objective ID" = field("Objective ID"),
                                  "Strategy ID" = field("Strategy ID"),
                                  Code = field(Code),
                                  "Primary Directorate" = field("Primary Directorate");
                    ToolTip = 'Executes the Implementation Period action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

