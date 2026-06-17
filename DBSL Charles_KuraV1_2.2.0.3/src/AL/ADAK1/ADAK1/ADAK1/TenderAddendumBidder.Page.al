#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75252 "Tender Addendum Bidder"
{
    PageType = List;
    SourceTable = "Tender Addendum Bidder";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No."; Rec."Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Addendum Notice No. field.';
                }
                field("IFS No."; Rec."IFS No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Email field.';
                }
                field("Addendum e-Notice Sent"; Rec."Addendum e-Notice Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Addendum e-Notice Sent field.';
                }
                field("e-Notice Sent Date/Time"; Rec."e-Notice Sent Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the e-Notice Sent Date/Time field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup11)
            {
                action("Suggest Intention-To-Bid Vendors")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Suggest Intention-To-Bid Vendors action.';

                    trigger OnAction()
                    begin
                        TenderAddendum.Reset;
                        TenderAddendum.SetRange("Addendum Notice No.", Rec."Addendum Notice No.");
                        if TenderAddendum.FindSet then
                            Procurement.suggestIntentionToBidVends(TenderAddendum);
                    end;
                }
                action("Send Addendum e-Notice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Send Addendum e-Notice action.';

                    trigger OnAction()
                    begin
                        TenderAddendum.Reset;
                        TenderAddendum.SetRange("Addendum Notice No.", Rec."Addendum Notice No.");
                        if TenderAddendum.FindSet then
                            Procurement.SendAddendumNotice(TenderAddendum);
                    end;
                }
            }
        }
    }

    var
        Procurement: Codeunit "Procurement Processing";
        TenderAddendum: Record "Tender Addendum Notice";
}

