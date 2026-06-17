#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72560 "Supervision Response Types"
{
    CardPageID = "Supervision Response Type";
    PageType = List;
    SourceTable = "Supervision Response Type";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Primary Supervisor"; Rec."Primary Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Supervisor field.';
                }
                field("No. of Default Resp. Options"; Rec."No. of Default Resp. Options")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Default Response Options field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

