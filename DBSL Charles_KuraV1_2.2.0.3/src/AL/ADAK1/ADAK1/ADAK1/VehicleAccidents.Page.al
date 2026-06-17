#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59006 "Vehicle Accidents"
{
    PageType = ListPart;
    SourceTable = "Vehicle Accident Details";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Drivers List";
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Names"; Rec."Driver Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Names field.';
                }
                field(RegNo; Rec.RegNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RegNo field.';
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                }
                field("Vehicle Incident Type"; Rec."Vehicle Incident Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Incident Types field.';
                    Caption = 'Nature of Incidents';
                }
                field("Accident date"; Rec."Accident date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident date field.';
                }
                field("Accident Details"; Rec."Accident Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident Details field.';
                }
                field("Police Abstract No"; Rec."Police Abstract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Police Abstract No field.';
                }
            }
        }
    }

    actions
    {
    }

}

