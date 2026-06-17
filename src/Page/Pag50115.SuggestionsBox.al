page 50115 "Suggestions Box"
{
    ApplicationArea = All;
    Caption = 'Suggestions Box';
    PageType = List;
    SourceTable = "Suggestion Box";
    CardPageId = "Suggestion Box";
    SourceTableView = where(Submitted = const(false), "Process Status" = filter("Under ICT"));


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field("Requested By Name"; Rec."Requested By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By Name field.', Comment = '%';
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the System Type field.';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // UserSetup.Get(Rec."Assign to Employee No");
        // if UserSetup."Employee No." <> '' then
        //     IsAssignedUser := true;
    end;

    trigger OnOpenPage()
    begin
        // IsAssignedUser := false;
        // UserSetup.Get(Rec."Requested By");
        // if UserSetup."Employee No." <> '' then
        //     IsAssignedUser := true;
        Rec.SetFilter(Rec."Requested By", UserSetup."Employee No.");
    end;

    var
        UserSetup: Record "User Setup";
        IsAssignedUser: Boolean;
}
