#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75085 "Vendor Special Group Entry"
{
    PageType = List;
    SourceTable = "Vendor Special Group Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Certifcate No"; Rec."Certifcate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certifcate No field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Vendor Category"; Rec."Vendor Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Category field.';
                }
                field("Certifying Agency"; Rec."Certifying Agency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certifying Agency field.';
                }
                field("Products/Service Category"; Rec."Products/Service Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Products/Service Category field.';
                }
                field("Certificate Expiry Date"; Rec."Certificate Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Expiry Date field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
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
    }
}

