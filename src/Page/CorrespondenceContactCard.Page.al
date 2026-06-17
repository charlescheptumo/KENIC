#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50183 "Correspondence Contact Card"
{
    PageType = Card;
    SourceTable = "Correspondence Contact";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Contact PersonTitle"; Rec."Contact PersonTitle")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Type = Rec.Type::Company;
                    ToolTip = 'Specifies the value of the Contact PersonTitle field.';
                }
                field("Contact Person Name"; Rec."Contact Person Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contact Person Name(Attn)';
                    Enabled = Rec.Type = Rec.Type::Company;
                    ToolTip = 'Specifies the value of the Contact Person Name(Attn) field.';
                }
                field("Contact Person Email"; Rec."Contact Person Email")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Type = Rec.Type::Company;
                    ToolTip = 'Specifies the value of the Contact Person Email field.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Name/Individual Name';
                    ToolTip = 'Specifies the value of the Company Name/Individual Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-mail field.';
                }
                field(Homepage; Rec.Homepage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Homepage field.';
                }
            }
        }
    }

    actions
    {
    }
}

