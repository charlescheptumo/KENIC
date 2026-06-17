#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72648 "Contractor Inspection Requests"
{
    ApplicationArea = Basic;
    Caption = 'Contractor Inspection/Test Request Forms';
    CardPageID = "Contractor Inspection Request";
    PageType = List;
    SourceTable = "Contractor Inspection Request";
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Requires Lab Test"; Rec."Requires Lab Test")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requires Lab Test field.';
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
                field("Daily/Weekly/Monthly W/Plan No"; Rec."Daily/Weekly/Monthly W/Plan No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Daily/Weekly/Monthly W/Plan No field.';
                }
                field("Resident Engineer ID"; Rec."Resident Engineer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer ID field.';
                }
                field("Residnet Engineer Name"; Rec."Residnet Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residnet Engineer Name field.';
                }
                field("Site Agent No."; Rec."Site Agent No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Site Agent No. field.';
                }
                field("Site Agent Name"; Rec."Site Agent Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Site Agent Name field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
                field("Last Modified By"; Rec."Last Modified By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Modified By field.';
                }
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Modified Date Time field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Doc. Attachment List Factbox")
            {

                SubPageLink = "Table ID" = const(72318),
                              "No." = field("Document No.");

            }
        }
    }

    actions
    {
    }
}

