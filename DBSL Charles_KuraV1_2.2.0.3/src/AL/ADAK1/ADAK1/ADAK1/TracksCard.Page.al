#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56083 "Tracks Card"
{
    PageType = Card;
    SourceTable = Tracks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Copyright No"; Rec."Copyright No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                field("Track Works Abstract"; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the ObjText field.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Track Work Abstract");
                        Rec."Track Work Abstract".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Track Work Abstract");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Track Work Abstract".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);

                        end;
                    end;
                }
                field("Track Language"; Rec."Track Language")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Language field.';
                }
            }
            group("Production Details")
            {
                field("Prod/Pub Name"; Rec."Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prod/Pub Name field.';
                }
                field("Prod/Pub ID No/Company Reg No"; Rec."Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Producer ID No/Company Reg No field.';
                }
                field("Prod/Pub P.I.N"; Rec."Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prod/Pub P.I.N field.';
                }
                field("Assignment/License Date"; Rec."Assignment/License Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assignment/License Date field.';
                }
                field("1st Country of Production"; Rec."1st Country of Production")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 1st Country of Production field.';
                }
                field("Production Category"; Rec."Production Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Production Category field.';
                }
                field("Prod/Pub Phone No."; Rec."Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prod/Pub Phone No. field.';
                }
                field("Prod/Pub Email"; Rec."Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prod/Pub Email field.';
                }
                field("Producer Address"; Rec."Producer Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Producer Address field.';
                }
                field("Producer Post Code"; Rec."Producer Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Producer Post Code field.';
                }
            }
            group("Other Persons")
            {
                Caption = 'Other Persons';
                part(Control24; "Tracks Other Persons")
                {
                    SubPageLink = Copyright = field("Copyright No"),
                                  "Tracks No" = field("Line No");
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

