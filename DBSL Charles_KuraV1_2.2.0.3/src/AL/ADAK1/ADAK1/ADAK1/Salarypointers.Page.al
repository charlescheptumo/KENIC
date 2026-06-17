#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69023 "Salary pointers"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Salary Pointers";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';

                    // trigger OnValidate()
                    // begin

                    //     if Rec."Salary Pointer" = 'A' then
                    //         Rec."Pointer Int" := 1
                    //     else if Rec."Salary Pointer" = 'B' then
                    //         Rec."Pointer Int" := 2
                    //     else if Rec."Salary Pointer" = 'C' then
                    //         Rec."Pointer Int" := 3
                    //     else if Rec."Salary Pointer" = 'D' then
                    //         Rec."Pointer Int" := 4
                    //     else if Rec."Salary Pointer" = 'E' then
                    //         Rec."Pointer Int" := 5
                    //     else if Rec."Salary Pointer" = 'F' then
                    //         Rec."Pointer Int" := 6
                    //     else if Rec."Salary Pointer" = 'G' then
                    //         Rec."Pointer Int" := 7
                    //     else if Rec."Salary Pointer" = 'H' then
                        //     Rec."Pointer Int" := 8
                        // else if Rec."Salary Pointer" = 'I' then
                        //     Rec."Pointer Int" := 9
                        // else if Rec."Salary Pointer" = 'J' then
                        //     Rec."Pointer Int" := 10
                        // else if Rec."Salary Pointer" = 'K' then
                        //     Rec."Pointer Int" := 11
                        // else if Rec."Salary Pointer" = 'L' then
                        //     Rec."Pointer Int" := 12
                        // else if Rec."Salary Pointer" = 'M' then
                        //     Rec."Pointer Int" := 13
                        // else if Rec."Salary Pointer" = 'N' then
                        //     Rec."Pointer Int" := 14
                        // else if Rec."Salary Pointer" = 'O' then
                        //     Rec."Pointer Int" := 15
                        // else if Rec."Salary Pointer" = 'P' then
                        //     Rec."Pointer Int" := 16;
                        // //MODIFY;
                        
             trigger OnValidate()
                    var
                        PointerLetter: Char;
                        PointerText: Text[1];
                    begin
                        if StrLen(Rec."Salary Pointer") >= 2 then begin
                            // Extract the last character as Text
                            PointerText := CopyStr(Rec."Salary Pointer", StrLen(Rec."Salary Pointer"), 1);
                            // Convert Text to Char
                            PointerLetter := PointerText[1];
                            // Convert letter to Pointer Int (A = 1, B = 2, C = 3, ...)
                            Rec."Pointer Int" := PointerLetter - 64; // in ASCII
                        end;
                    end;


                }
                field("Basic Pay int"; Rec."Basic Pay int")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Basic Pay int field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Pointer Int"; Rec."Pointer Int")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pointer Int field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Outlook)
            {
            }
            systempart(Control1000000008; Notes)
            {
            }
            systempart(Control1000000009; MyNotes)
            {
            }
            systempart(Control1000000010; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Ascii")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Generate Ascii action.';

                trigger OnAction()
                begin
                    SalaryPointers.Reset;
                    if SalaryPointers.Find('-') then begin
                        repeat
                            if SalaryPointers."Salary Pointer" = '1' then
                                SalaryPointers."Pointer Int" := 1
                            else if SalaryPointers."Salary Pointer" = '2' then
                                SalaryPointers."Pointer Int" := 2
                            else if SalaryPointers."Salary Pointer" = '3' then
                                SalaryPointers."Pointer Int" := 3
                            else if SalaryPointers."Salary Pointer" = '4' then
                                SalaryPointers."Pointer Int" := 4
                            else if SalaryPointers."Salary Pointer" = '5' then
                                SalaryPointers."Pointer Int" := 5
                            else if SalaryPointers."Salary Pointer" = '6' then
                                SalaryPointers."Pointer Int" := 6
                            else if SalaryPointers."Salary Pointer" = '7' then
                                SalaryPointers."Pointer Int" := 7
                            else if SalaryPointers."Salary Pointer" = '8' then
                                SalaryPointers."Pointer Int" := 8
                            else if SalaryPointers."Salary Pointer" = '9' then
                                SalaryPointers."Pointer Int" := 9
                            else if SalaryPointers."Salary Pointer" = '10' then
                                SalaryPointers."Pointer Int" := 10
                            else if SalaryPointers."Salary Pointer" = '11' then
                                SalaryPointers."Pointer Int" := 11
                            else if SalaryPointers."Salary Pointer" = '12' then
                                SalaryPointers."Pointer Int" := 12
                            else if SalaryPointers."Salary Pointer" = '13' then
                                SalaryPointers."Pointer Int" := 13
                            else if SalaryPointers."Salary Pointer" = '14' then
                                SalaryPointers."Pointer Int" := 14
                            else if SalaryPointers."Salary Pointer" = '15' then
                                SalaryPointers."Pointer Int" := 15
                            else if SalaryPointers."Salary Pointer" = '16' then
                                SalaryPointers."Pointer Int" := 16;
                            SalaryPointers.Modify;
                        until SalaryPointers.Next = 0;
                    end;
                end;
            }
        }
    }

    var
        SalaryPointers: Record "Salary Pointers";
}

