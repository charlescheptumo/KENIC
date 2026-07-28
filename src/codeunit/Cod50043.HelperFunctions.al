namespace KENIC.KENIC;

codeunit 50043 HelperFunctions
{
    procedure GetAsText(Obj: JsonObject; Name: Text): Text
    var
        Tok: JsonToken;
        JVal: JsonValue;
        Txt: Text;
    begin
        if not Obj.Get(Name, Tok) then
            exit('');

        if not Tok.IsValue() then
            exit('');

        JVal := Tok.AsValue();

        if JVal.IsNull() then
            exit('');

        if TryAsText(JVal, Txt) then
            exit(Txt);

        // Fallback for numbers/booleans
        exit(Format(JVal));
    end;

    procedure GetAsDecimal(Obj: JsonObject; Name: Text): Decimal
    var
        Txt: Text;
        D: Decimal;
    begin
        Txt := GetAsText(Obj, Name);

        if Txt = '' then
            exit(0);

        if not Evaluate(D, Txt) then
            exit(0);

        exit(D);
    end;

    procedure GetAsInteger(Obj: JsonObject; Name: Text): Integer
    var
        Txt: Text;
        I: Integer;
    begin
        Txt := GetAsText(Obj, Name);

        if Txt = '' then
            exit(0);

        if not Evaluate(I, Txt) then
            exit(0);

        exit(I);
    end;

    procedure GetAsBigInteger(Obj: JsonObject; Name: Text): BigInteger
    var
        Txt: Text;
        B: BigInteger;
    begin
        Txt := GetAsText(Obj, Name);

        if Txt = '' then
            exit(0);

        if not Evaluate(B, Txt) then
            exit(0);

        exit(B);
    end;

    procedure GetAsDateTime(Obj: JsonObject; Name: Text): DateTime
    var
        Txt: Text;
        DT: DateTime;
    begin
        Txt := GetAsText(Obj, Name);

        if Txt = '' then
            exit(0DT);

        if not Evaluate(DT, Txt) then
            exit(0DT);

        exit(DT);
    end;

    procedure GetAsDateTimeISO(Obj: JsonObject; Name: Text): DateTime
    var
        Txt: Text;
        CleanTxt: Text;
        DT: DateTime;
        p: Integer;
    begin
        Txt := GetAsText(Obj, Name);

        if Txt = '' then
            exit(0DT);

        // Replace ISO separator
        CleanTxt := Txt.Replace('T', ' ');

        // Remove UTC indicator
        p := StrPos(CleanTxt, 'Z');
        if p > 0 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        // Remove positive timezone offset
        p := StrPos(CleanTxt, '+');
        if p > 0 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        // Remove negative timezone offset (ignore '-' in yyyy-mm-dd)
        p := StrPos(CleanTxt, '-');
        if p > 11 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        // Remove milliseconds
        p := StrPos(CleanTxt, '.');
        if p > 0 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        if not Evaluate(DT, CleanTxt) then
            exit(0DT);

        exit(DT);
    end;

    procedure ParseStartTime(DateText: Text): DateTime
    var
        DT: DateTime;
    begin
        if DateText = '' then
            exit(0DT);

        if not Evaluate(DT, DateText) then
            exit(0DT);

        exit(DT);
    end;

    procedure ParseEndTime(DateText: Text): DateTime
    var
        CleanTxt: Text;
        DT: DateTime;
    begin
        if DateText = '' then
            exit(0DT);

        CleanTxt := DateText;

        while StrPos(CleanTxt, '  ') > 0 do
            CleanTxt := CleanTxt.Replace('  ', ' ');

        if (StrPos(CleanTxt, 'AM') > 0) and (StrPos(CleanTxt, ' AM') = 0) then
            CleanTxt := CleanTxt.Replace('AM', ' AM');

        if (StrPos(CleanTxt, 'PM') > 0) and (StrPos(CleanTxt, ' PM') = 0) then
            CleanTxt := CleanTxt.Replace('PM', ' PM');

        if not Evaluate(DT, CleanTxt) then
            exit(0DT);

        exit(DT);
    end;

    procedure GetAsBoolean(Obj: JsonObject; Name: Text): Boolean
    var
        Txt: Text;
    begin
        Txt := UpperCase(DelChr(GetAsText(Obj, Name), '=', ' '));

        exit(
            (Txt = 'Y') or
            (Txt = 'YES') or
            (Txt = 'TRUE') or
            (Txt = '1'));
    end;

    procedure SafeAssignText(Value: Text; MaxLen: Integer): Text
    begin
        exit(CopyStr(Value, 1, MaxLen));
    end;

    [TryFunction]
    local procedure TryAsText(JVal: JsonValue; var Result: Text)
    begin
        Result := JVal.AsText();
    end;
}