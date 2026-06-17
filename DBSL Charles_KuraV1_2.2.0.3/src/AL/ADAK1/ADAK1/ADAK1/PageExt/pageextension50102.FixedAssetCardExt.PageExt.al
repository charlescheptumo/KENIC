#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50102 "Fixed Asset Card Ext" extends "Fixed Asset Card"
{
    layout
    {
        addafter(Description)
        {
            field(Make; Rec.Make)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Make field.', Comment = '%';
                Editable = true;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                Editable = true;
            }
            field("Vehicle Registration No."; Rec."Vehicle Registration No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vehicle Registration No. field.', Comment = '%';
                Editable = true;
            }

            field("Present Logbook"; Rec."Present Logbook")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Present Logbook field.', Comment = '%';
                Editable = true;
            }
            field("Financed by"; Rec."Financed by")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Financed by field.', Comment = '%';
                Editable = true;
            }
        }
        modify("FA Location Code")
        {
            Caption = 'Location';
        }
        addafter("FA Location Code")
        {
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = Basic;
                Caption = 'Region Code';
                ToolTip = 'Specifies the value of the Region Code field.';
                Visible = false;
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Department Code field.';
            }
        }
        addafter("Serial No.")
        {
            field("Tag No"; Rec."Tag No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Tag No field.';
            }
            field("Chassis No"; Rec."Chassis No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Chassis No field.';
            }
            field("Asset Purchase Groups"; Rec."Asset Purchase Groups")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Asset Purchase Groups field.';
            }
        }
        addafter(Acquired)
        {
            field("Record Type"; Rec."Record Type")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Record Type field.';
            }
            field("Year of Purchase"; Rec."Year of Purchase")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Year of Purchase field.', Comment = '%';
                Editable = true;
            }
            field("Main Location"; Rec."Main Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Main Location field.', Comment = '%';
                Editable = true;
            }
            field("Sub Location"; Rec."Sub Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sub Location field.', Comment = '%';
            }
            field("Suggested For Disposal"; Rec."Suggested For Disposal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Suggested For Disposal field.', Comment = '%';
                Visible = false;
            }
            field("Marked for Disposal"; Rec."Marked for Disposal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marked for Disposal field.', Comment = '%';
            }
            field("Marked for Disposal By"; Rec."Marked for Disposal By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marked for Disposal By field.', Comment = '%';
                Editable = false;
            }
            field("Marked for Disposal On"; Rec."Marked for Disposal On")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marked for Disposal On field.', Comment = '%';
                Editable = false;
            }
        }
        addafter(General)
        {
            group("Research Details")
            {
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
            }
        }
        addafter(DepreciationEndingDate)
        {
        field(DecliningBalance; FADepreciationBook."Straight-Line %")
        {
            ApplicationArea = FixedAssets;
            Caption = 'Straight-Line %';
            ShowMandatory = true;
            ToolTip = 'Specifies Straight-Line %.';

            trigger OnValidate()
            begin
                LoadFADepreciationBooks();
                FADepreciationBook.Validate("Straight-Line %");
                SaveSimpleDepreciationBook(xRec."No.");
                ShowAcquisitionNotification();
            end;
        }
        
        }
        addfirst(Maintenance)
        {
            field("Fixed Asset Type"; Rec."Fixed Asset Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Fixed Asset Type field.';
            }
            field("Replacement Date"; Rec."Replacement Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Replacement Date field.', Comment = '%';
                Editable = true;
            }
        }
    }
}

