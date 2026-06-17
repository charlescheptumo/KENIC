
Page 70125 "Contract Issuance Requirements"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Contract Issuance Requirements";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Document Type"; Rec."Procurement Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Link"; Rec."Document Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                    ToolTip = 'Specifies the value of the Document Link field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Certificate Expiry field.';
                }
                field("Guidelines/Instruction"; Rec."Guidelines/Instruction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guidelines/Instruction field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Attach Document")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadContractDocs(Rec."Procurement Document Type", Rec.Description, Rec.RecordId, Rec."PRN No", Rec."Contract Index", Rec."Document ID");
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}


