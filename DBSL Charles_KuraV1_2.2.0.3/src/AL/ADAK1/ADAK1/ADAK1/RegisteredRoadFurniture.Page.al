#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72354 "Registered Road Furniture"
{
    PageType = Card;
    SourceTable = "Road Facility Item";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Facility  No."; Rec."Facility  No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility  No. field.';
                }
                field("Road Facility Type"; Rec."Road Facility Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    ToolTip = 'Specifies the value of the Name field.';
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
                field("Road Facility Category"; Rec."Road Facility Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Road Facility Category field.';
                }
                field("Road Facility SubType"; Rec."Road Facility SubType")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility SubType field.';
                }
                field("Facility Label"; Rec."Facility Label")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Label field.';
                }
                field("Facility Location"; Rec."Facility Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Location field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Material Type"; Rec."Material Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material Type field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("Town ID"; Rec."Town ID")
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Town ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Last Road Condition Survey ID"; Rec."Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Road Condition Survey ID field.';
                }
                field("Last Road Cond. Survey Date"; Rec."Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Road Cond. Survey Date field.';
                }
                field("General Facility Condition"; Rec."General Facility Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Facility Condition field.';
                }
                field("Construction Project ID"; Rec."Construction Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Project ID field.';
                }
                field("Construction Date"; Rec."Construction Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Date field.';
                }
                field("Project RICS ID"; Rec."Project RICS ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project RICS ID field.';
                }
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Maintenance Date field.';
                }
                field("Road Side"; Rec."Road Side")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Side field.';
                }
            }
            group("GPS Details")
            {
                Caption = 'GPS Details';
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Point Longitude field.';
                }
                field("Start Point Latitude"; Rec."Start Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Point Latitude field.';
                }
                field("End Point Longitude"; Rec."End Point Longitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Point Longitude field.';
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Point Latitude field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Documentations & Photos action.';

                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    DMSManagement.UploadRoadLinkDocuments(Rec."Facility  No.", 'Road Furniture', Rec.RecordId, Rec."Region ID");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Road Facility Category" := Rec."road facility category"::Furniture;
    end;

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

