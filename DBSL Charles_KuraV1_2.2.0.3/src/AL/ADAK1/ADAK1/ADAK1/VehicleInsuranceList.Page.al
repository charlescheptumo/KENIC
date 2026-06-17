#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59130 "Vehicle Insurance List"
{
    ApplicationArea = Basic;
    CardPageID = "Vehicle Insurance Card";
    PageType = List;
    SourceTable = Insurance;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiration Date field.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy No. field.';
                }
                field("Annual Premium"; Rec."Annual Premium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Premium field.';
                }
                field("Total Value Insured"; Rec."Total Value Insured")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Value Insured field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("FA No."; Rec."FA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }
        }
    }

    actions
    {
    }
}
// Page 59130 "Vehicle Insurance List"
// {
//     ApplicationArea = Basic;
//     CardPageID = "Vehicle Insurance Card";
//     PageType = List;
//     SourceTable = "Insurance Covers";
//     UsageCategory = Lists;
//     Editable = false;
//     SourceTableView = where("FA Cover Type" = filter(Vehicles));

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Document No. field.';
//                 }
//                 field("Insurance No."; Rec."Insurance No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Insurance No. field.';
//                 }
//                 field("Insurance Description"; Rec."Insurance Description")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Insurance Description field.';
//                 }
//                 field("Effective Date"; Rec."Effective Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Effective Date field.';
//                 }
//                 field("Expiration Date"; Rec."Expiration Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Expiration Date field.';
//                 }
//                 field("Policy No."; Rec."Policy No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Policy No. field.';
//                 }
//                 field("Annual Premium"; Rec."Annual Premium")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Annual Premium field.';
//                 }
//                 field("Total Value Insured"; Rec."Total Value Insured")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Total Value Insured field.';
//                 }
//                 field("Insurance Type"; Rec."Insurance Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the value of the Insurance Type field.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }
// }

