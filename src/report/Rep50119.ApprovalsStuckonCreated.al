report 50119 "Approvals Stuck on Created"
{
    ApplicationArea = All;
    Caption = 'Approvals Stuck on Created';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    AllowScheduling = true;
    Permissions = tabledata "Approval Entry" = RIMD;
    dataset
    {
        dataitem(ApprovalEntry; "Approval Entry")
        {
              trigger OnAfterGetRecord()
            begin
                ApprovalEntry.Reset();
                ApprovalEntry.SetRange("Document No.", DocumentNo);
                // ApprovalEntry.SetRange("Document No.", 'SUR00021');
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
                if ApprovalEntry.FindLast then begin
                    Sequence := ApprovalEntry."Sequence No.";
                    Sequence2 := Sequence + 1;
                    ApprovalEntry2.Reset();
                    ApprovalEntry2.SetRange("Document No.", ApprovalEntry."Document No.");
                    ApprovalEntry2.SetRange(Status, ApprovalEntry.Status::Created);
                    ApprovalEntry2.SetRange("Sequence No.", Sequence2);
                    if ApprovalEntry2.FindSet then begin
                        //if ApprovalEntry2.Status = ApprovalEntry2.Status::Created then begin
                        ApprovalEntry2.Status := ApprovalEntry2.Status::Open;
                        ApprovalEntry2.Modify();
                        Message('Document %1 approvals unlocked successfully', ApprovalEntry2."Document No.");
                    end else begin
                        Message('There are no stuck approvals for document number %1', ApprovalEntry2."Document No.");
                        //end;
                    end;
                end else begin
                    Error('Document number %1 not found', DocumentNo);
                end;
            end;
        }
    }
   requestpage
    {
        SaveValues = true;
 
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DocumentNo; DocumentNo)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
      var
        Sequence: Integer;
        Sequence2: Integer;
        Present: Boolean;
        DocumentNo: Code[1000];
        ApprovalEntry2: Record "Approval Entry";
}
