#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69702 "Application Filled Documents"
{
    PageType = List;
    SourceTable = "Application Filled Documents";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Vacancy No."; Rec."Vacancy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy No. field.';
                }
                field("HR Document Type"; Rec."HR Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Document Type field.';
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
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Extension field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
            }
            systempart(Control14; Notes)
            {
            }
            systempart(Control15; MyNotes)
            {
            }
            systempart(Control16; Links)
            {
            }
        }
    }

    actions
    {
    }
}

