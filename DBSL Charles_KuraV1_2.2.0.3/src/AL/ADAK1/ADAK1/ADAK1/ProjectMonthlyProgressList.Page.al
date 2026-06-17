#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72711 "Project Monthly Progress List"
{
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Job Monthly Progress";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Month Name"; Rec."Month Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month Name field.';
                }
                field("KM of Tarmac Done"; Rec."KM of Tarmac Done")
                {
                    ApplicationArea = Basic;
                    Visible = KMDoneVisible;
                    ToolTip = 'Specifies the value of the KM of Tarmac Done field.';
                }
                field("No of KM Designed"; Rec."No of KM Designed")
                {
                    ApplicationArea = Basic;
                    Visible = KMDesgnedVisible;
                    ToolTip = 'Specifies the value of the No of KM Designed field.';
                }
                field("No of Structures Completed"; Rec."No of Structures Completed")
                {
                    ApplicationArea = Basic;
                    Visible = Structuresvisible;
                    ToolTip = 'Specifies the value of the No of Structures Completed field.';
                }
                field("No of Men Employed"; Rec."No of Men Employed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Men Employed field.';
                }
                field("No of Women Employed"; Rec."No of Women Employed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Women Employed field.';
                }
                field("Men Mandays"; Rec."Men Mandays")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Men Mandays field.';
                }
                field("Women Mandays"; Rec."Women Mandays")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Women Mandays field.';
                }
                field("Updated By"; Rec."Updated By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Updated By field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        Structuresvisible := true;
        KMDesgnedVisible := true;
        KMDoneVisible := true;

        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", Rec."Job No");
        if ObjJob.FindSet then begin
            if ObjJob."Type of Project" = ObjJob."type of project"::"Survey/Study" then begin
                Structuresvisible := false;
                KMDoneVisible := false;
            end;
            if ((ObjJob."Type of Project" = ObjJob."type of project"::Maintenance) or (ObjJob."Type of Project" = ObjJob."type of project"::"Road Construction")) then begin
                Structuresvisible := false;
            end;
            if ObjJob."Type of Project" = ObjJob."type of project"::"Structure Construction" then begin
                KMDesgnedVisible := false;
                KMDoneVisible := false;
            end;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        Structuresvisible := true;
        KMDesgnedVisible := true;
        KMDoneVisible := true;

        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", Rec."Job No");
        if ObjJob.FindSet then begin
            if ObjJob."Type of Project" = ObjJob."type of project"::"Survey/Study" then begin
                Structuresvisible := false;
                KMDoneVisible := false;
            end;
            if ((ObjJob."Type of Project" = ObjJob."type of project"::Maintenance) or (ObjJob."Type of Project" = ObjJob."type of project"::"Road Construction")) then begin
                Structuresvisible := false;
            end;
            if ObjJob."Type of Project" = ObjJob."type of project"::"Structure Construction" then begin
                KMDesgnedVisible := false;
                KMDoneVisible := false;
            end;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //CurrPage.UPDATE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //CurrPage.UPDATE;
    end;

    trigger OnOpenPage()
    begin
        Structuresvisible := true;
        KMDesgnedVisible := true;
        KMDoneVisible := true;

        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", Rec."Job No");
        if ObjJob.FindSet then begin
            if ObjJob."Type of Project" = ObjJob."type of project"::"Survey/Study" then begin
                Structuresvisible := false;
                KMDoneVisible := false;
            end;
            if ((ObjJob."Type of Project" = ObjJob."type of project"::Maintenance) or (ObjJob."Type of Project" = ObjJob."type of project"::"Road Construction")) then begin
                Structuresvisible := false;
            end;
            if ObjJob."Type of Project" = ObjJob."type of project"::"Structure Construction" then begin
                KMDesgnedVisible := false;
                KMDoneVisible := false;
            end;
        end;
    end;

    var
        Structuresvisible: Boolean;
        KMDoneVisible: Boolean;
        KMDesgnedVisible: Boolean;
        ObjJob: Record Job;
}

