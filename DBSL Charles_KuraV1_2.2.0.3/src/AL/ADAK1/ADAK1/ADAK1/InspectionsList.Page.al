#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70055 "Inspections List"
{
    ApplicationArea = Basic;
    CardPageID = "Inspection Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inspection Header1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Contract/Order No"; Rec."Contract/Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract/Order No field.';
                }
                field("Commitee Appointment No"; Rec."Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitee Appointment No field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // IF UserSetup.FIND('-') THEN BEGIN
        //   SETFILTER("Responsibility Center","Responsibility Center");
        // END;

        //Fred RC
        FnGetUserRC();//NICK
    end;

    var
        UserSetup: Record "User Setup";


    procedure FnGetUserRC()
    begin
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
        end;
    end;
}

