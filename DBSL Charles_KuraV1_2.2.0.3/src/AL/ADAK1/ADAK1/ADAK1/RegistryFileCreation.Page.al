#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59085 "Registry File Creation"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Registry File Creation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("System No"; Rec."System No")
                {
                    ApplicationArea = Basic;
                    Caption = 'File No:';
                    ToolTip = 'Specifies the value of the File No: field.';
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registry No field.';
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Name Description';
                    ToolTip = 'Specifies the value of the File Name Description field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Created By" := UserId;
        Rec."Creation Date" := Today;
    end;
}

