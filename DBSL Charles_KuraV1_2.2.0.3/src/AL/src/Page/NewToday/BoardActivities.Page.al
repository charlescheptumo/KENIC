#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80117 "Board Activities"
{
    Caption = 'PC Activities';
    PageType = ListPart;
    SourceTable = "Board Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("AWP No"; Rec."AWP No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the AWP No field.';
                }
                field("Board Activity Code"; Rec."Board Activity Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'PC Target Code';
                    ToolTip = 'Specifies the value of the PC Target Code field.';

                }
                field("Board Activity Description"; Rec."Board Activity Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'PC Target  Description';
                    ToolTip = 'Specifies the value of the PC Target  Description field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';

                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Primary Department field.';


                    trigger OnValidate()
                    begin
                        /*BoardActivities.RESET;
                        BoardActivities.SETCURRENTKEY("Activity Code",Division,Department,"Cross Cutting Item");
                        BoardActivities.SETRANGE(Division,Division);
                        BoardActivities.SETRANGE(Department,Department);
                        BoardActivities.SETASCENDING("Cross Cutting Item",TRUE);
                        IF NOT BoardActivities.FINDLAST THEN  BEGIN
                            "Cross Cutting Item":='01';
                          "Entry No":=Department+'_'+"Cross Cutting Item";
                        END ELSE BEGIN
                           "Cross Cutting Item":=INCSTR(BoardActivities."Cross Cutting Item");
                          "Entry No":=BoardActivities.Department+'_'+"Cross Cutting Item"; */

                    end;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("WT(%)"; Rec."WT(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WT(%) field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("AnnualWorkplan Achieved Target"; Rec."AnnualWorkplan Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AnnualWorkplan Achieved Target field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Board Sub-Activities")
            {
                ApplicationArea = Basic;
                Caption = 'PC Sub-Activities';
                Image = AllLines;
                RunObject = Page "Board SUb Activities";
                RunPageLink = "Workplan No." = field("AWP No"),
                              "Initiative No." = field("Board Activity Code"),
                              "Activity Id" = field("Activity Code");
                ToolTip = 'Executes the PC Sub-Activities action.';
            }
        }
    }

    var
        BoardActivities: Record "Board Activities";
}

#pragma implicitwith restore

