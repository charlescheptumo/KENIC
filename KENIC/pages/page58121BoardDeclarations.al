page 58121 "Board Declarations"
{
    PageType = List;
    SourceTable = "Board Declaration Header";
    Caption = 'Board Declarations';
    CardPageId = "Board Declaration Card";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the declaration number.';
                }
                field("Board Member No."; Rec."Board Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member number.';
                }
                field("Board Member Name"; Rec."Board Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member name.';
                }
                field("Declaration Type"; Rec."Declaration Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this declaration is Annual or for a specific Meeting.';
                }
                field("Declaration Date"; Rec."Declaration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of declaration.';
                }
                field("Declaration Status"; Rec."Declaration Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current approval status.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who submitted the record.';
                }
            }


        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateAnnualDeclarations)
            {
                ApplicationArea = All;
                Caption = 'Create Annual Declarations';
                Image = CreateDocuments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Creates annual declaration records for all active board members who do not already have one for the current year.';

                trigger OnAction()
                var
                    BoardMember: Record "Board Members";
                    DeclarationHeader: Record "Board Declaration Header";
                    ExistingDeclaration: Record "Board Declaration Header";
                    DeclarationLine: Record "Board Declaration Line";
                    InterestType: Record "Declaration Interest Type";
                    CreatedCount: Integer;
                    CurrentYear: Integer;
                    NextLineNo: Integer;
                begin
                    CurrentYear := Date2DMY(WorkDate(), 3);

                    if not Confirm(
                        StrSubstNo(
                            'Annual declarations will be created for all active board members who do not already have one for %1. Continue?',
                            CurrentYear),
                        false)
                    then
                        exit;

                    BoardMember.Reset();
                    BoardMember.SetRange(Disabled, false);

                    if BoardMember.FindSet() then
                        repeat
                            ExistingDeclaration.Reset();
                            ExistingDeclaration.SetRange("Board Member No.", BoardMember."Personal No");
                            ExistingDeclaration.SetRange("Declaration Type", ExistingDeclaration."Declaration Type"::Annual);
                            ExistingDeclaration.SetRange("Declaration Year", CurrentYear);

                            if ExistingDeclaration.IsEmpty() then begin
                                DeclarationHeader.Init();
                                DeclarationHeader.Validate("Declaration Type", DeclarationHeader."Declaration Type"::Annual);
                                DeclarationHeader.Validate("Board Member No.", BoardMember."Personal No");
                                DeclarationHeader."Declaration Year" := CurrentYear;
                                DeclarationHeader."Declaration Status" := DeclarationHeader."Declaration Status"::Draft;

                                if DeclarationHeader.Insert(true) then begin
                                    CreatedCount += 1;


                                    InterestType.Reset();
                                    InterestType.SetRange(Blocked, false);

                                    if InterestType.FindSet() then begin
                                        NextLineNo := 10000;
                                        repeat
                                            DeclarationLine.Init();
                                            DeclarationLine."Declaration No." := DeclarationHeader."No.";
                                            DeclarationLine."Line No." := NextLineNo;
                                            DeclarationLine.Validate("Interest Type", InterestType.Code);
                                           // DeclarationLine.Validate("Interest Type", InterestType.Code);
                                            DeclarationLine.Insert(true);

                                            NextLineNo += 10000;
                                        until InterestType.Next() = 0;
                                    end;
                                end;
                            end;
                        until BoardMember.Next() = 0;

                    CurrPage.Update(false);

                    Message(
                        '%1 annual declaration(s) created successfully for %2.',
                        CreatedCount,
                        CurrentYear);
                end;
            }
        }
    }
}