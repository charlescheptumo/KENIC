#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72379 "Global Budget All C"
{
    Caption = 'Global Budget Book/Road Work Plan';
    PageType = Card;
    SourceTable = "Road Work Program";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Annual Maintenance Budget Ceilings Year: ' + Rec."Financial Year Code";
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Authority; Rec.Authority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authority field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Gloabal Budget Book ID"; Rec."Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Budget Book ID field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Road Planner No"; Rec."Road Planner No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Planner No field.';
                }
                field("Road Planner Name"; Rec."Road Planner Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Planner Name field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Financial Budget ID field.';
                }
                field("Budget Line/ Vote Item"; Rec."Budget Line/ Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Budget Line/ Vote Item field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Funding Agency ID field.';
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Road Project Category field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Total Workplanned Length (Km)"; Rec."Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Workplanned Length (Km) field.';
                }
                field("Total Financial Budget"; Rec."Total Financial Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Financial Budget field.';
                }
                field("Total Budget Ceiling"; Rec."Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Book Amount';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Budget Book Amount field.';
                }
                field("Total MultiYear Plan Cost"; Rec."Total MultiYear Plan Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total MultiYear Plan Cost field.';
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Actual Costs field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control42; "Maintenance Budget Ceilings Al")
            {
                Caption = 'Budget Ceilings';
                // SubPageLink = "Road Work Program ID"=field(Code);
                Visible = RegionalVisible;
            }
            part(Control25; "Construction Budget  Ceilin Al")
            {
                Caption = 'Budget Ceilings';
                SubPageLink = "Road Work Program ID" = field(Code);
                Visible = GlobalVisible;
            }
            part(Control32; "Multi_Year Work")
            {
                SubPageLink = "Road Work Program ID" = field(Code);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        if ((Rec."Approval Status" = Rec."approval status"::"Pending Approval") or (Rec."Approval Status" = Rec."approval status"::Released)) then begin
            CurrPage.Editable := false;
        end;

        GlobalVisible := false;
        RegionalVisible := false;

        if Rec."Document Type" = Rec."document type"::"Global Budget Book" then begin
            GlobalVisible := true;
            RegionalVisible := false;
        end else
            if Rec."Document Type" = Rec."document type"::"Schedule Of Projects" then begin
                GlobalVisible := false;
                RegionalVisible := true;
            end;

        if Rec."Document Type" = Rec."document type"::"Multi-Year Programs" then begin
            MultiYearVisible := true
        end else
            MultiYearVisible := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if ((Rec."Approval Status" = Rec."approval status"::"Pending Approval") or (Rec."Approval Status" = Rec."approval status"::Released)) then begin
            CurrPage.Editable := false;
        end;

        GlobalVisible := false;
        RegionalVisible := false;

        if Rec."Document Type" = Rec."document type"::"Global Budget Book" then begin
            GlobalVisible := true;
            RegionalVisible := false;
        end else
            if Rec."Document Type" = Rec."document type"::"Schedule Of Projects" then begin
                GlobalVisible := false;
                RegionalVisible := true;
            end;

        if Rec."Document Type" = Rec."document type"::"Multi-Year Programs" then begin
            MultiYearVisible := true
        end else
            MultiYearVisible := false;
    end;

    trigger OnOpenPage()
    begin
        if ((Rec."Approval Status" = Rec."approval status"::"Pending Approval") or (Rec."Approval Status" = Rec."approval status"::Released)) then begin
            CurrPage.Editable := false;
        end;
        GlobalVisible := false;
        RegionalVisible := false;

        if Rec."Document Type" = Rec."document type"::"Global Budget Book" then begin
            GlobalVisible := true;
            RegionalVisible := false;
        end else
            if Rec."Document Type" = Rec."document type"::"Schedule Of Projects" then begin
                GlobalVisible := false;
                RegionalVisible := true;
            end;


        if Rec."Document Type" = Rec."document type"::"Multi-Year Programs" then begin
            MultiYearVisible := true
        end else
            MultiYearVisible := false;
    end;

    var
        GlobalVisible: Boolean;
        RegionalVisible: Boolean;
        MultiYearVisible: Boolean;
}

