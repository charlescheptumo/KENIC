#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75452 "Submitted Framewo Procurements"
{
    Caption = 'Submitted Framework Procurements';
    CardPageID = "Framework Request Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const("Framework Agreement"),
                            Posted = const(false),
                            Status = const(Released),
                            "Submission Status" = const(Submitted));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PRN No. field.';
                }
                field("Awarded Bidder No"; Rec."Awarded Bidder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bidder No field.';
                }
                field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bidder Name field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("RFQ Sent"; Rec."RFQ Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFQ Sent field.';
                }
                field("Awarded Quote No"; Rec."Awarded Quote No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Quote No field.';
                }
                field("Awarded Bidder Sum"; Rec."Awarded Bidder Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bidder Sum field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Summary field.';
                }
                field("Procurement Category ID"; Rec."Procurement Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category ID field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control10; Links)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement Manager" = false then
                //OR UserSetup."Procurement Manager"= FALSE
                Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement Manager" = false then
                //OR UserSetup."Procurement Manager"= FALSE
                Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}
