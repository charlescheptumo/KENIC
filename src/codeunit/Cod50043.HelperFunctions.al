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

        // Handle null safely
        if Format(JVal) = 'null' then
            exit('');

        // Try to get as text (works for real JSON strings)
        if TryAsText(JVal, Txt) then
            exit(Txt);

        // Otherwise fallback to Format (for numbers/boolean)
        exit(Format(JVal));
    end;


    procedure GetAsDecimal(Obj: JsonObject; Name: Text): Decimal
    var
        Tok: JsonToken;
        Txt: Text;
        D: Decimal;
    begin
        if not Obj.Get(Name, Tok) then
            exit(0);

        Txt := Tok.AsValue().AsText();
        if Txt = '' then
            exit(0);

        Evaluate(D, Txt);
        exit(D);
    end;

    procedure GetAsInteger(Obj: JsonObject; Name: Text): Integer
    var
        Tok: JsonToken;
        Txt: Text;
        I: Integer;
    begin
        if not Obj.Get(Name, Tok) then
            exit(0);

        Txt := Tok.AsValue().AsText();
        if Txt = '' then
            exit(0);

        Evaluate(I, Txt);
        exit(I);
    end;

    procedure GetAsDateTime(Obj: JsonObject; Name: Text): DateTime
    var
        Tok: JsonToken;
        Txt: Text;
        DT: DateTime;
    begin
        if not Obj.Get(Name, Tok) then
            exit(0DT);

        Txt := Tok.AsValue().AsText();
        if Txt = '' then
            exit(0DT);

        Evaluate(DT, Txt);
        exit(DT);
    end;

    procedure GetAsDateTimeISO(Obj: JsonObject; Name: Text): DateTime
    var
        Tok: JsonToken;
        Txt: Text;
        CleanTxt: Text;
        DT: DateTime;
        p: Integer;
    begin
        if not Obj.Get(Name, Tok) then
            exit(0DT);

        Txt := Tok.AsValue().AsText();
        if Txt = '' then
            exit(0DT);

        // 1) Replace ISO 'T' with space
        CleanTxt := Txt.Replace('T', ' ');

        // 2) Remove timezone if present (Z or +HH:MM or -HH:MM)
        //    Example: 2026-02-09 13:55:11.957Z  OR 2026-02-09 13:55:11.957+03:00
        p := StrPos(CleanTxt, 'Z');
        if p > 0 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        p := StrPos(CleanTxt, '+');
        if p > 0 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        p := StrPos(CleanTxt, '-');
        // Avoid cutting the date part (the date has '-' too). Only cut timezone like " 13:55:11-03:00"
        if (p > 0) and (p > 11) then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        // 3) Remove milliseconds if present (.957)
        p := StrPos(CleanTxt, '.');
        if p > 0 then
            CleanTxt := CopyStr(CleanTxt, 1, p - 1);

        // Now CleanTxt looks like: 2026-02-09 13:55:11
        if not Evaluate(DT, CleanTxt) then
            exit(0DT);

        exit(DT);
    end;

    procedure ParseStartTime(DateText: Text): DateTime
    var
        CleanTxt: Text;
        DT: DateTime;
    begin
        if DateText = '' then
            exit(0DT);

        // This format is already Evaluate-compatible
        // Example: 02/09/2026 13:55:11

        if not Evaluate(DT, DateText) then
            Error('Invalid StartTime format: %1', DateText);

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

        // Remove double spaces
        while StrPos(CleanTxt, '  ') > 0 do
            CleanTxt := CleanTxt.Replace('  ', ' ');

        // Insert space before AM/PM if missing
        if (StrPos(CleanTxt, 'AM') > 0) and (StrPos(CleanTxt, ' AM') = 0) then
            CleanTxt := CleanTxt.Replace('AM', ' AM');

        if (StrPos(CleanTxt, 'PM') > 0) and (StrPos(CleanTxt, ' PM') = 0) then
            CleanTxt := CleanTxt.Replace('PM', ' PM');

        // Example becomes: Feb 9 2026 1:55 PM

        if not Evaluate(DT, CleanTxt) then
            Error('Invalid EndTime format: %1', DateText);

        exit(DT);
    end;

    procedure GetAsBoolean(Obj: JsonObject; Name: Text): Boolean
    var
        Txt: Text;
    begin
        Txt := UpperCase(GetAsText(Obj, Name));

        if (Txt = 'Y') or (Txt = 'TRUE') or (Txt = '1') then
            exit(true);

        exit(false);
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

    procedure GetAsBigInteger(Obj: JsonObject; Name: Text): BigInteger
    var
        Tok: JsonToken;
        Txt: Text;
        B: BigInteger;
    begin
        if not Obj.Get(Name, Tok) then
            exit(0);

        Txt := Tok.AsValue().AsText();

        if Txt = '' then
            exit(0);

        Evaluate(B, Txt);

        exit(B);
    end;
}
