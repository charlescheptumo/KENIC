#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72550 "Quality Inspection List"
{
    CardPageID = "Quality Inspection Card";
    PageType = List;
    SourceTable = "Inspection Headersss";
    SourceTableView = where("Inspection Type" = filter(" "));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Contractor Request No"; Rec."Contractor Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Request No field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Committee No"; Rec."Committee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee No field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("DLP Start Date"; Rec."DLP Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Start Date field.';
                }
                field("DLP Period"; Rec."DLP Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Period field.';
                }
                field("DLP End Date"; Rec."DLP End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP End Date field.';
                }
                field("Awarded Tender Sum Inc Tax"; Rec."Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Tender Sum Inc Tax field.';
                }
                field("Payments To Date"; Rec."Payments To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payments To Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Committee Decision"; Rec."Committee Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Decision field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field("Primary Contractor Rep."; Rec."Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contractor Rep. field.';
                }
                field("Contractor Representative Role"; Rec."Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Representative Role field.';
                }
                field("Contractor Rep. Email"; Rec."Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Rep. Email field.';
                }
                field("Work Execution Plan 1D"; Rec."Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan 1D field.';
                }
                field("Commencement Order No"; Rec."Commencement Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order No field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Manager/Engineer"; Rec."Project Manager/Engineer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager/Engineer field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("Funding Agency No."; Rec."Funding Agency No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Agency No. field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec.SetRange("Created By", UserId);
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange("Created By", UserId);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange("Created By", UserId);
    end;
}

