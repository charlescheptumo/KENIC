#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50041 "pageextension50041" extends "Work Types"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field(Rate; Rec.Rate)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Rate field.';
            }
            field("Responsibility Center Code"; Rec."Responsibility Center Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center Code field.';
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Category field.';
            }
            field("G/L Account"; Rec."G/L Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the G/L Account field.';
            }
            field("Local Travel"; Rec."Local Travel")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Local Travel field.';
            }
            field("International Travel"; Rec."International Travel")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the International Travel field.';
            }
            field(Blocked; rec.Blocked)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Blocked field.';
            }
        }
    }
}

#pragma implicitwith restore

