#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72592 "Project Road Constituencies"
{
    PageType = List;
    SourceTable = "Project Road Link Constituency";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Appro Constituency Cost"; Rec."Appro Constituency Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approximate Cost per Constituency';
                    ToolTip = 'Specifies the value of the Approximate Cost per Constituency field.';
                }
                field("Actual Constituency Cost"; Rec."Actual Constituency Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Constituency Cost field.';
                }
                field("Workplanned Length"; Rec."Workplanned Length")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplanned Length (KM)';
                    ToolTip = 'Specifies the value of the Workplanned Length (KM) field.';
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KeRRA Budget Code field.';
                }
                field("Global Budget Book ID"; Rec."Global Budget Book ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Budget Book ID field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        //TESTFIELD("Appro Constituency Cost");
    end;
}

