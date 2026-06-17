//#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 52018 "Roads Managment Setup"
{
    // ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Roads Management Setup";
    ApplicationArea = All;
    //UsageCategory = Administration;
    //  Visible =false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'No. Series';
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Feasibility Nos."; Rec."Feasibility Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feasibility Nos. field.';
                }
                field("Project  Nos"; Rec."Project  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project  Nos field.';
                }
                field("Section Nos"; Rec."Section Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Nos field.';
                }
                field("Construction Projects Nos"; Rec."Construction Projects Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Projects Nos field.';
                }
                field("Maintenance Projects Nos"; Rec."Maintenance Projects Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Projects Nos field.';
                }
                field("Surveys_Studies_Designs Nos"; Rec."Surveys_Studies_Designs Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surveys_Studies_Designs Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}



