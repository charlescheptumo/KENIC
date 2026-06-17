namespace KICD.KICD;

report 50109 "Assignment Matrix Delete"
{
    Caption = 'Assignment Matrix Delete';
    ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
       dataitem("Assignment Matrix-X";"Assignment Matrix-X")
       {

        trigger OnAfterGetRecord()
        var
        begin
            Delete();
            DeletedCount += 1;   
        end;

        trigger OnPreDataItem()
        begin
          SETRANGE("Payroll Period", BeginDate);
        end;
       }

       
    }
    

     requestpage
    {

        layout
        {
            area(Content)
            {
                group(OP)
                {
                    Caption = '';
                    field("Pay Period"; BeginDate)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "Payroll PeriodX";
                        ToolTip = 'Specifies the value of the BeginDate field.';
                    }
                }

            }

        }
    }

    
     trigger OnPreReport()
    var
        ConfirmDelete: Boolean;
        FilterText: Text;
    begin
        //FilterText := "Assignment Matrix-X".GETFILTER("Pay Period");
         if BeginDate = 0D then
             ERROR('You must set a Pay Period filter before running the report.');
    

        ConfirmDelete := CONFIRM(
            'Are you sure you want to delete all Assignment Matrix records for Pay Period: %1?', false, BeginDate);

        if not ConfirmDelete then
            ERROR('Operation cancelled by user.');
    end;

    trigger OnPostReport()
    begin
        MESSAGE('%1 record(s) deleted.', DeletedCount);
    end;

    var
        DeletedCount: Integer;
        BeginDate: Date;
        
}
