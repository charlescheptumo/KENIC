#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69088 "Director List"
{
    ApplicationArea = Basic;
    Caption = 'Directors';
    CardPageID = "Director Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Vendor;
    SourceTableView = where("Vendor Type" = const(Director));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(vo; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Co&mments")
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Human Resource Comment Sheet";
                RunPageLink = "Table Name" = const(Employee),
                              "No." = field("No.");
                ToolTip = 'Executes the Co&mments action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                // RunObject = Page "Default Dimensions";
                // RunPageLink = "Table ID"=const(5200),
                //               "No."=field("No.");
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
            }
            action("&Picture")
            {
                ApplicationArea = Basic;
                Caption = '&Picture';
                Image = Picture;
                RunObject = Page "Employee Picture";
                RunPageLink = "No." = field("No.");
                ToolTip = 'Executes the &Picture action.';
            }
            action("&Alternative Addresses")
            {
                ApplicationArea = Basic;
                Caption = '&Alternative Addresses';
                Image = Addresses;
                RunObject = Page "Alternative Address List";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the &Alternative Addresses action.';
            }
            action("&Relatives")
            {
                ApplicationArea = Basic;
                Caption = '&Relatives';
                Image = Relatives;
                RunObject = Page "Employee Relatives";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the &Relatives action.';
            }
            action("Mi&sc. Article Information")
            {
                ApplicationArea = Basic;
                Caption = 'Mi&sc. Article Information';
                Image = Filed;
                RunObject = Page "Misc. Article Information";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the Mi&sc. Article Information action.';
            }
            action("&Confidential Information")
            {
                ApplicationArea = Basic;
                Caption = '&Confidential Information';
                Image = Lock;
                RunObject = Page "Confidential Information";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the &Confidential Information action.';
            }
            action("Q&ualifications")
            {
                ApplicationArea = Basic;
                Caption = 'Q&ualifications';
                Image = Certificate;
                RunObject = Page "Employee Qualifications";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the Q&ualifications action.';
            }
            action("A&bsences")
            {
                ApplicationArea = Basic;
                Caption = 'A&bsences';
                Image = Absence;
                RunObject = Page "Employee Absences";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'Executes the A&bsences action.';
            }
            separator(Action1000000013)
            {
            }
            action("Absences by Ca&tegories")
            {
                ApplicationArea = Basic;
                Caption = 'Absences by Ca&tegories';
                Image = AbsenceCategory;
                RunObject = Page "Empl. Absences by Categories";
                RunPageLink = "No." = field("No."),
                              "Employee No. Filter" = field("No.");
                ToolTip = 'Executes the Absences by Ca&tegories action.';
            }
            action("Misc. Articles &Overview")
            {
                ApplicationArea = Basic;
                Caption = 'Misc. Articles &Overview';
                Image = FiledOverview;
                RunObject = Page "Misc. Articles Overview";
                ToolTip = 'Executes the Misc. Articles &Overview action.';
            }
            action("Co&nfidential Info. Overview")
            {
                ApplicationArea = Basic;
                Caption = 'Co&nfidential Info. Overview';
                Image = ConfidentialOverview;
                RunObject = Page "Confidential Info. Overview";
                ToolTip = 'Executes the Co&nfidential Info. Overview action.';
            }
            separator(Action1000000009)
            {
            }
            action("Online Map")
            {
                ApplicationArea = Basic;
                Caption = 'Online Map';
                Image = Map;
                ToolTip = 'Executes the Online Map action.';

                trigger OnAction()
                begin
                    Rec.DisplayMap;
                end;
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
            }
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Assign Default Earn/Ded action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Earnings")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Earnings';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Director Ledger Entries";
                RunPageLink = "Director No" = field("No."),
                              Type = const(Payment),
                              Closed = const(false);
                Visible = false;
                ToolTip = 'Executes the Assign Earnings action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Deductions';
                Ellipsis = true;
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Director Ledger Entries";
                RunPageLink = "Director No" = field("No."),
                              Type = const(Deduction),
                              Closed = const(false);
                Visible = false;
                ToolTip = 'Executes the Assign Deductions action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);
                end;
            }
            separator(Action1000000002)
            {
            }
            action("&Run Director Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Director Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Run Director Payroll action.';

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    // //IM.GenerateRedemptionJournal(Rec);
                    //
                    Payperiod.Reset;
                    Payperiod.SetRange(Payperiod.Closed, false);
                    if Payperiod.Find('-') then
                        CurrentMonth := Payperiod."Starting Date";
                    //DirectorRec.SETRANGE("No.","No.");
                    DirectorRec.SetRange("Pay Period Filter", CurrentMonth);
                    Report.Run(89032, true, false, DirectorRec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetSocialListeningFactboxVisibility
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        //[InDataSet]
        MapPointVisible: Boolean;
      //  [InDataSet]
        ContactEditable: Boolean;
       // [InDataSet]
        SocialListeningSetupVisible: Boolean;
       // [InDataSet]
        SocialListeningVisible: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        Payperiod: Record "Payroll PeriodX";
        DirectorRec: Record Vendor;
        CurrentMonth: Date;


    procedure GetSelectionFilter(): Text
    var
        Vend: Record Vendor;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Vend);
        exit(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //   SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        //  SocialListeningMgt.GetVendFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;
}

#pragma implicitwith restore

