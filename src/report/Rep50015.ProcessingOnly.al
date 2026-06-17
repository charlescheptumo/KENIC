
report 50015 "Processing Only"
{
    ApplicationArea = All;
    Caption = 'Processing Only';
    UsageCategory = Tasks;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Staff Exit Interview Questions"; "Staff Exit Interview Questions")
        {
            trigger OnAfterGetRecord()
            begin
                "Staff Exit Interview Questions".DeleteAll();
            end;
        }

        // dataitem("HR Leave Applications"; "HR Leave Applications")
        // {

        //     trigger OnAfterGetRecord()
        //     begin
        //         HRLeavePeriods.Reset();
        //         HRLeavePeriods.SetFilter(Starts, '<=%1', "Start Date");
        //         HRLeavePeriods.SetFilter(Ends, '>=%2', "Start Date");
        //         if HRLeavePeriods.FindFirst() then begin
        //             "HR Leave Applications"."Leave Period" := Format(HRLeavePeriods.Code);
        //             "HR Leave Applications".modify;
        //         end;
        //     end;


        // }

    }


    requestpage
    {
        layout
        {
            area(content)
            {

            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }
    var

        HRSetup: Record "Human Resources Setup";
        HRLeavePeriods: Record "HR Leave Periods";
        InterviewQuestions: Record "Staff Exit Interview Questions";
}
