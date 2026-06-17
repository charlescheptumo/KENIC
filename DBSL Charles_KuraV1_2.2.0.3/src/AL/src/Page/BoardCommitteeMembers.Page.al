#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 55001 "Board Committee Members"
{
    // PageType = List;
    PageType = ListPart;
    SourceTable = "Committee Board Members";
    DeleteAllowed = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Committee; rec.Committee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee field.';
                }
                // field("Code";rec.Code)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                    Visible = false;
                }
                field("Director No"; rec."Director No")
                {
                    Visible = true;
                    ApplicationArea = Basic;
                    Caption = 'Board Member No';
                    ToolTip = 'Specifies the value of the Board Member No field.';
                }
                field(Names; rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Designation; rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Role; rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }


            }
        }
    }

    actions
    {
    }
}

