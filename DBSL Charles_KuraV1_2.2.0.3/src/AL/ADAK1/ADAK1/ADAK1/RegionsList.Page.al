#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72000 "Regions List"
{
    ApplicationArea = Advanced;
    Caption = 'Regions List';
    CardPageID = "Regions Card";
    Editable = false;
    PageType = List;
    SourceTable = "Responsibility Center";
    SourceTableView = where("Operating Unit Type" = filter(Region));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center list code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
                }
                field("No. Of Constituencies"; Rec."No. Of Constituencies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Constituencies field.';
                }
                field("Total Road Network Length (Km)"; Rec."Total Road Network Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Road Network Length (Km) field.';
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
                field("No. of Planned Road Projects"; Rec."No. of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Road Projects field.';
                }
                field("No. of Ongoing Road Projects"; Rec."No. of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Ongoing Road Projects field.';
                }
                field("No. of Completed Road Projects"; Rec."No. of Completed Road Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Completed Road Projects field.';
                }
                field("Total Budget (Construction)"; Rec."Total Budget (Construction)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Construction) field.';
                }
                field("Total Budget (Maintainenace)"; Rec."Total Budget (Maintainenace)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Maintainenace) field.';
                }
                field("Actual Cost (Maintainenace)"; Rec."Actual Cost (Maintainenace)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Cost (Maintainenace) field.';
                }
                field("Actual Cost (Construction)"; Rec."Actual Cost (Construction)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Cost (Construction) field.';
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Sections field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5714),
                                  "No." = field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Copy Company Address action.';

                    trigger OnAction()
                    begin
                        if Rec.Code = '' then
                            Error(Text0001, Rec.Code);
                        CompInfo.Get();
                        Rec.Address := CompInfo.Address;
                        Rec."Address 2" := CompInfo."Address 2";
                        Rec."Post Code" := CompInfo."Post Code";
                        Rec.City := CompInfo.City;
                        Rec."Country/Region Code" := CompInfo."Country/Region Code";
                        Rec.Modify;

                        Message(Text0002);
                    end;
                }
                action("Staff Profile")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee List-P";
                    RunPageLink = "Research Center" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Staff Profile action.';
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Grant Funding Application List";
                    RunPageLink = "Research Center" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Grants Profile action.';
                }
                action("Project profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Project profile action.';
                    // RunObject = Page "Job List";
                    // RunPageLink = "Research Center"=field(Code);
                }
                action("Sub Centers")
                {
                    ApplicationArea = Basic;
                    Image = Skills;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Sub-Center List";
                    RunPageLink = "Research Centre" = field(Code);
                    ToolTip = 'Executes the Sub Centers action.';
                }
                action("Research Programs")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Center Programs List";
                    RunPageLink = "Center Code" = field(Code);
                    ToolTip = 'Executes the Research Programs action.';
                }
                action("Research Infrastructure")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Research Infrastructure List";
                    RunPageLink = "Center Code" = field(Code);
                    ToolTip = 'Executes the Research Infrastructure action.';
                }
                action("Fixed Assets")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Fixed Asset List";
                    RunPageLink = "Research Center" = field(Code);
                    Visible = false;
                    ToolTip = 'Executes the Fixed Assets action.';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Research Center Statistics";
                    RunPageLink = Code = field(Code);
                    ToolTip = 'Executes the Statistics action.';
                }
            }
        }
        area(reporting)
        {
            group(ActionGroup14)
            {
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Research Centers action.';
                    //Image = Report;
                    //RunObject = Report "Research Center List";
                }
                action("Research Centers Profile")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Research Centers Profile action.';
                    //Image = Report;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action11)
                {
                }
                action("Center Grant Profile")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    ToolTip = 'Executes the Center Grant Profile action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65011, true, true, ResearchCenter);
                        end;
                    end;
                }
                action("Center Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    ToolTip = 'Executes the Center Projects Profile action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65012, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action5)
                {
                }
                action("Fixed Assets List")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    ToolTip = 'Executes the Fixed Assets List action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65013, true, true, ResearchCenter);
                        end;
                    end;
                }
            }
        }
    }

    var
        CompInfo: Record "Company Information";
        WorkDescription: Text;
        ResearchCenter: Record "Research Center";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        ShowMapLbl: label 'Show on Map';
}

