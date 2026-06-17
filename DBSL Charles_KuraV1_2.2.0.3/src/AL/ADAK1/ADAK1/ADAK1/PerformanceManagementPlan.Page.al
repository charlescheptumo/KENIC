#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80041 "Performance Management Plan"
{
    PageType = Card;
    SourceTable = "Performance Management Plan";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                    Visible = false;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("HR Performance Template"; Rec."HR Performance Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Performance Template field.';
                }
                field("Performance Contract  Template"; Rec."Performance Contract  Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Contract  Template field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control13; "Performance Plan Tasks")
            {
                SubPageLink = "Performance Mgt Plan ID" = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Performance Appraisals")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Performance Mgt Plan ID" = field(No),
                              "Document Type" = const("Performance Appraisal");
                ToolTip = 'Executes the Performance Appraisals action.';
            }
            action("Performance Appeals")
            {
                ApplicationArea = Basic;
                Image = AddContacts;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Performance Mgt Plan ID" = field(No),
                              "Document Type" = const("Performance Appeal");
                ToolTip = 'Executes the Performance Appeals action.';
            }
            action(PIPs)
            {
                ApplicationArea = Basic;
                Image = Addresses;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Performance Improvement Plans";
                ToolTip = 'Executes the PIPs action.';
            }
            action("Performance Mgmt Policies")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Performance Plan Guidelines";
                RunPageLink = "Performance Mgt Plan ID" = field(No);
                ToolTip = 'Executes the Performance Mgmt Policies action.';
            }
            action("Review Periods")
            {
                ApplicationArea = Basic;
                Image = Replan;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Review Periods";
                ToolTip = 'Executes the Review Periods action.';
            }
        }
    }
}

