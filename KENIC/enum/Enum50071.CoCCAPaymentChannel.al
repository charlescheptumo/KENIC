namespace KENIC.KENIC;

enum 50071 "CoCCA Payment Channel"
{
    Extensible = false;
    value(0; Mpesa) { Caption = 'Mpesa'; }
    value(1; Ipay) { Caption = 'Ipay'; }
    value(2; NCBAKES) { Caption = 'NCBAKES'; }
    value(3; IMKES) { Caption = 'IMKES'; }
    value(4; IMUSD) { Caption = 'IMUSD'; }
    value(5; Cash) { Caption = 'Cash'; }

}
