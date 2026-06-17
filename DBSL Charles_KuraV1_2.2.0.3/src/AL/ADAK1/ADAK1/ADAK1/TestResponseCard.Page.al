#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69798 "Test Response Card"
{
    Caption = 'Test Response Card';
    PageType = Card;
    SourceTable = "Ability Test Response";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Date field.';
                }
                field("Test Start Time"; Rec."Test Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Start Time field.';
                }
                field("Test End Time"; Rec."Test End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test End Time field.';
                }
                field("Total No. of Questions"; Rec."Total No. of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Questions field.';
                }
                field("Total No. of Pass Questions"; Rec."Total No. of Pass Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Pass Questions field.';
                }
                field("Ability Test Pass Score %"; Rec."Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Pass Score % field.';
                }
                field("Response Status"; Rec."Response Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Status field.';
                }
            }
            part(Control6; "Test Responses")
            {
                SubPageLink = "Response ID" = field("Response ID");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Perfomance Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Perfomance Report action.';

                trigger OnAction()
                begin
                    Rec.SetRange("Response ID", Rec."Response ID");
                    Report.Run(69621, true, false, Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total No. of Pass Questions", "Total No. of Questions");
        if Rec."Total No. of Questions" > 0 then
            Rec."Ability Test Pass Score %" := (Rec."Total No. of Pass Questions" / Rec."Total No. of Questions") * 100;
    end;
}

