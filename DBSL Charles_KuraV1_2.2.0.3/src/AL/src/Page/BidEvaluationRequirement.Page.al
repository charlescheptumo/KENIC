#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75053 "Bid Evaluation Requirement"
{
    PageType = ListPart;
    SourceTable = "Bid Score Requirement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group ID field.';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Evaluation Requirement field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Contract Ref Clause"; Rec."Contract Ref Clause")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Ref Clause field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    Visible = AssignedWeightVisible;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Visible = DesiredKPIVisible;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Target Value"; Rec."Target Value")
                {
                    ApplicationArea = Basic;
                    Visible = TargetValueVisible;
                    ToolTip = 'Specifies the value of the Target Value field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = CreditMemo;
                    ToolTip = 'Executes the Score Guide action.';

                    trigger OnAction()
                    var
                        BidscoreGuide: Record "Bid Score Guide";
                        BidscoreGuides: Page "Bid Score Guide";
                    begin
                        Rec.TestField("Template ID");

                        BidscoreGuide.FilterGroup(2);
                        BidscoreGuide.SetRange("Template ID", Rec."Template ID");
                        BidscoreGuide.SetRange("Criteria Group ID", Rec."Criteria Group ID");
                        BidscoreGuide.SetRange("Requirement ID", Rec."Requirement ID");
                        BidscoreGuide.FilterGroup(0);
                        BidscoreGuides.SetTableview(BidscoreGuide);
                        BidscoreGuides.Editable := true;
                        BidscoreGuides.Run;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        AssignedWeightVisible := false;
        TargetValueVisible := false;
        DesiredKPIVisible := false;

        BidScoringTemplate.Reset;
        BidScoringTemplate.SetRange(BidScoringTemplate.Code, Rec."Template ID");
        BidScoringTemplate.SetRange(BidScoringTemplate."Use Weighted Scoring", true);
        if BidScoringTemplate.FindSet then begin
            AssignedWeightVisible := true;
            TargetValueVisible := true;
            DesiredKPIVisible := true;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        AssignedWeightVisible := false;
        TargetValueVisible := false;
        DesiredKPIVisible := false;

        BidScoringTemplate.Reset;
        BidScoringTemplate.SetRange(BidScoringTemplate.Code, Rec."Template ID");
        BidScoringTemplate.SetRange(BidScoringTemplate."Use Weighted Scoring", true);
        if BidScoringTemplate.FindSet then begin
            AssignedWeightVisible := true;
            TargetValueVisible := true;
            DesiredKPIVisible := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        AssignedWeightVisible := false;
        TargetValueVisible := false;
        DesiredKPIVisible := false;

        BidScoringTemplate.Reset;
        BidScoringTemplate.SetRange(BidScoringTemplate.Code, Rec."Template ID");
        BidScoringTemplate.SetRange(BidScoringTemplate."Use Weighted Scoring", true);
        if BidScoringTemplate.FindSet then begin
            AssignedWeightVisible := true;
            TargetValueVisible := true;
            DesiredKPIVisible := true;
        end;
    end;

    var
        AssignedWeightVisible: Boolean;
        DesiredKPIVisible: Boolean;
        TargetValueVisible: Boolean;
        BidScoringTemplate: Record "Bid Scoring Template";
}

