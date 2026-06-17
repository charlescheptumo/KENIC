
Page 72690 "Material Test Cert Submissions"
{
    ApplicationArea = Basic;
    CardPageID = "Material Test Cert. Submission";
    PageType = List;
    SourceTable = "Material Test Record";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Material Delivery Date"; Rec."Material Delivery Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Delivery Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted';
                    ToolTip = 'Specifies the value of the Submitted field.';
                }
                field("Manufacturer Name"; Rec."Manufacturer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manufacturer Name field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Doc. Attachment List Factbox")
            {

                SubPageLink = "Table ID" = const(72250),
                              "No." = field("Code");

            }
        }
    }

    actions
    {
    }
}



