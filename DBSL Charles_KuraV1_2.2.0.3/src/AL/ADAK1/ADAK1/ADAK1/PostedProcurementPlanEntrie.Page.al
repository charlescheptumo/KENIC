#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75059 "Posted Procurement Plan Entrie"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Plan Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan ID field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Category field.';
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Plan Project ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Preference/Reservation Code"; Rec."Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preference/Reservation Code field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Date field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Budget Cost"; Rec."Line Budget Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Budget Cost field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Constituency; Rec.Constituency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency field.';
                }
                field("Road No."; Rec."Road No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road No. field.';
                }
                field("Road Name"; Rec."Road Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Procurement Start Date"; Rec."Procurement Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Start Date field.';
                }
                field("Procurement End Date"; Rec."Procurement End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement End Date field.';
                }
                field("Procurement Duration (Days)"; Rec."Procurement Duration (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Duration (Days) field.';
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Unit Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Task No. field.';
                }
                field("Project_Combined Proc Budget"; Rec."Project_Combined Proc Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project_Combined Proc Budget field.';
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Product Group field.';
                }
                field("Procurement Use"; Rec."Procurement Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Use field.';
                }
                field("Total PRN Commitments"; Rec."Total PRN Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total PRN Commitments field.';
                }
                field("Total Contract Commitments"; Rec."Total Contract Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Contract Commitments field.';
                }
                field("Total PO Commitments"; Rec."Total PO Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total PO Commitments field.';
                }
                field("Total Purchase Commitments"; Rec."Total Purchase Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Purchase Commitments field.';
                }
                field("Total Purchase Invoices"; Rec."Total Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Purchase Invoices field.';
                }
                field("Total Purchase Credit Memos"; Rec."Total Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Purchase Credit Memos field.';
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Costs field.';
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Procurement Budget field.';
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job No field.';
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job Task No. field.';
                }
                field("Transferred from Item Budget"; Rec."Transferred from Item Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transferred from Item Budget field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage(Km) field.';
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage(Km) field.';
                }
                field("Section Length(Km)"; Rec."Section Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Length(Km) field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
            }
            systempart(Control38; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control40; Links)
            {
            }
        }
    }

    actions
    {
    }

    var
        ProcurementPlanNo: Code[20];
       // [InDataSet]
        ProcurementPlanNoVisible: Boolean;
       // [InDataSet]
        ProcurementPlanLineNoVisible: Boolean;


    procedure SetProcurementNo(No: Code[20])
    begin
        ProcurementPlanNo := No;
    end;


    procedure SetProcurementNoVisible(NewJobNoVisible: Boolean)
    begin
        ProcurementPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetProcuremntLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        ProcurementPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

