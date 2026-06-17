#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60090 "Security Officers Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = HRPortalUsers;
    ApplicationArea = All;

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field(No;code)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Security Officer Name";"Security Officer Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Email;Email)
    //             {
    //                 ApplicationArea = Basic;
    //                 ExtendedDatatype = EMail;
    //             }
    //             field("ID Number";IdNo)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Contact No";"Contact No")
    //             {
    //                 ApplicationArea = Basic;
    //                 ExtendedDatatype = PhoneNo;
    //             }
    //             field("Security Contract No";"Security Contract No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         systempart(Control10;Outlook)
    //         {
    //         }
    //         systempart(Control11;Notes)
    //         {
    //         }
    //         systempart(Control12;MyNotes)
    //         {
    //         }
    //         systempart(Control13;Links)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "User Type":="user type"::"Security Guard";
    // end;
}

