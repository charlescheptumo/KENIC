#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69301 "Disciplinary Commitee Card"
{
    PageType = Card;
    SourceTable = "Disciplinary Committees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Non-Employee"; Rec."Non-Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Employee field.';
                    trigger OnValidate()
                    begin
                        EnableControls();
                    end;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Mandate; Rec.Mandate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandate field.';
                }
            }
            part(Control10; "Disciplinary Committee Members")
            {
                Visible = Employee;
                Caption = 'Disciplinary Committee Members';
                SubPageLink = Committee = field(Code);
            }
            part(Control11; "Disciplinary Committee ListP")
            {
                Visible = not Employee;
                Caption = 'Disciplinary Committee Members';
                SubPageLink = "Document No." = field(Code);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        EnableControls();
    end;

    var
        Employee: Boolean;

    /// <summary>
    /// EnableControls.
    /// </summary>
    procedure EnableControls()
    begin
        Employee := Rec.IsEmployee();
    end;
}

