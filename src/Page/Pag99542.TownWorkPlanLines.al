#pragma warning disable AA0005, AA0008, AL0603,AA0018,AL0603, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

page 99542 "Town WorkPlan Lines"
{
    Caption = 'RAM Workplan Lines';
    PageType = ListPart;
    SourceTable = "RAM Workplan Line";
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
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Workplan Type field.';
                }
                field(Town; Rec.Town)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Town field.';
                }
                field(Revised; Rec.Revised)
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revised field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Funding Source Code';
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Works Type"; Rec."Works Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Type field.';
                }
                field("Works Type Description"; Rec."Works Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Type Description field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }

                field("BoQ Template"; Rec."BoQ Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template field.';
                }
                field("Estimated Project Cost"; Rec."Estimated Project Cost")
                {
                    Caption = 'Estimated Project Cost Excl VAT';
                    ToolTip = 'Specifies the value of the Estimated Project Cost Excl VAT field.';
                }
                field("Contingency Rate (%)"; Rec."Contingency Rate (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contingency Rate (%) field.';
                }
                field("Contingency Amount (KES)"; Rec."Contingency Amount (KES)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contingency Amount (KES) field.';
                }
                field("VoP Rate(%)"; Rec."VoP Rate(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VoP Rate(%) field.';
                }
                field("VoP Amount (KES)"; Rec."VoP Amount (KES)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VoP Amount (KES) field.';
                }
                field("VAT Prod Posting Group"; Rec."VAT Prod Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Prod Posting Group field.';
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Rate field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Total Incl VAT"; Rec."Total Incl VAT")
                {
                    Caption = 'Estimated Project Cost Incl VAT';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Project Cost Incl VAT field.';
                }

                field("Workplanned Length(KM)"; Rec."Workplanned Length(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length(KM) field.';
                }

                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }


            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Project Details")
            {
                Caption = 'Project Details';
                action("Road Links")
                {
                    Caption = 'Project Road Links';
                    Image = CreateJobSalesInvoice;
                    RunObject = Page "Workplan Project Road Links";
                    RunPageLink = "Workplan Type" = FIELD("Workplan Type"),
                                  "Workplan No" = FIELD("Document No"),
                                  "Line No" = FIELD("Line No");
                    ToolTip = 'Executes the Project Road Links action.';
                }
                action(Tasks)
                {
                    Caption = 'BoQ';
                    Ellipsis = true;
                    Image = TaskList;
                    RunObject = Page "Workplan Summary of Bills";
                    RunPageLink = "Workplan Type" = FIELD("Workplan Type"),
                                  "Workplan No" = FIELD("Document No"),
                                  "Line No" = FIELD("Line No"),
                                  "Funding Source Code" = FIELD("Global Dimension 2 Code");
                    ToolTip = 'Executes the BoQ action.';
                }
                action("Consultancy Projects Required")
                {
                    Image = Receipt;
                    RunObject = Page "Workplan Consultancy Projects";
                    RunPageLink = "Workplan No" = FIELD("Document No"),
                                  "Workplan Type" = FIELD("Workplan Type"),
                                  "Line No" = FIELD("Line No");
                    ToolTip = 'Executes the Consultancy Projects Required action.';
                }
            }
        }
    }
}

