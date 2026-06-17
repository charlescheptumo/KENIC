page 50044 "ApprovedTraining Need Requests"
{
    ApplicationArea = All;
    Caption = 'Approved Training Need Requests';
    PageType = List;
    SourceTable = "Training Needs Header";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
            }
        }
    }
}
