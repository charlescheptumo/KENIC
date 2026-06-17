#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75288 "Purchase Contract Milestone"
{
    Caption = 'Contract Milestones';
    PageType = List;
    SourceTable = "Purchase Contract Milestone";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Milestone Number';
                    ToolTip = 'Specifies the value of the Milestone Number field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Milestone Deliverables"; Rec."Milestone Deliverables")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone Deliverables field.';
                }
                field("No of IPCs"; Rec."No of IPCs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of IPCs field.';
                }
                field("Payment Instalment Code"; Rec."Payment Instalment Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'IPC No';
                    LookupPageID = "Purchase Contract Payment Term";
                    ToolTip = 'Specifies the value of the IPC No field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Engineer''s Signature Date';
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Engineer''s Signature Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Date';
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field("Date Notified"; Rec."Date Notified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Notified field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Notify on Milestone")
            {
                ApplicationArea = Basic;
                Caption = 'Notify on selected Milestones';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Notify on selected Milestones action.';

                trigger OnAction()
                var
                    Body: Text;
                    SMTP: Codeunit Mail;
                    Email: Text;
                    Email2: Text;
                    SMTPMailSetup: Record "Email Account";
                    PurchaseHeader: Record "Purchase Header";
                    Vendor: Record Vendor;
                begin

                    //     //notify attendees
                    //     PurchaseHeader.Reset;
                    //     PurchaseHeader.SetRange("No.","No.");
                    //     if PurchaseHeader.Find('-') then begin
                    //        Vendor.SetRange("No.",PurchaseHeader."Buy-from Vendor No.");
                    //        if Vendor.Find('-') then begin

                    //      SMTPMailSetup.Get;
                    //      Body:='Contract Milestone Completion';
                    //      Email:=SMTPMailSetup."Email Address";
                    //      Email2:=Vendor.Email;
                    //      SMTP.CreateMessage('KeRRa',Email,Email2,'Contract Notification',Body,true);
                    //      SMTP.AddBodyline('Thank you for the continued support.<BR>');
                    //     // SMTP.AddCC(Email2);
                    //      SMTP.AddBodyline('<BR><BR><b>Kind Regards,'+'<BR><BR>The Procurement Department<BR>');
                    //      SMTP.Send();

                    //     Message('Notification Sent successfully');
                    //   end;
                    // end;
                end;
            }
        }
    }
}

