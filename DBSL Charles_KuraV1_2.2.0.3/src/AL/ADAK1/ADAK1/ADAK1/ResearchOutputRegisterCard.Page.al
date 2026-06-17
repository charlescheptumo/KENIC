#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65017 "Research Output Register Card"
{
    PageType = Card;
    SourceTable = "Research Output Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Research Program Id field.';
                }
                field("Principle Investigator"; Rec."Principle Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Principle Investigator field.';
                }
                field("Research Output Category"; Rec."Research Output Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output Category field.';
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
                group("Comments Info")
                {
                    Caption = 'Comments Info';
                    field(Comments; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Comments';
                        MultiLine = true;
                        ToolTip = 'Specifies the value of the Comments field.';

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
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
        area(navigation)
        {
            group(ActionGroup18)
            {
                action(Authors)
                {
                    ApplicationArea = Basic;
                    Image = User;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Authorship List";
                    RunPageLink = "Research Output Id" = field(No);
                    ToolTip = 'Executes the Authors action.';
                }
                action("Collaborations/Affiliations")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Collaboration List";
                    RunPageLink = "Research Output ID" = field(No);
                    ToolTip = 'Executes the Collaborations/Affiliations action.';
                }
                action("Events && Activities")
                {
                    ApplicationArea = Basic;
                    Image = "Event";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Activities List";
                    RunPageLink = "Research Output ID" = field(No);
                    ToolTip = 'Executes the Events && Activities action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        WorkDescription: Text;
}

