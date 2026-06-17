#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 60095 "Assigned General List"
{
    Caption = 'Assigned General List';
    CardPageID = "Ticketing Card";
    PageType = List;
    SourceTable = "Front Office Management";
    SourceTableView = where(Status = const(Assigned));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
                field("Follow up Actions"; Rec."Follow up Actions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Follow up Actions field.';
                }
                field("Assigned Officer No."; Rec."Assigned Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer No. field.';
                }
                field("Assigned Officer Name"; Rec."Assigned Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
                field("Assigned Officer Email"; Rec."Assigned Officer Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Email field.';
                }
                field("Level of Priority"; Rec."Level of Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level of Priority field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //SETRANGE("Document Type","Document Type"::Enquiries);
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // IF UserSetup.FINDFIRST THEN
        // SETRANGE("Assigned Officer No.",UserSetup."Employee No.");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //"Document Type" := "Document Type"::Enquiries;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Document Type" := "Document Type"::Enquiries;
    end;

    trigger OnOpenPage()
    begin
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // IF UserSetup.FINDFIRST THEN
        // SETRANGE("Assigned Officer No.",UserSetup."Employee No.");
    end;

    var
        UserSetup: Record "User Setup";
}

