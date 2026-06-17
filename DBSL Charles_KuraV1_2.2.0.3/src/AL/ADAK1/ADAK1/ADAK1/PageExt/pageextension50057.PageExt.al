#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50057 "pageextension50057" extends "Purchases & Payables Setup"
{
    layout
    {
        // modify("Background Posting")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Background Posting"(Control 7)".


        //     //Unsupported feature: Property Modification (ControlType) on ""Background Posting"(Control 7)".


        //     //Unsupported feature: Property Modification (Name) on ""Background Posting"(Control 7)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on ""Background Posting"(Control 7)".

        //    // ApplicationArea = Basic;
        // }

        //Unsupported feature: Property Deletion (CaptionML) on ""Background Posting"(Control 7)".


        //Unsupported feature: Property Deletion (GroupType) on ""Background Posting"(Control 7)".

        addafter("Ignore Updated Addresses")
        {
            field("Current Year"; Rec."Current Year")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Current Year field.';
            }
        }
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Store Requisition Nos."; Rec."Store Requisition Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Store Requisition Nos. field.';
            }
            field("Loan Issue Requisition Nos."; Rec."Loan Issue Req. Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Loan Issue Requisition Nos. field.';
            }
            field("Loan Issue Surrender Nos."; Rec."Loan Issue Surrender Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Loan Issue Surrender Nos. field.';
            }
            field("Item Rejection Nos."; Rec."Item Rejection Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item Rejection Nos. field.';
            }
            field("Inspection Nos"; Rec."Inspection Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Inspection Nos field.';
            }
            field("Special RFQ Prcmnt Nos"; Rec."Special RFQ Prcmnt Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Special RFQ Prcmnt Nos field.';
            }
            group(Procurement)
            {
                Caption = 'Procurement';
                field("Procument Plan Nos"; Rec."Procument Plan Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procument Plan Nos';
                    ToolTip = 'Specifies the value of the Procument Plan Nos field.';
                }
                field("Request for Quotation Nos."; Rec."Request for Quotation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request for Quotation Nos. field.';
                }
                field("PM E-mail"; Rec."PM E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PM E-mail field.';
                }
                FIELD("Procurement/Stores E-mail"; Rec."Procurement/Stores E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement/Stores E-mail field.';

                }
                field("Request for Proposals Nos."; Rec."Request for Proposals Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request for Proposals Nos. field.';
                }
                field("Tenders Nos"; Rec."Tenders Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenders Nos field.';
                }
                field("Expression of Interest Nos."; Rec."Expression of Interest Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expression of Interest Nos. field.';
                }
                field("Direct Prcmnt Nos"; Rec."Direct Prcmnt Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Prcmnt Nos field.';
                }
                field("Low Value Prcmnt Nos"; Rec."Low Value Prcmnt Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Low Value Prcmnt Nos field.';
                }
                field("Requisition Nos."; Rec."Requisition Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Nos. field.';
                }


            }
        }
        addafter("Notify On Success")
        {
            field("Contract Nos"; Rec."Contract Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract Nos field.';
            }
            field("Purchase Requisition Nos."; Rec."Purchase Requisition Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Purchase Requisition Nos. field.';
            }
            field("Asset Disposal Nos"; Rec."Asset Disposal Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Asset Disposal Nos field.';
            }
            field("RFP Documents Path"; Rec."RFP Documents Path")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the RFP Documents Path field.';
            }
            field("RFQ Documents Path"; Rec."RFQ Documents Path")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the RFQ Documents Path field.';
            }
            field("Direct Documents Path"; Rec."Direct Documents Path")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Direct Documents Path field.';
            }
            field(ObjText; ObjText)
            {
                ApplicationArea = Basic;
                MultiLine = true;
                ToolTip = 'Specifies the value of the ObjText field.';

                trigger OnValidate()
                begin
                    Rec.CalcFields("Order Conditions");
                    Rec."Order Conditions".CreateInstream(ObjInstr);
                    Obj.Read(ObjInstr);

                    if ObjText <> Format(Obj) then begin
                        Clear(Rec."Order Conditions");
                        Clear(Obj);
                        Obj.AddText(ObjText);
                        Rec."Order Conditions".CreateOutstream(ObjOutStr);
                        Obj.Write(ObjOutStr);
                        //MODIFY;
                    end;
                end;
            }
        }
    }

    var
        OrderConditions: BigText;
        Instr: InStream;
        OutStr: OutStream;
        OrderConditionsTxt: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    CALCFIELDS("Order Conditions");
    "Order Conditions".CREATEINSTREAM(ObjInstr);
    Obj.READ(ObjInstr);
    ObjText:=FORMAT(Obj);
    */
    //end;
}

#pragma implicitwith restore

