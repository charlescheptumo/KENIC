namespace KENIC.KENIC;

enum 50073 "CoCCA Write State"
{
    Extensible = false;
    value(0; Draft) { Caption = 'Draft'; }
    value(1; Sending) { Caption = 'Sending'; }
    value(2; Succeeded) { Caption = 'Succeeded'; }
    value(3; Pending) { Caption = 'Pending'; }
    value(4; Rejected) { Caption = 'Rejected'; }
    value(5; Unknown) { Caption = 'Unknown'; }

}
