#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072,AL0603, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50128 "tableextension50128" extends "Fixed Asset"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Description 2"(Field 4)".


        //Unsupported feature: Code Modification on ""Global Dimension 1 Code"(Field 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(1,"Global Dimension 1 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Global Dimension 2 Code"(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Global Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
        */
        //end;
        field(50001; "FA G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50002; "Reference Number"; Text[30])
        {
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));


            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50051; "Asset Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Money Market",Property,Equity,Mortgage,"Unit Trust";
        }
        field(50052; "Interest Rate Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Fixed",Floating;
        }
        field(52000; Barcode; Code[20])
        {
        }
        field(52001; "Main Location"; Code[100])
        {
        }
        field(52002; "Sub Location"; Code[100])
        {
        }
        field(52003; Room; Code[50])
        {
        }
        field(52004; user; Code[100])
        {
        }
        field(52005; Dep; Code[150])
        {
        }
        field(56002; "Fixed Asset Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicle,Others;

            trigger OnValidate()
            begin
                if "Fixed Asset Type" = "fixed asset type"::Vehicle then begin
                    if Confirm('Are you sure you want to create a fleet vehicle?', true) = true then begin
                        FleetVehicles.Init;
                        FleetVehicles."No." := "No.";
                        FleetVehicles."Registration No." := Rec."Vehicle Registration No.";
                        FleetVehicles."FA Serial No" := Rec."Serial No.";
                        FleetVehicles.Description := Description;
                        // FleetVehicles.Validate(Description);
                        FleetVehicles."FA Class Code" := "FA Class Code";
                        FleetVehicles."FA Location Code" := "FA Location Code";
                        FleetVehicles."Global Dimension 1 Code" := "Global Dimension 1 Code";
                        FleetVehicles."Global Dimension 2 Code" := "Global Dimension 2 Code";
                        FleetVehicles."Location Code" := "Location Code";
                        FleetVehicles."Main Asset/Component" := "Main Asset/Component";
                        if not FleetVehicles.Get(FleetVehicles."No.", FleetVehicles."FA Serial No") then
                            FleetVehicles.Insert(true);
                        //MESSAGE(FORMAT(FleetVehicles));
                        Message('Vehicle %1 created successfully', FleetVehicles."No.");
                    end;
                end;
            end;
        }
        field(57021; "Vote Item"; Code[20])
        {
            CalcFormula = lookup("FA Posting Group"."Acquisition Cost Account" where(Code = field("FA Subclass Code")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "G/L Account";
        }
        field(57022; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Research Center?" = const(true), "Operating Unit Type" = const("Department/Center"));
        }
        field(59002; test; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(59003; "Record Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Fixed Asset,Road Asset';
            OptionMembers = " ","Fixed Asset","Road Asset";
        }
        field(59004; "Master Road Link ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59005; "Original Road ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59006; "Original Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class";
        }
        field(59007; "Original Road No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59008; "Orignal Road Agency"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table72007;
        }
        field(59009; "Road Label"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(59010; "Gazetted  Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class";
        }
        field(59011; Government; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Government Level";
        }
        field(59012; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency;
        }
        field(59013; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1;
        }
        field(59014; "Region ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(59015; "Start Reference Point"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59016; "Start Point Coordinates"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59017; "End Reference Point"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59018; "End Point Coordinates"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59019; "Total Road Length(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(59020; "Total Paved Length(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(59021; "Donated Asset"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59022; "Start Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59023; "End Chainage(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59024; "Link Length(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59025; "Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(59026; "Administrative Boundary"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Asset Purchase Groups"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70001; "Chassis No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70002; "Tag No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70003; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'Department Code';
            // TableRelation = "Responsibility Center".Code;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(70004; "Financed by"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Agency";
        }
        field(70005; "Engine No."; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70006; "Make"; Code[1000])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make".Code;
        }
        field(70007; "Year of Purchase"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70008; "PV Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Payments."No." where("Account Type" = const("Fixed Asset"));
        }
        field(70009; "Replacement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        // field(70010; Amount; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = Payments."Total Net Amount" where("Account Type" = const("Fixed Asset"));
        // }
        // field(70011; "Annual Depreciation"; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(70012; "Accumulated Depreciation"; Decimal)
        // {
        //     DataClassification = ToBeClassified;

        //     trigger OnValidate()
        //     begin
        //         "Net Book Value" := Rec.Amount - Rec."Accumulated Depreciation";
        //     end;
        // }
        // field(70013; "Net Book Value"; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "FA Depreciation Book"."Disposal Date"

        // }
        // field(70014; "Date of Disposal"; Date)
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(70015; "Disposal Value"; Date)
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(70016; "Asset Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Servicable,Good Condition';
            OptionMembers = " ",Servicable,"Good Condition";
        }
        field(70017; "Present Logbook"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70018; Notes; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70019; "Vehicle Registration No."; Code[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70020; "Suggested For Disposal"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70021; "Marked for Disposal"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            BEGIN
                IF "Marked for Disposal" = true THEN BEGIN
                    IF CONFIRM('Are you sure you want to mark for Disposal ?', TRUE) THEN BEGIN
                        "Marked for Disposal By" := USERID;
                        "Marked for Disposal On" := CREATEDATETIME(TODAY, TIME);

                    END;
                END;
            END;
        }
        field(70022; "Marked for Disposal By"; Code[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Marked for Disposal On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70024; "Model"; Code[1000])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Model".Code;
        }

    }




    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      FASetup.GET;
      FASetup.TESTFIELD("Fixed Asset Nos.");
      NoSeriesMgt.InitSeries(FASetup."Fixed Asset Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    "Main Asset/Component" := "Main Asset/Component"::" ";
    "Component of Main Asset" := '';

    DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     IF "No." = '' THEN BEGIN
     FASetup.GET;
      FASetup.TESTFIELD("Fixed Asset Nos.");
      NoSeriesMgt.InitSeries(FASetup."Fixed Asset Nos.",xRec."No. Series",0D,"No.","No. Series");
     END;

     "Main Asset/Component" := "Main Asset/Component"::" ";
     "Component of Main Asset" := '';

     DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;

    var
        FleetVehicles: Record "Fleet Vehicles.";
        ResponsibilityCenter: Record "Responsibility Center";
}