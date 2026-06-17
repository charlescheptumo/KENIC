#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72449 "DWR Incident Impacts"
{
    CardPageID = "DWR Incident Impact";
    PageType = List;
    SourceTable = "DWR Incident Impact";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Incident Line No."; Rec."Incident Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Line No. field.';
                }
                field("Impact Line No."; Rec."Impact Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Impact Line No. field.';
                }
                field("Impact Type"; Rec."Impact Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Impact Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Category of Party Affected"; Rec."Category of Party Affected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category of Party Affected field.';
                }
                field("Internal Employee No."; Rec."Internal Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Employee No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Contact Details"; Rec."Contact Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Details field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

