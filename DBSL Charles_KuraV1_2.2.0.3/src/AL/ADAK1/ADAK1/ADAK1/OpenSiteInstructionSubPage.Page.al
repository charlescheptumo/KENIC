
Page 72695 "Open Site Instruction SubPage"
{
    Caption = 'Payment Details';
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
                field("BoQ Item No."; Rec."BoQ Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("BoQ Category Description"; Rec."BoQ Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Category Description field.';
                }


                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ToolTip = 'Specifies the value of the Chainage Description field.';

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


            }
        }
    }

    actions
    {
    }
}



