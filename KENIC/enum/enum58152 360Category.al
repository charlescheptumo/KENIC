enum 58152 "360 Category"
{
    Extensible = true;

    value(0; Colleague) { Caption = 'Colleague'; }
    value(1; Manager) { Caption = 'Manager'; }
    value(2; CEO) { Caption = 'CEO'; }
}

enum 80301 "360 Question Type"
{
    Extensible = true;

    value(0; Closed) { Caption = 'Closed'; }
    value(1; Open) { Caption = 'Open'; }
}

enum 80302 "360 Rating"
{
    Extensible = true;

    value(0; " ") { Caption = ' '; }
    value(1; "Strongly Disagree") { Caption = 'Strongly Disagree'; }
    value(2; Disagree) { Caption = 'Disagree'; }
    value(3; Neutral) { Caption = 'Neutral'; }
    value(4; Agree) { Caption = 'Agree'; }
    value(5; "Strongly Agree") { Caption = 'Strongly Agree'; }
}

enum 80303 "360 Status"
{
    Extensible = true;

    value(0; Open) { Caption = 'Open'; }
    value(1; Submitted) { Caption = 'Submitted'; }
}
