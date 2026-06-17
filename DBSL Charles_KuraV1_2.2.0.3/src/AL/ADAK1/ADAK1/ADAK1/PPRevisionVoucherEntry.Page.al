#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99663 "PP Revision Voucher Entry"
{
    Caption = 'Procurement Plan Revision Entries';
    PageType = List;
    SourceTable = "Procurement Plan Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(Modified;rec.Modified)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = ProcurementPlanNoVisible;
                    ToolTip = 'Specifies the value of the Procurement Plan ID field.';
                }
                field("Revised Plan No"; Rec."Revised Plan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Revised Plan No field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                // field("Plan Item Type";"Plan Item Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Plan Item No";"Plan Item No")
                // {
                //     ApplicationArea = Basic;
                // }
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
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reservation Code';
                    ToolTip = 'Specifies the value of the Reservation Code field.';
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
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
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
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Q1 Quantity"; Rec."Q1 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Quantity field.';
                }
                field("Q1 Amount"; Rec."Q1 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Amount field.';
                }
                field("Q2 Quantity"; Rec."Q2 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Quantity field.';
                }
                field("Q2 Amount"; Rec."Q2 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Amount field.';
                }
                field("Q3 Quantity"; Rec."Q3 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Quantity field.';
                }
                field("Q3 Amount"; Rec."Q3 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Amount field.';
                }
                field("Q4 Quantity"; Rec."Q4 Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Quantity field.';
                }
                field("Q4 Amount"; Rec."Q4 Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Amount field.';
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
                field("Section Length(Km)"; Rec."Section Length(Km)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Section Length(Km) field.';
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Work Plan Project ID field.';
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Workplan Task No. field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
        area(processing)
        {
            action("Update Prices")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Update Prices action.';

                // trigger OnAction()
                // begin
                //      if Confirm('Are you sure you sure you want to update the price for this item ?',true) then begin
                //      rec.Items.Reset;
                //         Rec.Items.SetRange(rec."No.",rec."Plan Item No");
                //       if Rec.Items.FindSet then
                //         if Rec.Items."Unit Cost"<>0 then begin
                //       Rec."Unit Cost":= Rec.Items."Unit Cost";
                //           end else begin
                //      Rec."Unit Cost":=rec.Items."Last Direct Cost";
                //             end;
                //       Rec.Validate(Rec."Unit Cost");
                //       Message('Price Update Successfully');
                //       end;
                // end;
            }
        }
    }

    trigger OnInit()
    begin
        //ProcurementPlanNoVisible:=TRUE;
    end;

    var
        ProcurementPlanNo: Code[20];
      //  [InDataSet]
        ProcurementPlanNoVisible: Boolean;
      //  [InDataSet]
        ProcurementPlanLineNoVisible: Boolean;
        Items: Record Item;


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

#pragma implicitwith restore
