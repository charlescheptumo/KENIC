#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72141 "Legislation Part"
{
    PageType = ListPart;
    SourceTable = "Legislation Part";
    SourceTableView = where("Part Type" = filter("Section/Clause"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part ID"; Rec."Part ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part ID field.';
                }
                field("Part Type"; Rec."Part Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Subsections"; Rec."No. of Subsections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Subsections field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Line Functions")
            {
                AccessByPermission = TableData Item = R;
                ApplicationArea = Basic, Suite;
                Caption = 'Line Functions';
                Ellipsis = true;
                Image = NewItem;
                ToolTip = 'Add two or more items from the full list of your inventory items.';
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group(Subsection)
                {
                    Caption = 'Subsection';
                    Image = ItemAvailability;
                    action(SubSections)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Subsections';
                        Image = "Event";
                        RunObject = Page "Legislation Subsection";
                        RunPageLink = "Legislation ID" = field("Legislation ID"),
                                      "Part ID" = field("Part ID");
                        ToolTip = 'Executes the Subsections action.';
                    }
                }
            }
        }
    }
}

