#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72585 "Material Test Record Line Subp"
{
    PageType = ListPart;
    SourceTable = "Material Test Record Line";
    ApplicationArea = All;

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
                field("Material ID"; Rec."Material ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Material ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Base Unit of Measure field.';
                }
                field("Site Description"; Rec."Site Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Laboratory Location';
                    ToolTip = 'Specifies the value of the Test Laboratory Location field.';
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
                field("Technologist Type"; Rec."Technologist Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technologist Type field.';
                }
                field("Test Lead No."; Rec."Test Lead No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lab Technologist/Technician No';
                    ToolTip = 'Specifies the value of the Lab Technologist/Technician No field.';
                }
                field("Test Lead Name"; Rec."Test Lead Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lab Technologist/Technician Name';
                    ToolTip = 'Specifies the value of the Lab Technologist/Technician Name field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Final Test Result"; Rec."Final Test Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Test Result field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Testing Date"; Rec."Testing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Testing Date field.';
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
                action("Material Test Categories")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Material Test Record Category";
                    RunPageLink = Code = field(Code),
                                  "Project ID" = field("Project ID"),
                                  "Line No" = field("Line No.");
                    Visible = false;
                    ToolTip = 'Executes the Material Test Categories action.';
                }
                action("Material Test Pass")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "Material Test Passes";
                    RunPageLink = Code = field(Code),
                                  "Project ID" = field("Project ID"),
                                  "Line No." = field("Line No.");
                    Visible = false;
                    ToolTip = 'Executes the Material Test Pass action.';
                }
                action("Attach Test Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Attach Test Result action.';
                }
            }
        }
    }
}

