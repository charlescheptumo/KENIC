#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70011 "Procurement Financial Ceilings"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Financial ceilings";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Method of Procurement"; Rec."Method of Procurement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Method of Procurement field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Minimum Ceiling"; Rec."Minimum Ceiling")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Ceiling field.';
                }
                field("Maximum Ceiling"; Rec."Maximum Ceiling")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Ceiling field.';
                }
                field("Procument Description"; Rec."Procument Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procument Description field.';
                }
                field("Procurement Class"; Rec."Procurement Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Class field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Effective date"; Rec."Effective date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Effective Date';
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

