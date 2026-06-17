#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80047 "Performance Evaluation Weight"
{
    PageType = List;
    SourceTable = "Performance Evaluation Weight";
    Caption = 'Annual Performance Evaluation Weight';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Per_Evaluation Template ID"; Rec."Per_Evaluation Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Per_Evaluation Template ID field.';
                }
                field("Key Evaluation Section"; Rec."Key Evaluation Section")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key Evaluation Section field.';
                }
                field("Total Weight (%)"; Rec."Total Weight (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Weight (%) field.';
                }
            }
        }
    }

    actions
    {
    }
}

