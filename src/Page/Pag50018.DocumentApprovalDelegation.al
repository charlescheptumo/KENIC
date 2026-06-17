#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50018 "Document Approval Delegation"
{
    PageType = ListPart;
    Caption = 'Delegation Entries';
    SourceTable = "Delegation Entries";
    //  Editable = false;
    DeleteAllowed = false;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Workflow User Group"; Rec."Workflow User Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workflow User Group field.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Approver ID field.';
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Approver ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("isGroup Member"; Rec."isGroup Member")
                {
                    ApplicationArea = ALL;
                    Editable = false;
                    ToolTip = 'Specifies the value of the isGroup Member field.';

                }
            }
        }
    }


    var

}

#pragma implicitwith restore

