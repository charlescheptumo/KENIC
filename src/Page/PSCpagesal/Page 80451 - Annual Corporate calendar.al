page 80451 "Annual Corporate calendar"
{
    PageType = Card;
    SourceTable = 80050;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("HR Performance Template"; Rec."HR Performance Template")
                {
                    ToolTip = 'Specifies the value of the HR Performance Template field.';
                }
                field("Performance Contract  Template"; Rec."Performance Contract  Template")
                {
                    ToolTip = 'Specifies the value of the Performance Contract  Template field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            // part(part;80454)
            // {
            //     SubPageLink = "Performance Mgt Plan ID"=FIELD("No");
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Performance Appraisals")
            {
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 80084;
                ToolTip = 'Executes the Performance Appraisals action.';
                // RunPageLink = "Performance Mgt Plan ID" = FIELD(No),
                //               "Document Type" = CONST("Performance Appraisal");
            }
            action("Performance Appeals")
            {
                Image = AddContacts;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 80084;
                ToolTip = 'Executes the Performance Appeals action.';
                // RunPageLink = "Performance Mgt Plan ID" = FIELD(No),
                //              "Document Type" = CONST("Performance Appeal");
            }
            action(PIPs)
            {
                Image = Addresses;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 80103;
                ToolTip = 'Executes the PIPs action.';
            }
            action("Performance Mgmt Policies")
            {
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 80094;
                ToolTip = 'Executes the Performance Mgmt Policies action.';
                // RunPageLink = "Performance Mgt Plan ID" = FIELD("No");
            }
            action("Review Periods")
            {
                Image = Replan;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page 80115;
                ToolTip = 'Executes the Review Periods action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Corporate;
    end;
}

