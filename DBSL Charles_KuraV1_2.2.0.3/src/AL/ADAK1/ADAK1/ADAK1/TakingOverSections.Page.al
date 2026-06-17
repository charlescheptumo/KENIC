#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72657 "Taking Over Sections"
{
    PageType = List;
    SourceTable = "Taking Over Section";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No"; Rec."Road Section No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Workplannned Length"; Rec."Workplannned Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplannned Length field.';
                }
                field("Taking Over Length"; Rec."Taking Over Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taking Over Length field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Taken Over Sections")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Taken Over Sections";
                RunPageLink = "Document No" = field("Inspection No"),
                              "Document Type" = field("Document Type"),
                              "Line No" = field("Line No");
                ToolTip = 'Executes the Taken Over Sections action.';
            }
        }
    }
}

