page 58157 "ESign Document FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "ESign Header";
    Caption = 'Attached Documents';

    layout
    {
        area(content)
        {
            group(DocumentLinks)
            {
                ShowCaption = false;

                field("Document URL"; Rec."Document URL")
                {
                    ApplicationArea = All;
                    Caption = 'Original Document';
                    ToolTip = 'Click to open the original document stored in SharePoint.';
                    Visible = HasOriginalDoc;

                    trigger OnDrillDown()
                    begin
                        if Rec."Document URL" <> '' then
                            Hyperlink(Rec."Document URL");
                    end;
                }
                field("Signed Document URL"; Rec."Signed Document URL")
                {
                    ApplicationArea = All;
                    Caption = 'Signed Document';
                    ToolTip = 'Click to open the final signed document stored in SharePoint.';
                    Visible = HasSignedDoc;

                    trigger OnDrillDown()
                    begin
                        if Rec."Signed Document URL" <> '' then
                            Hyperlink(Rec."Signed Document URL");
                    end;
                }
                field(NoDocumentMsg; 'No documents attached yet.')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Visible = not HasOriginalDoc and not HasSignedDoc;
                    Style = Subordinate;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        HasOriginalDoc := Rec."Document URL" <> '';
        HasSignedDoc := Rec."Signed Document URL" <> '';
    end;

    var
        HasOriginalDoc: Boolean;
        HasSignedDoc: Boolean;
}