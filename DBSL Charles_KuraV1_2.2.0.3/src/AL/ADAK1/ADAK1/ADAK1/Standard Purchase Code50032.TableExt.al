#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50032 "tableextension50032" extends "Standard Purchase Code"
{
    DataCaptionFields = "Code", "Tender Name", "Requesting Region", Status;
    DrillDownPageID = "Standard Purchase Codes";
    fields
    {

        //Unsupported feature: Property Insertion (Description) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Editable) on "Code(Field 1)".


        //Unsupported feature: Property Modification (Data type) on "Description(Field 2)".


        //Unsupported feature: Code Insertion on "Code(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Code <> xRec.Code THEN BEGIN
          PurchSetup.GET;
          NoSeriesMgt.TestManual(PurchSetup."ITT No. Series");
          "No. Series" := '';
        END;
        */
        //end;

        //Unsupported feature: Property Deletion (NotBlank) on "Code(Field 1)".



        //Unsupported feature: Code Insertion on "Description(Field 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        {IF Purchheader.GET(Description)THEN
          BEGIN
            Description:=Purchheader.Description;
            END}
        */
        //end;
        // modify(Code){
        // trigger OnBeforeValidate()
        //   var
        // Begin
        // PurchSetup.Get();
        // if  Rec."Procurement Method" = "Procurement Method"::"Low Value Procurement" then begin
        //     PurchSetup.TESTFIELD("Low Value Purchase No. Series");
        //     if Code = '' then
        //         NoSeriesMgt.InitSeries(PurchSetup."Low Value Purchase No. Series", xRec.Code, 0D, Code, "No. Series");
        //     end;
        //   end;
        // }
        field(50004; "Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction,Public Private Partnership';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction","Public Private Partnership";
            trigger OnValidate()
            var
            begin
                SetNoseries(Rec);
            end;

        }
        field(50005; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'When the Solicitation Type is selcted, the system shall auto-populate the Bid Selection Method and Procurement Method fields';
            TableRelation = "Solicitation Type".Code;
        }
        field(50006; "External Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(50008; "Procurement Category ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;

            trigger OnValidate()
            begin
                ProcurementCategory.Reset;
                ProcurementCategory.SetRange(Code, "Procurement Category ID");
                if ProcurementCategory.FindSet then
                    "Procurement Category" := ProcurementCategory.Description;
                //pro
            end;
        }
        field(50009; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(50010; "Assigned Procurement Officer"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the assigned Procurement Officer. Mapped to Sales Person/Purchaser table (Filter Role type: Procurement Officer)';
            TableRelation = "Salesperson/Purchaser".Code where("Role Type" = const("Procurement Officer"));
        }
        field(50011; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange("Road Code", "Road Code");
                if RoadInventory.FindSet then
                    "Road Link Name" := RoadInventory."Link Name";
            end;
        }
        field(50012; "Road Link Name"; Text[150])
        {
            Editable = false;
        }
        field(50013; "Constituency ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(50014; "Requesting Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(50015; "Requesting Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(50016; "Requesting Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));//,
                                                                                                                   /////cccc // "Direct Reports To" = field("Requesting Directorate"));
        }
        field(50017; "Engineer Estimate (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(50018; "Tender Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Tender Summary"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50021; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(50022; Name; Text[250])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(50023; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = ToBeClassified;
        }
        field(50024; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(50025; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(50026; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(50027; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(50028; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(50029; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //         if Char.IsLetter("Phone No."[i]) then
            //             Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(50030; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            Description = 'Copy default Procurement Email from E-Procurement Setup Table';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit Mail;
            begin
                // MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(50031; "Tender Box Location Code"; Code[50])
        {
            Caption = 'Tender Box Location Code';
            DataClassification = ToBeClassified;
        }
        field(50032; "Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Charges Schedule".Code where("Document Type" = const(IFS));

            trigger OnValidate()
            begin
                IFSfee.Reset;
                IFSfee.SetRange(Code, "Bid Charge Code");
                if IFSfee.FindSet then begin
                    "Bid Charge (LCY)" := IFSfee.Amount
                end;
            end;
        }
        field(50033; "Bid Charge (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50034; "Bid Charge Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                Bank.Reset;
                Bank.SetRange("No.", "Bid Charge Bank Code");
                if Bank.FindSet then begin
                    "Bank Name" := Bank.Name;
                    "Bank Account Name" := Bank.Name;
                    "Bid Charge Bank Branch" := Bank."Bank Branch Name";
                    "Bid Charge Bank A/C No" := Bank."Bank Account No.";
                end;
            end;
        }
        field(50035; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50036; "Bank Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "Bid Charge Bank Branch"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50038; "Bid Charge Bank A/C No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50039; Published; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(50040; "Created by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50041; "Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IFSSecurities1.Reset;
                IFSSecurities1.SetRange("IFS Code", Code);
                if IFSSecurities1.FindSet then begin
                    repeat
                        IFSSecurities1."Bid Security Validity Expiry" := CalcDate(IFSSecurities1."No of Days", "Submission Start Date");
                        IFSSecurities1.Modify(true);
                    until IFSSecurities1.Next = 0;
                end;
            end;
        }
        field(50042; "Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50043; "Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Tender Validity Expiry Date" := CalcDate("Tender Validity Duration", "Submission End Date");
                "Bid Security Expiry Date" := CalcDate("Bid Security Validity Duration", "Submission End Date");
                "Bid Opening Date" := "Submission End Date";
            end;
        }
        field(50044; "Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Bid Opening Time" := "Submission End Time";
            end;
        }
        field(50045; "No. of Submission"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50046; "Enforce Mandatory E-Receipt"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Bid Document Template"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(50048; "Display Scoring Criteria Vendo"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50049; "Bid Scoring Template"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Scoring Template".Code;
        }
        field(50050; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50051; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(50052; "Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement,Special RFQ';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement","Special RFQ";
        }
        field(50053; "Bid Envelop Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '1-Envelop,2-Envelop';
            OptionMembers = "1-Envelop","2-Envelop";
        }
        field(50054; "Sealed Bids"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50055; "PRN No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"),
                                                           Status = const(Released));
        }
        field(50056; "Bid Submission Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Manual Bids,Hybrid (Electronic Summary+Hardcopy Submissions),Fully E-Bid';
            OptionMembers = "Manual Bids","Hybrid (Electronic Summary+Hardcopy Submissions)","Fully E-Bid";
        }
        field(50057; "Lot No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field used to track the different Lots for a given tender. On the system, each tender lot shall be created as a separate Tender record but the Lot No used for informational and tracking purposes only';
        }
        field(50058; "LCY Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to General Ledger Setup (LCY Code)';
            TableRelation = Currency.Code;
        }
        field(50059; "Works Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;
        }
        field(50060; "Annual Procurement Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field auto-populated based on selected PP Entry No';
            TableRelation = "Procurement Plan".Code;
        }
        field(50061; "Procurement Plan Line No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field auto-populated based on selected PP Entry No';
        }
        field(50062; "Procurement Plan Entry No1"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Mapped to Procurement Plan Entry No Table';
            TableRelation = "Procurement Plan Entry"."Entry No.";
        }
        field(50063; "Financial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Plan.Financial Year Code';
            Editable = false;
            TableRelation = "Financial Year Code".Code;
        }
        field(50064; "Budget Narration"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50065; "Available Procurement Budget"; Decimal)
        {
            Caption = 'Available Procurement Budget (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Linked to PP ENtry';
        }
        field(50066; "Publish Engineers Estimate"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine whether the Engineers Estimate should be published or not. When this is being activated, the system checks to ensure that the Estimate is equal to or less than the stated available budget. If it exceeds the budget, the user is notified and an error notification message is generated';
        }
        field(50067; "Procuring Entity Name/Contact"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50068; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50069; "Bid Opening Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50070; "Bid Opening Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50071; "Tender Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50072; "Tender Validity Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50073; "Enforce Mandatory Pre-bid Visi"; Boolean)
        {
            Caption = 'Enforce Mandatory Pre-bid Visit/Meeting';
            DataClassification = ToBeClassified;
            Description = 'Enforce Mandatory Pre-bid Visit/Meeting';
        }
        field(50074; "Mandatory Pre-bid Visit Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50075; "Domestic Bidder Preference"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50076; "Mandatory Special Group Reserv"; Boolean)
        {
            Caption = 'Mandatory Special Group Reserved';
            DataClassification = ToBeClassified;
        }
        field(50077; "Bid/Tender Security Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50078; "Bid Security %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50079; "Bid Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50080; "Special Group Bid Security"; Boolean)
        {
            Caption = 'Special Group Bid Security Waiver';
            DataClassification = ToBeClassified;
            Description = ' Waiver';
        }
        field(50081; "Bid Security Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50082; "Bid Security Expiry Date"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
            Editable = false;
        }
        field(50083; "Insurance Cover Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50084; "Performance Security Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50085; "Performance Security %"; Decimal)
        {
            Caption = 'Performance Security % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Performance Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50086; "Special Group Performance Secu"; Boolean)
        {
            Caption = 'Special Group Performance Security Waiver';
            DataClassification = ToBeClassified;
            Description = 'Special Group Performance Security Waiver';
        }
        field(50087; "Advance Payment Security Req"; Boolean)
        {
            Caption = 'Advance Payment Security Required';
            DataClassification = ToBeClassified;
            Description = 'Advance Payment Security Required';
        }
        field(50088; "Advance Payment Security %"; Decimal)
        {
            Caption = 'Advance Payment Security % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Advance Payment Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50089; "Advance Amount Limit %"; Decimal)
        {
            Caption = 'Advance Amount Limit % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Advance Amount Limit % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50090; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(50091; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(50092; "Max Works Completion Duration"; Code[10])
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';
            DataClassification = ToBeClassified;
            Description = 'Max Works Completion Duration (After Contract/Order';
        }
        field(50093; "Payment Terms Code"; Code[20])
        {
            Caption = 'Payment Terms';
            DataClassification = ToBeClassified;
            Description = 'Used to determine duration within which settlements shall be done for invoiced/completed works (submission of payment certificate for Works). It is linked to the Payment Terms table (T3)';
            TableRelation = "Payment Terms".Code;
        }
        field(50094; "Defects Liability Period"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Defects Liability (Warranty) Period';
        }
        field(50095; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(50096; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50097; "Payment Retention %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50098; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50099; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(50100; "Appointer of Bid Arbitrator"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Display Scoring Criteria Vend"; Boolean)
        {
            Caption = 'Display Scoring Criteria to Vendors';
            DataClassification = ToBeClassified;
            Description = 'Display Scoring Criteria to Vendors';
        }
        field(50102; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(50103; "Cancel Reason Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Cancel Reason Code".Code;
        }
        field(50104; "Parent Invitation No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'It shall be used to track the Parent ITT in case an Addendum has been done. When the user creates an addendum, the system shall require them to map it to the original ITT (System creates a new ITT that references, the original ITT, and then blocks the Parent ITT. A user can view all the Addenda against a Parent ITT)';
        }
        field(50105; "Target Bidder Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'All Bidders,Local Bidders,International Bidders';
            OptionMembers = "All Bidders","Local Bidders","International Bidders";
        }
        field(50106; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            begin
                Locations.Reset;
                Locations.SetRange(Code, "Location Code");
                if Locations.FindSet then begin
                    "Location Name" := Locations.Name;
                end;
                /*TestStatusOpen;
                IF ("Location Code" <> xRec."Location Code") AND
                   (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
                THEN
                  MessageIfPurchLinesExist(FIELDCAPTION("Location Code"));
                
                UpdateShipToAddress;
                
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                */

            end;
        }
        field(50107; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                TestStatusOpen;
                if not UserSetupMgt.CheckRespCenter(1, "Responsibility Center") then
                    Error(
                      Text028,
                      RespCenter.TableCaption, UserSetupMgt.GetPurchasesFilter);

                "Location Code" := UserSetupMgt.GetLocation(1, '', "Responsibility Center");


                UpdateAddress("Responsibility Center");
            end;
        }
        field(50108; "Requisition Product Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(50109; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = ToBeClassified;
            TableRelation = Language;

            trigger OnValidate()
            begin
                //MessageIfPurchLinesExist(FIELDCAPTION("Language Code"));
            end;
        }
        field(50110; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
                /*ValidatePurchaserOnPurchHeader(Rec,FALSE,FALSE);
                
                ApprovalEntry.SETRANGE("Table ID",DATABASE::"Purchase Header");
                ApprovalEntry.SETRANGE("Document Type","Document Type");
                ApprovalEntry.SETRANGE("Document No.","No.");
                ApprovalEntry.SETFILTER(Status,'%1|%2',ApprovalEntry.Status::Created,ApprovalEntry.Status::Open);
                IF NOT ApprovalEntry.ISEMPTY THEN
                  ERROR(Text042,FIELDCAPTION("Purchaser Code"));
                
                CreateDim(
                  DATABASE::"Salesperson/Purchaser","Purchaser Code",
                  DATABASE::Vendor,"Pay-to Vendor No.",
                  DATABASE::Campaign,"Campaign No.",
                  DATABASE::"Responsibility Center","Responsibility Center");*/

            end;
        }
        field(50111; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(50112; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(50113; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(50114; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(50115; "Primary Tender Submission"; Text[80])
        {
            Caption = 'Tender Submission Address';
            DataClassification = ToBeClassified;
            Description = 'Tender Submission Address';
        }
        field(50116; "Primary Engineer Contact"; Text[80])
        {
            Caption = 'Engineer Contact Address';
            DataClassification = ToBeClassified;
            Description = 'Engineer Contact Address';
        }
        field(50117; "Cancellation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50118; "Cancellation Secret Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(50119; "Bid Opening Committe"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(50120; "Bid Evaluation Committe"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(50480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Job;

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                /*IF JobRec.GET(Job) THEN BEGIN
                  "Job Name":=JobRec.Description;
                  Approver:=JobRec."Project Manager";
                
                END;
                */

            end;
        }
        field(70042; "Requisition Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Procurement Plan".Code;
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                PPlanEntry.Reset;
                PPlanEntry.SetRange("Entry No.", "Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin
                    "PP Planning Category" := PPlanEntry."Planning Category";
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    "PP Total Budget" := PPlanEntry."Available Procurement Budget";
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    "PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";


                end;
            end;
        }
        field(70048; "PP Planning Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Funding Source".Code;
        }
        field(70050; "PP Total Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70054; "Stage 1 EOI Invitation"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code where("Document Type" = const("EOI Invitation"));
        }
        field(70055; "Prebid Meeting Address"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(70056; "Prebid Meeting Register ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register";
        }
        field(70057; "Date/Time Published"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70058; "Cancelled By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70060; "PP Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(70061; "PP Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70062; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70066; "Bid Selection Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Selection Method".Code;
        }
        field(70067; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
                                                             "Job Task Type" = const(Posting));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

            end;
        }
        field(70068; "Sent Cancellation Secret Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70156; "Bid Opening Register"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70157; "Finance Opening Register"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70158; "Finance Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70159; "Sample Delivery Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70160; "Procurement Category"; Text[1000])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Supplier Type");
            end;
        }
        field(70161; "Supplier Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Prequalified Supplier,Registered Supplier,External Supplier';
            OptionMembers = " ","Prequalified Supplier","Registered Supplier","External Supplier";

            trigger OnValidate()
            begin
                //Fred Randomize
                //  IF xRec."Supplier Type"<>Rec."Supplier Type" THEN
                //   BEGIN
                //     SupplierSelect.RESET;
                //     SupplierSelect.SETRANGE(SupplierSelect.Code,Rec.Code);
                //     SupplierSelect.SETRANGE(SupplierSelect."Supplier Type","Supplier Type");
                //     SupplierSelect.SETRANGE(SupplierSelect."Procurement Category","Procurement Category ID");
                //     IF SupplierSelect.FINDSET THEN
                //       SupplierSelect.DELETEALL();
                //   END;
                //
                // IF "Supplier Type"="Supplier Type"::"Registered Supplier" THEN
                //  BEGIN
                //    SupplierSelect.RESET;
                //    SupplierSelect.SETRANGE(SupplierSelect.Code,Rec.Code);
                //    SupplierSelect.SETRANGE(SupplierSelect."Supplier Type","Supplier Type");
                //    SupplierSelect.SETRANGE(SupplierSelect."Procurement Category","Procurement Category ID");
                //    IF SupplierSelect.FINDSET THEN
                //      SupplierSelect.DELETEALL();
                //
                //      SupplierSelect.RESET;
                //      SupplierSelect.SETRANGE(SupplierSelect.Code,Rec.Code);
                //      SupplierSelect.SETRANGE(SupplierSelect."Supplier Type","Supplier Type");
                //      IF NOT SupplierSelect.FINDSET THEN
                //        BEGIN
                //          TESTFIELD("Procurement Category ID");
                //          TESTFIELD("No Of Supliers To Invite");
                //
                //
                //          VendorString:='';
                //          Vendor.RESET;
                //          Vendor.SETRANGE(Vendor."Procurement Category Code","Procurement Category ID");
                //           IF Vendor.FINDSET THEN
                //            BEGIN
                //              REPEAT
                //                IF VendorString<>'' THEN
                //                  VendorString:=VendorString+','+FORMAT(Vendor."Vendor No.")
                //                ELSE
                //                  VendorString:=VendorString+FORMAT(Vendor."Vendor No.");
                //              UNTIL Vendor.NEXT=0;
                //            END;
                //
                //
                //          RandomVendorSelection.RESET;
                //          IF RandomVendorSelection.FINDSET THEN
                //            RandomVendorSelection.DELETEALL;
                //
                //
                //
                //          MyVendors:=VendorString;
                //          Separator:=',';
                //          VendorValues:=MyVendors.Split(Separator.ToCharArray());
                //
                //          IF VendorValues.Length<"No Of Supliers To Invite" THEN
                //           // ERROR('There are only %1 Suppliers for selection for Category %2',VendorValues.Length,"Procurement Category ID");
                //
                //
                //          RandomVendorSelectionCopy.RESET;
                //          IF RandomVendorSelectionCopy.COUNT<="No Of Supliers To Invite" THEN
                //            BEGIN
                //              REPEAT
                //                RANDOMIZE();
                //                RandomPosition:=RANDOM(VendorValues.Length-1);//-1
                //                Selection:=VendorValues.GetValue(RandomPosition);
                //                RandomVendorSelection.RESET;
                //               IF NOT RandomVendorSelection.GET(Selection) THEN
                //                    BEGIN
                //                    RandomVendorSelection.RESET;
                //                    RandomVendorSelection."Entry No":=RandomVendorSelection.COUNT+1;
                //                    RandomVendorSelection."Vendor No":=Selection;
                //                    IF NOT RandomVendorSelection.INSERT(TRUE) THEN
                //                      RandomVendorSelection.MODIFY();
                //                  END;
                //              UNTIL RandomVendorSelectionCopy.COUNT="No Of Supliers To Invite";
                //            END;
                //
                //          //insert suppliers to qualification table
                //          RandomVendorSelection.RESET;
                //          IF RandomVendorSelection.FINDSET THEN BEGIN
                //            REPEAT
                //              SuppSelection.INIT;
                //              SuppSelection.Code:=Code;
                //              SuppSelection."Vendor No.":=RandomVendorSelection."Vendor No";
                //              SuppSelection.VALIDATE("Vendor No.");
                //              SuppSelection."Procurement Category":="Procurement Category ID";
                //              SuppSelection."Supplier Type":="Supplier Type";
                //              SuppSelection.Description:=Description;
                //              SuppSelection."IFS Code":=Code;
                //              IF NOT SuppSelection.INSERT(TRUE) THEN
                //                SuppSelection.MODIFY(TRUE);
                //              UNTIL RandomVendorSelection.NEXT=0;
                //              END;
                //
                //
                //
                //            SuppSelection.RESET;
                //            SuppSelection.SETRANGE(SuppSelection.Code,Code);
                //            SupplierSelection.SETTABLEVIEW(SuppSelection);
                //            SupplierSelection.RUN;
                //          END;
                //  END;
                //


                //Vendor Prequalification List
                // IF "Supplier Type"="Supplier Type"::"Prequalified Supplier" THEN BEGIN
                //    SupplierSelect.RESET;
                //    SupplierSelect.SETRANGE(SupplierSelect.Code,Rec.Code);
                //    SupplierSelect.SETRANGE(SupplierSelect."Supplier Type","Supplier Type");
                //    SupplierSelect.SETRANGE(SupplierSelect."Procurement Category","Procurement Category ID");
                //       IF NOT SupplierSelect.FINDSET THEN
                //        BEGIN
                //          TESTFIELD("Procurement Category ID");
                //          TESTFIELD("No Of Supliers To Invite");
                //          MESSAGE('Here');
                //
                //
                //          //Vendor Prequalification List
                //          VendorString:='';
                //          VendorPrequalificationEntry.RESET;
                //          VendorPrequalificationEntry.SETRANGE(VendorPrequalificationEntry."Procurement Category Code","Procurement Category ID");
                //           IF VendorPrequalificationEntry.FINDSET THEN
                //            BEGIN
                //            MESSAGE('Good');
                //              REPEAT
                //                IF VendorString<>'' THEN
                //                  VendorString:=VendorString+','+FORMAT(VendorPrequalificationEntry."Vendor No.")
                //                ELSE
                //                  VendorString:=VendorString+FORMAT(VendorPrequalificationEntry."Vendor No.");
                //              UNTIL VendorPrequalificationEntry.NEXT=0;
                //            END;
                //            END;
                //
                //
                //          RandomVendorSelection.RESET;
                //          IF RandomVendorSelection.FINDSET THEN
                //            RandomVendorSelection.DELETEALL;
                //
                //          MyVendors:=VendorString;
                //          Separator:=',';
                //          VendorValues:=MyVendors.Split(Separator.ToCharArray());
                //
                //          IF VendorValues.Length<"No Of Supliers To Invite" THEN
                //            ERROR('There are only %1 Suppliers for selection for Category %2',VendorValues.Length,"Procurement Category ID");
                //
                //
                //          RandomVendorSelectionCopy.RESET;
                //          IF RandomVendorSelectionCopy.COUNT<="No Of Supliers To Invite" THEN
                //            BEGIN
                //              REPEAT
                //                RANDOMIZE();
                //                RandomPosition:=RANDOM(VendorValues.Length-1);//-1
                //                Selection:=VendorValues.GetValue(RandomPosition);
                //                RandomVendorSelection.RESET;
                //               IF NOT RandomVendorSelection.GET(Selection) THEN
                //                    BEGIN
                //                    RandomVendorSelection."Entry No":=RandomVendorSelection."Entry No"+1;
                //                    RandomVendorSelection."Vendor No":=Selection;
                //                    IF NOT RandomVendorSelection.INSERT(TRUE) THEN
                //                      RandomVendorSelection.MODIFY();
                //                  END;
                //              UNTIL RandomVendorSelectionCopy.COUNT="No Of Supliers To Invite";
                //
                //
                //          //insert suppliers to qualification table
                //          RandomVendorSelection.RESET;
                //          IF RandomVendorSelection.FINDSET THEN
                //          BEGIN
                //            REPEAT
                //              SuppSelection.INIT;
                //              SuppSelection.Code:=Code;
                //              SuppSelection."Vendor No.":=RandomVendorSelection."Vendor No";
                //              SuppSelection.VALIDATE("Vendor No.");
                //              SuppSelection."Procurement Category":="Procurement Category ID";
                //              SuppSelection."Supplier Type":="Supplier Type";
                //              SuppSelection.Description:=Description;
                //              SuppSelection."IFS Code":=Code;
                //              IF NOT SuppSelection.INSERT(TRUE) THEN
                //                SuppSelection.MODIFY(TRUE);
                //              UNTIL RandomVendorSelection.NEXT=0;
                //              END;
                //
                //
                //
                //            SuppSelection.RESET;
                //            SuppSelection.SETRANGE(SuppSelection.Code,Code);
                //            SuppSelection.SETRANGE(SuppSelection."Supplier Type","Supplier Type");
                //            SupplierSelection.SETTABLEVIEW(SuppSelection);
                //            SupplierSelection.RUN;
                //          END;
                //        END;
                // //END;
                //Fred Randomize
            end;
        }
        field(70162; "Awarded Bidder No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Vendor."No.";
        }
        field(70163; "Awarded Quote No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote),
                                                           "Invitation For Supply No" = field(Code));

            trigger OnValidate()
            begin
                Purchheader.Reset;
                Purchheader.SetRange("No.", "Awarded Quote No");
                if Purchheader.FindSet then begin
                    "Awarded Bidder No" := Purchheader."Buy-from Vendor No.";
                    Purchheader.CalcFields("Amount Including VAT");
                    rec."Awarded Bid Amount" := Purchheader."Amount Including VAT";
                    rec."Awarded Bidder Name" := Purchheader."Buy-from Vendor Name";

                end;
            end;
        }
        field(70164; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70165; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70166; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70167; "No Of Supliers To Invite"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70168; "Location Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(70169; "IFS Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70170; "IFS Evaluation Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70171; "IFS Evaluation End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70172; "Payment Type"; Option)
        {
            OptionCaption = ' ,Milestone based,Minimum IPC amount';
            OptionMembers = " ","Milestone based","Minimum IPC amount";
        }
        field(70173; "Last Evaluation Version No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            InitValue = 1;
        }
        field(70174; "Re-Evaluate"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70175; "Program Title"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70176; "Location of Project"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70177; "Extent of Contract"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70178; "Awarded Bid Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70179; "Awarded Bidder Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70180; "RFQ Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70181; "RFQ Sent On"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70182; "Awarded Bidder Sum"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(70183; Archive; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70184; "Framework Agreement No"; Code[250])
        {
            TableRelation = "Standard Purchase Code".Code where("Procurement Method" = const("Framework Agreement"));
        }
        field(70185; "Submission Status"; Option)
        {
            OptionMembers = "",Open,Submitted;
        }
    }





    trigger OnInsert()
    var
        Docno: Text[30];
        Text01: Text[30];
        Text02: Text[30];
        StPCode: Record "Standard Purchase Code";

    begin
        Docno := '';
        IF REC."Invitation Notice Type" = REC."Invitation Notice Type"::RFQ THEN BEGIN
            IF Code = '' THEN BEGIN
                PurchSetup.GET;
                PurchSetup.TESTFIELD("RFQ Nos");
               Code := NoSeriesMgt.GetNextNo(PurchSetup."RFQ Nos", WorkDate(), true);
            END;
        END;

        IF REC."Invitation Notice Type" <> REC."Invitation Notice Type"::RFQ THEN BEGIN
            IF Code = '' THEN BEGIN
                PurchSetup.GET;
                PurchSetup.TESTFIELD("ITT No. Series");
                          Code := NoSeriesMgt.GetNextNo(PurchSetup."ITT No. Series", WorkDate(), true);
            END;
        END;

        if Code = '' then begin
            IF Rec."Procurement Method" = "Procurement Method"::"Low Value Procurement" THEN BEGIN
                PurchSetup.GET;
                PurchSetup.TESTFIELD("Low Value Purchase No. Series");
                 Code := NoSeriesMgt.GetNextNo(PurchSetup."Low Value Purchase No. Series", WorkDate(), true);
            END;
        END;




        "Created by" := USERID;
        "Created Date/Time" := CURRENTDATETIME;
        if usersetup.get(Userid) then begin
            "Responsibility Center" := usersetup."Responsibility Center";
            "Location Code" := UserSetup."Responsibility Center";
        end;
        //Create Reference No ****IanCasper****
        CashMgt.Get();
        Text01 := CopyStr(CashMgt."Current Budget", 3, 2) + '-' + CopyStr(CashMgt."Current Budget", 6, 2);
        StPCode.Reset();
        StPCode.SetRange("Responsibility Center", "Responsibility Center");
        StPCode.SetRange("Procurement Method", "Procurement Method");
        if StPCode.FindLast() then begin
            Text02 := IncStr(StPCode."External Document No");
            Docno := 'RFQ/' + "Responsibility Center" + '/' + Text01 + '/001';
            if CopyStr(Text02, 1, 17) <> CopyStr(Docno, 1, 17) then
                Text02 := Docno;
            if CopyStr(Text02, 1, 17) <> CopyStr(StPCode."External Document No", 1, 17) then
                Text02 := 'RFQ/' + "Responsibility Center" + '/' + Text01 + '/001';
        end else begin
            Text02 := 'RFQ/' + "Responsibility Center" + '/' + Text01 + '/001';
        end;
        "External Document No" := Text02;
        //End Create Reference No ****IanCasper****
    end;

    procedure SetNoseries(StandardPurchaseCode: Record "Standard Purchase Code")
    begin
        if Rec.Code = '' then begin
            PurchSetup.GET;
            PurchSetup.TESTFIELD("Low Value Purchase No. Series");
            If Rec."Procurement Method" = "Procurement Method"::"Low Value Procurement" THEN
                Rec.Code := NoSeriesMgt.GetNextNo(PurchSetup."Low Value Purchase No. Series", WorkDate(), true);
        END;

    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2','',Code),
        //     "Global Dimension 1 Code","Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;



        TestField(Status, Status::Open);

        OnAfterTestStatusOpen;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    procedure UpdateAddress(Respcode: Code[10])
    var
        Resp: Record "Responsibility Center";
    begin
        Resp.Reset;
        Resp.SetRange(Code, Respcode);
        if Resp.FindSet then begin

            "Procuring Entity Name/Contact" := Resp.Name;
            Validate(Address, Resp.Address);
            Validate("Address 2", Resp."Address 2");
            Validate("Post Code", Resp."Post Code");
            Validate(City, Resp.City);
            Validate("Country/Region Code", Resp."Country/Region Code");
            Validate("Phone No.", Resp."Phone No.");
            Validate("E-Mail", Resp."E-Mail");

        end;
    end;

    var
        IFSSecurities1: Record "IFS Securities";

    var
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Dimen: Text;
        Dimens: Text;
        DimMgt: Codeunit DimensionManagement;
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetupMgt: Codeunit "User Setup Management";
        Text028: label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        InvtSetup: Record "Inventory Setup";
        PPlanEntry: Record "Procurement Plan Entry";
        IFSfee: Record "Bid Charges Schedule";
        Bank: Record "Bank Account";
        RoadInventory: Record "Road Inventory";
        PPReservation: Record "PP Purchase Activity Schedule";
        Purchheader: Record "Purchase Header";
        ProcurementCategory: Record "Procurement Category";
        ProcSetup: Record "Procurement Setup";
        VendorString: Text;
        // MyVendors: dotnet String;
        // VendorValues: dotnet Array;
        // Separator: dotnet String;
        VendorNo: Text;
        RandomVendorSelection: Record "Random Vendor Selection";
        Selection: Text;
        RandomPosition: Integer;
        RandomVendorSelectionCopy: Record "Random Vendor Selection";
        SupplierCount: Integer;
        Selected: Integer;
        SupplierSelect: Record "Standard Vendor Purchase Code";
        Vendor: Record "Vendor Registration Entry";
        SuppSelection: Record "Standard Vendor Purchase Code";
        SupplierSelection: Page "Standard Vendor Purchase Codes";
        VendorPrequalificationEntry: Record "Vendor Prequalification Entry";
        ObjVendor: Record Vendor;
        ObjSuppSelection: Record "Standard Vendor Purchase Code";
        ObjRandomVendorSelection: Record "Random Vendor Selection";
        ObjRandomVendorSelectionCopy: Record "Random Vendor Selection";
        ObjSupplierSelect: Record "Standard Vendor Purchase Code";
        Locations: Record Location;
        UserSetup: Record "User Setup";
        CashMgt: Record "Cash Management Setup";
}

