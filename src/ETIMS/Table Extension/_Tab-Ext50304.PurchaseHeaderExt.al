tableextension 50304 "Purchase Header Ext1" extends "Purchase Header"
{
    fields
    {
        //START Etims SCU INFORMATION

        field(50153; EtimsDate; Date)
        {
            //TableRelation = "Bank Account";
        }
        field(50154; EtimsTime; time)
        {
            //TableRelation = "Bank Account";
        }
        field(50155; "Posted To Etims"; Boolean)
        {
            //TableRelation = "Bank Account";
        }
        field(50156; "ETIMS Local Invoice Number"; Integer)
        {
            //TableRelation = "Bank Account";
        }
    }
}
