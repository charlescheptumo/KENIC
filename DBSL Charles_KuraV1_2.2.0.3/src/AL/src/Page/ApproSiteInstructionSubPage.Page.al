#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72700 "Appro Site Instruction SubPage"
{
    PageType = ListPart;
    SourceTable = "Site Instructions Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("BoQ Category Code"; Rec."BoQ Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Category Code field.';
                }
                field("BoQ Item Line No."; Rec."BoQ Item Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Item Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("BoQ Category Description"; Rec."BoQ Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Category Description field.';
                }
                field("BoQ Item No."; Rec."BoQ Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Item No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

