/// <summary>
/// ListPart page over eTimsPushCredit for embedding an eTIMS credit note/invoice response list (JSON payload plus a large text "Request" blob field with get/set helper procedures) inside another page.
/// </summary>
page 50732 "Etims Responses"
{
    ApplicationArea = Basic;
    Caption = 'Etims Responses';
    PageType = ListPart;
    SourceTable = eTimsPushCredit;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Json; Rec.Json)
                {
                    ToolTip = 'Specifies the value of the Json field.';
                    MultiLine = true;
                }
                field("CU Invoice Number"; Rec."CU Invoice Number")
                {
                    ToolTip = 'Specifies the value of the CU Invoice Number field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Internal Data"; Rec."Internal Data")
                {
                    ToolTip = 'Specifies the value of the Internal Data field.';
                }
                field("Invoice Number"; Rec."Invoice Number")
                {
                    ToolTip = 'Specifies the value of the Invoice Number field.';
                }
                field(QRCodeUrl; Rec.QRCodeUrl)
                {
                    ToolTip = 'Specifies the value of the QRCodeUrl field.';
                }
                field("SCU ID"; Rec."SCU ID")
                {
                    ToolTip = 'Specifies the value of the SCU ID field.';
                }
                field("Posted to Etims"; Rec."Posted to Etims")
                {
                    ToolTip = 'Specifies the value of the Posted to Etims field.';
                }
                field("Receipt Signature"; Rec."Receipt Signature")
                {
                    ToolTip = 'Specifies the value of the Receipt Signature field.';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field(Request; Rec.Request)
                {
                    ToolTip = 'Specifies the value of the Request field.', Comment = '%';
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        SetLargeText(LargeText);
                    end;
                }
            }
        }
    }

    var
        LargeText: Text;

    trigger OnAfterGetRecord()
    begin
        LargeText := GetLargeText();
    end;

    procedure SetLargeText(NewLargeText: Text)
    var
        OutStream: OutStream;
    begin
        Clear(Rec.Request);
        Rec.Request.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(LargeText);
        Rec.Modify();
    end;

    procedure GetLargeText() NewLargeText: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        Rec.CalcFields(Request);
        Rec.Request.CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), Rec.FieldName(Request)));
    end;
}
