#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59125 "Vehicle Inspection Card"
{
    PageType = Card;
    SourceTable = "Vehicle Inspection";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                // Editable = Edit;
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Inspection No. field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Vehicle CC"; Rec."Vehicle CC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle CC field.';
                }
            }
            group("Inspection Details")
            {
                // Editable = Edit;
                field("Last Inspection Date"; Rec."Last Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Inspection Date field.';
                }
                field("Last Inspection No."; Rec."Last Inspection No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Inspection No. field.';
                }
                field("External Inspection No."; Rec."External Inspection No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Inspection No. field.';
                }
                field("Inspection Status"; Rec."Inspection Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Status field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Has Speed Governor"; Rec."Has Speed Governor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Speed Governor field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Inspection Center"; Rec."Inspection Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Center field.';
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Vehicle Inspection"),
                              "No." = field("Inspection No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark as Passed Inspection")
            {
                ApplicationArea = Basic;
                Image = CheckDuplicates;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                PromotedCategory = Process;
                Promoted = true;
                ToolTip = 'Executes the Mark as Passed Inspection action.';

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as passed?', true) then begin
                        Rec."Inspection Status" := Rec."inspection status"::Passed;
                        Rec.Modify;
                        Edit := false;
                    end;
                end;
            }
            action("Mark as Failed Inspection")
            {
                ApplicationArea = Basic;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Mark as Failed Inspection action.';

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as failed?', true) then begin
                        Rec."Inspection Status" := Rec."inspection status"::Failed;
                        Rec.Modify;
                        Edit := false;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger onOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Edit := true;
    end;

    var
        Edit: Boolean;

    local procedure SetControlAppearance()
    begin
        if Rec."Inspection Status" = Rec."inspection status"::Passed then begin
            Edit := false;
        end;
    end;
}

