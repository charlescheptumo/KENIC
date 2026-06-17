#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72171 "RICS Existing Road Link Line"
{
    PageType = ListPart;
    SourceTable = "RICS Existing Road Link Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RICS No."; Rec."RICS No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS No. field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Road Class ID field.';
                }
                field("New Road Class ID"; Rec."New Road Class ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Road Class ID field.';
                }
                field("General Road Surface Condition"; Rec."General Road Surface Condition")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the General Road Surface Condition field.';
                }
                field("New Gen. Road Surf. Condition"; Rec."New Gen. Road Surf. Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Gen. Road Surf. Condition field.';
                }
                field("Primary County ID"; Rec."Primary County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary County ID field.';
                }
                field("Primary Region ID"; Rec."Primary Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region ID field.';
                }
                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(KM) field.';
                }
                field("End  Chainage(KM)"; Rec."End  Chainage(KM)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End  Chainage(KM) field.';
                }
                field("Total Road Length (KMs)"; Rec."Total Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Road Length (KMs) field.';
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Sections field.';
                }
                field("Paved Road Length (Km)"; Rec."Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paved Road Length (Km) field.';
                }
                field("Paved Road Length %"; Rec."Paved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paved Road Length % field.';
                }
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaved Road Length % field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                group(Funtions)
                {
                    Caption = 'Funtions';
                    action("Major Structures")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Segment;
                        RunObject = Page "RICS Existing Road Facility";
                        RunPageLink = "Road Facility Type" = filter('STRUCTURE'),
                                      "RICS No." = field("RICS No."),
                                      "Road Code" = field("Road Code");
                        ToolTip = 'Executes the Major Structures action.';
                    }
                    action("Road Furniture")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = Components;
                        RunObject = Page "RICS Existing Road Facility";
                        RunPageLink = "Road Facility Type" = filter('FURNITURE'),
                                      "Road Code" = field("Road Code");
                        ToolTip = 'Executes the Road Furniture action.';
                    }
                    action("Road Environs")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = SelectItemSubstitution;
                        RunObject = Page "RICS Existing Road Environ";
                        RunPageLink = "RICS No." = field("RICS No."),
                                      "Road Code" = field("Road Code");
                        RunPageMode = View;
                        ToolTip = 'Executes the Road Environs action.';
                    }
                    action("Pavement Conditions")
                    {
                        ApplicationArea = Basic;
                        Ellipsis = true;
                        Image = ChangeTo;
                        RunObject = Page "RICS Existing Road Pavement";
                        RunPageLink = "Road Code" = field("Road Code"),
                                      "RICS No." = field("RICS No.");
                        ToolTip = 'Executes the Pavement Conditions action.';
                    }
                    action("Road Inventory & Condition")
                    {
                        ApplicationArea = Basic;
                        Caption = ' Road Inventory & Condition Surveys';
                        Ellipsis = true;
                        Image = InventorySetup;
                        ToolTip = 'Executes the  Road Inventory & Condition Surveys action.';
                        // RunObject = Page "Road Condition Surveys(Existin";
                        //   RunPageLink = "Road Code"=field("Road Code");
                    }
                    action(Sections)
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "RICS Existing Road Section";
                        RunPageLink = "RICS No." = field("RICS No."),
                                      "Road Code" = field("Road Code");
                        ToolTip = 'Executes the Sections action.';
                    }
                }
            }
        }
    }
}

