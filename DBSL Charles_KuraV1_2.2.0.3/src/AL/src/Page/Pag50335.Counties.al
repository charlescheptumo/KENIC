namespace KICD.KICD;
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
page 50335 Counties1
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = County;
    Caption = 'Counties';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field("County Name"; Rec."County Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(NewRecord)
            {
                Caption = 'New';
                ApplicationArea = All;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "County Card";
            }
        }
    }
}

// page 50336 "County Card"
// {
//     PageType = Card;
//     ApplicationArea = All;
//     SourceTable = County;
//     Caption = 'County Card';

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Code"; Rec."Code")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("County Name"; Rec."County Name")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
// }
