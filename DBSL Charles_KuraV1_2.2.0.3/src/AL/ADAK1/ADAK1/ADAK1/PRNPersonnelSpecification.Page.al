#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75240 "PRN Personnel Specification"
{
    PageType = List;
    SourceTable = "PRN Personnel Specification";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field("Title/Designation Description"; Rec."Title/Designation Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title/Designation Description field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Min No. of Recomm Staff"; Rec."Min No. of Recomm Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min No. of Recomm Staff field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Line)
            {
                Caption = 'Line';
                action("PRN Personnel Qualification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualification Requirements';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "PRN Personnel Qualification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Qualification Requirements action.';
                }
                action("PRN Personnel Experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Experience Requirements';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "PRN Personnel Experience";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Experience Requirements action.';
                }
                action("Export Excel")
                {
                    ApplicationArea = Basic;
                    Image = Excel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Export Excel action.';

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want to generate an excel?') then
                            exit;

                        RowNo := 0;
                        //  RMSMgt.FnMakePrnpersonelExcelHeader();
                        PRNPersonnelSpecification.Reset;
                        PRNPersonnelSpecification.SetRange("Document No.", Rec."Document No.");
                        PRNPersonnelSpecification.SetRange("Document Type", Rec."document type"::"Purchase Requisition");
                        if PRNPersonnelSpecification.FindSet then begin
                            repeat
                                RowNo := RowNo + 1;
                            //    RMSMgt.FnCreatePrnpersonelExcelLines(Format(PRNPersonnelSpecification."Document Type"), PRNPersonnelSpecification."Document No.", Format(PRNPersonnelSpecification."Staff Role Code"), PRNPersonnelSpecification."Title/Designation Description",
                            //                                  Format(PRNPersonnelSpecification."Staff Category"), PRNPersonnelSpecification."Min No. of Recomm Staff", RowNo);
                            until PRNPersonnelSpecification.Next = 0;
                        end;
                        // RMSMgt.FnOpenExcelFile('PrnPersonelSpecification', 'PrnPersonelSpecification.xlsx');
                    end;
                }
                action("Import Excel")
                {
                    ApplicationArea = Basic;
                    Image = Excel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Import Excel action.';
                    //  RunObject = Report "Import Required Personel";
                }
            }
        }
    }

    var
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        ProgressWindow: Dialog;
        RMSMgt: Codeunit "RMS Management";
        RowNo: Integer;
}

