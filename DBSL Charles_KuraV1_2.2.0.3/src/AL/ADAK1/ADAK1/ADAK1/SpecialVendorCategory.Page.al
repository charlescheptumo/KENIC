#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75031 "Special Vendor Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Special Vendor Category";
    UsageCategory = Administration;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Group field.';
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Type field.';
                }
                field("Default Certifiying Agency"; Rec."Default Certifiying Agency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Certifiying Agency field.';
                }
                field("Certifiying Agency URL"; Rec."Certifiying Agency URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certifiying Agency URL field.';
                }
                field("No of Active Vendors"; Rec."No of Active Vendors")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Active Vendors field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup12)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Current Vendor Class" = field(Code);
                    ToolTip = 'Executes the Vendors action.';
                }
            }
        }
    }
}

