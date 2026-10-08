/// <summary>
/// Log table recording customer-related notifications generated during eTIMS customer synchronization, storing the customer, message text and timestamp.
/// </summary>
table 50226 "eTims-saveCustomers-Notify"
{
    Caption = 'eTims-saveCustomers-Notify';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "Customer Num"; Code[20])
        {
            Caption = 'Customer Num';
        }
        field(3; Name; Text[200])
        {
            Caption = 'Name';
        }
        field(4; "Notification"; Text[300])
        {
            Caption = 'Notification';
        }
        field(5; "Datetime"; Date)
        {
            Caption = 'Datetime';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
