#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57205 "Finance Employee  Informations"
{
    CardPageID = "Employee Payment Details Card";
    PageType = List;
    SourceTable = "Employee Payment Information";
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
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Bank Code"; Rec."Employee Bank Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Code';
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Employee Bank Name"; Rec."Employee Bank Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Employee Bank Branch Code"; Rec."Employee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Code';
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Account Number';
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Employee Mobile No"; Rec."Employee Mobile No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile No';
                    ToolTip = 'Specifies the value of the Mobile No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
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

#pragma implicitwith restore

