table 50113 "Memo Nos Setup"
{
    Caption = 'Memo Nos Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(2; "General Correspondences Nos"; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(5; "Incoming Correspondence Nos"; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(6; "Correspondence Contact Nos"; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(15; "Project Files Url"; Text[200])
        {
            DataClassification = ToBeClassified;
        }


        // field(24; "EAP Memo Url"; Text[2048])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(25; "Education and Research Memo Url"; Text[2048])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(26; "Corporate Communication Memo Url"; Text[2048])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(27; "Audit Memo Url"; Text[2048])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(28; "Staff Personnel Files Url"; Text[2048])
        // {
        //     DataClassification = ToBeClassified;
        // }

        //CURRICULUM , RESEARCH AND CONSULTANCY SERVICES
        field(41; "Policy"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Policy';
        }
        field(42; "Circulars On Education"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Circulars On Education3';
        }
        field(43; "Term Dates"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Term Dates';
        }
        field(44; "Basic Education Course Panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Basic Education Course Panel';
        }
        field(45; "Membership to KICD Subject Panels"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Membership to KICD Subject Panels';
        }
        field(46; "East African Cooperation on Education"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'East African Cooperation on Education';
        }
        field(47; "Collaborations and Partnerships-CRS"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Collaborations and Partnerships-CRS';
        }
        field(48; "Usaid"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Usaid';
        }
        field(49; "Unesco"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Unesco';
        }
        field(50; "Unicef"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Unicef';
        }
        field(51; "ILO/IPEC Education & Training"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'ILO/IPEC Education & Training';
        }
        field(52; "NACADAA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'NACADAA';
        }
        field(53; "MOE"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'MOE';
        }
        field(54; "K NEC"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'K NEC';
        }
        field(55; "NEMA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'NEMA';
        }
        field(56; "National Parks/Museums of Kenya"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'National Parks/Museums of Kenya';
        }
        field(57; "City Council of Nairobi"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'City Council of Nairobi';
        }
        field(58; "JICA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'JICA';
        }
        field(59; "Kenya Bureau of Standards"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Kenya Bureau of Standards';
        }
        field(60; "I Choose Life"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'I Choose Life';
        }
        field(61; "Feed the Children"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Feed the Children';
        }
        field(62; "Kenya Association of Professional Counsellors"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Kenya Association of Professional Counsellors';
        }
        field(63; "URAIA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'URAIA';
        }
        field(64; "CCK"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'CCK';
        }
        field(65; "KEPSHA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'KEPSHA';
        }
        field(66; "KESSHA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'KESSHA';
        }
        field(67; "Kenya Publishers Association"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Kenya Publishers Association';
        }
        field(68; "National Book Development Council of Kenya"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'National Book Development Council of Kenya';
        }
        field(69; "Ministry of Roads & Public Works"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Ministry of Roads & Public Works';
        }
        field(70; "Public Service Commission"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Public Service Commission';
        }
        field(71; "KBC"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'KBC';
        }
        field(72; "TSC"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'TSC';
        }
        field(73; "WSPA"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'WSPA';
        }
        field(74; "IBM"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'IBM';
        }
        field(75; "Women Educational Researchers of Kenya"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Women Educational Researchers of Kenya';
        }
        field(76; "Memorandum of Understanding"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Memorandum of Understanding';
        }
        field(77; "KISE"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'KISE';
        }
        field(78; "Association of Charitable Children Institutions of Kenya(ACCICK)"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Association of Charitable Children Institutions of Kenya(ACCICK)';
        }
        field(79; "IEBC"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'IEBC';
        }
        field(80; "Education for Sustainable Development(ESD)"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Education for Sustainable Development(ESD)';
        }
        field(81; "Curriculum Review Projects"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Curriculum Review Projects';
        }
        field(82; "NESSP"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'NESSP';
        }
        field(83; "Tafakari"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Tafakari';
        }
        field(84; "NEPAD Schools"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'NEPAD Schools';
        }
        field(85; "Laptops Project cf digital literacy programme"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Laptops Project cf digital literacy programme';
        }
        field(86; "Kenya Future Leaders"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Kenya Future Leaders';
        }
        field(87; "Evaluation & Validation of Curriculum-Basic"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Evaluation & Validation of Curriculum-Basic';
        }
        field(88; "Evaluation & Validation of Curriculum-TVET"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Evaluation & Validation of Curriculum-TVET';
        }
        field(89; "Evaluation & Validation of Curriculum-SP"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Evaluation & Validation of Curriculum-SP';
        }
        field(90; "Evaluation & Validation of Curriculum-Research"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Evaluation & Validation of Curriculum-Research';
        }
        field(91; "Evaluation & Validation of Curriculum-MES"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Evaluation & Validation of Curriculum-MES';
        }
        field(92; "Curriculum Reforms"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Curriculum Reforms';
        }
        field(93; "Curriculum Reforms Pathways"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Curriculum Reforms Pathways';
        }
        field(94; "Consultancy Services-basic"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Consultancy Services-basic';
        }
        field(95; "Stakeholder Reports and publications"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Stakeholder Reports and publications';
        }
        field(96; "Academic Board-Agenda & Minutes"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Academic Board-Agenda & Minutes';
        }
        field(97; "Correspondence on Education Systems-not opened"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Correspondence on Education Systems-not opened';
        }
        field(98; "Translations"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Translations';
        }
        field(99; "Nacece general correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Nacece general correspondence';
        }

        //Audit
        field(100; "World forum on early care and education"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'World forum on early care and education';
        }
        field(101; "Training programmes"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Training programmes';
        }
        field(102; "ECD activity areas"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'ECD activity areas';
        }
        field(103; "Pre School education course correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Pre School education course correspondence';
        }
        field(104; "Pre School curriculum"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Pre School curriculum';
        }
        field(105; "Early Childhood Development-Diploma"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Early Childhood Development-Diploma';
        }
        field(106; "Islamic Intergrated Education Programmes"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Islamic Intergrated Education Programmes';
        }
        //Primary
        field(107; "MATTER 1"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'MATTER 1';
        }
        field(108; "Primary english panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary english panel correspondence';
        }
        field(109; "Primary kiswahili panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary kiswahili panel correspondence';
        }
        field(110; "Primary mathematics panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary mathematics panel correspondence';
        }
        field(111; "Primary science panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary science panel correspondence';
        }
        field(112; "Primary CRE panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary CRE panel correspondence';
        }
        field(113; "Primary Hindu R E panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary Hindu R E panel correspondence';
        }
        field(114; "Primary social studies panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary social studies panel correspondence';
        }
        field(115; "Primary Islamic R E panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary Islamic R E panel correspondence';
        }
        field(116; "Primary creative Arts panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary creative Arts panel correspondence';
        }
        field(117; "Primary Mothertongue panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary Mothertongue panel correspondence';
        }

        field(118; "Primary P.E panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Primary P.E panel correspondence';
        }

        //Secondary

        field(119; "Secondary education course panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary education course panel';
        }
        field(120; "Secondary Alternative curriculum"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Alternative curriculum';
        }
        field(121; "Secondary english panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary english panel correspondence';
        }
        field(122; "Secondary kiswahili panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary kiswahili panel correspondence';
        }
        field(123; "Secondary german panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary german panel correspondence';
        }
        field(124; "Secondary french panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary french panel correspondence';
        }
        field(125; "Secondary Arabic panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Arabic panel correspondence';
        }
        field(126; "Secondary Chinese panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Chinese panel correspondence';
        }
        field(127; "Secondary mathematics panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary mathematics panel correspondence';
        }
        field(128; "Secondary physics panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary physics panel correspondence';
        }
        field(129; "Secondary biology panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary biology panel correspondence';
        }
        field(130; "Secondary agriculture panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary agriculture panel correspondence';
        }
        field(131; "Secondary homescience panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary homescience panel correspondence';
        }
        field(132; "Secondary computer studies panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary computer studies panel';
        }
        field(133; "Secondary music panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary music panel correspondence';
        }
        field(134; "Secondary art and design panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary art and design panel correspondence';
        }
        field(135; "Secondary business studies panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary business studies panel';
        }
        field(136; "Secondary geography panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary geography panel correspondence';
        }
        field(137; "Secondary history panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary history panel correspondence';
        }
        field(138; "Secondary CRE panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary CRE panel correspondence';
        }
        field(139; "Secondary IRE panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(140; "Secondary HRE panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary HRE panel correspondence';
        }
        field(141; "Secondary physical sciences panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary physical sciences panel';
        }
        field(142; "Secondary Chemistry Panel Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Chemistry Panel Correspondence';
        }
        field(143; "Secondary PE Panel Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary PE Panel Correspondence';
        }
        field(144; "Secondary Woodwork Panel Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Woodwork Panel Correspondence';
        }
        field(145; "Secondary Metalwork Panel Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Metalwork Panel Correspondence';
        }
        field(146; "Secondary Building and Construction Panel "; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Building and Construction Panel';
        }
        field(147; "Secondary Aviation Panel Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Aviation Panel Correspondence';
        }
        field(148; "Secondary Power Mechanics Panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Power Mechanics Panel';
        }
        field(149; "Secondary Electricity Panel Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Electricity Panel Correspondence';
        }
        field(150; "Secondary Drawing and Design Panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary Drawing and Design Panel';
        }
        field(151; "Secondary General Science Panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Secondary General Science Panel';
        }

        //TEACHER EDUCATION

        field(152; "PTE general correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'PTE general correspondence';
        }
        field(153; "DTE general corespondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE general corespondence';
        }
        field(154; "Diploma in primary teacher education review"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Diploma in primary teacher education review';
        }
        field(155; "PTE Languages panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'PTE Languages panel correspondence';
        }
        field(156; "PTE Sciences & mathematics panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'PTE Sciences & mathematics panel correspondence';
        }
        field(157; "PTE Humanities panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'PTE Humanities panel correspondence';
        }
        field(158; "PTE Creative arts panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'PTE Creative arts panel correspondence';
        }
        field(159; "PTE Professional subjects"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'PTE Professional subjects';
        }
        field(160; "DTE languages panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE languages panel correspondence';
        }
        field(161; "DTE Sciences and mathematics panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE Sciences and mathematics panel';
        }
        field(162; "DTE Humanities panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE Humanities panel correspondence';
        }
        field(164; "DTE Creative arts panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE Creative arts panel correspondence';
        }
        field(165; "DTE Professional & support subjects panel "; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE Professional & support subjects panel';
        }
        field(166; "DTE Technical subjects panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'DTE Technical subjects panel correspondence';
        }
        //NON FORMAL EDUCATION
        field(167; "NFE Project general correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'NFE Project general correspondence';
        }
        field(168; "Basic NFE languages"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Basic NFE languages';
        }
        field(169; "Basic NFE sciences"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Basic NFE sciences';
        }
        field(170; "NFE technical subjects"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'NFE technical subjects';
        }
        field(171; "Basic NFE humanities"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Basic NFE humanities';
        }

        //ADULT AND CONTINUING EDUCATION

        field(172; "MATTER1"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'MATTER 1';
        }
        field(173; "Literacy panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Literacy panel correspondence';
        }
        field(174; "Adult and continuing education course panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Adult and continuing education course panel';
        }
        field(175; "Social work and community development panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Social work and community development panel';
        }
        field(176; "Adult teacher education correspondence (ATEC)"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Adult teacher education correspondence (ATEC)';
        }

        //SPECIAL NEEDS EDUCATION

        field(177; "Special education course panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education course panel';
        }
        field(178; "Special education general correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education general correspondence';
        }
        field(179; "Sign language"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Sign language';
        }
        field(180; "Disability Mainstreaming"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Disability Mainstreaming';
        }
        field(181; "Special education physically handicapped panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education physically handicapped panel';
        }
        field(182; "Special education mentally handicapped panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education mentally handicapped panel';
        }
        field(183; "Special education visually handicapped panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education visually handicapped panel';
        }
        field(184; "Special education Deaf-Blind panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education Deaf-Blind panel';
        }
        field(185; "Special education gifted and talented panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special education gifted and talented panel';
        }
        field(186; "Autism"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Autism';
        }
        field(187; "Learning disability panel correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Learning disability panel correspondence';
        }
        field(188; "special education hearing impaired panel"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'special education hearing impaired panel';
        }

        //CROSS CUTTING ISSUES

        field(189; "HIV AIDS Committee"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'HIV AIDS Committee';
        }
        field(190; "Voluntary Counselling and Testing (VCT)"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Voluntary Counselling and Testing (VCT)';
        }
        field(191; "Aids Control Unit (ACU)"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Aids Control Unit (ACU)';
        }
        field(192; "Disaster Risk Reduction"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Disaster Risk Reduction';
        }
        field(193; "Emerging issues general correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Emerging issues general correspondence';
        }
        field(194; "Guidance on sexuality matters"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Guidance on sexuality matters';
        }
        field(195; "Gender mainstreaming education and training"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Gender mainstreaming education and training';
        }
        field(196; "Civic Education General correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Civic Education General correspondence';
        }
        field(197; "Peace Education"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Peace Education';
        }

        field(198; "Guidance and Counselling"; code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Guidance and Counselling';
        }
        field(199; "Life Skills"; code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Life Skills';
        }

        // SPECIAL PROGRAMMES

        field(200; "Dvisional Reports"; code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Dvisional Reports';
        }
        field(201; "ADAK Status Reports - ADM46 Url"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'ADAK Status Reports - ADM46 URL';
        }
        field(202; "Special Programmes General Correspondence"; Code[50])
        {
            TableRelation = "No. Series";
            Caption = 'Special Programmes General Correspondence';
        }

        //RESEARCH

        field(203; "Research and Evaluation"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(204; "Request to Conduct Research"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(205; "Research Journal"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(206; "KIE Education Symposium"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(207; "Collaborations with Research Institutions"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(208; "Research Panel Correspondence"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(209; "Basic Research"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(210; "Applied Research"; code[50])
        {
            TableRelation = "No. Series";
        }

        //COFS

        field(211; "COFS -General correspondence"; code[50])
        {

            TableRelation = "No. Series";
            ;
        }
        field(212; "COFS -Orientation report"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(213; "COFS -Gender"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(214; "COFS -Lifeskills"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(215; "COFS -Research and evaluation"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(216; "COFS-ECD"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(217; "COFS -Primary"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(218; "COFS-Secondary"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(219; "COFS-NFE"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(220; "COFS-ACE"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(221; "COFS-TIVET"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(222; "COFS -Electronics and emerging media"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(223; "COFS -Symposium"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(224; "COFS -Radio programmes"; code[50])
        {

            TableRelation = "No. Series";
        }

        //TIVET

        field(225; "Tivet Course Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(226; "Tourism Management Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(227; "Insurance Courses Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(228; "Business And Hospitality Management Panel"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(229; "Disaster And Risk Management"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(230; "Secretarial National Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(231; "Co-Operative Education"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(232; "Entrepreneurship Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(233; "Transport Panel General Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(234; "Building And Civil Engineering Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(235; "Domestic/Home Management Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(236; "Front Office Management Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(237; "Catering And Accommodation Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(238; "Water Engineering Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(239; "Computer Studies"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(240; "Mechanical Automobile Agricultural And Prime Mover"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(241; "Leather Technology Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(242; "Fisheries Technology Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(243; "Medical Engineering Panel Orrespondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(244; "Texile And Garment Management Panel"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(245; "Electrical Electronics And TelecommunicationEngineering"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(246; "Information Studies"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(247; "Food Processing Technology"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(248; "Agriculture Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(249; "Applied Sciences Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(250; "Nutrition And Dietetics"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(251; "Supply Chain Management Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(252; "Medical Laboratory Technology"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(253; "Analytical Chemistry"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(254; "Community Health And Nutrition"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(255; "Sustainable Agriculture"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(256; "Food and Beverages"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(257; "Human Resource Management panel"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(258; "Science Laboratory Tecnology Panel"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(259; "Social Work & Community Development Panel"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(260; "Accounting Panel Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }

        //CONSULTANCY SERVICES

        field(261; "Consultancy services"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(262; "Kenya ports authority bandari college"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(263; "Kenya Institute of bankers"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(264; "Public procurenet oversight authority"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(265; "Kenya wildlife services"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(266; "Computer for Schools"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(267; "Kenya Prisons"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(268; "Kenya Police Service"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(269; "Youth Polytechnic Programmes"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(270; "Directorate of Occupational Safety and HealthServices.(DOSH)"; code[50])
        {

            TableRelation = "No. Series";
        }

        //TEXT BOOK ADMINISTRATION

        field(271; "Textbook submission and review"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(272; "Book Review"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(273; "Ministerial Textbook Vetting Committee"; code[50])
        {

            TableRelation = "No. Series";
        }

        //MEDIA AND TECHNICAL SERVICES
        //RADIO
        field(274; "School Broadcast Timetable"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(275; "Radio General Correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(276; "Interactive Radio Instruction"; code[50])
        {

            TableRelation = "No. Series";
        }

        //PRIMARY RADIO
        field(277; "Post box"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(278; "Primary IRE radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(3; "Primary science radio"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(279; "Primary english radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(280; "Primary kiswahili production radio"; code[50])
        {

            TableRelation = "No. Series";
        }

        field(281; "Primary CRE radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(282; "Primary mathematics radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(283; "Primary social studies radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(684; "Primary physical education radio"; code[50])
        {

            TableRelation = "No. Series";
        }

        //SECONDARY RADIO

        field(284; "Secondary mathematics radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(285; "Secondary music radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(286; "Secondary biology radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(287; "Secondary french radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(288; "Secondary CRE radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(289; "Secondary business studies radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(290; "Secondary computer studies radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(291; "Proposal for secondary kiswahili production radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(292; "Secondary chemistry radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(293; "Secondary physics radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(294; "Secondary geography radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(295; "History and goverment radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(296; "Secondary english radio"; code[50])
        {

            TableRelation = "No. Series";
        }

        //CROSS CUTTING ISSUES RADIO

        field(297; "Human rights education radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(298; "Guidance and counselling programme radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(299; "HIV and AIDS radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(300; "Lifeskills Radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(301; "SNE Radio"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(302; "Drugs and Substance abuse Radio"; code[50])
        {

            TableRelation = "No. Series";
        }

        // TV & FILM

        field(303; "Film & TV general correspondence"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(304; "Drama perfomance"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(305; "Science Congress"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(306; "Music Festivals"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(307; "setbook analysis and recording-english"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(308; "setbook analysis and recording-kiswahili"; code[50])
        {

            TableRelation = "No. Series";
        }

        //PRIMARY TV & FILM

        field(309; "SUBJECT 1"; code[50])
        {

            TableRelation = "No. Series";
        }

        //SECONDARY TV & FILM

        field(310; "TV languages foreign"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(311; "Media proposals Sciences-TV "; code[50])
        {

            TableRelation = "No. Series";
        }
        field(312; "Media proposals humanities-TV"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(313; "TV languages-english"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(314; "Secondary mathematics-TV"; code[50])
        {

            TableRelation = "No. Series";
        }

        //MATTERS NOT SPECIFIED (RADIO & TV)

        field(315; "Script Writers and artists"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(316; "Other media productions"; code[50])
        {

            TableRelation = "No. Series";
        }

        //GENERALITIES

        field(317; "General TV Production"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(318; "TV Generalities"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(685; "Feature Production"; code[50])
        {

            TableRelation = "No. Series";
        }
        field(319; "Documentaries"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(320; "Outreach Programmes"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(321; "Collaborations and Partnerships - MES"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(322; "Talents"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(323; "Innovations for Poverty Action (IPA)"; code[50])
        {
            TableRelation = "No. Series";
        }
        // EDUCATIONAL RESOURCES
        field(324; "POLICY H/1/P"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(325; "EDUCATIONAL RESOURCES MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(326; "Library Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(327; "Kenya Gazette"; code[50])
        {
            TableRelation = "No. Series";
        }
        //BOOKSHOP
        field(328; "BOOKSHOP POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(329; "BOOKSHOP MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(330; "Bookshop Reports"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(331; "Request for Syllabi"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(332; "Request for Books"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(333; "Bookshop Sales"; code[50])
        {
            TableRelation = "No. Series";
        }
        //RESOURCE MATERIALS

        field(334; "RESOURCE MATERIALS POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(335; "Educational Resources General Correspondence"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(336; "Dissemination and Utilization of Curriculum Support Materials"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(337; "E R Materials Development & Production"; code[50])
        {
            TableRelation = "No. Series";
        }
        //PRINT & PUBLICATION

        field(338; "PRINT & PUBLICATION POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(339; "PRINT & PUBLICATION MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(340; "Print and Publications"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(341; "International Standard Book Number (ISBN)"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(342; "Printing Machines"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(343; "Request for Printing Services - External Clients"; code[50])
        {
            TableRelation = "No. Series";
        }
        //Request for Printing Services-Internal
        field(344; "Request for Printing Services - Basic"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(345; "Request for Printing Services - TIVET"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(346; "Request for Printing Services-RM&E"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(347; "Request for Printing Services-ER"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(348; "Request for Printing Services-CS"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(349; "Request for Printing Services-SP"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(350; "Request for Printing Services-EEM"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(351; "Repair and Maintenance of Printing Equipment"; code[50])
        {
            TableRelation = "No. Series";
        }
        // TECHNICAL SERVICES


        field(352; "TECHNICAL SERVICES POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(353; "TECHNICAL SERVICES MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(354; "Hire of OB Van"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(355; "Installation of equipments"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(356; "Hire of EMS Technical Equipment"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(357; "Repair and Maintenance of Electronic Equipment"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(358; "Request for Use of EMS Facilities"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(359; "Requisitions for EMS Technical Equipment"; code[50])
        {
            TableRelation = "No. Series";
        }
        //ELECTRONIC LEARNING
        field(360; "ELECTRONIC LEARNING POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(361; "E-Learning Consultancy Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(362; "Elimika"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(363; "E-Learning"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(364; "Digital Content Development"; code[50])
        {
            TableRelation = "No. Series";
        }
        //PROGRAMMING
        field(365; "PROGRAMMING POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(366; "PROGRAMMING MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(367; "Digital Broadcast Channel"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(368; "Edu-Channel Generalities"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(369; "Edu-Channel Programming"; code[50])
        {
            TableRelation = "No. Series";
        }
        //ICT
        field(370; "ICT POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(371; "Curriculum Innovation Centre"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(372; "Project 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(373; "Requisitions for ICT Hardware/Infrastructure"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(374; "Repair and Maintenance of ICT Hardware/Infrastructure"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(375; "Management Information Systems"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(376; "KIE Website"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(377; "Software Licences"; code[50])
        {
            TableRelation = "No. Series";
        }
        //GENERAL ADMINISTRATIVE AND SUPPORT SERVICES
        //HUMAN RESOURCES
        field(378; "Human Resources POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(379; "HRM POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(380; "Circulars On HRMD"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(381; "Disciplinary Committee"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(382; "Board of Trustees-Agenda and Minutes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(383; "Safaricom Laptop Project"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(384; "Employment Applications"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(385; "KICD Interviews"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(386; "Offer of Voluntary Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(387; "Attachment /Attachment Committee Minutes-Confidential"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(388; "Internship"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(389; "Schemes of Service"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(390; "Performance Appraisal"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(391; "Wealth Declaration"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(392; "Staff Pension"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(393; "Staff Salaries"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(394; "KIE Job Advertisements"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(395; "Group Personal Accidents"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(396; "Medical Insurance-Inpatient"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(397; "Medical Insurance-Outpatient"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(398; "Staff Hospital Statements"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(399; "Leave Roster"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(400; "Staff Deployments"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(401; "Overtime"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(402; "Personnel Matters"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(403; "National Industrial Training Authority"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(404; "Offer of Contract Terms"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(405; "KIE Establishment and Staffing"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(406; "National Hospital Insurance Fund"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(407; "National Social Security Fund"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(408; "Other Allowances"; code[50])
        {
            TableRelation = "No. Series";
        }
        //STAFF WELFARE
        field(409; "Staff Welfare Fund"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(410; "Taasisi Sacco"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(411; "Taasisi Housing"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(412; "Ardhi Sacco"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(413; "Mwalimu Sacco"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(414; "U K C S"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(415; "HRMD Minute"; code[50])
        {
            TableRelation = "No. Series";
        }
        //REQUEST FOR SERVICES/RELEASE OF KIE STAFF
        field(416; "Request for Services of KIE Staff-General"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(417; "KIE MOE"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(418; "KNEC-Basic"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(419; "KNEC-Tivet"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(420; "KNEC-COFS"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(421; "KNEC-Research"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(422; "KNEC-Media"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(423; "Offer of Products and Marketing to KIE Staff"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(424; "KIE Code of Conduct and Ethics - Transfer"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(425; "Confirmation in Appointment"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(426; "Exit Interviews"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(427; "Casual Employment"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(428; "Casual Employment-MES"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(429; "Appointments and Promotions"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(430; "Medical Insurance General Correspondence"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(431; "Perfomance Contracts"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(432; "Handing and Taking Over"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(433; "Selection of Temporary Staff-Agenda & Minutes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(434; "Recruitment of KICD Director/CEO"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(435; "Time and Attendance of Staff"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(436; "Staff Identification"; code[50])
        {
            TableRelation = "No. Series";
        }
        //TRAINING
        field(437; "Training POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(438; "Training General (Committee)"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(439; "Training Bonding"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(440; "Training Committee - Corporate Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(441; "Training Committee - Agenda and Minutes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(442; "Seminars and Workshops"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(443; "Conferences and Conventions"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(444; "Inhouse Training Programmes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(445; "External Training Programmes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(446; "ISO Training"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(447; "Training Reports"; code[50])
        {
            TableRelation = "No. Series";
        }
        //TRANSPORT

        field(448; "B/P POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(449; "KAN 896U Peugeot 504"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(450; "KAN 897U Peugeot 504 Saloon"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(451; "KAN 898U Peugeot 504"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(452; "KAN 899U Peugeot 406"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(453; "KAN 945U Peugeot 406"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(454; "KAL 215 U Peugeot"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(455; "KAW 582Z Land Rover (Gk A 539H)"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(456; "KAT 730X Toyota Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(457; "KAT 731X Mitsubishi Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(458; "KAT 732X Mitsubishi Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(459; "KAT 733X Mitsubishi Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(460; "KAV O71E Isuzu Minibus"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(461; "KAB 582F Nissan B12"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(462; "KAA 704 Land Rover"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(463; "KAC 819G Isuzu Trooper"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(464; "KBB 268S Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(465; "KBB 269S Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(466; "KBB 270S Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(467; "KBB 272S Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(468; "KBB 271S Pajero"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(469; "KBB 466S Toyota"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(470; "KIE Transport Policy"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(471; "Transport Services - Standing Imprest"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(472; "Transport Staff Meeting"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(473; "KBL 337G Volkswagen Passat 1.8"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(474; "KBL 854G Nissan X-Trail"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(475; "Transport Schedules"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(476; "KBU 181T Toyota Hilux"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(477; "KBU 167T Ford Ranger"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(478; "KCD 352G Ford Ranger"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(479; "KCD 351G Ford Ranger"; code[50])
        {
            TableRelation = "No. Series";
        }
        //TRANSPORT MATTERS
        field(480; "Motor Vehicle - General"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(481; "Transport Matters"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(482; "AUTHORITY TO USE MOTOR VEHICLE"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(483; "Request for Transport Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(484; "Transport Services Standing Imprest"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(485; "TTransport Schedules"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(486; "Fuel Consumption"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(487; "Motor Vehicle Insurances"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(488; "Transport Meetings and Minutes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(489; "Fuel Cards"; code[50])
        {
            TableRelation = "No. Series";
        }
        //FINANCE
        field(490; "B/3/1 MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(491; "FINANCE POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(492; "Cash Survey Board Committee - Transfer"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(493; "Investments"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(494; "Estimates"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(495; "Returned Cheques"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(496; "Invoices and Statements"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(497; "Pay As You Earn"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(498; "Applications for Imprest"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(499; "KRA - VAT"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(500; "M-Pesa"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(501; "Government Grants"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(502; "Data Returns"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(503; "KIE Finances"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(504; "Equity Bank Agency - Transfer"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(505; "Remittances"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(506; "Institutes Debtors"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(507; "Kenya Commercial Bank"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(508; "Standard Chartered Bank"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(509; "Co-operative Bank"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(510; "Request for Temporary Imprest - Non KICD Staff"; code[50])
        {
            TableRelation = "No. Series";
        }
        //PROCUREMENT AND STORESS
        field(511; "PROCUREMENT AND STORES POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }
        field(512; "Tender Committee"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(513; "Procurement Committee"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(514; "Inspection and Acceptance Committee"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(515; "Tender Evaluation Committee"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(516; "Tender & Quotations Comm. Appointments"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(517; "Letters of Introduction - Suppliers/Service Providers"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(518; "External Advertisements"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(519; "Disposal of Assets"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(520; "Stores Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(521; "Purchase of Stores"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(522; "Tender Evaluation Recommendations"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(523; "Insurance Policies"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(524; "PPOA Correspondences"; code[50])
        {
            TableRelation = "No. Series";
        }
        //AUDIT

        field(525; "Audit Policy"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(526; "KENAO"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(527; "ISO Surveilance Audits"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(528; "Internal Audits"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(529; "Audit Committee - Agenda & Minutes"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(530; "Investigations (D & SDDCS Only)"; code[50])
        {
            TableRelation = "No. Series";
        }
        //NACECE RESOURCE CENTRE
        field(531; "NRC POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(532; "NRC Committee - Agenda & Minutes"; code[50])
        {
            TableRelation = "No. Series";
        }
        //NRC EQUIPMENT
        field(533; "NRC LIFTS"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(534; "NRC Equipment/Machines"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(535; "Hotel Bookings"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(536; "Bookings for NRC"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(537; "NRC Staffing"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(538; "NRC Medical Examination"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(539; "Wages for NRC Daily Hirees"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(540; "House keeping Services"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(541; "Requisition of Office Beverages"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(542; "Kitchen Supplies"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(543; "NRC Marketing"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(544; "Commissions for NRC Business"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(545; "Nacece Resource Center"; code[50])
        {
            TableRelation = "No. Series";
        }
        //PLANNING
        field(546; "PLANNING POLICY"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(547; "PLANNING MATTER 1"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(548; "Vision 2030"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(549; "Customer Satisfaction Surveys"; code[50])
        {
            TableRelation = "No. Series";
        }

        field(550; "Strategic Plan"; code[50])
        {
            TableRelation = "No. Series";
        }
      
        field(694;"Employee Open";Code[50])
        {
            TableRelation = "No. Series";
        }
        field(695;"Employee Confidential"; Code[50])
        {
            TableRelation= "No. Series";
        }
        

        
   
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}