#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72138 "Legislation Registers"
{
    CardPageID = "Legislation Register";
    PageType = List;
    SourceTable = "Legislation Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Legislation ID"; Rec."Legislation ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legislation ID field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Overview; Rec.Overview)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overview field.';
                }
                field("Functional Classification"; Rec."Functional Classification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional Classification field.';
                }
                field("Gazette Supplement No."; Rec."Gazette Supplement No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gazette Supplement No. field.';
                }
                field("National Assembly Bill No."; Rec."National Assembly Bill No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the National Assembly Bill No. field.';
                }
                field("No. of Amendments"; Rec."No. of Amendments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Amendments field.';
                }
                field("No. of Clauses/Sections"; Rec."No. of Clauses/Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Clauses/Sections field.';
                }
                field("No. of Subsections"; Rec."No. of Subsections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Subsections field.';
                }
                field("No. of Schedules"; Rec."No. of Schedules")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Schedules field.';
                }
            }
        }
    }

    actions
    {
    }
}

