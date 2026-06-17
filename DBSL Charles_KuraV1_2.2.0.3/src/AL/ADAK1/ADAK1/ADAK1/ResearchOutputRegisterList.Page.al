#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65018 "Research Output Register List"
{
    ApplicationArea = Basic;
    CardPageID = "Research Output Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Register";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Research Project Id"; Rec."Research Project Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Project Id field.';
                }
                field("Research Program Id"; Rec."Research Program Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Program Id field.';
                }
                field("Research Output Category"; Rec."Research Output Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output Category field.';
                }
                field("Principle Investigator"; Rec."Principle Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principle Investigator field.';
                }
                field("Research Output SubCategory"; Rec."Research Output SubCategory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output SubCategory field.';
                }
                field("Research Output Title"; Rec."Research Output Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output Title field.';
                }
                field(Abstract; Rec.Abstract)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Abstract field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Publication Status"; Rec."Publication Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Publication Status field.';
                }
                field("Visibilty Category"; Rec."Visibilty Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visibilty Category field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

