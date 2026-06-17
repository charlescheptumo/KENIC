#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72151 "County Card"
{
    PageType = Card;
    SourceTable = County1;
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Regional Offices';
                    ToolTip = 'Specifies the value of the Regional Offices field.';
                }
                field("No. Of Constituencies"; Rec."No. Of Constituencies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Constituencies field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            group("Road Statistics")
            {
                Editable = false;
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Road Sections field.';
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
                field("Actual Cost (Construction)"; Rec."Actual Cost (Construction)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Cost (Construction) field.';
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
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; MyNotes)
            {
            }
            systempart(Control23; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup27)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Sections";
                    RunPageLink = "Primary County ID" = field(Code);
                    ToolTip = 'Executes the Road Sections action.';
                }
                action("Maintenance Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Maintenance Budget  Ceilings";
                    RunPageLink = "County ID" = field(Code);
                    ToolTip = 'Executes the Maintenance Budget Book Entries action.';
                }
                action("Construction Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = EntryStatistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Construction Budget  Ceilings";
                    RunPageLink = "County ID" = field(Code);
                    ToolTip = 'Executes the Construction Budget Book Entries action.';
                }
                action("Road Work Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = WIPLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Road Work Plan Entries action.';
                    // RunObject = Page "Road WorkPlan Package Line";
                    // RunPageLink = "County ID"=field(Code);
                }
                action("Construction Projects")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "County ID" = field(Code),
                                  "Road Project Category" = const('2');
                    ToolTip = 'Executes the Construction Projects action.';
                }
                action("Maintainenace Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "County ID" = field(Code),
                                  "Road Project Category" = const('3');
                    ToolTip = 'Executes the Maintainenace Projects action.';
                }
                action("Studies & Surveys")
                {
                    ApplicationArea = Basic;
                    Image = JobTimeSheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "County ID" = field(Code),
                                  "Road Project Category" = const('1');
                    ToolTip = 'Executes the Studies & Surveys action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total Road Network Length (Km)", "Paved Road Length (Km)");


        if (Rec."Total Road Network Length (Km)" > 0) and (Rec."Paved Road Length (Km)" <= Rec."Total Road Network Length (Km)") then
            Rec."Paved Road Length %" := (Rec."Paved Road Length (Km)" / Rec."Total Road Network Length (Km)") * 100
        else
            Rec."Paved Road Length %" := 0;
        if Rec."Paved Road Length (Km)" > Rec."Total Road Network Length (Km)" then
            Rec."Paved Road Length %" := 100;

        Rec."Unpaved Road Length %" := 100 - Rec."Paved Road Length %";
    end;
}

