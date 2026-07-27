enum 58144 "Employee Obligation Status"
{
    Extensible = true;

    value(0; Open) 
    { 
        Caption = 'Open'; 
    }
    value(1; "In Progress") 
    { 
        Caption = 'In Progress'; 
    }
    value(2; Completed) 
    { 
        Caption = 'Completed'; 
    }
    value(3; Overdue) 
    { 
        Caption = 'Overdue'; 
    }
}