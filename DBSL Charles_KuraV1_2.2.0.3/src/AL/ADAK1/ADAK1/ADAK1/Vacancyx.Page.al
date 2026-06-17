#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69344 "Vacancyx"
{
    PageType = Card;
    SourceTable = Vacancyx;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacancy No.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vacancy No. field.';
                }
                field("Type of Contract"; Rec."Type of Contract")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type of Contract field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Salary; Rec.Salary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary field.';
                }
                field("Job Function"; Rec."Job Function")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Function field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Job Location"; Rec."Job Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Location field.';
                }
                field("Planned Qty"; Rec."Planned Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned Qty field.';
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requested Qty field.';
                }
                group("Application Details")
                {
                    field("Planned Start Date"; Rec."Planned Start Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Planned Start Date field.';
                    }
                    field("Planned End Date"; Rec."Planned End Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Planned End Date field.';
                    }
                    field("Actual Start Date"; Rec."Actual Start Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Actual Start Date field.';
                    }
                    field("Actual End Date"; Rec."Actual End Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Actual End Date field.';
                    }
                    field("Applications End Time"; Rec."Applications End Time")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applications End Time field.';
                    }
                    field("Applications End Date"; Rec."Applications End Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applications End Date field.';
                    }
                    field("Applications Start Date"; Rec."Applications Start Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applications Start Date field.';
                    }
                    field(Advertise; Rec.Advertise)
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Advertise field.';
                    }
                    field("Advertised By"; Rec."Advertised By")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Advertised By field.';
                    }
                    field("Advertised Date"; Rec."Advertised Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Advertised Date field.';
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control28; Notes)
            {
            }
            systempart(Control29; MyNotes)
            {
            }
            systempart(Control30; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Responsibilities)
            {
                ApplicationArea = Basic;
                Image = ReservationLedger;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Position Responsibilitiesx";
                RunPageLink = "Job ID" = field("Job Id");
                ToolTip = 'Executes the Responsibilities action.';
            }
            action(Requirements)
            {
                ApplicationArea = Basic;
                Image = RefreshVoucher;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Position Requirements";
                RunPageLink = "Job Id" = field("Job Id");
                ToolTip = 'Executes the Requirements action.';
            }
            action("Vacancy Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Vacancy Report action.';

                trigger OnAction()
                begin
                    Rec.SetRange("Requisition No.", Rec."Requisition No.");
                    Report.Run(69200, true, false, Rec);
                end;
            }
            action(Action34)
            {
                ApplicationArea = Basic;
                Image = OrderTracking;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Vacancy Media Advertisements";
                RunPageLink = "Vacancy No." = field("Requisition No.");
                ToolTip = 'Executes the Action34 action.';
            }
        }
    }
}

#pragma implicitwith restore

