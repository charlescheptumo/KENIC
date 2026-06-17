#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50150 "tableextension50150" extends "Accounting Services Cue"
{
    fields
    {
        field(50000; "Approved Imprest Memo"; Integer)
        {
            CalcFormula = count("Imprest Memo" where(Status = const(Released),
                                                      Posted = const(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50001; "Open Imprest Requisitions"; Integer)
        {
            CalcFormula = count(payments where("Document Type" = const(Imprest),
                                                Status = const(Open),
                                                Posted = const(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50002; "Posted Purchase Invoice"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header");
            FieldClass = FlowField;
            Editable = false;
        }
        field(50003; "Approved Staff claims"; Integer)
        {
            CalcFormula = count(payments where("Document Type" = const("Staff Claims"),
                                                Status = const(Released)));
            FieldClass = FlowField;
            Editable = false;
        }
    }
}

