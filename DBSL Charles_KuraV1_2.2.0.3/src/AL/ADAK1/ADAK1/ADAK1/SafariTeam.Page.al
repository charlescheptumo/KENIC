#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57034 "Safari Team"
{
    PageType = ListPart;
    SourceTable = "Project Members";
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
                    ToolTip = 'Specifies the value of the No. field.';

                    trigger OnValidate()
                    begin
                        ProjectMembers.Reset;
                        ProjectMembers.SetRange(ProjectMembers."No.", Rec."No.");
                        ProjectMembers.SetFilter(ProjectMembers."Return Date", '<=%1', Rec."Return Date");
                        if ProjectMembers.FindFirst then begin
                            if ProjectMembers."Return Date" <> 0D then begin
                                repeat
                                    Error('This employee %1 is tied in another imprest memo %2', ProjectMembers."No.", ProjectMembers."Imprest Memo No.");
                                until ProjectMembers.Next = 0;
                            end;
                        end;
                    end;
                }
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Type';
                    ToolTip = 'Specifies the value of the Advance Type field.';
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'SRC Perdiem';
                    ToolTip = 'Specifies the value of the SRC Perdiem field.';
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Time Period"; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                    Enabled = true;
                    ToolTip = 'Specifies the value of the No. of Days field.';

                    trigger OnValidate()
                    begin
                        //TESTFIELD("Task No.");
                        Rec.TestField("No.");
                        Rec.Validate("No.");
                    end;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field(Entitlement; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Daily Subsistence Allowance';
                    ToolTip = 'Specifies the value of the Total Daily Subsistence Allowance field.';
                }
                field("Imprest Created"; Rec."Imprest Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Created field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job  Task field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';

                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Budget field.';
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Remaining Amount field.';
                }

                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted Amount field.';
                }
                field("Account Actual Spent"; Rec."Account Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Committed Amount"; Rec."Committed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committed Amount field.';
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Amount field.';
                }
                field("Transport Costs"; Rec."Transport Costs")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transport Costs field.';
                }
                field("Total Entitlement"; Rec."Total Entitlement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Entitlement field.';
                }
                field("Entitlement (LCY)"; Rec."Entitlement (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entitlement (LCY) field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outstanding Amount field.';
                }
                field("No. Of Outstanding Imprest";Rec."No. Of Outstanding Imprest")
                {
                  ApplicationArea = Basic;
                  ToolTip = 'Specifies the value of the No. of  Outstanding field.';
                  Visible = false;
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Tasks to Carry Out field.';
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Expected Output field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field("Project Lead"; Rec."Project Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Lead field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Total per Employee"; Rec."Total per Employee")
                {
                    ToolTip = 'Specifies the value of the Total per Employee field.', Comment = '%';
                    Visible = false;
                }
                field("Total otherCost"; Rec."Total otherCost")
                {
                    ToolTip = 'Specifies the value of the Total otherCost field.', Comment = '%';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Type = Rec.Type::Machine then
            Show := true;

        editTransport := false;
        EditDays := true;


        if ImprestMemo.Get(Rec."Imprest Memo No.") then begin




            ApprovalEntry.Reset;
            ApprovalEntry.SetRange("Table ID", 57008);
            //ApprovalEntry.SETRANGE("Document Type","Document Type"::im","Document Type"::"Imprest memo");
            ApprovalEntry.SetRange("Document No.", ImprestMemo."No.");
            ApprovalEntry.SetRange("Sequence No.", 1);
            ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
            ApprovalEntry.SetFilter("Approver ID", '<>%1', ApprovalEntry."Sender ID");

            if ApprovalEntry.FindFirst then begin
                editTransport := true;
                EditDays := false;
                Rec.Modify;

                //MESSAGE(ImprestMemo."No.");

            end;

        end;
         Rec."Total per Employee" := Rec."Total Entitlement" + Rec."Total otherCost";
    end;

    trigger OnOpenPage()
    begin
        Rec."Total per Employee" := Rec."Total Entitlement" + Rec."Total otherCost";
        
    end;



    var
      //  [InDataSet]
        Show: Boolean;
        editTransport: Boolean;
        ApprovalEntry: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
        EditDays: Boolean;
        County: Record County1;
        Constituencies: Page Constituencies;
        ProjectMembers: Record "Project Members";
}

#pragma implicitwith restore

