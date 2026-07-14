#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// TableExtension "tableextension50134" (ID 50134) extends Record Responsibility Center.
/// </summary>
TableExtension 50134 tableextension50134 extends "Responsibility Center"
{
    fields
    {
        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".

        field(50005; "No. of Research Programs"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50006; "No. of Grant Proposals"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50007; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50008; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50009; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project Start Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50010; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project End Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50011; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Research Center" = field(Code),
                                                                                              "Application Status" = const(Won),
                                                                                              "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50012; "No. of Assets"; Integer)
        {
            CalcFormula = count("Fixed Asset" where("Research Center" = field(Code)));
            Description = 'For Statistics';
            FieldClass = FlowField;
            Editable = false;
        }
        field(72000; "Total Road Network Length (Km)"; Decimal)
        {
            CalcFormula = sum("Road Section"."Total Road Length (KMs)" where("Primary Region ID" = field(Code),
                                                                              Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72001; "Paved Road Length (Km)"; Decimal)
        {
            CalcFormula = sum("Pavement Surface Entry"."Road Length (Kms)" where("Region ID" = field(Code),
                                                                                 Reversed = const(false),
                                                                                 "Pavement Category" = const(Paved)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72002; "Paved Road Length %"; Decimal)
        {
            Editable = false;
        }
        field(72003; "Unpaved Road Length %"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(72004; "No. of Planned Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter(Planned | Ongoing), "Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72005; "No. of Ongoing Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Completed/Under DLP"), "Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72006; "No. of Completed Road Projects"; Integer)
        {
            CalcFormula = count(Job where(Status = filter("Under PBRM"), "Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72007; "Total Budget (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Region ID" = field(Code), "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                          Text = const('2')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72008; "Total Budget (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Region ID" = field(Code), "Line Type" = filter(Budget | "Both Budget and Billable"),
                                                                          Text = const('3')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72009; "Actual Cost (Maintainenace)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Region ID" = field(Code),
                                                                          "Entry Type" = const(Usage),
                                                                          "Road Project Category" = const("Maitenance Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72010; "Actual Cost (Construction)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Region ID" = field(Code),
                                                                          "Entry Type" = const(Usage),
                                                                          "Road Project Category" = const("Construction Works")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72011; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Primary Region ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(72012; "No. Of Constituencies"; Integer)
        {
            CalcFormula = count(Constituency where("Region Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(80000; "Operating Unit Type"; Enum "Responsibility Center Operating unit types")
        {
        }

      
        
        field(80001; "Direct Reports To"; Code[50])
        {
            Caption = 'Parent Centre Code';
            TableRelation = "Responsibility Center"; 
            ToolTip = 'Links to Responsibility Center table to show who directly manages/oversights this RC.';

            trigger OnValidate()
            begin
                ValidateDirectReportsTo();
            end;
        }
        field(80002; "Indirect Reports To"; Code[50])
        {
            Caption = 'Matrix Centre Code';
            TableRelation = "Responsibility Center";
            ToolTip = 'Links to Responsibility Center table for RCs that have an indirect or matrix relationship.';

            trigger OnValidate()
            begin
                ValidateIndirectReportsTo();
            end;
        }
        field(80003; "Hierarchical  Level ID"; Option)
        {
            Caption = 'Hierarchical Level ID';
            OptionCaption = 'Level 1,Level 2,Level 3,Level 4,Level 5';
            OptionMembers = "Level 1","Level 2","Level 3","Level 4","Level 5";
            ToolTip = 'Shows the Hierarchy/Seniority levels of each RC (e.g., L1 = Board, L2 = CEO, L3 = Directorates, L4 = Departments, L5 = Sections).';

            trigger OnValidate()
            begin
                
                "Direct Reports To" := '';
                "Indirect Reports To" := '';
            end;
        }
        field(80004; "Headed By (Title)"; Code[50])
        {
            Caption = 'Headed By (Title)';
            TableRelation = "Company Positions"."Position ID";
            ToolTip = 'Links to Position table';
        }
        field(80005; "Current Head"; Code[50])
                {
                    Caption = 'Current Head';
                    TableRelation = Employee."No.";
                    ToolTip = 'Specifies the current head of the responsibility center (replaces Center Director).';

                    trigger OnValidate()
                    begin
                        if "Current Head" = '' then
                            "Current Head Name" := ''
                        else if Employee.Get("Current Head") then
                            "Current Head Name" := Employee.FullName()
                        else
                            "Current Head Name" := '';
                    end;
                }
        field(80006; Blocked; Boolean)
        {
        }
        field(80007; Vision; Text[255])
        {
            Description = 'SPM';
        }
        field(80008; Mission; Text[255])
        {
            Description = 'SPM';
        }
        field(80009; Motto; Text[255])
        {
            Description = 'SPM';
        }
        field(80010; "Research Center?"; Boolean)
        {
        }
        field(80011; Region; Boolean)
        {
        }
        field(80012; "Current Head Name"; Text[100])
        {
            Description = 'SPM';
        }
        field(80013; "Performance Contra. Signatory"; Text[250])
        {
            Description = 'Performance Contracting Signatory';
        }
        field(80014; PDE; Boolean)
        {
        }
        field(80015; HQ; Boolean)
        {
        }
        field(80016; "Assignment Area ID"; Code[100])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Duty Station"));
        }
        field(80017; "No of RAM Workplans"; Integer)
        {
        }
        field(80018; Identifier; Enum "Resp Center Identifier")
        {
            DataClassification = ToBeClassified;
        }
           field(80019; "Station Category"; Text[250])
        {
            Description = 'Station Category';
        }
    }

    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;Name)
        // {
        // }
    }


    
    local procedure ValidateDirectReportsTo()
    var
        ParentRC: Record "Responsibility Center";
    begin
        if "Direct Reports To" = '' then
            exit;

        // Prevent direct self-referencing
        if "Direct Reports To" = Rec.Code then
            Error('A Responsibility Center cannot report to itself.');

        // 1. Recursive Hierarchy Loop Checker (Prevents infinite hierarchy loops)
        CheckForRecursiveLoop("Direct Reports To");

        // 2. Hierarchical level matching logic
        if ParentRC.Get("Direct Reports To") then begin
            if "Hierarchical  Level ID" = "Hierarchical  Level ID"::"Level 1" then begin
                if ParentRC."Hierarchical  Level ID" <> ParentRC."Hierarchical  Level ID"::"Level 1" then
                    Error('A Level 1 Responsibility Center can only directly report to another Level 1 Responsibility Center.');
                exit;
            end;

            case "Hierarchical  Level ID" of
                "Hierarchical  Level ID"::"Level 2":
                    if ParentRC."Hierarchical  Level ID" <> ParentRC."Hierarchical  Level ID"::"Level 1" then
                        Error('A Level 2 Responsibility Center must directly report to a Level 1 Responsibility Center.');
                "Hierarchical  Level ID"::"Level 3":
                    if ParentRC."Hierarchical  Level ID" <> ParentRC."Hierarchical  Level ID"::"Level 2" then
                        Error('A Level 3 Responsibility Center must directly report to a Level 2 Responsibility Center.');
                "Hierarchical  Level ID"::"Level 4":
                    if ParentRC."Hierarchical  Level ID" <> ParentRC."Hierarchical  Level ID"::"Level 3" then
                        Error('A Level 4 Responsibility Center must directly report to a Level 3 Responsibility Center.');
                "Hierarchical  Level ID"::"Level 5":
                    if ParentRC."Hierarchical  Level ID" <> ParentRC."Hierarchical  Level ID"::"Level 4" then
                        Error('A Level 5 Responsibility Center must directly report to a Level 4 Responsibility Center.');
            end;
        end;
    end;

    local procedure CheckForRecursiveLoop(ParentCode: Code[50])
    var
        TempRC: Record "Responsibility Center";
        VisitedList: List of [Code[50]];
        CurrentParent: Code[50];
    begin
        VisitedList.Add(Rec.Code);
        CurrentParent := ParentCode;

        while CurrentParent <> '' do begin
            
            if VisitedList.Contains(CurrentParent) then
                Error('Circular reporting loop detected! Responsibility Center %1 cannot report to %2 because %2 reports back to %1 in the hierarchy.', Rec.Code, ParentCode);
            
            VisitedList.Add(CurrentParent);

            if TempRC.Get(CurrentParent) then
                CurrentParent := TempRC."Direct Reports To"
            else
                CurrentParent := '';
        end;
    end;

    local procedure ValidateIndirectReportsTo()
    var
        IndirectRC: Record "Responsibility Center";
    begin
        if "Indirect Reports To" = '' then
            exit;

        
        if "Indirect Reports To" = Rec.Code then
            Error('A Responsibility Center cannot indirectly report to itself.');

        
        if "Hierarchical  Level ID" <> "Hierarchical  Level ID"::"Level 1" then begin
           
            if "Indirect Reports To" = "Direct Reports To" then
                Error('You cannot report directly and indirectly to the same Responsibility Center. Please check!');
        end;

        
        if "Hierarchical  Level ID" <> "Hierarchical  Level ID"::"Level 1" then begin
            if IndirectRC.Get("Indirect Reports To") then begin
                case "Hierarchical  Level ID" of
                    "Hierarchical  Level ID"::"Level 2":
                        if IndirectRC."Hierarchical  Level ID" <> IndirectRC."Hierarchical  Level ID"::"Level 1" then
                            Error('A Level 2 Responsibility Center must indirectly report to a Level 1 Responsibility Center.');
                    "Hierarchical  Level ID"::"Level 3":
                        if IndirectRC."Hierarchical  Level ID" <> IndirectRC."Hierarchical  Level ID"::"Level 2" then
                            Error('A Level 3 Responsibility Center must indirectly report to a Level 2 Responsibility Center.');
                    "Hierarchical  Level ID"::"Level 4":
                        if IndirectRC."Hierarchical  Level ID" <> IndirectRC."Hierarchical  Level ID"::"Level 3" then
                            Error('A Level 4 Responsibility Center must indirectly report to a Level 3 Responsibility Center.');
                    "Hierarchical  Level ID"::"Level 5":
                        if IndirectRC."Hierarchical  Level ID" <> IndirectRC."Hierarchical  Level ID"::"Level 4" then
                            Error('A Level 5 Responsibility Center must indirectly report to a Level 4 Responsibility Center.');
                end;
            end;
        end;
    end;

    var
        Employees: Record Employee;
        Employee: Record Employee;
}