#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75271 "Finance Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Finance Evaluation Line";
    SourceTableView = sorting("Final Evaluated Bid Price") order(ascending);
    ApplicationArea = All;

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
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder No field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluated Bid Price field.';
                }
                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read-out Bid Price (A) field.';
                }
                field("Finacial Auto-Ranking"; Rec."Finacial Auto-Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finacial Auto-Ranking field.';
                }
                field("Evaluation Committee Recomm"; Rec."Evaluation Committee Recomm")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Evaluation Committee Recomm field.';
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Tech Score % field.';
                }
                field("Financial Evaluation Date"; Rec."Financial Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Date field.';
                }
                field("Weighted Financial Score %"; Rec."Weighted Financial Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Financial Score % field.';
                }
                field("Evaluation Committee Remarks"; Rec."Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Remarks (Financial Evaluation) field.';
                }
                field("Aggregate Weighted Score %"; Rec."Aggregate Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aggregate Weighted Score % field.';
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arithmetic Corrections (B) field.';
                }
                field("Tech Evaluation Ranking"; Rec."Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tech Evaluation Ranking field.';
                }
                field("Corrected Bid Price"; Rec."Corrected Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrected Bid Price field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                action("BOQ/Items")
                {
                    ApplicationArea = Basic;
                    
                    RunObject = Page "Bid Response Purch Lines";
                    RunPageLink = "Document No." = field("No."),
                                  "Document Type" = const(Quote);
                    ToolTip = 'Executes the BOQ/Items action.';
                }
                action("Sensitivity Analysis")
                {
                    ApplicationArea = Basic;
                    
                    RunObject = Page "Fin Evaluation Lines";
                    RunPageLink = "Document No" = field("Document ID"),
                                  "Bid No" = field("No."),
                                  "Bidder No" = field("Bidder No"),
                                  Type = const(Sensitivity);
                    ToolTip = 'Executes the Sensitivity Analysis action.';
                }
                action("Preference/Reservation")
                {
                    ApplicationArea = Basic;
                    
                    RunObject = Page "Special Group Entry";
                    RunPageLink = "Vendor No" = field("Bidder No");
                    ToolTip = 'Executes the Preference/Reservation action.';
                }
                action("Balanced and unbalanced rates")
                {
                    ApplicationArea = Basic;
                    
                    RunObject = Page "Fin Evaluation Entries";
                    RunPageLink = "Document No" = field("Document ID"),
                                  "Bid No" = field("No."),
                                  "Bidder No" = field("Bidder No"),
                                  Type = const(Rates);
                    ToolTip = 'Executes the Balanced and unbalanced rates action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

