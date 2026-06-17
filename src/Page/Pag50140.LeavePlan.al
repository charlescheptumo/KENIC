page 50140 "Leave Plan"
{
    AutoSplitKey = true;
    Caption = 'Leave Plan';
    DataCaptionFields = "Leave Plan No.";
    PageType = Worksheet;
    RefreshOnActivate = true;
    SaveValues = true;
    SourceTable = "Leave Plan Lines";
    ObsoleteReason = 'Remove old Leave Plan experience.';
    ObsoleteState = Pending;
    ObsoleteTag = '22.0';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control26)
            {
                ShowCaption = false;
                field(CurrLeavePlanNo; CurrLeavePlanNo)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Leave Plan No';
                    ToolTip = 'Specifies the number of the Leave Plan.';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CurrPage.SaveRecord();
                        LeavePlanMgt.LookupOwnerLeavePlan(CurrLeavePlanNo, Rec, LeavePlanHeader);
                        UpdateControls();
                    end;

                    trigger OnValidate()
                    begin
                        LeavePlanHeader.Reset();
                        LeavePlanMgt.FilterLeavePlans(LeavePlanHeader, LeavePlanHeader.FieldNo("Owner User ID"));
                        LeavePlanMgt.CheckLeavePlanNo(LeavePlanHeader, CurrLeavePlanNo);
                        CurrPage.SaveRecord();
                        LeavePlanMgt.SetLeavePlanNo(CurrLeavePlanNo, Rec);
                        UpdateControls();
                    end;
                }
                field(EmployeeNo; LeavePlanHeader."Employee No.")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Employee No.';
                    Editable = false;
                    ToolTip = 'Specifies a number for the Employee.';
                }
                field(ApproverUserID; LeavePlanHeader."Approver User ID")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Approver User ID';
                    Editable = false;
                    ToolTip = 'Specifies the ID of the Leave Plan approver.';
                    Visible = false;
                }
                field(StartingDate; LeavePlanHeader."Starting Date")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Starting Date';
                    Editable = false;
                    ToolTip = 'Specifies the date from which the report or batch job processes information.';
                }
                field(EndingDate; LeavePlanHeader."Ending Date")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ending Date';
                    Editable = false;
                    ToolTip = 'Specifies the date to which the report or batch job processes information.';
                }
            }
            repeater(Control1)
            {
                ShowCaption = false;
                // field(Type; Rec.Type)
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the type of Leave Plan line.';

                //     trigger OnValidate()
                //     begin
                //         AfterGetCurrentRecord();
                //         CurrPage.Update(true);
                //     end;
                // }
                // field("Job No."; Rec."Job No.")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the number for the job that is associated with the Leave Plan line.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                // field("Job Task No."; Rec."Job Task No.")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the number of the related job task.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Editable = AllowEdit;
                    ToolTip = 'Specifies a description of the Leave Plan line.';

                    trigger OnAssistEdit()
                    begin
                        if Rec."Line No." = 0 then
                            exit;

                        // Rec.ShowLineDetails(false);
                        CurrPage.Update(false);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field("Cause of Absence Code"; Rec."Cause of Absence Code")
                {
                    ApplicationArea = Jobs;
                    Editable = AllowEdit;
                    ToolTip = 'Specifies a list of standard absence codes, from which you may select one.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = Jobs;
                    Editable = AllowEdit;
                    ToolTip = 'Specifies if the usage that you are posting is chargeable.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                // field("Work Type Code"; Rec."Work Type Code")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies which work type the Employee applies to. Prices are updated based on this entry.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                // field("Service Order No."; Rec."Service Order No.")
                // {
                //     ApplicationArea = Jobs;
                //     Editable = AllowEdit;
                //     ToolTip = 'Specifies the service order number that is associated with the Leave Plan line.';
                //     Visible = false;

                //     trigger OnValidate()
                //     begin
                //         CurrPage.SaveRecord();
                //     end;
                // }
                // field("Assembly Order No."; Rec."Assembly Order No.")
                // {
                //     ApplicationArea = Assembly;
                //     ToolTip = 'Specifies the assembly order number that is associated with the Leave Plan line.';
                //     Visible = false;
                // }
                field(Field1; CellData[1])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[1];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[1] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(1);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field2; CellData[2])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[2];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[2] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(2);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field3; CellData[3])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[3];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[3] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(3);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field4; CellData[4])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[4];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[4] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(4);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field5; CellData[5])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[5];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[5] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(5);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field6; CellData[6])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[6];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[6] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(6);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field7; CellData[7])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[7];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[7] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(7);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field8; CellData[8])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[8];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[8] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(8);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field9; CellData[9])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[9];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[9] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(9);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field10; CellData[10])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[10];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[10] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(10);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field11; CellData[11])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[11];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[11] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(11);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field12; CellData[12])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[12];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[12] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(12);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field13; CellData[13])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[13];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[13] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(13);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field14; CellData[14])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[14];
                    // DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[14] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(14);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field15; CellData[15])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[15];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[15] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(15);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field16; CellData[16])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[16];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[16] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(16);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field17; CellData[17])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[17];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[17] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(17);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field18; CellData[18])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[18];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[18] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(18);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field19; CellData[19])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[19];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[19] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(19);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field20; CellData[20])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[20];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[20] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(20);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field21; CellData[21])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[21];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[21] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(21);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field22; CellData[22])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[22];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[22] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(22);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field23; CellData[23])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[23];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[23] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(23);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field24; CellData[24])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[24];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[24] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(24);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field25; CellData[25])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[25];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[25] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(25);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field26; CellData[26])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[26];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[26] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(26);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field27; CellData[27])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[27];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[27] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(27);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field28; CellData[28])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[28];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[28] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(28);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field29; CellData[29])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[29];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[29] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(29);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field30; CellData[30])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[30];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[30] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(30);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field31; CellData[31])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[31];
                    // DecimalPlaces = 0 : 16;
                    Editable = AllowEdit;
                    Width = 6;
                    ToolTip = 'Specifies the value of the CellData[31] field.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(31);
                        CellDataOnAfterValidate();
                    end;
                }
                // field("Total Quantity"; Rec."Total Quantity")
                // {
                //     ApplicationArea = Jobs;
                //     Caption = 'Total';
                //     DrillDown = false;
                //     ToolTip = 'Specifies the total number of hours that have been entered on a Leave Plan.';
                //     Visible = false;
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies information about the status of a Leave Plan line.';
                }
            }
        }
        area(factboxes)
        {
            // part(LeavePlanStatusFactBox; "Leave Plan Status FactBox")
            // {
            //     ApplicationArea = Jobs;
            //     Caption = 'Leave Plan Status';
            // }
            part(ActualSchedSummaryFactBox; "Actual/Sched. Summary FactBox")
            {
                ApplicationArea = Jobs;
                Caption = 'Actual/Budgeted Summary';
                Visible = true;
            }
            // part(ActivityDetailsFactBox; "Activity Details FactBox")
            // {
            //     ApplicationArea = Jobs;
            //     Caption = 'Activity Details';
            //     SubPageLink = "Leave Plan No." = field("Leave Plan No."),
            //                   "Line No." = field("Line No.");
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Leave Plan")
            {
                Caption = '&Leave Plan';
                Image = PlanningWorksheet;
                action(PreviousPeriod)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Previous Period';
                    Image = PreviousSet;
                    ToolTip = 'Show the information based on the previous period. If you set the View by field to Day, the date filter changes to the day before.';

                    trigger OnAction()
                    begin
                        FindLeavePlan(SetWanted::Previous);
                    end;
                }
                action(NextPeriod)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Next Period';
                    Image = NextSet;
                    ToolTip = 'View information for the next period.';

                    trigger OnAction()
                    begin
                        FindLeavePlan(SetWanted::Next);
                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Leave Plan Allocation")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Leave Plan Allocation';
                    Image = Allocate;
                    ToolTip = 'Allocate posted hours among days of the week on a Leave Plan.';

                    trigger OnAction()
                    begin
                        TimeAllocation();
                    end;
                }
                action("Activity &Details")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Activity &Details';
                    Image = View;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View the quantity of hours for each Leave Plan status.';

                    trigger OnAction()
                    begin
                        // Rec.ShowLineDetails(false);
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    var
                        DimMgt: Codeunit DimensionManagement;
                    begin
                        Rec."Dimension Set ID" := DimMgt.EditDimensionSet(Rec."Dimension Set ID", DimensionCaptionTok);
                    end;
                }
            }
            group(Comments)
            {
                Caption = 'Co&mments';
                Image = ViewComments;
                action(LeavePlanComments)
                {
                    ApplicationArea = Comments;
                    Caption = '&Leave Plan Comments';
                    Image = ViewComments;
                    RunObject = Page "Leave Plan Comment Sheet";
                    RunPageLink = "No." = field("Leave Plan No."),
                                  "Leave Plan Line No." = const(0);
                    ToolTip = 'View comments about the Leave Plan.';
                }
                action(LineComments)
                {
                    ApplicationArea = Comments;
                    Caption = '&Line Comments';
                    Image = ViewComments;
                    RunObject = Page "Leave Plan Comment Sheet";
                    RunPageLink = "No." = field("Leave Plan No."),
                                  "Leave Plan Line No." = field("Line No.");
                    Scope = Repeater;
                    ToolTip = 'View or create comments.';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Submit)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Submit';
                    Image = ReleaseDoc;
                    ShortCutKey = 'F9';
                    ToolTip = 'Submit the Leave Plan for approval.';

                    trigger OnAction()
                    begin
                        SubmitLines();
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Reopen';
                    Image = ReOpen;
                    ToolTip = 'Reopen the Leave Plan, for example, after it has been rejected. The approver of a Leave Plan has permission to approve, reject, or reopen a Leave Plan. The approver can also submit a Leave Plan for approval.';

                    trigger OnAction()
                    begin
                        ReopenLines();
                    end;
                }
                separator(Action28)
                {
                }
                action(CopyLinesFromPrevTS)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy lines from previous Leave Plan';
                    Image = Copy;
                    ToolTip = 'Copy information from the previous Leave Plan, such as type and description, and then modify the lines. If a line is related to a job, the job number is copied.';

                    trigger OnAction()
                    begin
                        LeavePlanMgt.CheckCopyPrevLeavePlanLines(LeavePlanHeader);
                    end;
                }
                action(CreateLinesFromJobPlanning)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Create lines from &job planning';
                    Image = CreateLinesFromJob;
                    ToolTip = 'Create Leave Plan lines that are based on job planning lines.';

                    trigger OnAction()
                    begin
                        LeavePlanMgt.CheckCreateLinesFromJobPlanning(LeavePlanHeader);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Submit_Promoted; Submit)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(PreviousPeriod_Promoted; PreviousPeriod)
                {
                }
                actionref(NextPeriod_Promoted; NextPeriod)
                {
                }
            }
            group(Category_Prepare)
            {
                Caption = 'Prepare';

                actionref(CopyLinesFromPrevTS_Promoted; CopyLinesFromPrevTS)
                {
                }
                actionref(CreateLinesFromJobPlanning_Promoted; CreateLinesFromJobPlanning)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Line', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Activity &Details_Promoted"; "Activity &Details")
                {
                }
                actionref("Leave Plan Allocation_Promoted"; "Leave Plan Allocation")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(LeavePlanComments_Promoted; LeavePlanComments)
                {
                }
                actionref(LineComments_Promoted; LineComments)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AfterGetCurrentRecord();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        AfterGetCurrentRecord();
    end;

    trigger OnOpenPage()
    begin
        if Rec."Leave Plan No." <> '' then
            CurrLeavePlanNo := Rec."Leave Plan No."
        else
            CurrLeavePlanNo := LeavePlanHeader.FindLastLeavePlanNo(LeavePlanHeader.FieldNo("Owner User ID"));
        OnOpenPageOnAfterSetCurrLeavePlanNo(LeavePlanHeader, Rec);

        LeavePlanMgt.SetLeavePlanNo(CurrLeavePlanNo, Rec);
        UpdateControls();
    end;

    var
        LeavePlanDetail: Record "Leave Plan Detail";
        ColumnRecords: array[32] of Record Date;
        LeavePlanMgt: Codeunit "Leave Plan Management";
        LeavePlanApprovalMgt: Codeunit "Leave Plan Approval Management";
        NoOfColumns: Integer;
        // CellData: array[32] of Decimal;
        CellData: array[32] of Boolean;

        ColumnCaption: array[32] of Text[1024];
        CurrLeavePlanNo: Code[20];
        SetWanted: Option Previous,Next;
        Text001: Label 'The type of Leave Plan line cannot be empty.';
        AllowEdit: Boolean;
        DimensionCaptionTok: Label 'Dimensions';

    protected var
        LeavePlanHeader: Record "Leave Plan Header";

    procedure SetColumns()
    var
        Calendar: Record Date;
    begin
        Clear(ColumnCaption);
        Clear(ColumnRecords);
        Clear(Calendar);
        Clear(NoOfColumns);


        GetLeavePlanHeader();
        Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
        Calendar.SetRange("Period Start", LeavePlanHeader."Starting Date", LeavePlanHeader."Ending Date");
        if Calendar.FindSet() then
            repeat
                NoOfColumns += 1;
                ColumnRecords[NoOfColumns]."Period Start" := Calendar."Period Start";
                ColumnCaption[NoOfColumns] := LeavePlanMgt.FormatDate(Calendar."Period Start", 1);
            until Calendar.Next() = 0;
    end;

    local procedure GetLeavePlanHeader()
    begin
        LeavePlanHeader.Get(CurrLeavePlanNo);

        OnAfterGetLeavePlanHeader(LeavePlanHeader);
    end;

    local procedure AfterGetCurrentRecord()
    var
        i: Integer;
    begin
        i := 0;
        while i < NoOfColumns do begin
            i := i + 1;
            if (Rec."Line No." <> 0) and LeavePlanDetail.Get(
                 Rec."Leave Plan No.",
                 Rec."Line No.",
                 ColumnRecords[i]."Period Start")
            then
                // CellData[i] := LeavePlanDetail.Quantity
                Message('CellData[i] := LeavePlanDetail.Quantity')
            else
                CellData[i] := false;
        end;
        // UpdateFactBoxes();
        AllowEdit := Rec.Status in [Rec.Status::Open, Rec.Status::Rejected];
    end;

    local procedure ValidateQuantity(ColumnNo: Integer)
    begin
        // if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") then
        //     Error(Text001);

        if LeavePlanDetail.Get(
             Rec."Leave Plan No.",
             Rec."Line No.",
             ColumnRecords[ColumnNo]."Period Start")
        then begin
            // if Evaluate(CellData[ColumnNo]) <> LeavePlanDetail.Quantity then
            //     TestLeavePlanLineStatus();

            if CellData[ColumnNo] = false then
                LeavePlanDetail.Delete()
            else begin
                // LeavePlanDetail.Quantity := Evaluate(CellData[ColumnNo]);
                LeavePlanDetail.Modify(true);
            end;
        end else
            if CellData[ColumnNo] <> false then begin
                TestLeavePlanLineStatus();

                LeavePlanDetail.Init();
                LeavePlanDetail.CopyFromLeavePlanLines(Rec);
                LeavePlanDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                // LeavePlanDetail.Quantity := Evaluate(,CellData[ColumnNo]);
                LeavePlanDetail.Insert(true);
            end;
    end;

    local procedure Process("Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All")
    var
        LeavePlanLine: Record "Leave Plan Lines";
        TempLeavePlanLine: Record "Leave Plan Lines" temporary;
        ActionType: Option Submit,Reopen;
    begin
        CurrPage.SaveRecord();
        case Action of
            Action::"Submit All":
                FilterAllLines(LeavePlanLine, ActionType::Submit);
            Action::"Reopen All":
                FilterAllLines(LeavePlanLine, ActionType::Reopen);
            else
                CurrPage.SetSelectionFilter(LeavePlanLine);
        end;
        OnProcessOnAfterLeavePlanLinesFiltered(LeavePlanLine, Action);
        LeavePlanMgt.CopyFilteredLeavePlanLinesToBuffer(LeavePlanLine, TempLeavePlanLine);
        if LeavePlanLine.FindSet() then
            repeat
                case Action of
                    Action::"Submit Selected",
                  Action::"Submit All":
                        // LeavePlanApprovalMgt.Submit(LeavePlanLine);
                        Message('LeavePlanApprovalMgt.Submit(LeavePlanLine)');
                    Action::"Reopen Selected",
                  Action::"Reopen All":
                        // LeavePlanApprovalMgt.ReopenSubmitted(LeavePlanLine);
                        Message('LeavePlanApprovalMgt.ReopenSubmitted(LeavePlanLine)');
                end;
            until LeavePlanLine.Next() = 0;
        OnAfterProcess(TempLeavePlanLine, Action);
        CurrPage.Update(true);
    end;

    local procedure CellDataOnAfterValidate()
    begin
        // UpdateFactBoxes();
        // Rec.CalcFields("Total Quantity");
    end;

    local procedure FindLeavePlan(Which: Option)
    begin
        CurrLeavePlanNo := LeavePlanMgt.FindLeavePlan(LeavePlanHeader, Which);
        LeavePlanMgt.SetLeavePlanNo(CurrLeavePlanNo, Rec);
        UpdateControls();
    end;

    // local procedure UpdateFactBoxes()
    // begin
    //     CurrPage.ActualSchedSummaryFactBox.PAGE.UpdateData(LeavePlanHeader);
    //     CurrPage.LeavePlanStatusFactBox.PAGE.UpdateData(LeavePlanHeader);
    //     if Rec."Line No." = 0 then
    //         CurrPage.ActivityDetailsFactBox.PAGE.SetEmptyLine();
    // end;

    local procedure UpdateControls()
    begin
        SetColumns();
        // UpdateFactBoxes();
        CurrPage.Update(false);
    end;

    local procedure TestLeavePlanLineStatus()
    var
        LeavePlanLine: Record "Leave Plan Lines";
    begin
        LeavePlanLine.Get(Rec."Leave Plan No.", Rec."Line No.");
        LeavePlanLine.TestStatus();
    end;

    local procedure SubmitLines()
    var
        "Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All";
        ActionType: Option Submit,Reopen;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSubmitLines(Rec, IsHandled);
        if IsHandled then
            exit;

        case ShowDialog(ActionType::Submit) of
            1:
                Process(Action::"Submit All");
            2:
                Process(Action::"Submit Selected");
        end;
    end;

    local procedure ReopenLines()
    var
        ActionType: Option Submit,Reopen;
        "Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeReopenLines(Rec, IsHandled);
        if IsHandled then
            exit;

        case ShowDialog(ActionType::Reopen) of
            1:
                Process(Action::"Reopen All");
            2:
                Process(Action::"Reopen Selected");
        end;
    end;

    local procedure TimeAllocation()
    var
        LeavePlanAllocation: Page "Leave Plan Allocation";
        AllocatedQty: array[7] of Decimal;
    begin
        Rec.TestField(Posted, true);
        // Rec.CalcFields("Total Quantity");
        // LeavePlanAllocation.InitParameters(Rec."Leave Plan No.", Rec."Line No.", Rec."Total Quantity");
        // LeavePlanAllocation.InitParameters(Rec."Leave Plan No.", Rec."Line No.");
        if LeavePlanAllocation.RunModal() = ACTION::OK then begin
            LeavePlanAllocation.GetAllocation(AllocatedQty);
            LeavePlanMgt.UpdateTimeAllocation(Rec, AllocatedQty);
        end;
    end;

    local procedure GetDialogText(ActionType: Option Submit,Reopen): Text[100]
    var
        LeavePlanLine: Record "Leave Plan Lines";
    begin
        FilterAllLines(LeavePlanLine, ActionType);
        exit(LeavePlanApprovalMgt.GetLeavePlanDialogText(ActionType, LeavePlanLine.Count));
    end;

    local procedure FilterAllLines(var LeavePlanLine: Record "Leave Plan Lines"; ActionType: Option Submit,Reopen)
    begin
        LeavePlanLine.SetRange("Leave Plan No.", CurrLeavePlanNo);
        LeavePlanLine.CopyFilters(Rec);
        LeavePlanLine.FilterGroup(2);
        // LeavePlanLine.SetFilter(Type, '<>%1', LeavePlanLine.Type::" ");
        LeavePlanLine.FilterGroup(0);
        case ActionType of
            ActionType::Submit:
                LeavePlanLine.SetFilter(Status, '%1|%2', LeavePlanLine.Status::Open, LeavePlanLine.Status::Rejected);
            ActionType::Reopen:
                LeavePlanLine.SetRange(Status, LeavePlanLine.Status::Submitted);
        end;

        OnAfterFilterAllLines(LeavePlanLine, ActionType);
    end;

    local procedure ShowDialog(ActionType: Option Submit,Reopen): Integer
    begin
        exit(StrMenu(GetDialogText(ActionType), 1, LeavePlanApprovalMgt.GetLeavePlanDialogInstruction(ActionType)));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFilterAllLines(var LeavePlanLine: Record "Leave Plan Lines"; ActionType: Option Submit,Reopen)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetLeavePlanHeader(var LeavePlanHeader: Record "Leave Plan Header");
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnProcessOnAfterLeavePlanLinesFiltered(var LeavePlanLine: Record "Leave Plan Lines"; "Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterProcess(var LeavePlanLine: Record "Leave Plan Lines"; "Action": Option "Submit Selected","Submit All","Reopen Selected","Reopen All")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenLines(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSubmitLines(var LeavePlanLine: Record "Leave Plan Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnOpenPageOnAfterSetCurrLeavePlanNo(var LeavePlanHeader: Record "Leave Plan Header"; var LeavePlanLine: Record "Leave Plan Lines")
    begin
    end;
}
