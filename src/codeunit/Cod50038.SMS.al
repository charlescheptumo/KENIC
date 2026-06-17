namespace KICD.KICD;

codeunit 50038 SMS
{
    trigger OnRun()
    begin

    end;


    var
        SingleSMSUrl: Label 'http://4.246.227.105:8092/api/SMS/sendSMS';
        //SingleSMSUrl: Label 'http://13.90.231.54:8092/api/SMS/sendSMS';
        Client: HttpClient;
        Content: HttpContent;
        Headers: HttpHeaders;
        Headers2: HttpHeaders;
        JSONPayload: JsonObject;
        JSONPayload1: JsonObject;
        JSONPayload2: JsonObject;
        JSONPayload3: JsonObject;
        JSONPayload4: JsonObject;
        JSONPayload5: JsonObject;
        JSONPayload6: JsonObject;
        JSONArray: JSONArray;
        URL: Text;
        Token: Text;
        RefreshToken: Text;
        ResponseMessage: HttpResponseMessage;
        Request: HttpRequestMessage;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        ContentText: Text;
        Body: Text;
        Resp: HttpResponseMessage;
        Based: Text;
        // Graph: Record "Microsoft Graphs";
        MultiPartBody: TextBuilder;
        MultiPartBodyOutStream: OutStream;
        MultiPartBodyInStream: InStream;
        Boundary: Text;
        Payments: Record Payments;
        OuStr: OutStream;
        RecRef: RecordRef;
        Ins: Instream;
        Property: Text;
        OStream: OutStream;
        JAccessToken: JsonObject;
        JToken: JsonToken;
        ElapsedSecs: Integer;
        IStream: InStream;
        Buffer: TextBuilder;
        Line: Text;
        PayloadJson: JsonObject;
        GUID: Text;
        TimeFort: Time;
        TimeFormat: Text;
        FinalTwelveHrsConversion: Time;
        TwelveHrsConversion: Decimal;
        FormattedAmount: Text;
        HashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
        Window: Dialog;

    procedure SendSingleSMS(receipient: Text; message: Text) Response: Text
    var
        ResponseMsg: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
        ContentText: Text;
    begin
        Message('Sending SMS to %1', receipient);

        Clear(JSONPayload);

        // 🔹 Build JSON
        JSONPayload.Add('to', receipient);
        JSONPayload.Add('message', message);
        JSONPayload.WriteTo(ContentText);

        // 🔹 Prepare content
        Content.WriteFrom(ContentText);
        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        // 🔹 Send request (SIMPLE + CORRECT)
        if not Client.Post(SingleSMSUrl, Content, ResponseMsg) then
            Error('Failed to connect to SMS API.');

        // 🔹 Read response
        ResponseMsg.Content.ReadAs(Response);

        // 🔹 Debug
        Message('Status: %1\Response: %2', ResponseMsg.HttpStatusCode(), Response);

        // 🔹 Handle failure properly
        if not ResponseMsg.IsSuccessStatusCode then
            Error('SMS failed.\Status: %1\Response: %2',
                  ResponseMsg.HttpStatusCode(),
                  Response);

        exit(Response);
    end;
}

