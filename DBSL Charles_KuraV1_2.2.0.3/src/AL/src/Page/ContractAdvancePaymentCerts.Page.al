#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72296 "Contract Advance Payment Certs"
{
    ApplicationArea = Basic;
    CardPageID = "Advance Payment Certificate";
    PageType = List;
    SourceTable = "Measurement &  Payment Header";
    SourceTableView = where("Document Type" = filter("Contractor Payment Request"),
                            "Payment Certificate Type" = filter("Advance Payment"), Status = FILTER(<> Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Certificate Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Advance Payment Request' + ' ' + Rec."Project ID";
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
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
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Reason For Reversal"; Rec."Reason For Reversal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Reversal field.';
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed By field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer No. field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Engineer Name field.';
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Representative No. field.';
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Representative Name field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Agency ID field.';
                }
                field("Funder Name"; Rec."Funder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funder Name field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Section Start Chainage"; Rec."Section Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Start Chainage field.';
                }
                field("Section End Chainage"; Rec."Section End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section End Chainage field.';
                }
                field("Total  Section Length (KMs)"; Rec."Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total  Section Length (KMs) field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Portal Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

