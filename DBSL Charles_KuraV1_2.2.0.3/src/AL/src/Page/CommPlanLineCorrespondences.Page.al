#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72709 "Comm Plan Line Correspondences"
{
    Caption = 'Communication Plan Line Correspondences';
    PageType = ListPart;
    SourceTable = "Communication Plan Line";
    SourceTableView = where(Category = filter(Correspondence));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("category"; Rec.Category)
                {
                    ///// DataClassification = ToBeClassified;
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Communication Type"; Rec."Communication Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("No. of Target Stakeholders"; Rec."No. of Target Stakeholders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Target Stakeholders field.';
                }
                field("Default Initiator Code"; Rec."Default Initiator Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Initiator Code field.';
                }
                field("Initiator Designation"; Rec."Initiator Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiator Designation field.';
                }
                field("No of Correspondences"; Rec."No of Correspondences")
                {
                    ApplicationArea = Basic;
                    Caption = 'No of Correspondences';
                    ToolTip = 'Specifies the value of the No of Correspondences field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Category := Rec.Category::Correspondence;
    end;
}

