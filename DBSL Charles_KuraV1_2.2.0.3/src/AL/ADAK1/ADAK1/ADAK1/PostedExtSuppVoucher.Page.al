#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75416 "Posted Ext Supp Voucher"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "External Supplier Voucher";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Authority Code"; Rec."External Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Authority Code field.';
                }
                field("External Authority Name"; Rec."External Authority Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Authority Name field.';
                }
                field("Procurement  Category ID"; Rec."Procurement  Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement  Category ID field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("IFS Description"; Rec."IFS Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("DateTime Posted"; Rec."DateTime Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime Posted field.';
                }
                field("Procurement Category Name"; Rec."Procurement Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

