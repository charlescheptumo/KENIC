#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57202 "Employee Payment Details Card"
{
    PageType = Card;
    SourceTable = "Employee Payment Information";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Bank Code"; Rec."Employee Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Bank Code field.';
                }
                field("Employee Bank Name"; Rec."Employee Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Bank Name field.';
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Bank Account Number field.';
                }
                field("Employee Bank Branch Code"; Rec."Employee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Bank Branch Code field.';
                }
                field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Bank Branch Name field.';
                }
                field("Employee Mobile No"; Rec."Employee Mobile No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Mobile No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Imprest Account"; Rec."Imprest Account")
                {
                    ToolTip = 'Specifies the value of the Imprest Account field.', Comment = '%';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
            }
        }
    }

    actions
    {
    }
}

