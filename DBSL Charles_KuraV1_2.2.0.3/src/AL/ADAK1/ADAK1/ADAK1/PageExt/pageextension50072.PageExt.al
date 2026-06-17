#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50072 "pageextension50072" extends "Workflow User Group"
{
    layout
    {
        addafter(Description)
        {
            field("Project Based"; Rec."Project Based")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Based field.';
            }
            field("Region Code"; Rec."Region Code")
            {
                ApplicationArea = Basic;
                Visible = RegionCodeVisible;
                ToolTip = 'Specifies the value of the Region Code field.';
            }
            field("Project ID"; Rec."Project ID")
            {
                ApplicationArea = Basic;
                Visible = ProjectIDVisible;
                ToolTip = 'Specifies the value of the Project ID field.';
            }
            field("Project Name"; Rec."Project Name")
            {
                ApplicationArea = Basic;
                Visible = ProjectIDVisible;
                ToolTip = 'Specifies the value of the Project Name field.';
            }
        }
    }

    var
        ProjectIDVisible: Boolean;
        RegionCodeVisible: Boolean;


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    ProjectIDVisible:=FALSE;
    IF "Project Based"=TRUE THEN
      ProjectIDVisible:=TRUE;

    RegionCodeVisible:=TRUE;
    IF "Project Based"=TRUE THEN
    RegionCodeVisible:=FALSE;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    ProjectIDVisible:=FALSE;
    IF "Project Based"=TRUE THEN
      ProjectIDVisible:=TRUE;

    RegionCodeVisible:=TRUE;
    IF "Project Based"=TRUE THEN
    RegionCodeVisible:=FALSE;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    ProjectIDVisible:=FALSE;
    IF "Project Based"=TRUE THEN
      ProjectIDVisible:=TRUE;

    RegionCodeVisible:=TRUE;
    IF "Project Based"=TRUE THEN
    RegionCodeVisible:=FALSE;
    */
    //end;
}

