#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72548 "Corrective Order Lines"
{
    PageType = ListPart;
    SourceTable = "Corrective Order Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Category ID"; Rec."Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category ID field.';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Response Option"; Rec."Response Option")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Option field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field("Plan Line No"; Rec."Plan Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Line No field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Bill Item Description"; Rec."Bill Item Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill Item Description field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage Description field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Rework Status"; Rec."Rework Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rework Status field.';
                }
                field("Contractor Comments"; Rec."Contractor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Comments field.';
                }
                field("Photo Number"; Rec."Photo Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo Number field.';
                }
                field("Closure Date"; Rec."Closure Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closure Date field.';
                }
                field("Completion Percentage"; Rec."Completion Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion Percentage field.';
                }
            }
        }
    }

    actions
    {
    }
}

