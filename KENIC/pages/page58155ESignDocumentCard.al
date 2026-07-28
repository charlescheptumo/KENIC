page 58155 "ESign Document Card"
{
    PageType = Card;
    SourceTable = "ESign Header";
    Caption = 'ESign Document';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique document number.';

                    trigger OnAssistEdit()
                    var
                        EBoardSetup: Record "E-Board Setup";
                        NoSeries: Codeunit "No. Series";
                    begin
                        if Rec."No." = '' then begin
                            EBoardSetup.GetRecordOnce();
                            EBoardSetup.TestField("E-Signing Nos.");
                            if NoSeries.LookupRelatedNoSeries(EBoardSetup."E-Signing Nos.", Rec."No. Series", Rec."No. Series") then
                                Rec."No." := NoSeries.GetNextNo(Rec."No. Series", WorkDate());
                        end;
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the title of the document to be signed.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies a brief description of the document.';
                }
                field("Document URL"; Rec."Document URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the link or SharePoint URL of the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the overall document status.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the workflow approval status.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the document has been posted.';
                }
            }

            part(Lines; "ESign Lines")
            {
                ApplicationArea = All;
                Caption = 'Signers';
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }

            group(Audit)
            {
                Caption = 'Audit Trail';

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who created this document.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this document was created.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
}