#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58159 "Meeting Plan Card"
{
    Caption = 'Meeting Plan';
    PageType = Document;
    SourceTable = "Meeting Plans";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Id"; Rec."Id")
                {
                    ApplicationArea = All;
                }
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                }
                field("Committee Id"; Rec."Committee Id")
                {
                    ApplicationArea = All;
                }
                field("Committee Description"; Rec."Committee Description")
                {
                    ApplicationArea = All;
                }
                field("Year"; Rec."Year")
                {
                    ApplicationArea = All;
                }
                field("Quarter"; Rec."Quarter")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
            }
            group(Voting)
            {
                Caption = 'Voting';

                field("Allow Multiple Date Votes"; Rec."Allow Multiple Date Votes")
                {
                    ApplicationArea = All;
                }
                field("Voting Status"; Rec."Voting Status")
                {
                    ApplicationArea = All;
                }
                field("Poll Opened At"; Rec."Poll Opened At")
                {
                    ApplicationArea = All;
                }
                field("Poll Closed At"; Rec."Poll Closed At")
                {
                    ApplicationArea = All;
                }
                field("Selected Meeting Date"; Rec."Selected Meeting Date")
                {
                    ApplicationArea = All;
                }
            }
            part(DateOptions; "Meeting Date Options Subform")
            {
                Caption = 'Proposed Dates';
                ApplicationArea = All;
                SubPageLink = "Meeting Plan Id" = field("Id");
            }
            part(Votes; "Meeting Date Polls Subform")
            {
                Caption = 'Votes';
                ApplicationArea = All;
                SubPageLink = "Meeting Plan Id" = field("Id");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenPoll)
            {
                Caption = 'Open Poll';
                ApplicationArea = All;
                Image = Start;
                Enabled = Rec."Voting Status" = Rec."Voting Status"::"Not Started";

                trigger OnAction()
                begin
                    Rec.OpenPoll();
                    CurrPage.Update(false);
                end;
            }
            action(ClosePoll)
            {
                Caption = 'Close Poll';
                ApplicationArea = All;
                Image = Stop;
                Enabled = Rec."Voting Status" = Rec."Voting Status"::Open;

                trigger OnAction()
                begin
                    Rec.ClosePoll();
                    CurrPage.Update(false);
                end;
            }
            action(SelectWinningDate)
            {
                Caption = 'Select Winning Date';
                ApplicationArea = All;
                Image = SelectEntries;
                Enabled = Rec."Voting Status" = Rec."Voting Status"::Closed;

                trigger OnAction()
                var
                    DateOption: Record "Meeting Date Options";
                begin
                    DateOption.SetRange("Meeting Plan Id", Rec."Id");
                    if Page.RunModal(Page::"Meeting Date Options List", DateOption) = Action::LookupOK then begin
                        Rec.SelectWinningDate(DateOption."Id");
                        CurrPage.Update(false);
                    end;
                end;
            }
        }
    }
}
