table 50112 "Memo Nos Setup Url"
{
    Caption = 'Memo Nos Setup Url';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        // field(2; "General Correspondences Nos"; Code[250])
        // {
        //     TableRelation = "No. Series";
        // }
        // field(5; "Incoming Correspondence Nos"; Code[250])
        // {
        //     TableRelation = "No. Series";
        // }
        // field(6; "Correspondence Contact Nos"; Code[250])
        // {
        //     TableRelation = "No. Series";
        // }
        field(15; "Project Files Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Finance & Accounts Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Human Capital Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "ICT Memos Url"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Administration Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Legal Services Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Standards and Compliance Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Supply Chain Management Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Transport Memos Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "EAP Memo Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Education and Research Memo Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Corporate Communication Memo Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Audit Memo Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Staff Personnel Files Url"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }

        //Administration
        // field(41; "Absence from Duty - ADM7 Vol.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Absence from Duty - ADM7 Vol.1';
        // }
        // field(42; "ADAK Acts, Rules and Policies - ADM23"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ADAK Acts, Rules and Policies - ADM23';
        // }
        // field(43; "ADAK Board Members General Correspondence - ADM45"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ADAK Board Members General Correspondence - ADM45';
        // }
        // field(44; "ADAK Status Reports - ADM46"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ADAK Status Reports - ADM46';
        // }
        // field(45; "Alcohol Drug Abuse - ADM51"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Alcohol Drug Abuse - ADM51';
        // }
        // field(46; "Appointments to the Board and Board Committees - ADM25"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Appointments to the Board and Board Committees - ADM25';
        // }
        // field(47; "Appreciations and Acknowledgments - ADM10"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Appreciations and Acknowledments - ADM10';
        // }
        // field(48; "ASK- ADM 66 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ASK- ADM 66 VOL.1';
        // }
        // field(49; "AU - ADM 64 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'AU - ADM 64 VOL.1';
        // }
        // field(50; "Cabinet Secretary Directives and Circulars - ADM55"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Cabinet Secretary Directives and Circulars - ADM55';
        // }
        // field(51; "Circulars and Directives from the Presidency - ADM42"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Circulars and Directives from the Presidency - ADM42';
        // }
        // field(52; "Communication Services - ADM34"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Communication Services - ADM34';
        // }
        // field(53; "Complaints - ADM49"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Complaints - ADM49';
        // }
        // field(54; "Corporate Social Responsibility - ADM50"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Corporate Social Responsibility - ADM50';
        // }
        // field(55; "Corruption Prevention Committee - ADM53"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Corruption Prevention Committee - ADM53';
        // }
        // field(56; "Customer Satisfaction - ADM58"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Customer Satisfaction - ADM58';
        // }
        // field(57; "Data Protection and Privacy- ADM 69 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Data Protection and Privacy- ADM 69 VOL.1';
        // }
        // field(58; "Disability Mainstreaming - ADM48"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Disability Mainstreaming - ADM48';
        // }
        // field(59; "Establishment of ADAK - ADM2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Establishment of ADAK - ADM2';
        // }
        // field(60; "Ethics and Integrity - ADM20"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ethics and Integrity - ADM20';
        // }
        // field(61; "Full Board Notices and Agendas - ADM27"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Full Board Notices and Agendas - ADM27';
        // }
        // field(62; "Gender and Development Committee - ADM43"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Gender and Development Committee - ADM43';
        // }
        // field(63; "General Administration - ADM1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'General Administration - ADM1';
        // }
        // field(64; "General Circulars - ADM26"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'General Circulars - ADM26';
        // }
        // field(65; "General Staff Meeting - ADM3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'General Staff Meeting - ADM3';
        // }
        // field(66; "Handing and Taking Over - ADM8"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Handing and Taking Over - ADM8';
        // }
        // field(67; "HIV and AIDS Committee - ADM41"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'HIV and AIDS Committee - ADM41';
        // }
        // field(68; "HOD Meeting - ADM5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'HOD Meeting - ADM5';
        // }
        // field(69; "Integrity Assurance Committee - ADM56"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Integrity Assurance Committee - ADM56';
        // }
        // field(70; "Invitations and Appointments - ADM9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Invitations and Appointments - ADM9';
        // }
        // field(71; "ISO 9001 - ADM39"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ISO 9001 - ADM39';
        // }
        // field(72; "Kenya Gazette Notices - ADM21"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Gazette Notices - ADM21';
        // }
        // field(73; "Ministerial Meetings - ADM6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ministerial Meetings - ADM6';
        // }
        // field(74; "National Cohesion - ADM54"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'National Cohesion - ADM54';
        // }
        // field(75; "NOCK - ADM 68 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'NOCK - ADM 68 VOL.1';
        // }
        // field(76; "Occupational Safety and Health Committee - ADM40"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Occupational Safety and Health Committee - ADM40';
        // }
        // field(77; "Office Accomodations - ADM16"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Office Accomodations - ADM16';
        // }
        // field(78; "Office Maintenance - ADM17"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Office Maintenance - ADM17';
        // }
        // field(79; "Office Security - ADM18"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Office Security - ADM18';
        // }
        // field(80; "Parliamentary Business - ADM22"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Parliamentary Business - ADM22';
        // }
        // field(81; "Partnerships - ADM33"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Partnerships - ADM33';
        // }
        // field(82; "Partnerships and Collaborations with iNADOs-ADM 65 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Partnerships and Collaborations with iNADOs-ADM 65 VOL.1';
        // }
        // field(83; "Performance Contracts and Reports - ADM15"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Performance Contracts and Reports - ADM15';
        // }
        // field(84; "PSC Circulars and Directives - ADM57"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'PSC Circulars and Directives - ADM57';
        // }
        // field(85; "RADO- ADM 62 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'RADO- ADM 62 VOL.1';
        // }
        // field(86; "Records Management - ADM47"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Records Management - ADM47';
        // }
        // field(87; "Road Safety Mainstreaming - ADM59"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Road Safety Mainstreaming - ADM59';
        // }
        // field(88; "Seminars, Workshops and Conferences - ADM24"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Seminars, Workshops and Conferences - ADM24';
        // }
        // field(89; "Sporting Events and Calendars - ADM 67 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Sporting Events and Calendars - ADM 67 VOL.1';
        // }
        // field(90; "Sports Organization Federation - ADM60"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Sports Organization Fedaration - ADM60';
        // }
        // field(91; "Staff Welfare - ADM13"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Staff Welfare - ADM13';
        // }
        // field(92; "Strategic Plans - ADM11"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Strategic Plans - ADM11';
        // }
        // field(93; "Strategy Planning and Corporate Governance - ADM35"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Strategy Planning and Corporate Governance - ADM35';
        // }
        // field(94; "Travel Clearance - ADM12"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Travel Clearance - ADM12';
        // }
        // field(95; "UNESCO - ADM 63 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'UNESCO - ADM 63 VOL.1';
        // }
        // field(96; "Values and Principles of Governance - ADM19"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Values and Principles of Governance - ADM19';
        // }
        // field(97; "Vision 2030 - ADM52"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Vision 2030 - ADM52';
        // }
        // field(98; "WADA-ADM 61 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'WADA-ADM 61 VOL.1';
        // }
        // field(99; "Workplans - ADM14"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Workplans - ADM14';
        // }

        // //Audit
        // field(100; "Audit and Risk Management Committee(notices)-ADAK AUD 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Audit and Risk Management Committee(notices)-ADAK AUD 1';
        // }
        // field(101; "Audit General- ADAK AUD 9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Audit General- ADAK AUD 9';
        // }
        // field(102; "Internal Audit Education and Research reports-ADAK AUD 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internal Audit Education and Research reports-ADAK AUD 3';
        // }
        // field(103; "Internal Audit Finance and Accounts reports-ADAK AUD 8"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internal Audit Finance and Accounts reports-ADAK AUD 8';
        // }
        // field(104; "Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3';
        // }
        // field(105; "Internal Audit Legal Services reports-ADAK AUD 6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internal Audit Legal Services reports-ADAK AUD 6';
        // }
        // field(106; "Internal Audit Standards and Compliance reports-ADAK AUD 4"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internal Audit Standards and Compliance reports-ADAK AUD 4';
        // }
        // field(107; "Internal Audit Supply Chain reports-ADAK AUD 7"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internal Audit Supply Chain reports-ADAK AUD 7';
        // }
        // //Corporate Comms
        // field(108; "Advertising and Publicity-ADAK COM 4"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Advertising and Publicity-ADAK COM 4';
        // }
        // field(109; "Branding- ADAK COM 7"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Branding- ADAK COM 7';
        // }
        // field(110; "CSR-ADAK COM 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'CSR-ADAK COM 3';
        // }
        // field(111; "Customer Feedback Reports- ADAK COM 5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Customer Feedback Reports- ADAK COM 5';
        // }
        // field(112; "General Communication- ADAK COM 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'General Communication- ADAK COM 1';
        // }
        // field(113; "Newsletters and Publications-ADAK COM 8"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Newsletters and Publications-ADAK COM 8';
        // }
        // field(114; "Press Cutting-ADAK COM 10"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Press Cutting-ADAK COM 10';
        // }
        // field(115; "Press Releases-ADAK COM 9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Press Releases- ADAK COM 9';
        // }
        // field(116; "Shows and Exhibitions- ADAK COM 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Shows and Exhibitions- ADAK COM 2';
        // }
        // field(117; "Speeches - ADAK COM 6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Speeches - ADAK COM 6';
        // }

        // //Education and Research
        // field(118; "Anti-Doping Educators- ADAK E&R 9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Anti-Doping Educators- ADAK E&R 9';
        // }
        // field(119; "Anti-Doping Research Proposals & Reports- ADAK E&R 10"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Anti-Doping Research Proposals & Reports- ADAK E&R 10';
        // }
        // field(120; "Anti-Doping Value Based Education- ADAK E&R 5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Anti-Doping Value Based Education- ADAK E&R 5';
        // }
        // field(121; "Anti-Doping workshop programmes- ADAK E&R 1 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Anti-Doping workshop programmes- ADAK E&R 1 VOL.1';
        // }
        // field(122; "Research and Development- ADAK E&R 7"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Research and Development- ADAK E&R 7';
        // }

        // //Finance and Accounts
        // field(123; "Audited Financial Statements and Reports - FIN14"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Audited Financial Statements and Reports  - FIN14';
        // }
        // field(124; "Bad Debts and Write-offs - FIN20"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Bad Debts and Write-offs - FIN20';
        // }
        // field(125; "Board Expenditure - FIN10"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Board Expenditure - FIN10';
        // }
        // field(126; "Board of Survey Finance - FIN15"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Board of Survey Finance - FIN15';
        // }
        // field(127; "Budgets and Estimates - FIN 7"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Budgets and Estimates - FIN 7';
        // }
        // field(128; "Expenditure Control - FIN8"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Expenditure Control - FIN8';
        // }
        // field(129; "Finance and General Purpose Committee Notices - FIN17"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Finance and General Purpose Committee Notices - FIN17';
        // }
        // field(130; "Finance General - FIN 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Finance General- FIN 1';
        // }
        // field(131; "Finance Statements and Reports - FIN13"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Finance Statements and Reports - FIN13';
        // }
        // field(132; "Government Grants - FIN 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Government Grants - FIN 2';
        // }
        // field(133; "Imprest and Advances - FIN9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Imprest and Advances - FIN9';
        // }
        // field(134; "MTEF - FIN 6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'MTEF - FIN 6';
        // }
        // field(135; "National Treasury Circulars - FIN19"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'National Treasury Circulars - FIN19';
        // }
        // field(136; "Other Grants - FIN 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Other Grants - FIN 3';
        // }
        // field(137; "Pending Bills - FIN11"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Pending Bills - FIN11';
        // }
        // field(138; "Statutory Obligation Reports - FIN12"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Statutory Obligation Reports - FIN12';
        // }
        // field(139; "Tax Matters - FIN21"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Tax Matters - FIN21';
        // }
        // //Human Capital
        // field(140; "Casual engagements- HCM 5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Casual engagements- HCM 5';
        // }
        // field(141; "Cleaning Services-HCM 21"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Cleaning Services-HCM 21';
        // }
        // field(142; "Deployment and Secondment of staff - HCM 7"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Deployment and Secondment of staff - HCM 7';
        // }
        // field(143; "HCM BOARD Committee (papers)-HCM 22"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'HCM BOARD Committee (papers)-HCM 22';
        // }
        // field(144; "Human Capital Advisory Committee(Notices)- HCM 28"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Human Capital Advisory Committee(Notices)- HCM 28';
        // }
        // field(145; "Human Capital Disciplinary Committee-HCM 34"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Human Capital Disciplinary Committee-HCM 34';
        // }
        // field(146; "Human Capital Management Board Committee(notices) -HCM 22"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Human Capital Management Board Committee(notices) -HCM 22';
        // }
        // field(147; "Human Resource Circulars - HCM 12"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Human Resource Circulars - HCM 12';
        // }
        // field(148; "Human Resource Payroll Information - HCM 14"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Human Resource Payroll Information - HCM 14';
        // }
        // field(149; "Induction-HCM 36"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Induction-HCM 36';
        // }
        // field(150; "Industrial Attachments - HCM 17"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Industrial Attachments - HCM 17';
        // }
        // field(151; "Insurance Matters- HCM 35"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Insurance Matters- HCM 35';
        // }
        // field(152; "Internships - HCM 18"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Internships - HCM 18';
        // }
        // field(153; "Pensions and Gratuity - HCM 15"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Pensions and Gratuity - HCM 15';
        // }
        // field(154; "Performance Evaluation and Appraisal -HCM 9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Performance Evaluation and Appraisal -HCM 9';
        // }
        // field(155; "Professional Associations - HCM 20"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Professional Associations - HCM 20';
        // }
        // field(156; "Recruitment and Appointments - HCM 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Recruitment and Appointments - HCM 3';
        // }
        // field(157; "Salary and Remuneration(SRC)-HCM 8"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Salary and Remuneration(SRC)-HCM 8';
        // }
        // field(158; "Staff Leave - HCM 11"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Staff Leave - HCM 11';
        // }
        // field(159; "Staff Matters - HCM 1 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Staff Matters - HCM 1 VOL.1';
        // }
        // field(160; "Staff Training - HCM 16"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Staff Training - HCM 16';
        // }
        // field(161; "State Corporation Advisory Committee(SCAC)-HCM 19"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'State Corporation Advisory Committee(SCAC)-HCM 19';
        // }
        // field(162; "Statutory Deductions - HCM 13"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Statutory Deductions - HCM 13';
        // }

        // //Legal
        // field(164; "Attorney General Matters-ADAK LEG 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Attorney General Matters-ADAK LEG 2';
        // }
        // field(165; "Legal Matters Correspondences-ADAK LEG 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Legal Matters Correspondences-ADAK LEG 1';
        // }
        // field(166; "Legal Opinions and Advisories(internal)-ADAK LEG 9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Legal Opinions and Advisories(internal)-ADAK LEG 9';
        // }
        // //Standards and Compliance
        // field(167; "RTP-ADAK S&C 9 (VOL III)"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'RTP-ADAK S&C 9';
        // }
        // field(168; "S&C Departmental meetings- ADAK S&C 15"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'S&C Departmental meetings- ADAK S&C 15';
        // }
        // field(169; "Sample Collection Personnel Training-ADAK S&C 6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Sample Collection Personnel Training-ADAK S&C 6';
        // }
        // field(170; "Sample Collection Personnel-ADAK S&C 5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Sample Collection Personnel-ADAK S&C 5';
        // }
        // field(171; "Sports Federations Compliance Audit-ADAK S&C 10"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Sports Federations Compliance Audit-ADAK S&C 10';
        // }
        // field(172; "Standards & Compliance General-ADAK S&C 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Standards & Compliance General-ADAK S&C 1';
        // }
        // field(173; "TUE- ADAK S&C 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TUE- ADAK S&C 2';
        // }

        // //SCM
        // field(174; "Appointment to ADHOC Procurement Committee- ADAK SCM 5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Appointment to ADHOC procurement committee- ADAK SCM 5';
        // }
        // field(175; "Assets and Liabilities- ADAK SCM 15"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Assets and Liabilities- ADAK SCM 15';
        // }
        // field(176; "Board of survey- stores- ADAK SCM 10"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Board of survey- stores- ADAK SCM 10';
        // }
        // field(177; "Notification of Tender Awards- ADAK SCM 6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Notification of Tender Awards- ADAK SCM 6';
        // }
        // field(178; "Procurement of Goods-ADAK SCM 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Procurement of Goods-ADAK SCM 1';
        // }
        // field(179; "Procurement of Motor vehicle-ADAK SCM 4"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Procurement of Motor vehicle-ADAK SCM 4';
        // }
        // field(180; "Procurement of services-ADAK SCM 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Procurement of services-ADAK SCM 2';
        // }
        // field(181; "Procurement of works- ADAK SCM 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Procurement of works- ADAK SCM 3';
        // }
        // field(182; "Procurement Plan-ADAK SCM 11"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Procurement Plan-ADAK SCM 11';
        // }
        // field(183; "Procurement Policy and Circulars-ADAK SCM 9"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Procurement Policy and Circulars-ADAK SCM 9';
        // }
        // field(184; "Public Procurement Appeals and Review Board-ADAK SCM 7"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Public Procurement Appeals and Review Board-ADAK SCM 7';
        // }
        // field(185; "Recommendations and Reference letters-ADAK SCM 13"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Recommendations and Reference letters-ADAK SCM 13';
        // }
        // field(186; "Statutory Reports- ADAK SCM 12"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Statutory Reports- ADAK SCM 12';
        // }
        // //Transport
        // field(187; "General Transport Matters - ADAK TRA 1 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'General Transport Matters - ADAK TRA 1 VOL.1';
        // }
        // field(188; "Motor Vehicle Returns- ADAK TRA 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Motor Vehicle Returns- ADAK TRA 2';
        // }
        // field(189; "TOYOTA COROLLA SALON-TRA KCE 880D"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA COROLLA SALON-TRA KCE 880D';
        // }
        // field(190; "TOYOTA FORTUNER- TRA KCD 878G"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA FORTUNER- TRA KCD 878G';
        // }
        // field(191; "TOYOTA HILUX-TRA KCD 877G"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA HILUX-TRA KCD 877G';
        // }
        // field(192; "TOYOTA PRADO - TRA GKB 474M"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA PRADO - TRA GKB 474M';
        // }
        // field(193; "TOYOTA PRADO - TRA GKB 478M"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA PRADO - TRA GKB 478M';
        // }
        // field(194; "TOYOTA PRADO - TRA KCD 891G"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA PRADO - TRA KCD 891G';
        // }
        // field(195; "TOYOTA PRADO - TRA KCE 901D"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA PRADO - TRA KCE 901D';
        // }
        // field(196; "TOYOTA VAN HIACE- TRA KCE 925D"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'TOYOTA VAN HIACE- TRA KCE 925D';
        // }
        // field(197; "Transport Requisitions- ADAK TRA 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Transport Requisitions- ADAK TRA 3';
        // }
        //Personnel Files

        //URLs
        //Administration
        // field(198; "Absence from Duty - ADM7 Vol.1 Url"; Text[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Absence from Duty - ADM7 Vol.1 URL';
        // }
        field(199; "ADAK Acts, Rules and Policies - ADM23 Url"; Text[1000])
        {

            Caption = 'ADAK Acts, Rules and Policies - ADM23 URL';
        }
        field(200; "ADAK Board Members General Correspondence - ADM45 Url"; Text[1000])
        {

            Caption = 'ADAK Board Members General Correspondence - ADM45 URL';
        }
        field(201; "ADAK Status Reports - ADM46 Url"; Text[1000])
        {

            Caption = 'ADAK Status Reports - ADM46 URL';
        }
        field(202; "Alcohol Drug Abuse - ADM51 Url"; Text[1000])
        {

            Caption = 'Alcohol Drug Abuse - ADM51 URL';
        }
        field(203; "Appointments to the Board and Board Committees - ADM25 Url"; Text[1000])
        {

            Caption = 'Appointments to the Board and Board Committees - ADM25 URL';
        }
        field(204; "Appreciations and Acknowledgments - ADM10 Url"; Text[1000])
        {

            Caption = 'Appreciations and Acknowledgments - ADM10 URL';
        }
        field(205; "ASK- ADM 66 VOL.1 Url"; Text[1000])
        {

            Caption = 'ASK- ADM 66 VOL.1 URL';
        }
        field(206; "AU - ADM 64 VOL.1 Url"; Text[1000])
        {

            Caption = 'AU - ADM 64 VOL.1 URL';
        }
        field(207; "Cabinet Secretary Directives and Circulars - ADM55 Url"; Text[1000])
        {

            Caption = 'Cabinet Secretary Directives and Circulars - ADM55 URL';
        }
        field(208; "Circulars and Directives from the Presidency - ADM42 Url"; Text[1000])
        {

            Caption = 'Circulars and Directives from the Presidency - ADM42 URL';
        }
        field(209; "Communication Services - ADM34 Url"; Text[1000])
        {

            Caption = 'Communication Services - ADM34 URL';
        }
        field(210; "Complaints - ADM49 Url"; Text[1000])
        {

            Caption = 'Complaints - ADM49 URL';
        }
        field(211; "Corporate Social Responsibility - ADM50 Url"; Text[1000])
        {

            Caption = 'Corporate Social Responsibility - ADM50 URL';
        }
        field(212; "Corruption Prevention Committee - ADM53 Url"; Text[1000])
        {

            Caption = 'Corruption Prevention Committee - ADM53 URL';
        }
        field(213; "Customer Satisfaction - ADM58 Url"; Text[1000])
        {

            Caption = 'Customer Satisfaction - ADM58 URL';
        }
        field(214; "Data Protection and Privacy- ADM 69 VOL.1 Url"; Text[1000])
        {

            Caption = 'Data Protection and Privacy- ADM 69 VOL.1 URL';
        }
        field(215; "Disability Mainstreaming - ADM48 Url"; Text[1000])
        {

            Caption = 'Disability Mainstreaming - ADM48 URL';
        }
        field(216; "Establishment of ADAK - ADM2 Url"; Text[1000])
        {

            Caption = 'Establishment of ADAK - ADM2 URL';
        }
        field(217; "Ethics and Integrity - ADM20 Url"; Text[1000])
        {

            Caption = 'Ethics and Integrity - ADM20 URL';
        }
        field(218; "Full Board Notices and Agendas - ADM27 Url"; Text[1000])
        {

            Caption = 'Full Board Notices and Agendas - ADM27 URL';
        }
        field(219; "Gender and Development Committee - ADM43 Url"; Text[1000])
        {

            Caption = 'Gender and Development Committee - ADM43 URL';
        }
        field(220; "General Administration - ADM1 Url"; Text[1000])
        {

            Caption = 'General Administration - ADM1 URL';
        }
        field(221; "General Circulars - ADM26 Url"; Text[1000])
        {

            Caption = 'General Circulars - ADM26 URL';
        }
        field(222; "General Staff Meeting - ADM3 Url"; Text[1000])
        {

            Caption = 'General Staff Meeting - ADM3 URL';
        }
        field(223; "Handing and Taking Over - ADM8 Url"; Text[1000])
        {

            Caption = 'Handing and Taking Over - ADM8 URL';
        }
        field(224; "HIV and AIDS Committee - ADM41 Url"; Text[1000])
        {

            Caption = 'HIV and AIDS Committee - ADM41 URL';
        }
        field(225; "HOD Meeting - ADM5 Url"; Text[1000])
        {

            Caption = 'HOD Meeting - ADM5 URL';
        }
        field(226; "Integrity Assurance Committee - ADM56 Url"; Text[1000])
        {

            Caption = 'Integrity Assurance Committee - ADM56 URL';
        }
        field(227; "Invitations and Appointments - ADM9 Url"; Text[1000])
        {

            Caption = 'Invitations and Appointments - ADM9 URL';
        }
        field(228; "ISO 9001 - ADM39 Url"; Text[1000])
        {

            Caption = 'ISO 9001 - ADM39 URL';
        }
        field(229; "Kenya Gazette Notices - ADM21 Url"; Text[1000])
        {

            Caption = 'Kenya Gazette Notices - ADM21 URL';
        }
        field(230; "Ministerial Meetings - ADM6 Url"; Text[1000])
        {

            Caption = 'Ministerial Meetings - ADM6 URL';
        }
        field(231; "National Cohesion - ADM54 Url"; Text[1000])
        {

            Caption = 'National Cohesion - ADM54 URL';
        }
        field(232; "NOCK - ADM 68 VOL.1 Url"; Text[1000])
        {

            Caption = 'NOCK - ADM 68 VOL.1 URL';
        }
        field(233; "Occupational Safety and Health Committee - ADM40 Url"; Text[1000])
        {

            Caption = 'Occupational Safety and Health Committee - ADM40 URL';
        }
        field(234; "Office Accomodations - ADM16 Url"; Text[1000])
        {

            Caption = 'Office Accomodations - ADM16 URL';
        }
        field(235; "Office Maintenance - ADM17 Url"; Text[1000])
        {

            Caption = 'Office Maintenance - ADM17 URL';
        }
        field(236; "Office Security - ADM18 Url"; Text[1000])
        {

            Caption = 'Office Security - ADM18 URL';
        }
        field(237; "Parliamentary Business - ADM22 Url"; Text[1000])
        {

            Caption = 'Parliamentary Business - ADM22 URL';
        }
        field(238; "Partnerships - ADM33 Url"; Text[1000])
        {

            Caption = 'Partnerships - ADM33 URL';
        }
        field(239; "Partnerships and Collaborations with iNADOs-ADM 65 VOL.1 Url"; Text[1000])
        {

            Caption = 'Partnerships and Collaborations with iNADOs-ADM 65 VOL.1 URL';
        }
        field(240; "Performance Contracts and Reports - ADM15 Url"; Text[1000])
        {

            Caption = 'Performance Contracts and Reports - ADM15 URL';
        }
        field(241; "PSC Circulars and Directives - ADM57 Url"; Text[1000])
        {

            Caption = 'PSC Circulars and Directives - ADM57 URL';
        }
        field(242; "RADO- ADM 62 VOL.1 Url"; Text[1000])
        {

            Caption = 'RADO- ADM 62 VOL.1 URL';
        }
        field(243; "Records Management - ADM47 Url"; Text[1000])
        {

            Caption = 'Records Management - ADM47 URL';
        }
        field(244; "Absence from Duty - ADM7 Vol.1 Url"; Text[1000])
        {

            Caption = 'Absence from Duty - ADM7 Vol.1 URL';
        }
        field(245; "Road Safety Mainstreaming - ADM59 Url"; Text[1000])
        {

            Caption = 'Road Safety Mainstreaming - ADM59 URL';
        }
        field(246; "Seminars, Workshops and Conferences - ADM24 Url"; Text[1000])
        {

            Caption = 'Seminars, Workshops and Conferences - ADM24 URL';
        }
        field(247; "Sporting Events and Calendars - ADM 67 VOL.1 Url"; Text[1000])
        {

            Caption = 'Sporting Events and Calendars - ADM 67 VOL.1 URL';
        }
        field(248; "Sports Organization Fedaration - ADM60 Url"; Text[1000])
        {

            Caption = 'Sports Organization Fedaration - ADM60 URL';
        }
        field(249; "Staff Welfare - ADM13 Url"; Text[1000])
        {

            Caption = 'Staff Welfare - ADM13 URL';
        }
        field(250; "Strategic Plans - ADM11 Url"; Text[1000])
        {

            Caption = 'Strategic Plans - ADM11 URL';
        }
        field(251; "Strategy Planning and Corporate Governance - ADM35 Url"; Text[1000])
        {

            Caption = 'Strategy Planning and Corporate Governance - ADM35 URL';
        }
        field(252; "Travel Clearance - ADM12 Url"; Text[1000])
        {

            Caption = 'Travel Clearance - ADM12 URL';
        }
        field(253; "UNESCO - ADM 63 VOL.1 Url"; Text[1000])
        {

            Caption = 'UNESCO - ADM 63 VOL.1 URL';
        }
        field(254; "Values and Principles of Governance - ADM19 Url"; Text[1000])
        {
            Caption = 'Values and Principles of Governance - ADM19 URL';
        }
        field(255; "Vision 2030 - ADM52 Url"; Text[1000])
        {

            Caption = 'Vision 2030 - ADM52 URL';
        }
        field(256; "WADA-ADM 61 VOL.1 Url"; Text[1000])
        {

            Caption = 'WADA-ADM 61 VOL.1 URL';
        }
        field(257; "Workplans - ADM14 Url"; Text[1000])
        {

            Caption = 'Workplans - ADM14 URL';
        }

        //Audit
        field(258; "Audit and Risk Management Committee(notices)-ADAK AUD 1 Url"; Text[1000])
        {

            Caption = 'Audit and Risk Management Committee(notices)-ADAK AUD 1 URL';
        }
        field(259; "Audit General- ADAK AUD 9 Url"; Text[1000])
        {

            Caption = 'Audit General- ADAK AUD 9 URL';
        }
        field(260; "Internal Audit Education and Research reports-ADAK AUD 3 Url"; Text[1000])
        {

            Caption = 'Internal Audit Education and Research reports-ADAK AUD 3 URL';
        }
        field(261; "Internal Audit Finance and Accounts reports-ADAK AUD 8 Url"; Text[1000])
        {

            Caption = 'Internal Audit Finance and Accounts reports-ADAK AUD 8 URL';
        }
        field(262; "Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3 Url"; Text[1000])
        {

            Caption = 'Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3 URL';
        }
        field(263; "Internal Audit Legal Services reports-ADAK AUD 6 Url"; Text[1000])
        {

            Caption = 'Internal Audit Legal Services reports-ADAK AUD 6 URL';
        }
        field(264; "Internal Audit Standards and Compliance reports-ADAK AUD 4 Url"; Text[1000])
        {

            Caption = 'Internal Audit Standards and Compliance reports-ADAK AUD 4 URL';
        }
        field(265; "Internal Audit Supply Chain reports-ADAK AUD 7 Url"; Text[1000])
        {

            Caption = 'Internal Audit Supply Chain reports-ADAK AUD 7 URL';
        }

        //Corporate Comms
        field(266; "Advertising and Publicity-ADAK COM 4 Url"; Text[1000])
        {

            Caption = 'Advertising and Publicity-ADAK COM 4 URL';
        }
        field(267; "Branding- ADAK COM 7 Url"; Text[1000])
        {

            Caption = 'Branding- ADAK COM 7 URL';
        }
        field(268; "CSR-ADAK COM 3 Url"; Text[1000])
        {

            Caption = 'CSR-ADAK COM 3 URL';
        }
        field(269; "Customer Feedback Reports- ADAK COM 5 Url"; Text[1000])
        {

            Caption = 'Customer Feedback Reports- ADAK COM 5 URL';
        }
        field(270; "General Communication- ADAK COM 1 Url"; Text[1000])
        {

            Caption = 'General Communication- ADAK COM 1 URL';
        }
        field(271; "Newsletters and Publications-ADAK COM 8 Url"; Text[1000])
        {

            Caption = 'Newsletters and Publications-ADAK COM 8 URL';
        }
        field(272; "Press Cutting-ADAK COM 10 Url"; Text[1000])
        {

            Caption = 'Press Cutting-ADAK COM 10 URL';
        }
        field(273; "Press Releases-ADAK COM 9 Url"; Text[1000])
        {

            Caption = 'Press Releases- ADAK COM 9 URL';
        }
        field(274; "Shows and Exhibitions- ADAK COM 2 Url"; Text[1000])
        {

            Caption = 'Shows and Exhibitions- ADAK COM 2 URL';
        }
        field(275; "Speeches - ADAK COM 6 Url"; Text[1000])
        {

            Caption = 'Speeches - ADAK COM 6 URL';
        }

        //Education and Research
        field(276; "Anti-Doping Educators- ADAK E&R 9 Url"; Text[1000])
        {

            Caption = 'Anti-Doping Educators- ADAK E&R 9 URL';
        }
        field(277; "Anti-Doping Research Proposals & Reports- ADAK E&R 10 Url"; Text[1000])
        {

            Caption = 'Anti-Doping Research Proposals & Reports- ADAK E&R 10 URL';
        }
        field(278; "Anti-Doping field Based Education- ADAK E&R 5 Url"; Text[1000])
        {

            Caption = 'Anti-Doping field Based Education- ADAK E&R 5 URL';
        }
        field(3; "Anti-Doping Value Based Education- ADAK E&R 5 URL"; Text[1000])
        {
            Caption = 'Anti-Doping Value Based Education- ADAK E&R 5';
        }
        field(279; "Anti-Doping workshop programmes- ADAK E&R 1 VOL.1 Url"; Text[1000])
        {

            Caption = 'Anti-Doping workshop programmes- ADAK E&R 1 VOL.1 URL';
        }
        field(280; "Research and Development- ADAK E&R 7 Url"; Text[1000])
        {

            Caption = 'Research and Development- ADAK E&R 7 URL';
        }
        //Finance and Accounts
        field(281; "Audited Financial Statements and Reports - FIN14 Url"; Text[1000])
        {

            Caption = 'Audited Financial Statements and Reports - FIN14 URL';
        }
        field(282; "Bad Debts and Write-offs - FIN20 Url"; Text[1000])
        {

            Caption = 'Bad Debts and Write-offs - FIN20 URL';
        }
        field(283; "Board Expenditure - FIN10 Url"; Text[1000])
        {

            Caption = 'Board Expenditure - FIN10 URL';
        }
        field(284; "Board of Survey Finance - FIN15 Url"; Text[1000])
        {

            Caption = 'Board of Survey Finance - FIN15 URL';
        }
        field(285; "Budgets and Estimates - FIN 7 Url"; Text[1000])
        {

            Caption = 'Budgets and Estimates - FIN 7 Url';
        }
        field(286; "Expenditure Control - FIN8 URL"; Text[1000])
        {

            Caption = 'Expenditure Control - FIN8 URL';
        }
        field(287; "Finance and General Purpose Committee Notices - FIN17 URL"; Text[1000])
        {

            Caption = 'Finance and General Purpose Committee Notices - FIN17 URL';
        }
        field(288; "Finance General- FIN 1 URL"; Text[1000])
        {

            Caption = 'Finance General- FIN 1 URL';
        }
        field(289; "Finance Statements and Reports - FIN13 URL"; Text[1000])
        {

            Caption = 'Finance Statements and Reports - FIN13 URL';
        }
        field(290; "Government Grants- FIN 2 URL"; Text[1000])
        {

            Caption = 'Government Grants- FIN 2 URL';
        }
        field(291; "Imprest and Advances - FIN9 URL"; Text[1000])
        {

            Caption = 'Imprest and Advances - FIN9 URL';
        }
        field(292; "MTEF- FIN 6 URL"; Text[1000])
        {

            Caption = 'MTEF- FIN 6 URL';
        }
        field(293; "National Treasury Circulars - FIN19 URL"; Text[1000])
        {

            Caption = 'National Treasury Circulars - FIN19 URL';
        }
        field(294; "Other Grants- FIN 3 URL"; Text[1000])
        {

            Caption = 'Other Grants- FIN 3 URL';
        }
        field(295; "Pending Bills - FIN11 URL"; Text[1000])
        {

            Caption = 'Pending Bills - FIN11 URL';
        }
        field(296; "Statutory Obligation Reports - FIN12 URL"; Text[1000])
        {

            Caption = 'Statutory Obligation Reports - FIN12 URL';
        }
        field(297; "Tax Matters - FIN21 URL"; Text[1000])
        {

            Caption = 'Tax Matters - FIN21 URL';
        }
        //Human Capital
        field(298; "Casual engagements- HCM 5 URL"; Text[1000])
        {

            Caption = 'Casual engagements- HCM 5 URL';
        }
        field(299; "Cleaning Services-HCM 21 URL"; Text[1000])
        {

            Caption = 'Cleaning Services-HCM 21 URL';
        }
        field(300; "Deployment and Secondment of staff - HCM 7 URL"; Text[1000])
        {

            Caption = 'Deployment and Secondment of staff - HCM 7 URL';
        }
        field(301; "HCM BOARD Committee (papers)-HCM 22 URL"; Text[1000])
        {

            Caption = 'HCM BOARD Committee (papers)-HCM 22 URL';
        }
        field(302; "Human Capital Advisory Committee(Notices)- HCM 28 URL"; Text[1000])
        {

            Caption = 'Human Capital Advisory Committee(Notices)- HCM 28 URL';
        }
        field(303; "Human Capital Disciplinary Committee-HCM 34 URL"; Text[1000])
        {

            Caption = 'Human Capital Disciplinary Committee-HCM 34 URL';
        }
        field(304; "Human Capital Management Board Committee(notices) -HCM 22 URL"; Text[1000])
        {

            Caption = 'Human Capital Management Board Committee(notices) -HCM 22 URL';
        }
        field(305; "Human Resource Circulars - HCM 12 URL"; Text[1000])
        {

            Caption = 'Human Resource Circulars - HCM 12 URL';
        }
        field(306; "Human Resource Payroll Information - HCM 14 URL"; Text[1000])
        {

            Caption = 'Human Resource Payroll Information - HCM 14 URL';
        }
        field(307; "Induction-HCM 36 URL"; Text[1000])
        {

            Caption = 'Induction-HCM 36 URL';
        }
        field(308; "Industrial Attachments - HCM 17 URL"; Text[1000])
        {

            Caption = 'Industrial Attachments - HCM 17 URL';
        }
        field(309; "Insurance Matters- HCM 35 URL"; Text[1000])
        {

            Caption = 'Insurance Matters- HCM 35 URL';
        }
        field(310; "Internships - HCM 18 URL"; Text[1000])
        {

            Caption = 'Internships - HCM 18 URL';
        }
        field(311; "Pensions and Gratuity - HCM 15 URL"; Text[1000])
        {

            Caption = 'Pensions and Gratuity - HCM 15 URL';
        }
        field(312; "Performance Evaluation and Appraisal -HCM 9 URL"; Text[1000])
        {

            Caption = 'Performance Evaluation and Appraisal -HCM 9 URL';
        }
        field(313; "Professional Associations - HCM 20 URL"; Text[1000])
        {

            Caption = 'Professional Associations - HCM 20 URL';
        }
        field(314; "Recruitment and Appointments - HCM 3 URL"; Text[1000])
        {

            Caption = 'Recruitment and Appointments - HCM 3 URL';
        }
        field(315; "Salary and Remuneration(SRC)-HCM 8 URL"; Text[1000])
        {

            Caption = 'Salary and Remuneration(SRC)-HCM 8 URL';
        }
        field(316; "Staff Leave - HCM 11 URL"; Text[1000])
        {

            Caption = 'Staff Leave - HCM 11 URL';
        }
        field(317; "Staff Matters - HCM 1 VOL.1 URL"; Text[1000])
        {

            Caption = 'Staff Matters - HCM 1 VOL.1 URL';
        }
        field(318; "Staff Training - HCM 16 URL"; Text[1000])
        {

            Caption = 'Staff Training - HCM 16 URL';
        }
        field(319; "State Corporation Advisory Committee(SCAC)-HCM 19 URL"; Text[1000])
        {

            Caption = 'State Corporation Advisory Committee(SCAC)-HCM 19 URL';
        }
        field(320; "Statutory Deductions - HCM 13 URL"; Text[1000])
        {

            Caption = 'Statutory Deductions - HCM 13 URL';
        }
        //Legal
        field(322; "Attorney General Matters-ADAK LEG 2 URL"; Text[1000])
        {

            Caption = 'Attorney General Matters-ADAK LEG 2 URL';
        }
        field(323; "Legal Matters Correspondences-ADAK LEG 1 URL"; Text[1000])
        {

            Caption = 'Legal Matters Correspondences-ADAK LEG 1 URL';
        }
        field(324; "Legal Opinions and Advisories(internal)-ADAK LEG 9 URL"; Text[1000])
        {

            Caption = 'Legal Opinions and Advisories(internal)-ADAK LEG 9 URL';
        }
        //Standards and Compliance
        field(325; "RTP-ADAK S&C 9 (VOL III) URL"; Text[1000])
        {

            Caption = 'RTP-ADAK S&C 9 URL';
        }
        field(326; "S&C Departmental meetings- ADAK S&C 15 URL"; Text[1000])
        {

            Caption = 'S&C Departmental meetings- ADAK S&C 15 URL';
        }
        field(327; "Sample Collection Personnel Training-ADAK S&C 6 URL"; Text[1000])
        {

            Caption = 'Sample Collection Personnel Training-ADAK S&C 6 URL';
        }
        field(328; "Sample Collection Personnel-ADAK S&C 5 URL"; Text[1000])
        {

            Caption = 'Sample Collection Personnel-ADAK S&C 5 URL';
        }
        field(329; "Sports Federations Compliance Audit-ADAK S&C 10 Url"; Text[1000])
        {

            Caption = 'Sports Federations Compliance Audit-ADAK S&C 10 URL';
        }
        field(330; "Standards & Compliance General-ADAK S&C 1 Url"; Text[1000])
        {

            Caption = 'Standards & Compliance General-ADAK S&C 1 URL';
        }
        field(331; "TUE- ADAK S&C 2 Url"; Text[1000])
        {

            Caption = 'TUE- ADAK S&C 2 URL';
        }

        //SCM
        field(332; "Appointment to ADHOC Procurement Committee- ADAK SCM 5 Url"; Text[1000])
        {

            Caption = 'Appointment to ADHOC procurement committee- ADAK SCM 5 URL';
        }
        field(333; "Assets and Liabilities- ADAK SCM 15 Url"; Text[1000])
        {

            Caption = 'Assets and Liabilities- ADAK SCM 15 URL';
        }
        field(334; "Board of survey- stores- ADAK SCM 10 Url"; Text[1000])
        {

            Caption = 'Board of survey- stores- ADAK SCM 10 URL';
        }
        field(335; "Notification of Tender Awards- ADAK SCM 6 Url"; Text[1000])
        {

            Caption = 'Notification of Tender Awards- ADAK SCM 6 URL';
        }
        field(336; "Procurement of Goods-ADAK SCM 1 Url"; Text[1000])
        {

            Caption = 'Procurement of Goods-ADAK SCM 1 URL';
        }
        field(337; "Procurement of Motor vehicle-ADAK SCM 4 Url"; Text[1000])
        {

            Caption = 'Procurement of Motor vehicle-ADAK SCM 4 URL';
        }
        field(338; "Procurement of services-ADAK SCM 2 Url"; Text[1000])
        {

            Caption = 'Procurement of services-ADAK SCM 2 URL';
        }
        field(339; "Procurement of works- ADAK SCM 3 Url"; Text[1000])
        {

            Caption = 'Procurement of works- ADAK SCM 3 URL';
        }
        field(340; "Procurement Plan-ADAK SCM 11 Url"; Text[1000])
        {

            Caption = 'Procurement Plan-ADAK SCM 11 URL';
        }
        field(341; "Procurement Policy and Circulars-ADAK SCM 9 Url"; Text[1000])
        {

            Caption = 'Procurement Policy and Circulars-ADAK SCM 9 URL';
        }
        field(342; "Public Procurement Appeals and Review Board-ADAK SCM 7 Url"; Text[1000])
        {

            Caption = 'Public Procurement Appeals and Review Board-ADAK SCM 7 URL';
        }
        field(343; "Recommendations and Reference letters-ADAK SCM 13 Url"; Text[1000])
        {

            Caption = 'Recommendations and Reference letters-ADAK SCM 13 URL';
        }
        field(344; "Statutory Reports- ADAK SCM 12 Url"; Text[1000])
        {

            Caption = 'Statutory Reports- ADAK SCM 12 URL';
        }
        //Transport
        field(345; "General Transport Matters - ADAK TRA 1 VOL.1 Url"; Text[1000])
        {

            Caption = 'General Transport Matters - ADAK TRA 1 VOL.1 URL';
        }
        field(346; "Motor Vehicle Returns- ADAK TRA 2 Url"; Text[1000])
        {

            Caption = 'Motor Vehicle Returns- ADAK TRA 2 URL';
        }
        field(347; "TOYOTA COROLLA SALON-TRA KCE 880D Url"; Text[1000])
        {

            Caption = 'TOYOTA COROLLA SALON-TRA KCE 880D URL';
        }
        field(348; "TOYOTA FORTUNER- TRA KCD 878G Url"; Text[1000])
        {

            Caption = 'TOYOTA FORTUNER- TRA KCD 878G URL';
        }
        field(349; "TOYOTA HILUX-TRA KCD 877G Url"; Text[1000])
        {

            Caption = 'TOYOTA HILUX-TRA KCD 877G URL';
        }
        field(350; "TOYOTA PRADO - TRA GKB 474M Url"; Text[1000])
        {

            Caption = 'TOYOTA PRADO - TRA GKB 474M URL';
        }
        field(351; "TOYOTA PRADO - TRA GKB 478M Url"; Text[1000])
        {

            Caption = 'TOYOTA PRADO - TRA GKB 478M URL';
        }
        field(352; "TOYOTA PRADO - TRA KCD 891G Url"; Text[1000])
        {

            Caption = 'TOYOTA PRADO - TRA KCD 891G URL';
        }
        field(353; "TOYOTA PRADO - TRA KCE 901D Url"; Text[1000])
        {

            Caption = 'TOYOTA PRADO - TRA KCE 901D URL';
        }
        field(354; "TOYOTA VAN HIACE- TRA KCE 925D Url"; Text[1000])
        {

            Caption = 'TOYOTA VAN HIACE- TRA KCE 925D URL';
        }
        field(355; "Transport Requisitions- ADAK TRA 3 Url"; Text[1000])
        {
            Caption = 'Transport Requisitions- ADAK TRA 3 URL';
        }
        //ICT
        // field(163; "ICT Equipments and Services-ADAK ICT 2"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ICT Equipments and Services-ADAK ICT 2';
        // }
        // field(356; "ICT Internal Support- ADAK ICT 3"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ICT Internal Support- ADAK ICT 3';
        // }
        // field(357; "ICT Projects-ADAK ICT 5"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ICT Projects-ADAK ICT 5';
        // }
        // field(358; "ISMS-ADAK ICT 4"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'ISMS-ADAK ICT 4';
        // }
        // field(359; "Website Matters- ADAK ICT 1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Website Matters- ADAK ICT 1';
        // }
        //ICT URL
        field(360; "ICT Equipments and Services-ADAK ICT 2 URL"; Text[1000])
        {
            Caption = 'ICT Equipments and Services-ADAK ICT 2 URL';
        }
        field(361; "ICT Internal Support- ADAK ICT 3 URL"; Text[1000])
        {
            Caption = 'ICT Internal Support- ADAK ICT 3 URL';
        }
        field(362; "ICT Projects-ADAK ICT 5 URL"; Text[1000])
        {
            Caption = 'ICT Projects-ADAK ICT 5 URL';
        }
        field(363; "ISMS-ADAK ICT 4 URL"; Text[1000])
        {
            Caption = 'ISMS-ADAK ICT 4 URL';
        }
        field(364; "Website Matters- ADAK ICT 1 URL"; Text[1000])
        {
            Caption = 'Website Matters- ADAK ICT 1 URL';
        }
        // field(365; "Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1';
        // }
        // field(366; "Enhanced Anti-Doping General-ADAK EAP 1 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Enhanced Anti-Doping General-ADAK EAP 1 VOL.1';
        // }
        // field(367; "Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1';
        // }
        // field(368; "Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Enhanced Anti-Doping Testing-ADAK EAP 3 VOL.1';
        // }
        // field(369; "Monitoring Pool-ADAK EAP 6"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Monitoring Pool-ADAK EAP 6';
        // }
        // field(370; "Office Accommodation Eldoret-ADAK EAP 4 VOL.1"; Code[250])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Office Accommodation Eldoret-ADAK EAP 4 VOL.1';
        // }
        field(371; "Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1 URL"; Text[1000])
        {

            Caption = 'Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1 URL';
        }
        field(372; "Enhanced Anti-Doping General-ADAK EAP 1 VOL.1 URL"; Text[1000])
        {

            Caption = 'Enhanced Anti-Doping General-ADAK EAP 1 VOL.1 URL';
        }
        field(373; "Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1 URL"; Text[1000])
        {

            Caption = 'Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1 URL';
        }
        field(374; "Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II URL"; Text[1000])
        {

            Caption = 'Enhanced Anti-Doping Testing-ADAK EAP 3 VOL.1 URL';
        }
        field(375; "Monitoring Pool-ADAK EAP 6 URL"; Text[1000])
        {

            Caption = 'Monitoring Pool-ADAK EAP 6 URL';
        }
        field(376; "Office Accommodation Eldoret-ADAK EAP 4 VOL.1 URL"; Text[1000])
        {

            Caption = 'Office Accommodation Eldoret-ADAK EAP 4 VOL.1 URL';
        }
        // field(377; "Athletics Kenya - ADM60 02"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Athletics Kenya - ADM60 02';
        // }
        field(378; "Athletics Kenya - ADM60 02 URL"; Text[1000])
        {
            Caption = 'Athletics Kenya - ADM60 02';
        }
        // field(379; "Badminton Kenya - ADM60 23"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Badminton Kenya - ADM60 23';
        // }
        field(380; "Badminton Kenya - ADM60 23 URL"; Text[1000])
        {
            Caption = 'Badminton Kenya - ADM60 23';
        }
        // field(381; "Boxing Federation of Kenya - ADM60 27"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Boxing Federation of Kenya - ADM60 27';
        // }
        field(382; "Boxing Federation of Kenya - ADM60 27 URL"; Text[1000])
        {
            Caption = 'Boxing Federation of Kenya - ADM60 27 URL';
        }
        // field(383; "Football Kenya - ADM60 03"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Football Kenya - ADM60 03';
        // }
        field(384; "Football Kenya - ADM60 03 URL"; Text[1000])
        {
            Caption = 'Football Kenya - ADM60 03 URL';
        }
        // field(385; "Kenya Baseball Federation - ADM60 16"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Baseball Federation - ADM60 16';
        // }
        field(386; "Kenya Baseball Federation - ADM60 16 URL"; Text[1000])
        {
            Caption = 'Kenya Baseball Federation - ADM60 16 URL';
        }
        // field(387; "Kenya Basketball Federation - ADM60 12"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Basketball Federation - ADM60 12';
        // }
        field(388; "Kenya Basketball Federation - ADM60 12 URL"; Text[1000])
        {
            Caption = 'Kenya Basketball Federation - ADM60 12 URL';
        }
        // field(389; "Kenya Body Building Federation - ADM60 04"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Body Building Federation - ADM60 04';
        // }
        field(390; "Kenya Body Building Federation - ADM60 04 URL"; Text[1000])
        {
            Caption = 'Kenya Body Building Federation - ADM60 04 URL';
        }
        // field(391; "Kenya Bowling Federation - ADM60 26"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Bowling Federation - ADM60 26';
        // }
        field(392; "Kenya Bowling Federation - ADM60 26 URL"; Text[1000])
        {
            Caption = 'Kenya Bowling Federation - ADM60 26 UEL';
        }
        // field(393; "Kenya Cycling Federation - ADM6019"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Cycling Federation - ADM6019';
        // }
        field(394; "Kenya Cycling Federation - ADM6019 URL"; Text[1000])
        {
            Caption = 'Kenya Cycling Federation - ADM6019 URL';
        }
        // field(395; "Kenya Golf Union- ADM60 21"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Golf Union- ADM60 21';
        // }
        field(396; "Kenya Golf Union- ADM60 21 URL"; Text[1000])
        {
            Caption = 'Kenya Golf Union- ADM60 21 URL';
        }
        // field(397; "Kenya Handball Federation - ADM60 11"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Handball Federation - ADM60 11';
        // }
        field(398; "Kenya Handball Federation - ADM60 11 URL"; Text[1000])
        {
            Caption = 'Kenya Handball Federation - ADM60 11 URL';
        }
        // field(399; "Kenya Hockey Union - ADM60 14"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Hockey Union - ADM60 14';
        // }
        field(400; "Kenya Hockey Union - ADM60 14 URL"; Text[1000])
        {
            Caption = 'Kenya Hockey Union - ADM60 14 URL';
        }
        // field(401; "Kenya Judo Association - ADM60 05"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Judo Association - ADM60 05';
        // }
        field(402; "Kenya Judo Association - ADM60 05 URL"; Text[1000])
        {
            Caption = 'Kenya Judo Association - ADM60 05 URL';
        }
        // field(403; "Kenya Kabaddi Sports Federation - ADM60 18"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Kabaddi Sports Federation - ADM60 18';
        // }
        field(404; "Kenya Kabaddi Sports Federation - ADM60 18 URL"; Text[1000])
        {
            Caption = 'Kenya Kabaddi Sports Federation - ADM60 18 URL';
        }
        // field(405; "Kenya Karate Federation - ADM60 10"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Karate Federation - ADM60 10';
        // }
        field(406; "Kenya Karate Federation - ADM60 10 URL"; Text[1000])
        {
            Caption = 'Kenya Karate Federation - ADM60 10 URL';
        }
        // field(407; "Kenya National Paralympic  - ADM60 08"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya National Paralympic  - ADM60 08';
        // }
        field(408; "Kenya National Paralympic  - ADM60 08 URL"; Text[1000])
        {
            Caption = 'Kenya National Paralympic  - ADM60 08 URL';
        }
        // field(409; "Kenya Netball Federation - ADM60 20"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Netball Federation - ADM60 20';
        // }
        field(410; "Kenya Netball Federation - ADM60 20 URL"; Text[1000])
        {
            Caption = 'Kenya Netball Federation - ADM60 20 URL';
        }
        // field(411; "Kenya Rowing and Canoe Association - ADM60 09"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Rowing and Canoe Association - ADM60 09';
        // }
        field(412; "Kenya Rowing and Canoe Association - ADM60 09 URL"; Text[1000])
        {
            Caption = 'Kenya Rowing and Canoe Association - ADM60 09 URL';
        }
        // field(413; "Kenya Rugby Union - ADM60 07"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Rugby Union - ADM60 07';
        // }
        field(414; "Kenya Rugby Union - ADM60 07 URL"; Text[1000])
        {
            Caption = 'Kenya Rugby Union - ADM60 07 URL';
        }
        // field(415; "Kenya Shooting Federation - ADM60 28"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Shooting Federation - ADM60 28';
        // }
        field(416; "Kenya Shooting Federation - ADM60 28 URL"; Text[1000])
        {
            Caption = 'Kenya Shooting Federation - ADM60 28 URL';
        }
        // field(417; "Kenya Squash Rackets Association - ADM60 22"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Squash Rackets Association - ADM60 22';
        // }
        field(418; "Kenya Squash Rackets Association - ADM60 22 URL"; Text[1000])
        {
            Caption = 'Kenya Squash Rackets Association - ADM60 22 URL';
        }
        // field(419; "Kenya Swimming Federation - ADM60 17"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Swimming Federation - ADM60 17';
        // }
        field(420; "Kenya Swimming Federation - ADM60 17 URL"; Text[1000])
        {
            Caption = 'Kenya Swimming Federation - ADM60 17 URL';
        }
        // field(421; "Kenya Table Tennis Federation - ADM60 13"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Table Tennis Federation - ADM60 13';
        // }
        field(422; "Kenya Table Tennis Federation - ADM60 13 URL"; Text[1000])
        {
            Caption = 'Kenya Table Tennis Federation - ADM60 13 URL';
        }
        // field(423; "Kenya Triathlon Federation - ADM60 25"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Triathlon Federation - ADM60 25';
        // }
        field(424; "Kenya Triathlon Federation - ADM60 25 URL"; Text[1000])
        {
            Caption = 'Kenya Triathlon Federation - ADM60 25 URL';
        }
        // field(425; "Kenya Volleyball Federation - ADM60 06"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Volleyball Federation - ADM60 06';
        // }
        field(426; "Kenya Volleyball Federation - ADM60 06 URL"; Text[1000])
        {
            Caption = 'Kenya Volleyball Federation - ADM60 06 URL';
        }
        // field(427; "Kenya Weight Lifting Association - ADM60 15"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kenya Weight Lifting Association - ADM60 15';
        // }
        field(428; "Kenya Weight Lifting Association - ADM60 15 URL"; Text[1000])
        {
            Caption = 'Kenya Weight Lifting Association - ADM60 15 URL';
        }
        // field(429; "Tennis Kenya  - ADM60 24"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Tennis Kenya  - ADM60 24';
        // }
        field(430; "Tennis Kenya  - ADM60 24 URL"; Text[1000])
        {
            Caption = 'Tennis Kenya  - ADM60 24 URL';
        }
        //EAP
        // field(431; "Adlif James Khalonyere-ADAK EAP 007"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Adlif James Khalonyere-ADAK EAP 007';
        // }
        field(432; "Adlif James Khalonyere-ADAK EAP 007 URL"; Text[1000])
        {
            Caption = 'Adlif James Khalonyere-ADAK EAP 007 URL';
        }
        // field(433; "Ann Wairimu-ADAK EAP 004"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ann Wairimu-ADAK EAP 004';
        // }
        field(434; "Ann Wairimu-ADAK EAP 004 URL"; Text[1000])
        {
            Caption = 'Ann Wairimu-ADAK EAP 004 URL';
        }
        // field(435; "Catherine Mkabahati Shegu-ADAK EAP 009"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Catherine Mkabahati Shegu-ADAK EAP 009';
        // }
        field(436; "Catherine Mkabahati Shegu-ADAK EAP 009 URL"; Text[1000])
        {
            Caption = 'Catherine Mkabahati Shegu-ADAK EAP 009 URL';
        }
        // field(437; "Chriss Carlos Mwachia-ADAK EAP 020"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Chriss Carlos Mwachia-ADAK EAP 020';
        // }
        field(438; "Chriss Carlos Mwachia-ADAK EAP 020 URL"; Text[1000])
        {
            Caption = 'Chriss Carlos Mwachia-ADAK EAP 020 URL';
        }
        // field(439; "Daisy Chebet Kurgat-ADAK EAP 026"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Daisy Chebet Kurgat-ADAK EAP 026';
        // }
        field(440; "Daisy Chebet Kurgat-ADAK EAP 026 URL"; Text[1000])
        {
            Caption = 'Daisy Chebet Kurgat-ADAK EAP 026 URL';
        }
        // field(441; "Dalacha Iram Gheneti-ADAK EAP 013"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Dalacha Iram Gheneti-ADAK EAP 013';
        // }
        field(442; "Dalacha Iram Gheneti-ADAK EAP 013 URL"; Text[1000])
        {
            Caption = 'Dalacha Iram Gheneti-ADAK EAP 013 URL';
        }
        // field(443; "Damaris Njeri Wanjiru-ADAK EAP 016"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Damaris Njeri Wanjiru-ADAK EAP 016';
        // }
        field(444; "Damaris Njeri Wanjiru-ADAK EAP 016 URL"; Text[1000])
        {
            Caption = 'Damaris Njeri Wanjiru-ADAK EAP 016 URL';
        }
        // field(445; "Diana Langat-ADAK EAP 025"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Diana Langat-ADAK EAP 025';
        // }
        field(446; "Diana Langat-ADAK EAP 025 URL"; Text[1000])
        {
            Caption = 'Diana Langat-ADAK EAP 025 URL';
        }
        // field(447; "Emily Karimi Mwirigi-ADAK EAP 014"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Emily Karimi Mwirigi-ADAK EAP 014';
        // }
        field(448; "Emily Karimi Mwirigi-ADAK EAP 014 URL"; Text[1000])
        {
            Caption = 'Emily Karimi Mwirigi-ADAK EAP 014 URL';
        }
        // field(449; "Esther Wambui Kihara-ADAK EAP 021"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Esther Wambui Kihara-ADAK EAP 021';
        // }
        field(450; "Esther Wambui Kihara-ADAK EAP 021 URL"; Text[1000])
        {
            Caption = 'Esther Wambui Kihara-ADAK EAP 021 URL';
        }
        // field(451; "Gibson Ronoh-ADAK EAP 002"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Gibson Ronoh-ADAK EAP 002';
        // }
        field(452; "Gibson Ronoh-ADAK EAP 002 URL"; Text[1000])
        {
            Caption = 'Gibson Ronoh-ADAK EAP 002 URL';
        }
        // field(453; "Gladwel Obaga Bitutu-ADAK EAP 008"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Gladwel Obaga Bitutu-ADAK EAP 008';
        // }
        field(454; "Gladwel Obaga Bitutu-ADAK EAP 008 URL"; Text[1000])
        {
            Caption = 'Gladwel Obaga Bitutu-ADAK EAP 008 URL';
        }
        // field(455; "Grace Wanjiru Ngugi-ADAK EAP 010"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Grace Wanjiru Ngugi-ADAK EAP 010';
        // }
        field(456; "Grace Wanjiru Ngugi-ADAK EAP 010 URL"; Text[1000])
        {
            Caption = 'Grace Wanjiru Ngugi-ADAK EAP 010 URL';
        }
        // field(457; "Januaris Ngemu Nicholas-ADAK EAP 012"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Januaris Ngemu Nicholas-ADAK EAP 012';
        // }
        field(458; "Januaris Ngemu Nicholas-ADAK EAP 012 URL"; Text[1000])
        {
            Caption = 'Januaris Ngemu Nicholas-ADAK EAP 012 URL';
        }
        // field(459; "Joseph Kithisya Mbithi-024"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Joseph Kithisya Mbithi-024';
        // }
        field(460; "Joseph Kithisya Mbithi-024 URL"; Text[1000])
        {
            Caption = 'Joseph Kithisya Mbithi-024 URL';
        }
        // field(461; "Kipkoech Laban-ADAK EAP 022"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kipkoech Laban-ADAK EAP 022';
        // }
        field(462; "Kipkoech Laban-ADAK EAP 022 URL"; Text[1000])
        {
            Caption = 'Kipkoech Laban-ADAK EAP 022 URL';
        }
        // field(463; "Maryanne Waithera Mwaura-ADAK EAP 006"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Maryanne Waithera Mwaura-ADAK EAP 006';
        // }
        field(464; "Maryanne Waithera Mwaura-ADAK EAP 006 URL"; Text[1000])
        {
            Caption = 'Maryanne Waithera Mwaura-ADAK EAP 006 URL';
        }
        // field(465; "Mildred Ondoi-ADAK EAP 019"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Mildred Ondoi-ADAK EAP 019';
        // }
        field(466; "Mildred Ondoi-ADAK EAP 019 URL"; Text[1000])
        {
            Caption = 'Mildred Ondoi-ADAK EAP 019 URL';
        }
        // field(467; "Morris Mugambi-ADAK EAP 027"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Morris Mugambi-ADAK EAP 027';
        // }
        field(468; "Morris Mugambi-ADAK EAP 027 URL"; Text[1000])
        {
            Caption = 'Morris Mugambi-ADAK EAP 027 URL';
        }
        // field(469; "Ong'inti Anyona Dennis-ADAK EAP 018"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ong''inti Anyona Dennis-ADAK EAP 018';
        // }
        field(470; "Ong'inti Anyona Dennis-ADAK EAP 018 URL"; Text[1000])
        {
            Caption = 'Ong''inti Anyona Dennis-ADAK EAP 018 URL';
        }
        // field(471; "Phyllis Nduta Mwangi-ADAK EAP 005"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Phyllis Nduta Mwangi-ADAK EAP 005';
        // }
        field(472; "Phyllis Nduta Mwangi-ADAK EAP 005 URL"; Text[1000])
        {
            Caption = 'Phyllis Nduta Mwangi-ADAK EAP 005 URL';
        }
        // field(473; "Remicus Asitaka L. Khamasi-ADAK EAP 003"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Remicus Asitaka L. Khamasi-ADAK EAP 003';
        // }
        field(474; "Remicus Asitaka L. Khamasi-ADAK EAP 003 URL"; Text[1000])
        {
            Caption = 'Remicus Asitaka L. Khamasi-ADAK EAP 003 URL';
        }
        // field(475; "Ronney Sumba Mandu-ADAK EAP 011"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ronney Sumba Mandu-ADAK EAP 011';
        // }
        field(476; "Ronney Sumba Mandu-ADAK EAP 011 URL"; Text[1000])
        {
            Caption = 'Ronney Sumba Mandu-ADAK EAP 011 URL';
        }
        // field(477; "Rosemary Wanjiru Wambui-ADAK EAP 023"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Rosemary Wanjiru Wambui-ADAK EAP 023';
        // }
        field(478; "Rosemary Wanjiru Wambui-ADAK EAP 023 URL"; Text[1000])
        {
            Caption = 'Rosemary Wanjiru Wambui-ADAK EAP 023 URL';
        }
        // field(479; "Victor Ashiali Indakwa- ADAK EAP 001"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Victor Ashiali Indakwa- ADAK EAP 001';
        // }
        field(480; "Victor Ashiali Indakwa- ADAK EAP 001 URL"; Text[1000])
        {
            Caption = 'Victor Ashiali Indakwa- ADAK EAP 001 URL';
        }
        // field(481; "Vincent Owino Nyangor-ADAK EAP 017"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Vincent Owino Nyangor-ADAK EAP 017';
        // }
        field(482; "Vincent Owino Nyangor-ADAK EAP 017 URL"; Text[1000])
        {
            Caption = 'Vincent Owino Nyangor-ADAK EAP 017 URL';
        }
        // field(483; "Wycliffe Ayiga Lumadede-ADAK EAP 015"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Wycliffe Ayiga Lumadede-ADAK EAP 015';
        // }
        field(484; "Wycliffe Ayiga Lumadede-ADAK EAP 015 URL"; Text[1000])
        {
            Caption = 'Wycliffe Ayiga Lumadede-ADAK EAP 015 URL';
        }

        //Staff Personnel
        // field(485; "Abdikadir Abdi Hassan-PF.ADAK 028 (46)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Abdikadir Abdi Hassan-PF.ADAK 028 (46)';
        // }
        field(486; "Abdikadir Abdi Hassan-PF.ADAK 028 (46) URL"; Text[1000])
        {
            Caption = 'Abdikadir Abdi Hassan-PF.ADAK 028 (46) URL';
        }
        // field(487; "Alice Kinyanjui-PF.2007041031(57)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Alice Kinyanjui-PF.2007041031(57)';
        // }
        field(488; "Alice Kinyanjui-PF.2007041031(57) URL"; Text[1000])
        {
            Caption = 'Alice Kinyanjui-PF.2007041031(57) URL';
        }
        // field(489; "Anthony Kamau-PF.2008034176(3)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Anthony Kamau-PF.2008034176(3)';
        // }
        field(490; "Anthony Kamau-PF.2008034176(3) URL"; Text[1000])
        {
            Caption = 'Anthony Kamau-PF.2008034176(3) URL';
        }
        // field(491; "Betty Chege-PF. ADAK 032 (24)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Betty Chege-PF. ADAK 032 (24)';
        // }
        field(492; "Betty Chege-PF. ADAK 032 (24) URL"; Text[1000])
        {
            Caption = 'Betty Chege-PF. ADAK 032 (24) URL';
        }
        // field(493; "Bildad Kamwele-PF.ADAK 019(51)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Bildad Kamwele-PF.ADAK 019(51)';
        // }
        field(494; "Bildad Kamwele-PF.ADAK 019(51) URL"; Text[1000])
        {
            Caption = 'Bildad Kamwele-PF.ADAK 019(51) URL';
        }
        // field(495; "Brenda Nyakoa-PF.ADAK 026 (70)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Brenda Nyakoa-PF.ADAK 026 (70)';
        // }
        field(496; "Brenda Nyakoa-PF.ADAK 026 (70) URL"; Text[1000])
        {
            Caption = 'Brenda Nyakoa-PF.ADAK 026 (70) URL';
        }
        // field(497; "Brian Vita-PF.ADAK 015 (2)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Brian Vita-PF.ADAK 015 (2)';
        // }
        field(498; "Brian Vita-PF.ADAK 015 (2) URL"; Text[1000])
        {
            Caption = 'Brian Vita-PF.ADAK 015 (2) URL';
        }
        // field(499; "Cosmus Mutwiri Njagi-PF.ADAK 018(2)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Cosmus Mutwiri Njagi-PF.ADAK 018(2)';
        // }
        field(1000; "Cosmus Mutwiri Njagi-PF.ADAK 018(2) URL"; Text[1000])
        {
            Caption = 'Cosmus Mutwiri Njagi-PF.ADAK 018(2) URL';
        }
        // field(501; "Darius Peter Mwakazi-PF.ADAK 029(4)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Darius Peter Mwakazi-PF.ADAK 029(4)';
        // }
        field(502; "Darius Peter Mwakazi-PF.ADAK 029(4) URL"; Text[1000])
        {
            Caption = 'Darius Peter Mwakazi-PF.ADAK 029(4) URL';
        }
        // field(503; "Dennis Keitany-PF.ADAK.023(56)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Dennis Keitany-PF.ADAK.023(56)';
        // }
        field(504; "Dennis Keitany-PF.ADAK.023(56) URL"; Text[1000])
        {
            Caption = 'Dennis Keitany-PF.ADAK.023(56) URL';
        }
        // field(505; "Edna Koitie-PF. ADAK 003 (109)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Edna Koitie-PF. ADAK 003 (109)';
        // }
        field(506; "Edna Koitie-PF. ADAK 003 (109) URL"; Text[1000])
        {
            Caption = 'Edna Koitie-PF. ADAK 003 (109) URL';
        }
        // field(507; "Elizabeth Shali-PF.ADAK 022(6)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Elizabeth Shali-PF.ADAK 022(6)';
        // }
        field(508; "Elizabeth Shali-PF.ADAK 022(6) URL"; Text[1000])
        {
            Caption = 'Elizabeth Shali-PF.ADAK 022(6) URL';
        }
        // field(509; "Elvis Njuguna Gitau-PF.ADAK 027(47)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Elvis Njuguna Gitau-PF.ADAK 027(47)';
        // }
        field(510; "Elvis Njuguna Gitau-PF.ADAK 027(47) URL"; Text[1000])
        {
            Caption = 'Elvis Njuguna Gitau-PF.ADAK 027(47) URL';
        }
        // field(511; "Erick O. Obwogo-PF. ADAK 031 (31)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Erick O. Obwogo-PF. ADAK 031 (31)';
        // }
        field(512; "Erick O. Obwogo-PF. ADAK 031 (31) URL"; Text[1000])
        {
            Caption = 'Erick O. Obwogo-PF. ADAK 031 (31) URL';
        }
        // field(513; "Fednard Machoka-PF. ADAK 020(49)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Fednard Machoka-PF. ADAK 020(49)';
        // }
        field(514; "Fednard Machoka-PF. ADAK 020(49) URL"; Text[1000])
        {
            Caption = 'Fednard Machoka-PF. ADAK 020(49) URL';
        }
        // field(515; "Frederick M.Shikami-PF. ADAK 030(5)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Frederick M.Shikami-PF. ADAK 030(5)';
        // }
        field(516; "Frederick M.Shikami-PF. ADAK 030(5) URL"; Text[1000])
        {
            Caption = 'Frederick M.Shikami-PF. ADAK 030(5) URL';
        }
        // field(517; "Gillian Otieno-PF.ADAK 035(3)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Gillian Otieno-PF.ADAK 035(3)';
        // }
        field(518; "Gillian Otieno-PF.ADAK 035(3) URL"; Text[1000])
        {
            Caption = 'Gillian Otieno-PF.ADAK 035(3) URL';
        }
        // field(519; "Ian Lutta-PF.ADAK 036(3)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ian Lutta-PF.ADAK 036(3)';
        // }
        field(520; "Ian Lutta-PF.ADAK 036(3) URL"; Text[1000])
        {
            Caption = 'Ian Lutta-PF.ADAK 036(3) URL';
        }
        // field(521; "Karen Chelangat Wairimu-PF.ADAK 017(8)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Karen Chelangat Wairimu-PF.ADAK 017(8)';
        // }
        field(522; "Karen Chelangat Wairimu-PF.ADAK 017(8) URL"; Text[1000])
        {
            Caption = 'Karen Chelangat Wairimu-PF.ADAK 017(8) URL';
        }
        // field(523; "Kennedy Mwai-PF.ADAK 007 (5)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Kennedy Mwai-PF.ADAK 007 (5)';
        // }
        field(524; "Kennedy Mwai-PF.ADAK 007 (5) URL"; Text[1000])
        {
            Caption = 'Kennedy Mwai-PF.ADAK 007 (5) URL';
        }
        // field(525; "Martin Yauma- PF.ADAK 004(6)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Martin Yauma- PF.ADAK 004(6)';
        // }
        field(526; "Martin Yauma- PF.ADAK 004(6) URL"; Text[1000])
        {
            Caption = 'Martin Yauma- PF.ADAK 004(6) URL';
        }
        // field(527; "Mary Kairu Nyokabi-PF.ADAK 025(69)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Mary Kairu Nyokabi-PF.ADAK 025(69)';
        // }
        field(528; "Mary Kairu Nyokabi-PF.ADAK 025(69) URL"; Text[1000])
        {
            Caption = 'Mary Kairu Nyokabi-PF.ADAK 025(69) URL';
        }
        // field(529; "Monicah Makau - PF.ADAK 012(44)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Monicah Makau - PF.ADAK 012(44)';
        // }
        field(530; "Monicah Makau - PF.ADAK 012(44) URL"; Text[1000])
        {
            Caption = 'Monicah Makau - PF.ADAK 012(44) URL';
        }
        // field(531; "Patricia Nyiva-PF.2008003793(39)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Patricia Nyiva-PF.2008003793(39)';
        // }
        field(532; "Patricia Nyiva-PF.2008003793(39) URL"; Text[1000])
        {
            Caption = 'Patricia Nyiva-PF.2008003793(39) URL';
        }
        // field(533; "Peninah W. Wahome-PF.ADAK 002(6)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Peninah W. Wahome-PF.ADAK 002(6)';
        // }
        field(534; "Peninah W. Wahome-PF.ADAK 002(6) URL"; Text[1000])
        {
            Caption = 'Peninah W. Wahome-PF.ADAK 002(6) URL';
        }
        // field(535; "Peter Omwenga-PF.2009100378(9)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Peter Omwenga-PF.2009100378(9)';
        // }
        field(536; "Peter Omwenga-PF.2009100378(9) URL"; Text[1000])
        {
            Caption = 'Peter Omwenga-PF.2009100378(9) URL';
        }
        // field(537; "Ronald Amiani- PF. ADAK 011(69)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Ronald Amiani- PF. ADAK 011(69)';
        // }
        field(538; "Ronald Amiani- PF. ADAK 011(69) URL"; Text[1000])
        {
            Caption = 'Ronald Amiani- PF. ADAK 011(69) URL';
        }
        // field(539; "Sarah I. Shibutse-ADAK 034 (79)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Sarah I. Shibutse-ADAK 034 (79)';
        // }
        field(540; "Sarah I. Shibutse-ADAK 034 (79) URL"; Text[1000])
        {
            Caption = 'Sarah I. Shibutse-ADAK 034 (79) URL';
        }
        // field(541; "Simon Katee-PF.ADAK 006 (6)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Simon Katee-PF.ADAK 006 (6)';
        // }
        field(542; "Simon Katee-PF.ADAK 006 (6) URL"; Text[1000])
        {
            Caption = 'Simon Katee-PF.ADAK 006 (6) URL';
        }
        // field(543; "Stanley Mwakio Mwandagha-PF.ADAK 024(1)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Stanley Mwakio Mwandagha-PF.ADAK 024(1)';
        // }
        field(544; "Stanley Mwakio Mwandagha-PF.ADAK 024(1) URL"; Text[1000])
        {
            Caption = 'Stanley Mwakio Mwandagha-PF.ADAK 024(1) URL';
        }
        // field(545; "Vincent Alunga -PF.ADAK 016(5)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Vincent Alunga -PF.ADAK 016(5)';
        // }
        field(546; "Vincent Alunga -PF.ADAK 016(5) URL"; Text[1000])
        {
            Caption = 'Vincent Alunga -PF.ADAK 016(5) URL';
        }
        // field(547; "Vincent Ongera-PF.2008004600(84)"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Vincent Ongera-PF.2008004600(84)';
        // }
        field(548; "Vincent Ongera-PF.2008004600(84) URL"; Text[1000])
        {
            Caption = 'Vincent Ongera-PF.2008004600(84) URL';
        }
        // field(549; "Courier Services-ADAK S&C 12"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Courier Services-ADAK S&C 12';
        // }
        field(550; "Courier Services-ADAK S&C 12 URL"; Text[1000])
        {
            Caption = 'Courier Services-ADAK S&C 12 URL';
        }
        // field(551; "Laboratory matters- ADAK S&C 13"; Code[1000])
        // {
        //     TableRelation = "No. Series";
        //     Caption = 'Laboratory matters- ADAK S&C 13';
        // }
        field(552; "Laboratory matters- ADAK S&C 13 URL"; Text[1000])
        {
            Caption = 'Laboratory matters- ADAK S&C 13 URL';
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