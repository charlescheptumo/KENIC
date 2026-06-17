#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
/// <summary>
/// Page RFI Prequalification Category (ID 75046).
/// </summary>
Page 75046 "RFI Prequalification Category"
{
    PageType = ListPart;
    SourceTable = "RFI Prequalification Category";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prequalification Category ID"; Rec."Prequalification Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Category ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Start Date field.';
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period End Date field.';
                }
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invitation Start Date';
                    ToolTip = 'Specifies the value of the Invitation Start Date field.';
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invitation Start Time';
                    ToolTip = 'Specifies the value of the Invitation Start Time field.';
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission End Date field.';
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission End Time field.';
                }
                // field("Applicable Location"; Rec."Applicable Location")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Restricted RC"; Rec."Restricted RC")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Restricted RC field.';
                }
                field("Restricted RC Type"; Rec."Restricted RC Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Restricted RC Type field.';
                }
                field("Restricted RC Code"; Rec."Restricted RC Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Restricted RC Code field.';
                }
                field("No. of Submissions"; Rec."No. of Submissions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submissions field.';
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
                Caption = 'Line';
                action("RFI Category Requirement ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specific Requirement';
                    Image = Category;
                   
                    RunObject = Page "RFI Required Document";
                    RunPageLink = "Document No" = field("Document No"),
                                  "Linked To category No" = field("Prequalification Category ID"),
                                  "Document Type" = field("Document Type");
                    ToolTip = 'Executes the Specific Requirement action.';
                }
                action("RFI Restricted Vendor Category")
                {
                    ApplicationArea = Basic;
                    Image = Comment;
                    
                    RunObject = Page "RFI Restricted Vendor Category";
                    RunPageLink = "Prequalification Category ID" = field("Prequalification Category ID"),
                                  "Document No" = field("Document No");
                    ToolTip = 'Executes the RFI Restricted Vendor Category action.';
                }
                action("Applicable Location")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "RFI Responsibility Center";
                    Visible = false;
                    RunPageLink = "Document Type" = field("Document Type"),
                                   "Document No" = field("Document No"),
                                   "Procurement Category" = field("Prequalification Category ID");
                    ToolTip = 'Executes the Applicable Location action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

