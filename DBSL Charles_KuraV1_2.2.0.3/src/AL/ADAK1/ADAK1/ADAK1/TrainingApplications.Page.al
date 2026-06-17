#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69220 "Training Applications"
{
    ApplicationArea = Basic;
    CardPageID = "Training Requisition";
    PageType = List;
    SourceTable = "Training Requests";
    SourceTableView = where(Status = filter(Open | Pending));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start DateTime field.';
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End DateTime field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Employee Department"; Rec."Employee Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Department field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field("Approved Cost"; Rec."Approved Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Cost field.';
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
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Start Date field.';
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual End Date field.';
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Cost field.';
                }
                field("Imprest Created"; Rec."Imprest Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Created field.';
                }
                field("Training Plan Cost"; Rec."Training Plan Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Plan Cost field.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field(Actual; Rec.Actual)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual field.';
                }
                field(Commitment; Rec.Commitment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitment field.';
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GL Account field.';
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fiscal Year field.';
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Funds field.';
                }
                field("Local"; Rec."Local")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Local field.';
                }
                field("Requires Flight"; Rec."Requires Flight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requires Flight field.';
                }
                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor No. field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("Training Plan No."; Rec."Training Plan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Plan No. field.';
                }
                field("Training Responsibility Code"; Rec."Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Responsibility Code field.';
                }
                field("Training Venue Region Code"; Rec."Training Venue Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Venue Region Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

