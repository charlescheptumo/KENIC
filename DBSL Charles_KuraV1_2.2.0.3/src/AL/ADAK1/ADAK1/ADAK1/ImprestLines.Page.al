#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57013 "Imprest Lines"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "Imprest Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Type field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    // editable = false;
                    editable = (rec.status = rec.Status::Open);
                    //Editable = StatusIsOpen;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Daily Rate"; Rec."Daily Rate")
                {
                    ApplicationArea = Basic;
                    editable = (rec.status = rec.Status::Open);
                    ToolTip = 'Specifies the value of the Daily Rate field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    editable = (rec.status = rec.Status::Open);
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field(ConvertedAmount; Rec.ConvertedAmount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ConvertedAmount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
    var
        imheader: record "payments";
        StatusIsOpen: Boolean;

    trigger OnAfterGetRecord()
    begin
        //cc
        imheader.reset;
        imheader.SetRange(imheader."No.", rec.No);
        if imheader.findset then
            if imheader.Status = imheader.Status::Released then
                currpage.Editable := false;
        SetFieldsEditability();
        //cc
    end;

    trigger OnOpenPage()
    var
        imheader: record "payments";
    begin

        //cc
        REC.Validate("Daily Rate");
        REC.Validate("No. of Days");
    end;

    local procedure SetFieldsEditability()
    var
        ImprestHeader: Record "Payments";
    begin
        if ImprestHeader.Get(Rec."No") then
            StatusIsOpen := ImprestHeader.Status = ImprestHeader.Status::Open
        else
            StatusIsOpen := false;
    end;
}

#pragma implicitwith restore

