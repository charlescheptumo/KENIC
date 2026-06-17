#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72637 "Weekly Work Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Weekly Work Plan";
    PageType = List;
    SourceTable = "Work Plan Header";
    SourceTableView = where("Document Type" = filter(Weekly),
                            Status = filter(<> Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Day/Week/Month From"; Rec."Day/Week/Month From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day/Week/Month From field.';
                }
                field("Day/Week/Month To"; Rec."Day/Week/Month To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day/Week/Month To field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Portal Status field.';
                }
                field("Site Agent ID"; Rec."Site Agent ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Site Agent ID field.';
                }
                field("Site Agent Name"; Rec."Site Agent Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Site Agent Name field.';
                }
                field("Resident Engineer ID"; Rec."Resident Engineer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer ID field.';
                }
                field("Resident Engineer Name"; Rec."Resident Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer Name field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Confirmed By"; Rec."Confirmed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Confirmed By field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Doc. Attachment List Factbox")
            {

                SubPageLink = "Table ID" = const(72315),
                              "No." = field("Document No.");

            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Weekly;
    end;
}

