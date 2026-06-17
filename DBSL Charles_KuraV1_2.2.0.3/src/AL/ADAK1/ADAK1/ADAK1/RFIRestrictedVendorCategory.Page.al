#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75047 "RFI Restricted Vendor Category"
{
    PageType = List;
    SourceTable = "RFI Restricted Vendor Category";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Prequalification Category ID"; Rec."Prequalification Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Category ID field.';
                }
                field("Restricted Vendor Category ID"; Rec."Restricted Vendor Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted Vendor Category ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

