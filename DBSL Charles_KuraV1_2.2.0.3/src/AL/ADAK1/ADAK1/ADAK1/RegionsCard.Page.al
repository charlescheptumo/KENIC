#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72001 "Regions Card"
{
    Caption = 'Regions Card';
    PageType = Card;
    SourceTable = "Responsibility Center";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the address associated with the responsibility center.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the city where the responsibility center is located.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name of the person you regularly contact. ';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
                }
                field(ShowMap; ShowMapLbl)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the customer''s address on your preferred map website.';
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        //CurrPage.UPDATE(TRUE);
                        //DisplayMap;
                    end;
                }
                field(Vision; Rec.Vision)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision field.';
                }
                field(Mission; Rec.Mission)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission field.';
                }
                field(Motto; Rec.Motto)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Motto field.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s phone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the fax number of the responsibility center.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Location;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the email address of the responsibility center.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s web site.';
                }
            }
            // group("Road Statistics")
            // {
            //     Editable = false;
            //     field("No. Of Constituencies"; "No. Of Constituencies")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the No. Of Constituencies field.';
            //     }
            //     field("No. of Road Sections"; "No. of Road Sections")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the No. of Road Sections field.';
            //     }
            //     field("Total Road Network Length (Km)"; "Total Road Network Length (Km)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Total Road Network Length (Km) field.';
            //     }
            //     field("Paved Road Length (Km)"; "Paved Road Length (Km)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Paved Road Length (Km) field.';
            //     }
            //     field("Paved Road Length %"; "Paved Road Length %")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Paved Road Length % field.';
            //     }
            //     field("Unpaved Road Length %"; "Unpaved Road Length %")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Unpaved Road Length % field.';
            //     }
            //     field("No. of Planned Road Projects"; "No. of Planned Road Projects")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the No. of Planned Road Projects field.';
            //     }
            //     field("No. of Ongoing Road Projects"; "No. of Ongoing Road Projects")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the No. of Ongoing Road Projects field.';
            //     }
            //     field("No. of Completed Road Projects"; "No. of Completed Road Projects")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the No. of Completed Road Projects field.';
            //     }
            //     field("Total Budget (Construction)"; "Total Budget (Construction)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Total Budget (Construction) field.';
            //     }
            //     field("Actual Cost (Construction)"; "Actual Cost (Construction)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Actual Cost (Construction) field.';
            //     }
            //     field("Total Budget (Maintainenace)"; "Total Budget (Maintainenace)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Total Budget (Maintainenace) field.';
            //     }
            //     field("Actual Cost (Maintainenace)"; "Actual Cost (Maintainenace)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Actual Cost (Maintainenace) field.';
            //     }
            // }
            group(" Research")
            {
                Visible = false;
                field("Research Center?"; Rec."Research Center?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center? field.';
                }
                group("Overview Details")
                {
                    field(Overview; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Overview';
                        MultiLine = true;
                        ToolTip = 'Specifies the value of the Overview field.';

                        trigger OnValidate()
                        begin
                            //SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "Research Center Factbox")
            {
                SubPageLink = Code = field(Code);
                Visible = false;
            }
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
                        Rec.Vision := CompInfo.Vision;
                        Rec.Mission := CompInfo.Mission;
                        Rec.Motto := CompInfo.Motto;
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
                    ToolTip = 'Executes the Grants Profile action.';
                }
                action("Road Work Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Road Work Projects action.';
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
                    Visible = false;
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
                    Visible = false;
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
                    Visible = false;
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
            group(ActionGroup69)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Sections";
                    RunPageLink = "Primary Region ID" = field(Code);
                    ToolTip = 'Executes the Road Sections action.';
                }
                action("Maintenance Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Maintenance Budget  Ceilings";
                    RunPageLink = "Region ID" = field(Code);
                    ToolTip = 'Executes the Maintenance Budget Book Entries action.';
                }
                action("Construction Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = EntryStatistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Construction Budget  Ceilings";
                    RunPageLink = "Region ID" = field(Code);
                    ToolTip = 'Executes the Construction Budget Book Entries action.';
                }
                action("Road Work Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = WIPLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Road Work Plan Entries action.';
                    //  RunObject = Page "Road WorkPlan Package Line";
                    //   RunPageLink = "Region ID"=field(Code);
                }
                action("Construction Projects")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Construction Projects action.';
                    // RunObject = Page "Job List";
                    // RunPageLink = "Region ID"=field(Code),
                    //               "Road Project Category"=const('2');
                }
                action("Maintainenace Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Maintainenace Projects action.';
                    // RunObject = Page "Job List";
                    // RunPageLink = "Region ID"=field(Code),
                    //               "Road Project Category"=const('3');
                }
                action("Studies & Surveys")
                {
                    ApplicationArea = Basic;
                    Image = JobTimeSheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Studies & Surveys action.';
                    //     RunObject = Page "Job List";
                    //     RunPageLink = "Region ID"=field(Code),
                    //                   "Road Project Category"=const('1');
                }
            }
        }
        area(reporting)
        {
            group(ActionGroup38)
            {
                Visible = false;
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    //   RunObject = Report "Research Center List";
                    Visible = false;
                    ToolTip = 'Executes the Research Centers action.';
                }
                action("Research Centers Profile")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Report;
                    Visible = false;
                    ToolTip = 'Executes the Research Centers Profile action.';

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action43)
                {
                }
                action("Region Grant Profile")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    ToolTip = 'Executes the Region Grant Profile action.';
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
                action("Region Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = Report;
                    ToolTip = 'Executes the Region Projects Profile action.';
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
                separator(Action44)
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

    trigger OnAfterGetRecord()
    begin
        // /
    end;

    var
        CompInfo: Record "Company Information";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        WorkDescription: Text;
        ShowMapLbl: label 'Show on Map';
        ResearchCenter: Record "Research Center";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        /*OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);*/

    end;
}

