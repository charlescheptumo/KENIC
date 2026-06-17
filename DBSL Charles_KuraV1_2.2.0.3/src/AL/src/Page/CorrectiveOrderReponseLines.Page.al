#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72553 "Corrective Order Reponse Lines"
{
    PageType = ListPart;
    SourceTable = "Corrective Order Response Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Engineer Comments"; Rec."Engineer Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Comments field.';
                }
                field("Achieved Start Chainage"; Rec."Achieved Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Start Chainage field.';
                }
                field("Achieved End Chainage"; Rec."Achieved End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved End Chainage field.';
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
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

