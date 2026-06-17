// Table 56025 "Copyright Participants"
// {
//     fields
//     {
//         field(1; "Line No"; Integer)
//         {
//             AutoIncrement = true;
//             NotBlank = false;
//         }
//         field(2; "Copyright Reg No"; Code[20])
//         {
//             TableRelation = "Copyright Registration Table"."No.";
//         }
//         field(3; "First Name"; Text[50])
//         {
//             Caption = ' First Name';

//             trigger OnValidate()
//             begin
//                 //IF (Surname = UPPERCASE(xRec."First Name")) OR (Surname = '') THEN
//                 //  Surname := "First Name";
//                 //"First Name":=UPPERCASE("First Name");
//             end;
//         }
//         field(4; Surname; Code[50])
//         {
//             Caption = 'Surname';

//             trigger OnValidate()
//             begin
//                 //Surname:=UPPERCASE(Surname);
//             end;
//         }
//         field(5; "Middle Name"; Text[50])
//         {
//             Caption = ' Middle Name';

//             trigger OnValidate()
//             begin
//                 //"Middle Name":=UPPERCASE("Middle Name");
//             end;
//         }
//         field(6; Address; Text[50])
//         {
//             Caption = 'Address';
//         }
//         field(7; "Address 2"; Text[50])
//         {
//             Caption = 'Physical Location';
//         }
//         field(9; Contact; Text[50])
//         {
//             Caption = 'Contact';
//         }
//         field(10; "Phone No."; Text[30])
//         {
//             Caption = 'Phone No.';
//             ExtendedDatatype = PhoneNo;
//         }
//         field(11; "ID. No./company Reg"; Code[20])
//         {
//         }
//         field(12; "P.I.N"; Code[11])
//         {
//         }
//         field(13; "Pseudo Name"; Text[50])
//         {
//         }
//         field(15; "Email Address"; Text[50])
//         {
//         }
//         field(16; Type; Option)
//         {
//             OptionMembers = Applicant,Author,Agent,Publisher,Producer;
//         }
//         field(17; City; Text[30])
//         {
//             Caption = 'City';
//             // TableRelation = if ("Country/Region Code" = const()) "Post Code".City
//             // else if ("Country/Region Code" = filter(<> "")) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
//             TableRelation = if ("Country/Region Code" = const()) "Post Code".City;
//             // else if ("Country/Region Code" = filter(<> "")) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//             trigger OnValidate()
//             begin
//                 PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
//             end;
//         }
//         field(18; "Post Code"; Code[20])
//         {
//             Caption = 'Post Code';
//             // TableRelation = if ("Country/Region Code" = const()) "Post Code"
//             // else if ("Country/Region Code" = filter(<> "")) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
//             TableRelation = if ("Country/Region Code" = const()) "Post Code";
//             // else if "Post Code" where("Country/Region Code" = field("Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//             trigger OnValidate()
//             begin
//                 PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
//             end;
//         }
//         field(19; "Country/Region Code"; Code[10])
//         {
//             Caption = 'Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(20; County; Text[30])
//         {
//             Caption = 'County';
//         }
//         field(21; "Full Name"; Text[250])
//         {
//         }
//         field(22; "Assignment/License Date"; Date)
//         {
//         }
//         field(23; "1st Country of Production"; Code[10])
//         {
//             TableRelation = "Country/Region".Code;
//         }
//         field(24; "Production Category"; Option)
//         {
//             OptionCaption = 'Self-Produced,Label/Record Company';
//             OptionMembers = "Self-Produced","Label/Record Company";
//         }
//         field(25; ISBN; Code[20])
//         {
//         }
//     }

//     keys
//     {
//         key(Key1; "Line No", "Copyright Reg No")
//         {
//             Clustered = true;
//         }
//         // key(Key2;'')
//         // {
//         //     Enabled = false;
//         // }
//     }

//     fieldgroups
//     {
//     }

//     var
//         objTrack: Record Tracks;
//         PostCode: Record "Post Code";
// }