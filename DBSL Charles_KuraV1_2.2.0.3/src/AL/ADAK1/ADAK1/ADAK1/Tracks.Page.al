#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56082 "Tracks"
{
    ApplicationArea = Basic;
    CardPageID = "Tracks Card";
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Tracks;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Copyright No"; Rec."Copyright No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright No field.';
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright Title field.';
                }
                field("Track Title"; Rec."Track Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Title field.';
                }
                field("Track Work Category"; Rec."Track Work Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Work Category field.';
                }
                field("Track Work SubCategory"; Rec."Track Work SubCategory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Work SubCategory field.';
                }
                field("Track Category Description"; Rec."Track Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Category Description field.';
                }
                field("Track SubCategory Desc"; Rec."Track SubCategory Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track SubCategory Desc field.';
                }
                field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Fixation/Reduction field.';
                }
                field("Track Language"; Rec."Track Language")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Language field.';
                }
                field("<Track Work Abstract>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Track Work Abstract';
                    ToolTip = 'Specifies the value of the Track Work Abstract field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Track Work Abstract");
        Rec."Track Work Abstract".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}

