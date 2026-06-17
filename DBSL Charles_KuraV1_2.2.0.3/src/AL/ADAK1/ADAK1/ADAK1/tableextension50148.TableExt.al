#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50148 "tableextension50148" extends "Purchase Cue"
{
    fields
    {
        field(57000; "Approved PRNs"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter(Released)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57001; "Pending PRNs"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57003; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
            Editable = false;
        }
        field(57004; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
            Editable = false;
        }
        field(57005; "Open PRNS"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter(Open)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57006; "Open S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Open)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57007; "Pending S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Open | "Pending Approval")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57008; "Approved S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Released)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57009; "Issued S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Released),
                                                         "Fully Issued" = const(true)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57010; "Partially Issued"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Released)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57011; "Posted Purchase Invoive"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header");
            FieldClass = FlowField;
            Editable = false;
        }
        field(57012; "Posted Purchase Receipts"; Integer)
        {
            CalcFormula = count("Purch. Rcpt. Header");
            FieldClass = FlowField;
            Editable = false;
        }
        field(57013; "Assigned Purchase Requisitions"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"), "Assigded Procument Officer" = field(Assigned), "Ordered PRN" = FILTER(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(57014; Assigned; code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("User Setup"."Salespers./Purch. Code" where("User ID" = field("User ID Filter")));
            Editable = false;
        }
    }
    var
        salescode: code[100];
}

