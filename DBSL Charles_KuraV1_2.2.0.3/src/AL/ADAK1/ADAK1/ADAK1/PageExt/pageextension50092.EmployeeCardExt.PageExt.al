#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50092 "Employee Card Ext" extends "Employee Card"
{
    layout
    {

        modify(Control13)
        {
            Visible = false;
        }

        modify(Payments)
        {
            Visible = false;
        }
        modify("Birth Date")
        {
            Visible = false;
        }
        addafter("Phone No.2")
        {
            field(Disabled; Rec.Disabled)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Disabled field.';
            }


        }
        addafter("Last Name")
        {
            field("Job ID"; Rec."Job ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job ID field.', Comment = '%';
                Editable = true;
            }
        }
        addafter("Job Title")
        {
            field("Current Position ID"; Rec."Current Position ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Current Position ID field.', Comment = '%';
                Editable = true;
            }
        }

        addafter("Last Date Modified")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the User ID field.';
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Department Code field.';

            }

            field("Directorate Code"; Rec."Directorate Code")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Directorate Code field.';
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Division field.';
            }
            field("Section Code"; Rec."Section Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Section Code field.';
            }
            field("Directorate Head"; Rec."Directorate Head")
            {
                ApplicationArea = Basic;
                Caption = 'Division Head';
                ToolTip = 'Specifies the value of the Division Head field.';
            }
            field("Driver?"; Rec."Driver?")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Driver? field.';
            }
            field(HOD; Rec.HOD)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD field.';

            }
            field(CEO;Rec.CEO){
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the CEO field.';
            }
            field("Employee Category"; Rec."Employee Category")
            {
                Caption = 'Employee Category';
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Category field.';
            }
            field("Employement Terms"; Rec."Employement Terms")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employement Terms field.';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            }

        }
        addfirst("Address & Contact")
        {
            group(Control1367)
            {
            }
        }
        addafter("Salespers./Purch. Code")
        {
            field("Research Center"; Rec."Research Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Research Center field.';
            }
        }
        addfirst(Personal)
        {
            field("Date Of Birth"; Rec."Date Of Birth")
            {
                ApplicationArea = Basic;
                ToolTip = 'Enter the date of birth here to calculate retirement date';
            }

        }
        addlast(Administration)
        {
            field("Contract End Date"; Rec."Contract End Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Contract End Date field.';

            }
        }
    }
    actions
    {
        addlast("E&mployee")
        {
            action("Change Position")
            {
                ApplicationArea = BasicHR;
                Enabled = true;
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Change Position action.';
                trigger OnAction()
                var
                    Emp: record Employee;
                    ChangePosition: report "Change Employee Position";
                begin
                    Emp.Reset();
                    Emp.SetRange("No.", Rec."No.");
                    ChangePosition.SetTableView(Emp);
                    ChangePosition.RunModal;
                end;
            }
            action("Employee History")
            {
                ApplicationArea = BasicHR;
                Enabled = true;
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Employee History";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the Employee History action.';
            }
        }
        addafter(PayEmployee)
        {
            action("Create Customer Imprest A/C")
            {
                ApplicationArea = BasicHR;
                Enabled = true;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Create Customer Imprest A/C action.';

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    if Rec.CreateCustomer then
                        Message(Text000, 'Imprest A/C')
                    else
                        Message(Text001, 'Imprest A/C');
                end;
            }
            action("Create Resource A/C")
            {
                ApplicationArea = Basic;
                Enabled = true;
                Image = Resource;
                Promoted = true;
                Visible = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Create Resource A/C action.';

                trigger OnAction()
                begin
                    if Rec.CreateResource then
                        Message(Text000, 'Resource')
                    else
                        Message(Text001, 'Resource');
                end;
            }
            action("&Employee Standing Imprest Statement")
            {
                ApplicationArea = Basic;
                Caption = '&Employee Standing Imprest Statement';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Employee Standing Imprest Statement action.';

                trigger OnAction()
                var
                EmployeeRec: Record Employee;
                begin
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    Report.Run(50116, true, false, EmployeeRec);
                end;
            }
        }
    }


    //Unsupported feature: Property Modification (Id) on "FormatAddress(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //FormatAddress : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FormatAddress : 1553;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsCountyVisible(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsCountyVisible : 1002;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsCountyVisible : 1552;
    //Variable type has not been exported.

    var
       // [InDataSet]
        ShowCust: Boolean;
      //  [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
}

#pragma implicitwith restore

