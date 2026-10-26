/// <summary>
/// Page Asset Possession Card (ID 50410).
/// </summary>
page 50410 "Asset Possession Card"
{
    Caption = 'Asset Possession Form';
    PageType = Card;
    SourceTable = "Asset Possession Header";
    ApplicationArea = All;
    // Editable = IsOpen;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = IsOpen;


                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the form, according to the number series.';

                    trigger OnAssistEdit()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the form was created.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the form is still open or has been issued.';
                    Editable = false;
                }
            }
            group("Part I: Staff Details")
            {
                Caption = 'Part I: Staff Details';
                Editable = IsOpen;


                field("Staff Type"; Rec."Staff Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies whether the staff member is Permanent, Contract, Intern or Casual.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the staff number.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the staff member.';
                    Editable = false;
                }
                field("Date Engaged"; Rec."Date Engaged")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the staff member was engaged.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the end date of the engagement, if any.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department of the staff member.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the position of the staff member.';
                }
            }
            part("Office Equipment"; "Asset Poss. Equipment Subform")
            {
                ApplicationArea = All;
                Caption = 'Part II: Office Equipment';
                Editable = IsOpen;
                SubPageLink = "Document No." = field("No.");
            }
            part(Furniture; "Asset Poss. Furniture Subform")
            {
                ApplicationArea = All;
                Caption = 'Part III: Furniture';
                Editable = IsOpen;
                SubPageLink = "Document No." = field("No.");
            }
            part(Keys; "Asset Poss. Keys Subform")
            {
                ApplicationArea = All;
                Caption = 'Part IV: Keys';
                Editable = IsOpen;
                SubPageLink = "Document No." = field("No.");
            }
            part(Phones; "Asset Poss. Phones Subform")
            {
                ApplicationArea = All;
                Caption = 'Part V: Phones';
                Editable = IsOpen;
                SubPageLink = "Document No." = field("No.");
            }
            group("Part VI: Declaration")
            {
                Caption = 'Part VI: Declaration';
                Editable = IsOpen;


                field("Declaration Accepted"; Rec."Declaration Accepted")
                {
                    ApplicationArea = All;
                    Caption = 'I confirm the information provided herein is correct and the assets are in good and working condition.';
                    ToolTip = 'Confirm that the information is correct and the assets are in good and working condition.';
                }
                group("Received By")
                {
                    Caption = 'Received By';

                    field("Received By Name"; Rec."Received By Name")
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the name of the person receiving the assets.';
                    }
                    field("Received By Date"; Rec."Received By Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the date the assets were received. Defaults to today when the form is issued.';
                    }
                    field("Received By Remark"; Rec."Received By Remark")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies a remark from the person receiving the assets.';
                    }
                }
                group("Issued By")
                {
                    Caption = 'Issued By';

                    field("Issued By Name"; Rec."Issued By Name")
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        ToolTip = 'Specifies the name of the person issuing the assets.';
                    }
                    field("Issued By Date"; Rec."Issued By Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the date the assets were issued. Defaults to today when the form is issued.';
                    }
                    field("Issued By Remark"; Rec."Issued By Remark")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies a remark from the person issuing the assets.';
                    }
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Issue)
            {
                ApplicationArea = All;
                Caption = 'Issue';
                Image = Approve;
                ToolTip = 'Validate the form and mark it as issued. Issued forms can no longer be edited.';
                Enabled = IsOpen;

                trigger OnAction()
                begin
                    Rec.IssueDocument();
                    CurrPage.Update(false);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = All;
                Caption = 'Reopen';
                Image = ReOpen;
                ToolTip = 'Reopen an issued form so it can be edited.';
                Enabled = not IsOpen;

                trigger OnAction()
                begin
                    Rec.ReopenDocument();
                    CurrPage.Update(false);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(Issue_Promoted; Issue)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        IsOpen := Rec.Status = Rec.Status::Open;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IsOpen := true;
    end;

    var
        IsOpen: Boolean;
}
