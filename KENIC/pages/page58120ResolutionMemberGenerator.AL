page 58120 "Resolution Member Generator"
{
    PageType = StandardDialog;
    Caption = 'Resolution Member Generator';
    SourceTable = "Resolution Members";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(Options)
            {
                Caption = 'Selection Criteria';
                
                field("Generation Method"; Rec."Generation Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select how you want to resolve and add members.';
                    
                    trigger OnValidate()
                    begin
                        ClearFilters();
                        SetVisibility();
                    end;
                }
            }
            group(Filters)
            {
                Caption = 'Target Filters';

                field("Employee Filter"; Rec."Employee Filter")
                {
                    ApplicationArea = All;
                    Visible = IsEmployeeVisible;
                    ToolTip = 'Select the specific employee to add.';
                }
                field("Responsibility Center Filter"; Rec."Responsibility Center Filter")
                {
                    ApplicationArea = All;
                    Visible = IsRespCenterVisible;
                    ToolTip = 'Select the responsibility center.';
                }
                field("Operating Unit Type Filter"; Rec."Operating Unit Type Filter")
                {
                    ApplicationArea = All;
                    Visible = IsUnitTypeVisible;
                    ToolTip = 'Select the operating unit type.';
                }
                field("Branch Filter"; Rec."Branch Filter")
                {
                    ApplicationArea = All;
                    Visible = IsBranchVisible;
                    ToolTip = 'Select the branch value.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Init();
        Rec."Primary Key" := '1';
        Rec.Insert();
        SetVisibility();
    end;

    var
        IsEmployeeVisible: Boolean;
        IsRespCenterVisible: Boolean;
        IsUnitTypeVisible: Boolean;
        IsBranchVisible: Boolean;

    local procedure SetVisibility()
    begin
        IsEmployeeVisible := Rec."Generation Method" = Rec."Generation Method"::Employee;
        IsRespCenterVisible := Rec."Generation Method" = Rec."Generation Method"::"Responsibility Center";
        IsUnitTypeVisible := Rec."Generation Method" = Rec."Generation Method"::"Operating Unit Type";
        IsBranchVisible := Rec."Generation Method" = Rec."Generation Method"::Branch;
    end;

    local procedure ClearFilters()
    begin
        Rec."Employee Filter" := '';
        Rec."Responsibility Center Filter" := '';
        Rec."Operating Unit Type Filter" := Rec."Operating Unit Type Filter"::" ";
        Rec."Branch Filter" := '';
    end;
}