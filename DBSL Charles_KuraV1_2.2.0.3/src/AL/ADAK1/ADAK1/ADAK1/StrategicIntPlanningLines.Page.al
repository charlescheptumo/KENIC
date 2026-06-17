#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80163 "Strategic Int Planning Lines"
{
    PageType = List;
    SourceTable = "Strategic Int Planning Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Annual Reporting Codes"; Rec."Annual Reporting Codes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Codes field.';
                }
                field("Target Budget"; Rec."Target Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Budget field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Allocate Bugdet")
            {
                ApplicationArea = Basic;
                Caption = 'Allocate Bugdet';
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Allocate Bugdet action.';
                //RunObject = Report "Allocate Budget";
            }
        }
    }
}

#pragma implicitwith restore

