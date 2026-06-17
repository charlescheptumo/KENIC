#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75382 "IFP Addendum Notice"
{
    ApplicationArea = Basic;
    CardPageID = "IFP Addendum Notice Card";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Addendum Notice";
    SourceTableView = where("Process Type" = const(IFP));
    UsageCategory = Lists;

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Invitation Notice No."; Rec."Invitation Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Addendum Instructions"; Rec."Addendum Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Addendum Instructions field.';
                }
                field("Primary Addendum Type ID"; Rec."Primary Addendum Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Addendum Type ID field.';
                }
                field("Addendum Type Description"; Rec."Addendum Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Addendum Type Description field.';
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No field.';
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Description field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("New Submission Start Date"; Rec."New Submission Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Submission Start Date field.';
                }
                field("Original Submission Start Date"; Rec."Original Submission Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Submission Start Date field.';
                }
                field("New Submission Start Time"; Rec."New Submission Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Submission Start Time field.';
                }
                field("Original Submission Start Time"; Rec."Original Submission Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Submission Start Time field.';
                }
                field("New Submission End Date"; Rec."New Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Submission End Date field.';
                }
                field("Original Submission End Date"; Rec."Original Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Submission End Date field.';
                }
                field("New Submission End Time"; Rec."New Submission End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Submission End Time field.';
                }
                field("Original Submission End Time"; Rec."Original Submission End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Submission End Time field.';
                }
                field("Original Bid Opening Date"; Rec."Original Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Bid Opening Date field.';
                }
                field("New Bid Opening Date"; Rec."New Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bid Opening Date field.';
                }
                field("Original Bid Opening Time"; Rec."Original Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Bid Opening Time field.';
                }
                field("New Bid Opening Time"; Rec."New Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bid Opening Time field.';
                }
                field("Original Prebid Meeting Date"; Rec."Original Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Prebid Meeting Date field.';
                }
                field("New Prebid Meeting Date"; Rec."New Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Prebid Meeting Date field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created by field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
            }
        }
    }

    actions
    {
    }
}

