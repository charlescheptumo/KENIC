#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57085 "Project Surrender Team"
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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';

                    trigger OnValidate()
                    begin
                        if Rec.Type = Rec.Type::Machine then
                            Show := true;
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Type field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Actual Time Period"; Rec."Actual Time Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Time Period field.';
                }
                field("Time Period"; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Period field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field("Daily Rate"; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entitlement field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outstanding Amount field.';
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tasks to Carry Out field.';
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Output field.';
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delivery field.';
                }
                field("Last Maintenance Cost"; Rec."Last Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Editable = show;
                    ToolTip = 'Specifies the value of the Last Maintenance Cost field.';
                }
                field("Expected Maintenance Cost"; Rec."Expected Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Editable = Show;
                    ToolTip = 'Specifies the value of the Expected Maintenance Cost field.';
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
    end;

    var
      //  [InDataSet]
        Show: Boolean;
}

