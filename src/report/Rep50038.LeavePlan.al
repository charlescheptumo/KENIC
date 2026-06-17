report 50038 "Leave Plan"
{
    ApplicationArea = All;
    Caption = 'Leave Plan';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Leave Plan Header"; "Leave Plan Header")
        {
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
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
}
