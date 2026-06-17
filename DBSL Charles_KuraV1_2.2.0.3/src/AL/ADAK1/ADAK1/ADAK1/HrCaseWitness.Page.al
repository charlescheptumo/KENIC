#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69289 "Hr Case Witness"
{
    PageType = List;
    SourceTable = "Hr Case Witness";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Witness is Staff"; Rec."Witness is Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness is Staff field.';
                }
                field("Witness Number"; Rec."Witness Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Number field.';
                }
                field("Witness Name"; Rec."Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Name field.';
                }
                field("Witness Statement"; Rec."Witness Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Statement field.';
                }
            }
        }
    }

    actions
    {
    }
}

