#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72640 "Weekly Work Plan Lines"
{
    PageType = List;
    SourceTable = "Planning Work Plan Line";
    ApplicationArea = All;

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
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Works Description"; Rec."Works Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Description field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Total Done Todate"; Rec."Total Done Todate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Done Todate field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Works Start Chainage(KM)"; Rec."Works Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage(KM) field.';
                }
                field("Works End Chanage(KM)"; Rec."Works End Chanage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chanage(KM) field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("Foreman ID"; Rec."Foreman ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Foreman ID field.';
                }
                field("Foreman Name"; Rec."Foreman Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Foreman Name field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Material on Site")
            {
                ApplicationArea = Basic;
                Image = WarehouseRegisters;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Workplan Materials on Site";
                RunPageLink = "Document No" = field("Document No."),
                              "Document Type" = field("Document Type"),
                              "Project ID" = field("Project ID"),
                              "Line No" = field("Entry No"),
                              "Activity No" = field("Activity Code");
                ToolTip = 'Executes the Material on Site action.';
            }
            action("Plant and Machinery")
            {
                ApplicationArea = Basic;
                Image = Delivery;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Workplan Plant and Machinery L";
                RunPageLink = "Document No" = field("Document No."),
                              "Document Type" = field("Document Type"),
                              "Activity No" = field("Activity Code"),
                              "Line No" = field("Line No.");
                ToolTip = 'Executes the Plant and Machinery action.';
            }
        }
    }
}

