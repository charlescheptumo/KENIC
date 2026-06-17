page 50162 "Board Committee Card"
{
    ApplicationArea = All;
    Caption = 'Board Committee Card';
    PageType = Card;
    SourceTable = "Board Committees";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Comments; rec.Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = Basic;
                    Multiline = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Mandate; rec.Mandate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandate field.';
                }
                field(Type; rec.Type)
                {
                    applicationarea = basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
            part(CommitteeMembers; "Board Committee Members")
            {
                ApplicationArea = Basic;
                SubPageLink = Committee = field(Code);
            }
        }
    }
}
