
page 58303 "360 Consol. Open Lines"
{
    Caption = 'Open-ended Responses';
    PageType = ListPart;
    SourceTable = "360 Consol. Open Line";
    SourceTableView = sorting("Evaluatee Employee No.", "Year Reporting Code", "Question Entry No.", "Line No.");
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Text"; Rec."Question Text") { ApplicationArea = All; }
                field("Response Text"; Rec."Response Text") { ApplicationArea = All; }
                field("Self Response"; Rec."Self Response") { ApplicationArea = All; }
            }
        }
    }
}
