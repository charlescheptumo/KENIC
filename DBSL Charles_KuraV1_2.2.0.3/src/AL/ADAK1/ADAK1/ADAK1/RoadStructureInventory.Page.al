#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72041 "Road Structure Inventory"
{
    Caption = 'Road Structure Inventory';
    PageType = List;
    SourceTable = "Road Facility Inventory";
    SourceTableView = where("Road Facility Catgegory" = const(Structure));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Facility ID"; Rec."Facility ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility ID field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Facility Catgegory"; Rec."Road Facility Catgegory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility Catgegory field.';
                }
                field("Road Facility Type"; Rec."Road Facility Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Facility Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field("Facility Material Type"; Rec."Facility Material Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Facility Material Type field.';
                }
                field("Construction Vendor No."; Rec."Construction Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Vendor No. field.';
                }
                field("Construction Vendor Name"; Rec."Construction Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Construction Vendor Name field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Road Facility Catgegory" := Rec."road facility catgegory"::Structure;
    end;
}

