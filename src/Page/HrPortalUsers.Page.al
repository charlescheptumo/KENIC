page 57925 "HRPortalUsers"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = HRPortalUsers;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(changedPassword; Rec.changedPassword)
                {
                    ToolTip = 'Specifies the value of the changedPassword field.', Comment = '%';
                }
                field("code"; Rec."code")
                {
                    ToolTip = 'Specifies the value of the code field.', Comment = '%';
                }
                field(employeeNo; Rec.employeeNo)
                {
                    ToolTip = 'Specifies the value of the employeeNo field.', Comment = '%';
                }
                field(EmployeeUserID; Rec.EmployeeUserID)
                {
                    ToolTip = 'Specifies the value of the EmployeeUserID field.', Comment = '%';
                }
                field(IdNo; Rec.IdNo)
                {
                    ToolTip = 'Specifies the value of the IdNo field.', Comment = '%';
                }
                field(password; Rec.password)
                {
                    ToolTip = 'Specifies the value of the password field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }

        area(Factboxes)
        {

        }
    }


}