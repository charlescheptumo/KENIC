#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50073 "pageextension50073" extends "Workflow User Group Members"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""User Name"(Control 3)".

        addafter("User Name")
        {
            field("HR Position"; Rec."HR Position")
            {
                ApplicationArea = Basic;
                Visible = HRPositionVisible;
                ToolTip = 'Specifies the value of the HR Position field.';
            }
        }
        addafter("Sequence No.")
        {
            field("Region Code"; Rec."Region Code")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = RegionCodeVisible;
                ToolTip = 'Specifies the value of the Region Code field.';
            }
            field("Alternative Station"; Rec."Alternative Station")
            {
                ApplicationArea = Basic;
                Visible = AlternativeStationVisible;
                ToolTip = 'Specifies the value of the Alternative Station field.';
            }
            field("Project ID"; Rec."Project ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project ID field.';
            }
            field("Project Role"; Rec."Project Role")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Role field.';
            }
        }
    }

    var
        HRPositionVisible: Boolean;
        RegionCodeVisible: Boolean;
        AlternativeStationVisible: Boolean;
        WFGroup: Record "Workflow User Group";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    HRPositionVisible:=TRUE;
    AlternativeStationVisible:=TRUE;
    RegionCodeVisible:=TRUE;
    IF "Project Based" =TRUE THEN BEGIN
        HRPositionVisible:=FALSE;
        AlternativeStationVisible:=FALSE;
        RegionCodeVisible:=FALSE;
    END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    HRPositionVisible:=TRUE;
    AlternativeStationVisible:=TRUE;
    RegionCodeVisible:=TRUE;
    IF "Project Based" =TRUE THEN BEGIN
        HRPositionVisible:=FALSE;
        AlternativeStationVisible:=FALSE;
        RegionCodeVisible:=FALSE;
    END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    HRPositionVisible:=TRUE;
    AlternativeStationVisible:=TRUE;
    RegionCodeVisible:=TRUE;
    IF "Project Based" =TRUE THEN BEGIN
        HRPositionVisible:=FALSE;
        AlternativeStationVisible:=FALSE;
        RegionCodeVisible:=FALSE;
    END;
    */
    //end;
}

