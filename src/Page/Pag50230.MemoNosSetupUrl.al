page 50282 "Memo Nos Setup Url"
{
    ApplicationArea = All;
    Caption = 'Memo Nos Setup Url';
    PageType = Card;
    SourceTable = "Memo Nos Setup Url";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            // group(General)
            // {
            //     Caption = 'General';

            //     field("General Correspondences Nos"; Rec."General Correspondences Nos")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Incoming Correspondences Nos"; Rec."Incoming Correspondence Nos")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Correspondence Contact Nos"; Rec."Correspondence Contact Nos")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
            // SharePoint
            group("Memo Directories")
            {
                field("Administration Memos Url"; Rec."Administration Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Administration Memos Url field.', Comment = '%';
                }
                field("Audit Memo Url"; Rec."Audit Memo Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Memo Url field.', Comment = '%';
                }
                field("Corporate Communication Memo Url"; Rec."Corporate Communication Memo Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Communication Memo Url field.', Comment = '%';
                }
                field("EAP Memo Url"; Rec."EAP Memo Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EAP Memo Url field.', Comment = '%';
                }
                field("Education and Research Memo Url"; Rec."Education and Research Memo Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Education and Research Memo Url field.', Comment = '%';
                }
                field("Finance & Accounts Memos Url"; Rec."Finance & Accounts Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance & Accounts Memos Url field.', Comment = '%';
                }
                field("Human Capital Memos Url"; Rec."Human Capital Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Human Capital Memos Url field.', Comment = '%';
                }
                field("ICT Memos Url"; Rec."ICT Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Memos Url field.', Comment = '%';
                }
                field("Legal Services Memos Url"; Rec."Legal Services Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Services Memos Url field.', Comment = '%';
                }
                field("Project Files Url"; Rec."Project Files Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Files Url field.', Comment = '%';
                }
                field("Staff Personnel Files Url"; Rec."Staff Personnel Files Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Personnel Files Url field.', Comment = '%';
                }
                field("Standards and Compliance Memos Url"; Rec."Standards and Compliance Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standards and Compliance Memos Url field.', Comment = '%';
                }
                field("Supply Chain Management Memos Url"; Rec."Supply Chain Management Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supply Chain Management Memos Url field.', Comment = '%';
                }
                field("Transport Memos Url"; Rec."Transport Memos Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Memos Url field.', Comment = '%';
                }
            }
            // group("Administration Files")
            // {

            //     field("Absence from Duty - ADM7 Vol.1"; Rec."Absence from Duty - ADM7 Vol.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Absence from Duty - ADM7 Vol.1 field.', Comment = '%';
            //     }
            //     field("ADAK Acts, Rules and Policies - ADM23"; Rec."ADAK Acts, Rules and Policies - ADM23")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ADAK Acts, Rules and Policies - ADM23 field.', Comment = '%';
            //     }
            //     field("ADAK Board Members General Correspondence - ADM45"; Rec."ADAK Board Members General Correspondence - ADM45")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ADAK Board Members General Correspondence - ADM45 field.', Comment = '%';
            //     }
            //     field("ADAK Status Reports - ADM46"; Rec."ADAK Status Reports - ADM46")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ADAK Status Reports - ADM46 field.', Comment = '%';
            //     }
            //     field("Alcohol Drug Abuse - ADM51"; Rec."Alcohol Drug Abuse - ADM51")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Alcohol Drug Abuse - ADM51 field.', Comment = '%';
            //     }
            //     field("Appointments to the Board and Board Committees - ADM25"; Rec."Appointments to the Board and Board Committees - ADM25")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Appointments to the Board and Board Committees - ADM25 field.', Comment = '%';
            //     }
            //     field("Appreciations and Acknowledments - ADM10"; Rec."Appreciations and Acknowledgments - ADM10")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Appreciations and Acknowledments - ADM10 field.', Comment = '%';
            //     }
            //     field("ASK- ADM 66 VOL.1"; Rec."ASK- ADM 66 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ASK- ADM 66 VOL.1 field.', Comment = '%';
            //     }
            //     field("AU - ADM 64 VOL.1"; Rec."AU - ADM 64 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the AU - ADM 64 VOL.1 field.', Comment = '%';
            //     }
            //     field("Cabinet Secretary Directives and Circulars - ADM55"; Rec."Cabinet Secretary Directives and Circulars - ADM55")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Cabinet Secretary Directives and Circulars - ADM55 field.', Comment = '%';
            //     }
            //     field("Circulars and Directives from the Presidency - ADM42"; Rec."Circulars and Directives from the Presidency - ADM42")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Circulars and Directives from the Presidency - ADM42 field.', Comment = '%';
            //     }
            //     field("Communication Services - ADM34"; Rec."Communication Services - ADM34")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Communication Services - ADM34 field.', Comment = '%';
            //     }
            //     field("Complaints - ADM49"; Rec."Complaints - ADM49")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Complaints - ADM49 field.', Comment = '%';
            //     }
            //     field("Corporate Social Responsibility - ADM50"; Rec."Corporate Social Responsibility - ADM50")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Corporate Social Responsibility - ADM50 field.', Comment = '%';
            //     }
            //     field("Corruption Prevention Committee - ADM53"; Rec."Corruption Prevention Committee - ADM53")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Corruption Prevention Committee - ADM53 field.', Comment = '%';
            //     }
            //     field("Customer Satisfaction - ADM58"; Rec."Customer Satisfaction - ADM58")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Customer Satisfaction - ADM58 field.', Comment = '%';
            //     }
            //     field("Data Protection and Privacy- ADM 69 VOL.1"; Rec."Data Protection and Privacy- ADM 69 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Data Protection and Privacy- ADM 69 VOL.1 field.', Comment = '%';
            //     }
            //     field("Disability Mainstreaming - ADM48"; Rec."Disability Mainstreaming - ADM48")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Disability Mainstreaming - ADM48 field.', Comment = '%';
            //     }
            //     field("Establishment of ADAK - ADM2"; Rec."Establishment of ADAK - ADM2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Establishment of ADAK - ADM2 field.', Comment = '%';
            //     }
            //     field("Ethics and Integrity - ADM20"; Rec."Ethics and Integrity - ADM20")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ethics and Integrity - ADM20 field.', Comment = '%';
            //     }
            //     field("Values and Principles of Governance - ADM19"; Rec."Values and Principles of Governance - ADM19")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Values and Principles of Governance - ADM19 field.', Comment = '%';
            //     }
            //     field("Full Board Notices and Agendas - ADM27"; Rec."Full Board Notices and Agendas - ADM27")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Full Board Notices and Agendas - ADM27 field.', Comment = '%';
            //     }
            //     field("Gender and Development Committee - ADM43"; Rec."Gender and Development Committee - ADM43")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Gender and Development Committee - ADM43 field.', Comment = '%';
            //     }
            //     field("General Administration - ADM1"; Rec."General Administration - ADM1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the General Administration - ADM1 field.', Comment = '%';
            //     }
            //     field("General Circulars - ADM26"; Rec."General Circulars - ADM26")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the General Circulars - ADM26 field.', Comment = '%';
            //     }
            //     field("General Staff Meeting - ADM3"; Rec."General Staff Meeting - ADM3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the General Staff Meeting - ADM3 field.', Comment = '%';
            //     }
            //     field("Handing and Taking Over - ADM8"; Rec."Handing and Taking Over - ADM8")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Handing and Taking Over - ADM8 field.', Comment = '%';
            //     }
            //     field("HIV and AIDS Committee - ADM41"; Rec."HIV and AIDS Committee - ADM41")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the HIV and AIDS Committee - ADM41 field.', Comment = '%';
            //     }
            //     field("HOD Meeting - ADM5"; Rec."HOD Meeting - ADM5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the HOD Meeting - ADM5 field.', Comment = '%';
            //     }
            //     field("Integrity Assurance Committee - ADM56"; Rec."Integrity Assurance Committee - ADM56")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Integrity Assurance Committee - ADM56 field.', Comment = '%';
            //     }
            //     field("Invitations and Appointments - ADM9"; Rec."Invitations and Appointments - ADM9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Invitations and Appointments - ADM9 field.', Comment = '%';
            //     }
            //     field("ISO 9001 - ADM39"; Rec."ISO 9001 - ADM39")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ISO 9001 - ADM39 field.', Comment = '%';
            //     }
            //     field("Kenya Gazette Notices - ADM21"; Rec."Kenya Gazette Notices - ADM21")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Kenya Gazette Notices - ADM21 field.', Comment = '%';
            //     }
            //     field("Ministerial Meetings - ADM6"; Rec."Ministerial Meetings - ADM6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ministerial Meetings - ADM6 field.', Comment = '%';
            //     }
            //     field("National Cohesion - ADM54"; Rec."National Cohesion - ADM54")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the National Cohesion - ADM54 field.', Comment = '%';
            //     }
            //     field("NOCK - ADM 68 VOL.1"; Rec."NOCK - ADM 68 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the NOCK - ADM 68 VOL.1 field.', Comment = '%';
            //     }
            //     field("Occupational Safety and Health Committee - ADM40"; Rec."Occupational Safety and Health Committee - ADM40")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Occupational Safety and Health Committee - ADM40 field.', Comment = '%';
            //     }
            //     field("Office Accomodations - ADM16"; Rec."Office Accomodations - ADM16")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Office Accomodations - ADM16 field.', Comment = '%';
            //     }
            //     field("Office Maintenance - ADM17"; Rec."Office Maintenance - ADM17")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Office Maintenance - ADM17 field.', Comment = '%';
            //     }
            //     field("Office Security - ADM18"; Rec."Office Security - ADM18")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Office Security - ADM18 field.', Comment = '%';
            //     }
            //     field("Parliamentary Business - ADM22"; Rec."Parliamentary Business - ADM22")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Parliamentary Business - ADM22 field.', Comment = '%';
            //     }
            //     field("Partnerships - ADM33"; Rec."Partnerships - ADM33")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Partnerships - ADM33 field.', Comment = '%';
            //     }
            //     field("Partnerships and Collaborations with iNADOs-ADM 65 VOL.1"; Rec."Partnerships and Collaborations with iNADOs-ADM 65 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Partnerships and Collaborations with iNADOs-ADM 65 VOL.1 field.', Comment = '%';
            //     }
            //     field("Performance Contracts and Reports - ADM15"; Rec."Performance Contracts and Reports - ADM15")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Performance Contracts and Reports - ADM15 field.', Comment = '%';
            //     }
            //     field("PSC Circulars and Directives - ADM57"; Rec."PSC Circulars and Directives - ADM57")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the PSC Circulars and Directives - ADM57 field.', Comment = '%';
            //     }
            //     field("RADO- ADM 62 VOL.1"; Rec."RADO- ADM 62 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the RADO- ADM 62 VOL.1 field.', Comment = '%';
            //     }
            //     field("Records Management - ADM47"; Rec."Records Management - ADM47")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Records Management - ADM47 field.', Comment = '%';
            //     }
            //     field("Road Safety Mainstreaming - ADM59"; Rec."Road Safety Mainstreaming - ADM59")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Road Safety Mainstreaming - ADM59 field.', Comment = '%';
            //     }
            //     field("Seminars, Workshops and Conferences - ADM24"; Rec."Seminars, Workshops and Conferences - ADM24")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Seminars, Workshops and Conferences - ADM24 field.', Comment = '%';
            //     }
            //     field("Sporting Events and Calenders - ADM 67 VOL.1"; Rec."Sporting Events and Calendars - ADM 67 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Sporting Events and Calenders - ADM 67 VOL.1 field.', Comment = '%';
            //     }
            //     group("Sports Files")
            //     {
            //         field("Sports Organization Fedaration - ADM60"; Rec."Sports Organization Federation - ADM60")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Sports Organization Fedaration - ADM60 field.', Comment = '%';
            //         }
            //         field("Athletics Kenya - ADM60 02"; Rec."Athletics Kenya - ADM60 02")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Athletics Kenya - ADM60 02 field.', Comment = '%';
            //         }
            //         field("Badminton Kenya - ADM60 23"; Rec."Badminton Kenya - ADM60 23")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Badminton Kenya - ADM60 23 field.', Comment = '%';
            //         }
            //         field("Boxing Federation of Kenya - ADM60 27"; Rec."Boxing Federation of Kenya - ADM60 27")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Boxing Federation of Kenya - ADM60 27 field.', Comment = '%';
            //         }
            //         field("Football Kenya - ADM60 03"; Rec."Football Kenya - ADM60 03")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Football Kenya - ADM60 03 field.', Comment = '%';
            //         }
            //         field("Kenya Baseball Federation - ADM60 16"; Rec."Kenya Baseball Federation - ADM60 16")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Baseball Federation - ADM60 16 field.', Comment = '%';
            //         }
            //         field("Kenya Basketball Federation - ADM60 12"; Rec."Kenya Basketball Federation - ADM60 12")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Basketball Federation - ADM60 12 field.', Comment = '%';
            //         }
            //         field("Kenya Body Building Federation - ADM60 04"; Rec."Kenya Body Building Federation - ADM60 04")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Body Building Federation - ADM60 04 field.', Comment = '%';
            //         }
            //         field("Kenya Bowling Federation - ADM60 26"; Rec."Kenya Bowling Federation - ADM60 26")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Bowling Federation - ADM60 26 field.', Comment = '%';
            //         }
            //         field("Kenya Cycling Federation - ADM6019"; Rec."Kenya Cycling Federation - ADM6019")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Cycling Federation - ADM6019 field.', Comment = '%';
            //         }
            //         field("Kenya Golf Union- ADM60 21"; Rec."Kenya Golf Union- ADM60 21")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Golf Union- ADM60 21 field.', Comment = '%';
            //         }
            //         field("Kenya Handball Federation - ADM60 11"; Rec."Kenya Handball Federation - ADM60 11")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Handball Federation - ADM60 11 field.', Comment = '%';
            //         }
            //         field("Kenya Hockey Union - ADM60 14"; Rec."Kenya Hockey Union - ADM60 14")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Hockey Union - ADM60 14 field.', Comment = '%';
            //         }
            //         field("Kenya Judo Association - ADM60 05"; Rec."Kenya Judo Association - ADM60 05")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Judo Association - ADM60 05 field.', Comment = '%';
            //         }
            //         field("Kenya Kabaddi Sports Federation - ADM60 18"; Rec."Kenya Kabaddi Sports Federation - ADM60 18")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Kabaddi Sports Federation - ADM60 18 field.', Comment = '%';
            //         }
            //         field("Kenya Karate Federation - ADM60 10"; Rec."Kenya Karate Federation - ADM60 10")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Karate Federation - ADM60 10 field.', Comment = '%';
            //         }
            //         field("Kenya National Paralympic  - ADM60 08"; Rec."Kenya National Paralympic  - ADM60 08")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya National Paralympic  - ADM60 08 field.', Comment = '%';
            //         }
            //         field("Kenya Netball Federation - ADM60 20"; Rec."Kenya Netball Federation - ADM60 20")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Netball Federation - ADM60 20 field.', Comment = '%';
            //         }
            //         field("Kenya Rowing and Canoe Association - ADM60 09"; Rec."Kenya Rowing and Canoe Association - ADM60 09")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Rowing and Canoe Association - ADM60 09 field.', Comment = '%';
            //         }
            //         field("Kenya Rugby Union - ADM60 07"; Rec."Kenya Rugby Union - ADM60 07")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Rugby Union - ADM60 07 field.', Comment = '%';
            //         }
            //         field("Kenya Shooting Federation - ADM60 28"; Rec."Kenya Shooting Federation - ADM60 28")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Shooting Federation - ADM60 28 field.', Comment = '%';
            //         }
            //         field("Kenya Squash Rackets Association - ADM60 22"; Rec."Kenya Squash Rackets Association - ADM60 22")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Squash Rackets Association - ADM60 22 field.', Comment = '%';
            //         }
            //         field("Kenya Swimming Federation - ADM60 17"; Rec."Kenya Swimming Federation - ADM60 17")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Swimming Federation - ADM60 17 field.', Comment = '%';
            //         }
            //         field("Kenya Table Tennis Federation - ADM60 13"; Rec."Kenya Table Tennis Federation - ADM60 13")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Table Tennis Federation - ADM60 13 field.', Comment = '%';
            //         }
            //         field("Kenya Triathlon Federation - ADM60 25"; Rec."Kenya Triathlon Federation - ADM60 25")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Triathlon Federation - ADM60 25 field.', Comment = '%';
            //         }
            //         field("Kenya Volleyball Federation - ADM60 06"; Rec."Kenya Volleyball Federation - ADM60 06")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Volleyball Federation - ADM60 06 field.', Comment = '%';
            //         }
            //         field("Kenya Weight Lifting Association - ADM60 15"; Rec."Kenya Weight Lifting Association - ADM60 15")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Kenya Weight Lifting Association - ADM60 15 field.', Comment = '%';
            //         }
            //         field("Tennis Kenya  - ADM60 24"; Rec."Tennis Kenya  - ADM60 24")
            //         {
            //             ApplicationArea = Basic;
            //             ToolTip = 'Specifies the value of the Tennis Kenya  - ADM60 24 field.', Comment = '%';
            //         }
            //     }
            //     field("Staff Welfare - ADM13"; Rec."Staff Welfare - ADM13")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Staff Welfare - ADM13 field.', Comment = '%';
            //     }
            //     field("Strategic Plans - ADM11"; Rec."Strategic Plans - ADM11")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Strategic Plans - ADM11 field.', Comment = '%';
            //     }
            //     field("Strategy Planning and Corporate Governance - ADM35"; Rec."Strategy Planning and Corporate Governance - ADM35")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Strategy Planning and Corporate Governance - ADM35 field.', Comment = '%';
            //     }
            //     field("Travel Clearance - ADM12"; Rec."Travel Clearance - ADM12")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Travel Clearance - ADM12 field.', Comment = '%';
            //     }
            //     field("UNESCO - ADM 63 VOL.1"; Rec."UNESCO - ADM 63 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the UNESCO - ADM 63 VOL.1 field.', Comment = '%';
            //     }
            //     field("Vision 2030 - ADM52"; Rec."Vision 2030 - ADM52")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Vision 2030 - ADM52 field.', Comment = '%';
            //     }
            //     field("WADA-ADM 61 VOL.1"; Rec."WADA-ADM 61 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the WADA-ADM 61 VOL.1 field.', Comment = '%';
            //     }
            //     field("Workplans - ADM14"; Rec."Workplans - ADM14")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Workplans - ADM14 field.', Comment = '%';
            //     }
            // }
            // group("Audit Files")
            // {

            //     field("Audit and Risk Management Committee(notices)-ADAK AUD 1"; Rec."Audit and Risk Management Committee(notices)-ADAK AUD 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Audit and Risk Management Committee(notices)-ADAK AUD 1 field.', Comment = '%';
            //     }
            //     field("Audit General- ADAK AUD 9"; Rec."Audit General- ADAK AUD 9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Audit General- ADAK AUD 9 field.', Comment = '%';
            //     }
            //     field("Internal Audit Education and Research reports-ADAK AUD 3"; Rec."Internal Audit Education and Research reports-ADAK AUD 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internal Audit Education and Research reports-ADAK AUD 3 field.', Comment = '%';
            //     }
            //     field("Internal Audit Finance and Accounts reports-ADAK AUD 8"; Rec."Internal Audit Finance and Accounts reports-ADAK AUD 8")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internal Audit Finance and Accounts reports-ADAK AUD 8 field.', Comment = '%';
            //     }
            //     field("Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3"; Rec."Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3 field.', Comment = '%';
            //     }
            //     field("Internal Audit Legal Services reports-ADAK AUD 6"; Rec."Internal Audit Legal Services reports-ADAK AUD 6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internal Audit Legal Services reports-ADAK AUD 6 field.', Comment = '%';
            //     }
            //     field("Internal Audit Standards and Compliance reports-ADAK AUD 4"; Rec."Internal Audit Standards and Compliance reports-ADAK AUD 4")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internal Audit Standards and Compliance reports-ADAK AUD 4 field.', Comment = '%';
            //     }
            //     field("Internal Audit Supply Chain reports-ADAK AUD 7"; Rec."Internal Audit Supply Chain reports-ADAK AUD 7")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internal Audit Supply Chain reports-ADAK AUD 7 field.', Comment = '%';
            //     }
            // }
            // group("Corporate Communication Files")
            // {

            //     field("Advertising and Publicity-ADAK COM 4"; Rec."Advertising and Publicity-ADAK COM 4")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Advertising and Publicity-ADAK COM 4 field.', Comment = '%';
            //     }
            //     field("Branding- ADAK COM 7"; Rec."Branding- ADAK COM 7")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Branding- ADAK COM 7 field.', Comment = '%';
            //     }
            //     field("CSR-ADAK COM 3"; Rec."CSR-ADAK COM 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the CSR-ADAK COM 3 field.', Comment = '%';
            //     }
            //     field("Customer Feedback Reports- ADAK COM 5"; Rec."Customer Feedback Reports- ADAK COM 5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Customer Feedback Reports- ADAK COM 5 field.', Comment = '%';
            //     }
            //     field("General Communication- ADAK COM 1"; Rec."General Communication- ADAK COM 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the General Communication- ADAK COM 1 field.', Comment = '%';
            //     }
            //     field("Newsletters and Publications-ADAK COM 8"; Rec."Newsletters and Publications-ADAK COM 8")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Newsletters and Publications-ADAK COM 8 field.', Comment = '%';
            //     }
            //     field("Press Cutting-ADAK COM 10"; Rec."Press Cutting-ADAK COM 10")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Press Cutting-ADAK COM 10 field.', Comment = '%';
            //     }
            //     field("Press Releases-ADAK COM 9"; Rec."Press Releases-ADAK COM 9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Press Releases- ADAK COM 9 field.', Comment = '%';
            //     }
            //     field("Shows and Exhibitions- ADAK COM 2"; Rec."Shows and Exhibitions- ADAK COM 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Shows and Exhibitions- ADAK COM 2 field.', Comment = '%';
            //     }
            //     field("Speeches - ADAK COM 6"; Rec."Speeches - ADAK COM 6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Speeches - ADAK COM 6 field.', Comment = '%';
            //     }
            // }
            // group("Education and Research Files")
            // {

            //     field("Anti-Doping Educators- ADAK E&R 9"; Rec."Anti-Doping Educators- ADAK E&R 9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Anti-Doping Educators- ADAK E&R 9 field.', Comment = '%';
            //     }
            //     field("Anti-Doping Value Based Education- ADAK E&R 5"; Rec."Anti-Doping Value Based Education- ADAK E&R 5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Anti-Doping Value Based Education- ADAK E&R 5 field.', Comment = '%';
            //     }
            //     field("Anti-Doping Research Proposals & Reports- ADAK E&R 10"; Rec."Anti-Doping Research Proposals & Reports- ADAK E&R 10")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Anti-Doping Research Proposals & Reports- ADAK E&R 10 field.', Comment = '%';
            //     }
            //     field("Anti-Doping workshop programmes- ADAK E&R 1 VOL.1"; Rec."Anti-Doping workshop programmes- ADAK E&R 1 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Anti-Doping workshop programmes- ADAK E&R 1 VOL.1 field.', Comment = '%';
            //     }
            //     field("Research and Development- ADAK E&R 7"; Rec."Research and Development- ADAK E&R 7")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Research and Development- ADAK E&R 7 field.', Comment = '%';
            //     }
            // }
            // group("Finance and Accounts Files")
            // {

            //     field("Audited Financial Statements and Reports  - FIN14"; Rec."Audited Financial Statements and Reports - FIN14")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Audited Financial Statements and Reports  - FIN14 field.', Comment = '%';
            //     }
            //     field("Bad Debts and Write-offs - FIN20"; Rec."Bad Debts and Write-offs - FIN20")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Bad Debts and Write-offs - FIN20 field.', Comment = '%';
            //     }
            //     field("Board Expenditure - FIN10"; Rec."Board Expenditure - FIN10")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Board Expenditure - FIN10 field.', Comment = '%';
            //     }
            //     field("Board of Survey Finance - FIN15"; Rec."Board of Survey Finance - FIN15")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Board of Survey Finance - FIN15 field.', Comment = '%';
            //     }
            //     field("Budgets and Estimates - FIN 7"; Rec."Budgets and Estimates - FIN 7")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Budgets and Estimates - FIN 7 field.', Comment = '%';
            //     }
            //     field("Expenditure Control - FIN8"; Rec."Expenditure Control - FIN8")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Expenditure Control - FIN8 field.', Comment = '%';
            //     }
            //     field("Finance General- FIN 1"; Rec."Finance General - FIN 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Finance General- FIN 1 field.', Comment = '%';
            //     }
            //     field("Finance Statements and Reports - FIN13"; Rec."Finance Statements and Reports - FIN13")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Finance Statements and Reports - FIN13 field.', Comment = '%';
            //     }
            //     field("Finance and General Purpose Committee Notices - FIN17"; Rec."Finance and General Purpose Committee Notices - FIN17")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Finance and General Purpose Committee Notices - FIN17 field.', Comment = '%';
            //     }
            //     field("Government Grants- FIN 2"; Rec."Government Grants - FIN 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Government Grants- FIN 2 field.', Comment = '%';
            //     }
            //     field("Imprest and Advances - FIN9"; Rec."Imprest and Advances - FIN9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Imprest and Advances - FIN9 field.', Comment = '%';
            //     }
            //     field("MTEF- FIN 6"; Rec."MTEF - FIN 6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the MTEF- FIN 6 field.', Comment = '%';
            //     }
            //     field("National Treasury Circulars - FIN19"; Rec."National Treasury Circulars - FIN19")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the National Treasury Circulars - FIN19 field.', Comment = '%';
            //     }
            //     field("Other Grants- FIN 3"; Rec."Other Grants - FIN 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Other Grants- FIN 3 field.', Comment = '%';
            //     }
            //     field("Pending Bills - FIN11"; Rec."Pending Bills - FIN11")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Pending Bills - FIN11 field.', Comment = '%';
            //     }
            //     field("Statutory Obligation Reports - FIN12"; Rec."Statutory Obligation Reports - FIN12")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Statutory Obligation Reports - FIN12 field.', Comment = '%';
            //     }
            //     field("Tax Matters - FIN21"; Rec."Tax Matters - FIN21")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Tax Matters - FIN21 field.', Comment = '%';
            //     }
            // }
            // group("Human Capital Files")
            // {

            //     field("Casual engagements- HCM 5"; Rec."Casual engagements- HCM 5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Casual engagements- HCM 5 field.', Comment = '%';
            //     }
            //     field("Cleaning Services-HCM 21"; Rec."Cleaning Services-HCM 21")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Cleaning Services-HCM 21 field.', Comment = '%';
            //     }
            //     field("Deployment and Secondment of staff - HCM 7"; Rec."Deployment and Secondment of staff - HCM 7")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Deployment and Secondment of staff - HCM 7 field.', Comment = '%';
            //     }
            //     field("HCM BOARD Committee (papers)-HCM 22"; Rec."HCM BOARD Committee (papers)-HCM 22")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the HCM BOARD Committee (papers)-HCM 22 field.', Comment = '%';
            //     }
            //     field("Human Capital Advisory Committee(Notices)- HCM 28"; Rec."Human Capital Advisory Committee(Notices)- HCM 28")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Human Capital Advisory Committee(Notices)- HCM 28 field.', Comment = '%';
            //     }
            //     field("Human Capital Disciplinary Committee-HCM 35"; Rec."Human Capital Disciplinary Committee-HCM 34")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Human Capital Disciplinary Committee-HCM 35 field.', Comment = '%';
            //     }
            //     field("Human Capital Management Board Committee(notices) -HCM 22"; Rec."Human Capital Management Board Committee(notices) -HCM 22")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Human Capital Management Board Committee(notices) -HCM 22 field.', Comment = '%';
            //     }
            //     field("Human Resource Circulars - HCM 12"; Rec."Human Resource Circulars - HCM 12")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Human Resource Circulars - HCM 12 field.', Comment = '%';
            //     }
            //     field("Human Resource Payroll Information - HCM 14"; Rec."Human Resource Payroll Information - HCM 14")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Human Resource Payroll Information - HCM 14 field.', Comment = '%';
            //     }
            //     field("Induction-HCM 36"; Rec."Induction-HCM 36")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Induction-HCM 36 field.', Comment = '%';
            //     }
            //     field("Industrial Attachments - HCM 17"; Rec."Industrial Attachments - HCM 17")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Industrial Attachments - HCM 17 field.', Comment = '%';
            //     }
            //     field("Insurance Matters- HCM 35"; Rec."Insurance Matters- HCM 35")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Insurance Matters- HCM 35 field.', Comment = '%';
            //     }
            //     field("Internships - HCM 18"; Rec."Internships - HCM 18")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Internships - HCM 18 field.', Comment = '%';
            //     }
            //     field("Pensions and Gratuity - HCM 15"; Rec."Pensions and Gratuity - HCM 15")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Pensions and Gratuity - HCM 15 field.', Comment = '%';
            //     }
            //     field("Performance Evaluation and Appraisal -HCM 9"; Rec."Performance Evaluation and Appraisal -HCM 9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Performance Evaluation and Appraisal -HCM 9 field.', Comment = '%';
            //     }
            //     field("Professional Associations - HCM 20"; Rec."Professional Associations - HCM 20")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Professional Associations - HCM 20 field.', Comment = '%';
            //     }
            //     field("Recruitment and Appointments - HCM 3"; Rec."Recruitment and Appointments - HCM 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Recruitment and Appointments - HCM 3 field.', Comment = '%';
            //     }
            //     field("Salary and Remuneration(SRC)-HCM 8"; Rec."Salary and Remuneration(SRC)-HCM 8")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Salary and Remuneration(SRC)-HCM 8 field.', Comment = '%';
            //     }
            //     field("Staff Leave - HCM 11"; Rec."Staff Leave - HCM 11")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Staff Leave - HCM 11 field.', Comment = '%';
            //     }
            //     field("Staff Matters - HCM 1 VOL.1"; Rec."Staff Matters - HCM 1 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Staff Matters - HCM 1 VOL.1 field.', Comment = '%';
            //     }
            //     field("Staff Training - HCM 16"; Rec."Staff Training - HCM 16")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Staff Training - HCM 16 field.', Comment = '%';
            //     }
            //     field("State Corporation Advisory Committee(SCAC)-HCM 19"; Rec."State Corporation Advisory Committee(SCAC)-HCM 19")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the State Corporation Advisory Committee(SCAC)-HCM 19 field.', Comment = '%';
            //     }
            //     field("Statutory Deductions - HCM 13"; Rec."Statutory Deductions - HCM 13")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Statutory Deductions - HCM 13 field.', Comment = '%';
            //     }
            // }
            // group(OtherFiles)
            // {

            //     field("Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1"; Rec."Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1 field.', Comment = '%';
            //     }
            //     field("Enhanced Anti-Doping General-ADAK EAP 1 VOL.1"; Rec."Enhanced Anti-Doping General-ADAK EAP 1 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Enhanced Anti-Doping General-ADAK EAP 1 VOL.1 field.', Comment = '%';
            //     }
            //     field("Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1"; Rec."Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1 field.', Comment = '%';
            //     }
            //     field("Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II"; Rec."Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II field.', Comment = '%';
            //     }
            //     field("Monitoring Pool-ADAK EAP 6"; Rec."Monitoring Pool-ADAK EAP 6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Monitoring Pool-ADAK EAP 6 field.', Comment = '%';
            //     }
            //     field("Office Accommodation Eldoret-ADAK EAP 4 VOL.1"; Rec."Office Accommodation Eldoret-ADAK EAP 4 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Office Accommodation Eldoret-ADAK EAP 4 VOL.1 field.', Comment = '%';
            //     }
            // }
            // group("ICT Files")
            // {
            //     field("ICT Equipments and Services-ADAK ICT 2"; Rec."ICT Equipments and Services-ADAK ICT 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ICT Equipments and Services-ADAK ICT 2 field.', Comment = '%';
            //     }
            //     field("ICT Internal Support- ADAK ICT 3"; Rec."ICT Internal Support- ADAK ICT 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ICT Internal Support- ADAK ICT 3 field.', Comment = '%';
            //     }
            //     field("ICT Projects-ADAK ICT 5"; Rec."ICT Projects-ADAK ICT 5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ICT Projects-ADAK ICT 5 field.', Comment = '%';
            //     }
            //     field("ISMS-ADAK ICT 4"; Rec."ISMS-ADAK ICT 4")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ISMS-ADAK ICT 4 field.', Comment = '%';
            //     }
            //     field("Website Matters- ADAK ICT 1"; Rec."Website Matters- ADAK ICT 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Website Matters- ADAK ICT 1 field.', Comment = '%';
            //     }
            // }
            // group("Legal Files")
            // {

            //     field("Legal Matters Correspondences-ADAK LEG 1"; Rec."Legal Matters Correspondences-ADAK LEG 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Legal Matters Correspondences-ADAK LEG 1 field.', Comment = '%';
            //     }
            //     field("Legal Opinions and Advisories(internal)-ADAK LEG 9"; Rec."Legal Opinions and Advisories(internal)-ADAK LEG 9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Legal Opinions and Advisories(internal)-ADAK LEG 9 field.', Comment = '%';
            //     }
            //     field("Attorney General Matters-ADAK LEG 2"; Rec."Attorney General Matters-ADAK LEG 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Attorney General Matters-ADAK LEG 2 field.', Comment = '%';
            //     }
            // }
            // group("Personnel Files")
            // {
            //     field("Abdikadir Abdi Hassan-PF.ADAK 028 (46)"; Rec."Abdikadir Abdi Hassan-PF.ADAK 028 (46)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Abdikadir Abdi Hassan-PF.ADAK 028 (46) field.', Comment = '%';
            //     }
            //     field("Alice Kinyanjui-PF.2007041031(57)"; Rec."Alice Kinyanjui-PF.2007041031(57)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Alice Kinyanjui-PF.2007041031(57) field.', Comment = '%';
            //     }
            //     field("Anthony Kamau-PF.2008034176(3)"; Rec."Anthony Kamau-PF.2008034176(3)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Anthony Kamau-PF.2008034176(3) field.', Comment = '%';
            //     }
            //     field("Betty Chege-PF. ADAK 032 (24)"; Rec."Betty Chege-PF. ADAK 032 (24)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Betty Chege-PF. ADAK 032 (24) field.', Comment = '%';
            //     }
            //     field("Bildad Kamwele-PF.ADAK 019(51)"; Rec."Bildad Kamwele-PF.ADAK 019(51)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Bildad Kamwele-PF.ADAK 019(51) field.', Comment = '%';
            //     }
            //     field("Brenda Nyakoa-PF.ADAK 026 (70)"; Rec."Brenda Nyakoa-PF.ADAK 026 (70)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Brenda Nyakoa-PF.ADAK 026 (70) field.', Comment = '%';
            //     }
            //     field("Brian Vita-PF.ADAK 015 (2)"; Rec."Brian Vita-PF.ADAK 015 (2)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Brian Vita-PF.ADAK 015 (2) field.', Comment = '%';
            //     }
            //     field("Cosmus Mutwiri Njagi-PF.ADAK 018(2)"; Rec."Cosmus Mutwiri Njagi-PF.ADAK 018(2)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Cosmus Mutwiri Njagi-PF.ADAK 018(2) field.', Comment = '%';
            //     }
            //     field("Darius Peter Mwakazi-PF.ADAK 029(4)"; Rec."Darius Peter Mwakazi-PF.ADAK 029(4)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Darius Peter Mwakazi-PF.ADAK 029(4) field.', Comment = '%';
            //     }
            //     field("Dennis Keitany-PF.ADAK.023(56)"; Rec."Dennis Keitany-PF.ADAK.023(56)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Dennis Keitany-PF.ADAK.023(56) field.', Comment = '%';
            //     }
            //     field("Edna Koitie-PF. ADAK 003 (109)"; Rec."Edna Koitie-PF. ADAK 003 (109)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Edna Koitie-PF. ADAK 003 (109) field.', Comment = '%';
            //     }
            //     field("Elizabeth Shali-PF.ADAK 022(6)"; Rec."Elizabeth Shali-PF.ADAK 022(6)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Elizabeth Shali-PF.ADAK 022(6) field.', Comment = '%';
            //     }
            //     field("Elvis Njuguna Gitau-PF.ADAK 027(47)"; Rec."Elvis Njuguna Gitau-PF.ADAK 027(47)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Elvis Njuguna Gitau-PF.ADAK 027(47) field.', Comment = '%';
            //     }
            //     field("Erick O. Obwogo-PF. ADAK 031 (31)"; Rec."Erick O. Obwogo-PF. ADAK 031 (31)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Erick O. Obwogo-PF. ADAK 031 (31) field.', Comment = '%';
            //     }
            //     field("Fednard Machoka-PF. ADAK 020(49)"; Rec."Fednard Machoka-PF. ADAK 020(49)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Fednard Machoka-PF. ADAK 020(49) field.', Comment = '%';
            //     }
            //     field("Frederick M.Shikami-PF. ADAK 030(5)"; Rec."Frederick M.Shikami-PF. ADAK 030(5)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Frederick M.Shikami-PF. ADAK 030(5) field.', Comment = '%';
            //     }
            //     field("Gillian Otieno-PF.ADAK 035(3)"; Rec."Gillian Otieno-PF.ADAK 035(3)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Gillian Otieno-PF.ADAK 035(3) field.', Comment = '%';
            //     }
            //     field("Ian Lutta-PF.ADAK 036(3)"; Rec."Ian Lutta-PF.ADAK 036(3)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ian Lutta-PF.ADAK 036(3) field.', Comment = '%';
            //     }
            //     field("Joseph Kithisya Mbithi-024"; Rec."Joseph Kithisya Mbithi-024")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Joseph Kithisya Mbithi-024 field.', Comment = '%';
            //     }
            //     field("Karen Chelangat Wairimu-PF.ADAK 017(8)"; Rec."Karen Chelangat Wairimu-PF.ADAK 017(8)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Karen Chelangat Wairimu-PF.ADAK 017(8) field.', Comment = '%';
            //     }
            //     field("Kennedy Mwai-PF.ADAK 007 (5)"; Rec."Kennedy Mwai-PF.ADAK 007 (5)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Kennedy Mwai-PF.ADAK 007 (5) field.', Comment = '%';
            //     }
            //     field("Martin Yauma- PF.ADAK 004(6)"; Rec."Martin Yauma- PF.ADAK 004(6)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Martin Yauma- PF.ADAK 004(6) field.', Comment = '%';
            //     }
            //     field("Mary Kairu Nyokabi-PF.ADAK 025(69)"; Rec."Mary Kairu Nyokabi-PF.ADAK 025(69)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Mary Kairu Nyokabi-PF.ADAK 025(69) field.', Comment = '%';
            //     }
            //     field("Monicah Makau - PF.ADAK 012(44)"; Rec."Monicah Makau - PF.ADAK 012(44)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Monicah Makau - PF.ADAK 012(44) field.', Comment = '%';
            //     }
            //     field("Patricia Nyiva-PF.2008003793(39)"; Rec."Patricia Nyiva-PF.2008003793(39)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Patricia Nyiva-PF.2008003793(39) field.', Comment = '%';
            //     }
            //     field("Peninah W. Wahome-PF.ADAK 002(6)"; Rec."Peninah W. Wahome-PF.ADAK 002(6)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Peninah W. Wahome-PF.ADAK 002(6) field.', Comment = '%';
            //     }
            //     field("Peter Omwenga-PF.2009100378(9)"; Rec."Peter Omwenga-PF.2009100378(9)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Peter Omwenga-PF.2009100378(9) field.', Comment = '%';
            //     }
            //     field("Ronald Amiani- PF. ADAK 011(69)"; Rec."Ronald Amiani- PF. ADAK 011(69)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ronald Amiani- PF. ADAK 011(69) field.', Comment = '%';
            //     }
            //     field("Sarah I. Shibutse-ADAK 034 (79)"; Rec."Sarah I. Shibutse-ADAK 034 (79)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Sarah I. Shibutse-ADAK 034 (79) field.', Comment = '%';
            //     }
            //     field("Simon Katee-PF.ADAK 006 (6)"; Rec."Simon Katee-PF.ADAK 006 (6)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Simon Katee-PF.ADAK 006 (6) field.', Comment = '%';
            //     }
            //     field("Stanley Mwakio Mwandagha-PF.ADAK 024(1)"; Rec."Stanley Mwakio Mwandagha-PF.ADAK 024(1)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Stanley Mwakio Mwandagha-PF.ADAK 024(1) field.', Comment = '%';
            //     }
            //     field("Vincent Alunga -PF.ADAK 016(5)"; Rec."Vincent Alunga -PF.ADAK 016(5)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Vincent Alunga -PF.ADAK 016(5) field.', Comment = '%';
            //     }
            //     field("Vincent Ongera-PF.2008004600(84)"; Rec."Vincent Ongera-PF.2008004600(84)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Vincent Ongera-PF.2008004600(84) field.', Comment = '%';
            //     }
            // }
            // group("EAP Files")
            // {
            //     field("Adlif James Khalonyere-ADAK EAP 007"; Rec."Adlif James Khalonyere-ADAK EAP 007")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Adlif James Khalonyere-ADAK EAP 007 field.', Comment = '%';
            //     }
            //     field("Ann Wairimu-ADAK EAP 004"; Rec."Ann Wairimu-ADAK EAP 004")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ann Wairimu-ADAK EAP 004 field.', Comment = '%';
            //     }
            //     field("Catherine Mkabahati Shegu-ADAK EAP 009"; Rec."Catherine Mkabahati Shegu-ADAK EAP 009")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Catherine Mkabahati Shegu-ADAK EAP 009 field.', Comment = '%';
            //     }
            //     field("Chriss Carlos Mwachia-ADAK EAP 020"; Rec."Chriss Carlos Mwachia-ADAK EAP 020")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Chriss Carlos Mwachia-ADAK EAP 020 field.', Comment = '%';
            //     }
            //     field("Daisy Chebet Kurgat-ADAK EAP 026"; Rec."Daisy Chebet Kurgat-ADAK EAP 026")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Daisy Chebet Kurgat-ADAK EAP 026 field.', Comment = '%';
            //     }
            //     field("Dalacha Iram Gheneti-ADAK EAP 013"; Rec."Dalacha Iram Gheneti-ADAK EAP 013")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Dalacha Iram Gheneti-ADAK EAP 013 field.', Comment = '%';
            //     }
            //     field("Damaris Njeri Wanjiru-ADAK EAP 016"; Rec."Damaris Njeri Wanjiru-ADAK EAP 016")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Damaris Njeri Wanjiru-ADAK EAP 016 field.', Comment = '%';
            //     }
            //     field("Diana Langat-ADAK EAP 025"; Rec."Diana Langat-ADAK EAP 025")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Diana Langat-ADAK EAP 025 field.', Comment = '%';
            //     }
            //     field("Emily Karimi Mwirigi-ADAK EAP 014"; Rec."Emily Karimi Mwirigi-ADAK EAP 014")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Emily Karimi Mwirigi-ADAK EAP 014 field.', Comment = '%';
            //     }
            //     field("Esther Wambui Kihara-ADAK EAP 021"; Rec."Esther Wambui Kihara-ADAK EAP 021")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Esther Wambui Kihara-ADAK EAP 021 field.', Comment = '%';
            //     }
            //     field("Gibson Ronoh-ADAK EAP 002"; Rec."Gibson Ronoh-ADAK EAP 002")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Gibson Ronoh-ADAK EAP 002 field.', Comment = '%';
            //     }
            //     field("Gladwel Obaga Bitutu-ADAK EAP 008"; Rec."Gladwel Obaga Bitutu-ADAK EAP 008")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Gladwel Obaga Bitutu-ADAK EAP 008 field.', Comment = '%';
            //     }
            //     field("Grace Wanjiru Ngugi-ADAK EAP 010"; Rec."Grace Wanjiru Ngugi-ADAK EAP 010")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Grace Wanjiru Ngugi-ADAK EAP 010 field.', Comment = '%';
            //     }
            //     field("Januaris Ngemu Nicholas-ADAK EAP 012"; Rec."Januaris Ngemu Nicholas-ADAK EAP 012")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Januaris Ngemu Nicholas-ADAK EAP 012 field.', Comment = '%';
            //     }
            //     field("Kipkoech Laban-ADAK EAP 022"; Rec."Kipkoech Laban-ADAK EAP 022")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Kipkoech Laban-ADAK EAP 022 field.', Comment = '%';
            //     }
            //     field("Maryanne Waithera Mwaura-ADAK EAP 006"; Rec."Maryanne Waithera Mwaura-ADAK EAP 006")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Maryanne Waithera Mwaura-ADAK EAP 006 field.', Comment = '%';
            //     }
            //     field("Mildred Ondoi-ADAK EAP 019"; Rec."Mildred Ondoi-ADAK EAP 019")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Mildred Ondoi-ADAK EAP 019 field.', Comment = '%';
            //     }
            //     field("Morris Mugambi-ADAK EAP 027"; Rec."Morris Mugambi-ADAK EAP 027")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Morris Mugambi-ADAK EAP 027 field.', Comment = '%';
            //     }
            //     field("Ong'inti Anyona Dennis-ADAK EAP 018"; Rec."Ong'inti Anyona Dennis-ADAK EAP 018")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ong''inti Anyona Dennis-ADAK EAP 018 field.', Comment = '%';
            //     }
            //     field("Phyllis Nduta Mwangi-ADAK EAP 005"; Rec."Phyllis Nduta Mwangi-ADAK EAP 005")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Phyllis Nduta Mwangi-ADAK EAP 005 field.', Comment = '%';
            //     }
            //     field("Remicus Asitaka L. Khamasi-ADAK EAP 003"; Rec."Remicus Asitaka L. Khamasi-ADAK EAP 003")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Remicus Asitaka L. Khamasi-ADAK EAP 003 field.', Comment = '%';
            //     }
            //     field("Ronney Sumba Mandu-ADAK EAP 011"; Rec."Ronney Sumba Mandu-ADAK EAP 011")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Ronney Sumba Mandu-ADAK EAP 011 field.', Comment = '%';
            //     }
            //     field("Rosemary Wanjiru Wambui-ADAK EAP 023"; Rec."Rosemary Wanjiru Wambui-ADAK EAP 023")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Rosemary Wanjiru Wambui-ADAK EAP 023 field.', Comment = '%';
            //     }
            //     field("Victor Ashiali Indakwa- ADAK EAP 001"; Rec."Victor Ashiali Indakwa- ADAK EAP 001")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Victor Ashiali Indakwa- ADAK EAP 001 field.', Comment = '%';
            //     }
            //     field("Vincent Owino Nyangor-ADAK EAP 017"; Rec."Vincent Owino Nyangor-ADAK EAP 017")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Vincent Owino Nyangor-ADAK EAP 017 field.', Comment = '%';
            //     }
            //     field("Wycliffe Ayiga Lumadede-ADAK EAP 015"; Rec."Wycliffe Ayiga Lumadede-ADAK EAP 015")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Wycliffe Ayiga Lumadede-ADAK EAP 015 field.', Comment = '%';
            //     }
            // }
            // group("Standards and Compliance Files")
            // {

            //     field("RTP-ADAK S&C 9 (VOL III)"; Rec."RTP-ADAK S&C 9 (VOL III)")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the RTP-ADAK S&C 9 field.', Comment = '%';
            //     }
            //     field("S&C Departmental meetings- ADAK S&C 15"; Rec."S&C Departmental meetings- ADAK S&C 15")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the S&C Departmental meetings- ADAK S&C 15 field.', Comment = '%';
            //     }
            //     field("Sample Collection Personnel Training-ADAK S&C 6"; Rec."Sample Collection Personnel Training-ADAK S&C 6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Sample Collection Personnel Training-ADAK S&C 6 field.', Comment = '%';
            //     }
            //     field("Sample Collection Personnel-ADAK S&C 5"; Rec."Sample Collection Personnel-ADAK S&C 5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Sample Collection Personnel-ADAK S&C 5 field.', Comment = '%';
            //     }
            //     field("Sports Federations Compliance Audit-ADAK S&C 10"; Rec."Sports Federations Compliance Audit-ADAK S&C 10")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Sports Federations Compliance Audit-ADAK S&C 10 field.', Comment = '%';
            //     }
            //     field("Standards & Compliance General-ADAK S&C 1"; Rec."Standards & Compliance General-ADAK S&C 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Standards & Compliance General-ADAK S&C 1 field.', Comment = '%';
            //     }
            //     field("TUE- ADAK S&C 2"; Rec."TUE- ADAK S&C 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TUE- ADAK S&C 2 field.', Comment = '%';
            //     }
            //     field("Courier Services-ADAK S&C 12"; Rec."Courier Services-ADAK S&C 12")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Courier Services-ADAK S&C 12 field.', Comment = '%';
            //     }
            //     field("Laboratory matters- ADAK S&C 13"; Rec."Laboratory matters- ADAK S&C 13")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Laboratory matters- ADAK S&C 13 field.', Comment = '%';
            //     }
            // }
            // group("Supply Chain Management Files")
            // {

            //     field("Appointment to ADHOC Procurement Committee- ADAK SCM 5"; Rec."Appointment to ADHOC Procurement Committee- ADAK SCM 5")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Appointment to ADHOC procurement committee- ADAK SCM 5 field.', Comment = '%';
            //     }
            //     field("Procurement Plan-ADAK SCM 11"; Rec."Procurement Plan-ADAK SCM 11")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Procurement Plan-ADAK SCM 11 field.', Comment = '%';
            //     }
            //     field("Procurement of Goods-ADAK SCM 1"; Rec."Procurement of Goods-ADAK SCM 1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Procurement of Goods-ADAK SCM 1 field.', Comment = '%';
            //     }
            //     field("Procurement of works- ADAK SCM 3"; Rec."Procurement of works- ADAK SCM 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Procurement of works- ADAK SCM 3 field.', Comment = '%';
            //     }
            //     field("Procurement of services-ADAK SCM 2"; Rec."Procurement of services-ADAK SCM 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Procurement of services-ADAK SCM 2 field.', Comment = '%';
            //     }
            //     field("Procurement of Motor vehicle-ADAK SCM 4"; Rec."Procurement of Motor vehicle-ADAK SCM 4")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Procurement of Motor vehicle-ADAK SCM 4 field.', Comment = '%';
            //     }
            //     field("Procurement Policy and Circulars-ADAK SCM 9"; Rec."Procurement Policy and Circulars-ADAK SCM 9")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Procurement Policy and Circulars-ADAK SCM 9 field.', Comment = '%';
            //     }
            //     field("Assets and Liabilities- ADAK SCM 15"; Rec."Assets and Liabilities- ADAK SCM 15")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Assets and Liabilities- ADAK SCM 15 field.', Comment = '%';
            //     }
            //     field("Board of survey- stores- ADAK SCM 10"; Rec."Board of survey- stores- ADAK SCM 10")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Board of survey- stores- ADAK SCM 10 field.', Comment = '%';
            //     }
            //     field("Notification of Tender Awards- ADAK SCM 6"; Rec."Notification of Tender Awards- ADAK SCM 6")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Notification of Tender Awards- ADAK SCM 6 field.', Comment = '%';
            //     }
            //     field("Public Procurement Appeals and Review Board-ADAK SCM 7"; Rec."Public Procurement Appeals and Review Board-ADAK SCM 7")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Public Procurement Appeals and Review Board-ADAK SCM 7 field.', Comment = '%';
            //     }
            //     field("Recommendations and Reference letters-ADAK SCM 13"; Rec."Recommendations and Reference letters-ADAK SCM 13")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Recommendations and Reference letters-ADAK SCM 13 field.', Comment = '%';
            //     }
            //     field("Statutory Reports- ADAK SCM 12"; Rec."Statutory Reports- ADAK SCM 12")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Statutory Reports- ADAK SCM 12 field.', Comment = '%';
            //     }
            // }
            // group("Transport Files")
            // {

            //     field("General Transport Matters - ADAK TRA 1 VOL.1"; Rec."General Transport Matters - ADAK TRA 1 VOL.1")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the General Transport Matters - ADAK TRA 1 VOL.1 field.', Comment = '%';
            //     }
            //     field("Motor Vehicle Returns- ADAK TRA 2"; Rec."Motor Vehicle Returns- ADAK TRA 2")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Motor Vehicle Returns- ADAK TRA 2 field.', Comment = '%';
            //     }
            //     field("TOYOTA COROLLA SALON-TRA KCE 880D"; Rec."TOYOTA COROLLA SALON-TRA KCE 880D")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA COROLLA SALON-TRA KCE 880D field.', Comment = '%';
            //     }
            //     field("TOYOTA VAN HIACE- TRA KCE 925D"; Rec."TOYOTA VAN HIACE- TRA KCE 925D")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA VAN HIACE- TRA KCE 925D field.', Comment = '%';
            //     }
            //     field("TOYOTA FORTUNER- TRA KCD 878G"; Rec."TOYOTA FORTUNER- TRA KCD 878G")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA FORTUNER- TRA KCD 878G field.', Comment = '%';
            //     }
            //     field("TOYOTA HILUX-TRA KCD 877G"; Rec."TOYOTA HILUX-TRA KCD 877G")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA HILUX-TRA KCD 877G field.', Comment = '%';
            //     }
            //     field("TOYOTA PRADO - TRA GKB 474M"; Rec."TOYOTA PRADO - TRA GKB 474M")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA GKB 474M field.', Comment = '%';
            //     }
            //     field("TOYOTA PRADO - TRA GKB 478M"; Rec."TOYOTA PRADO - TRA GKB 478M")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA GKB 478M field.', Comment = '%';
            //     }
            //     field("TOYOTA PRADO - TRA KCD 891G"; Rec."TOYOTA PRADO - TRA KCD 891G")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA KCD 891G field.', Comment = '%';
            //     }
            //     field("TOYOTA PRADO - TRA KCE 901D"; Rec."TOYOTA PRADO - TRA KCE 901D")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA KCE 901D field.', Comment = '%';
            //     }
            //     field("Transport Requisitions- ADAK TRA 3"; Rec."Transport Requisitions- ADAK TRA 3")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Transport Requisitions- ADAK TRA 3 field.', Comment = '%';
            //     }
            // }
            group("Administration Files Urls")
            {

                field("Absence from Duty - ADM7 Vol.1 Url"; Rec."Absence from Duty - ADM7 Vol.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Absence from Duty - ADM7 Vol.1 field.', Comment = '%';
                }
                field("ADAK Acts, Rules and Policies - ADM23 Url"; Rec."ADAK Acts, Rules and Policies - ADM23 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ADAK Acts, Rules and Policies - ADM23 field.', Comment = '%';
                }
                field("ADAK Board Members General Correspondence - ADM45 Url"; Rec."ADAK Board Members General Correspondence - ADM45 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ADAK Board Members General Correspondence - ADM45 field.', Comment = '%';
                }
                field("ADAK Status Reports - ADM46 Url"; Rec."ADAK Status Reports - ADM46 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ADAK Status Reports - ADM46 field.', Comment = '%';
                }
                field("Alcohol Drug Abuse - ADM51 Url"; Rec."Alcohol Drug Abuse - ADM51 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alcohol Drug Abuse - ADM51 field.', Comment = '%';
                }
                field("Appointments to the Board and Board Committees - ADM25 Url"; Rec."Appointments to the Board and Board Committees - ADM25 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointments to the Board and Board Committees - ADM25 field.', Comment = '%';
                }
                field("Appreciations and Acknowledments - ADM10 Url"; Rec."Appreciations and Acknowledgments - ADM10 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appreciations and Acknowledments - ADM10 field.', Comment = '%';
                }
                field("ASK- ADM 66 VOL.1 Url"; Rec."ASK- ADM 66 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ASK- ADM 66 VOL.1 field.', Comment = '%';
                }
                field("AU - ADM 64 VOL.1 Url"; Rec."AU - ADM 64 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AU - ADM 64 VOL.1 field.', Comment = '%';
                }
                field("Cabinet Secretary Directives and Circulars - ADM55 Url"; Rec."Cabinet Secretary Directives and Circulars - ADM55 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cabinet Secretary Directives and Circulars - ADM55 field.', Comment = '%';
                }
                field("Circulars and Directives from the Presidency - ADM42 Url"; Rec."Circulars and Directives from the Presidency - ADM42 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Circulars and Directives from the Presidency - ADM42 field.', Comment = '%';
                }
                field("Communication Services - ADM34 Url"; Rec."Communication Services - ADM34 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Services - ADM34 field.', Comment = '%';
                }
                field("Complaints - ADM49 Url"; Rec."Complaints - ADM49 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complaints - ADM49 field.', Comment = '%';
                }
                field("Corporate Social Responsibility - ADM50 Url"; Rec."Corporate Social Responsibility - ADM50 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Social Responsibility - ADM50 field.', Comment = '%';
                }
                field("Corruption Prevention Committee - ADM53 Url"; Rec."Corruption Prevention Committee - ADM53 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corruption Prevention Committee - ADM53 field.', Comment = '%';
                }
                field("Customer Satisfaction - ADM58 Url"; Rec."Customer Satisfaction - ADM58 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Satisfaction - ADM58 field.', Comment = '%';
                }
                field("Data Protection and Privacy- ADM 69 VOL.1 Url"; Rec."Data Protection and Privacy- ADM 69 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Data Protection and Privacy- ADM 69 VOL.1 field.', Comment = '%';
                }
                field("Disability Mainstreaming - ADM48 Url"; Rec."Disability Mainstreaming - ADM48 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Mainstreaming - ADM48 field.', Comment = '%';
                }
                field("Establishment of ADAK - ADM2 Url"; Rec."Establishment of ADAK - ADM2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Establishment of ADAK - ADM2 field.', Comment = '%';
                }
                field("Ethics and Integrity - ADM20 Url"; Rec."Ethics and Integrity - ADM20 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethics and Integrity - ADM20 field.', Comment = '%';
                }
                field("Values and Principles of Governance - ADM19 Url"; Rec."Values and Principles of Governance - ADM19 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Values and Principles of Governance - ADM19 field.', Comment = '%';
                }
                field("Full Board Notices and Agendas - ADM27 Url"; Rec."Full Board Notices and Agendas - ADM27 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Board Notices and Agendas - ADM27 field.', Comment = '%';
                }
                field("Gender and Development Committee - ADM43 Url"; Rec."Gender and Development Committee - ADM43 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender and Development Committee - ADM43 field.', Comment = '%';
                }
                field("General Administration - ADM1 Url"; Rec."General Administration - ADM1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Administration - ADM1 field.', Comment = '%';
                }
                field("General Circulars - ADM26 Url"; Rec."General Circulars - ADM26 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Circulars - ADM26 field.', Comment = '%';
                }
                field("General Staff Meeting - ADM3 Url"; Rec."General Staff Meeting - ADM3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Staff Meeting - ADM3 field.', Comment = '%';
                }
                field("Handing and Taking Over - ADM8 Url"; Rec."Handing and Taking Over - ADM8 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Handing and Taking Over - ADM8 field.', Comment = '%';
                }
                field("HIV and AIDS Committee - ADM41 Url"; Rec."HIV and AIDS Committee - ADM41 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HIV and AIDS Committee - ADM41 field.', Comment = '%';
                }
                field("HOD Meeting - ADM5 Url"; Rec."HOD Meeting - ADM5 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD Meeting - ADM5 field.', Comment = '%';
                }
                field("Integrity Assurance Committee - ADM56 Url"; Rec."Integrity Assurance Committee - ADM56 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Integrity Assurance Committee - ADM56 field.', Comment = '%';
                }
                field("Invitations and Appointments - ADM9 Url"; Rec."Invitations and Appointments - ADM9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitations and Appointments - ADM9 field.', Comment = '%';
                }
                field("ISO 9001 - ADM39 Url"; Rec."ISO 9001 - ADM39 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ISO 9001 - ADM39 field.', Comment = '%';
                }
                field("Kenya Gazette Notices - ADM21 Url"; Rec."Kenya Gazette Notices - ADM21 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Kenya Gazette Notices - ADM21 field.', Comment = '%';
                }
                field("Ministerial Meetings - ADM6 Url"; Rec."Ministerial Meetings - ADM6 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ministerial Meetings - ADM6 field.', Comment = '%';
                }
                field("National Cohesion - ADM54 Url"; Rec."National Cohesion - ADM54 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the National Cohesion - ADM54 field.', Comment = '%';
                }
                field("NOCK - ADM 68 VOL.1 Url"; Rec."NOCK - ADM 68 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NOCK - ADM 68 VOL.1 field.', Comment = '%';
                }
                field("Occupational Safety and Health Committee - ADM40 Url"; Rec."Occupational Safety and Health Committee - ADM40 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occupational Safety and Health Committee - ADM40 field.', Comment = '%';
                }
                field("Office Accomodations - ADM16 Url"; Rec."Office Accomodations - ADM16 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Accomodations - ADM16 field.', Comment = '%';
                }
                field("Office Maintenance - ADM17 Url"; Rec."Office Maintenance - ADM17 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Maintenance - ADM17 field.', Comment = '%';
                }
                field("Office Security - ADM18 Url"; Rec."Office Security - ADM18 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Security - ADM18 field.', Comment = '%';
                }
                field("Parliamentary Business - ADM22 Url"; Rec."Parliamentary Business - ADM22 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parliamentary Business - ADM22 field.', Comment = '%';
                }
                field("Partnerships - ADM33 Url"; Rec."Partnerships - ADM33 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partnerships - ADM33 field.', Comment = '%';
                }
                field("Partnerships and Collaborations with iNADOs-ADM 65 VOL.1 Url"; Rec."Partnerships and Collaborations with iNADOs-ADM 65 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partnerships and Collaborations with iNADOs-ADM 65 VOL.1 field.', Comment = '%';
                }
                field("Performance Contracts and Reports - ADM15 Url"; Rec."Performance Contracts and Reports - ADM15 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Contracts and Reports - ADM15 field.', Comment = '%';
                }
                field("PSC Circulars and Directives - ADM57 Url"; Rec."PSC Circulars and Directives - ADM57 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PSC Circulars and Directives - ADM57 field.', Comment = '%';
                }
                field("RADO- ADM 62 VOL.1 Url"; Rec."RADO- ADM 62 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RADO- ADM 62 VOL.1 field.', Comment = '%';
                }
                field("Records Management - ADM47 Url"; Rec."Records Management - ADM47 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Records Management - ADM47 field.', Comment = '%';
                }
                field("Road Safety Mainstreaming - ADM59 Url"; Rec."Road Safety Mainstreaming - ADM59 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Safety Mainstreaming - ADM59 field.', Comment = '%';
                }
                field("Seminars, Workshops and Conferences - ADM24 Url"; Rec."Seminars, Workshops and Conferences - ADM24 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seminars, Workshops and Conferences - ADM24 field.', Comment = '%';
                }
                field("Sporting Events and Calenders - ADM 67 VOL.1 Url"; Rec."Sporting Events and Calendars - ADM 67 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sporting Events and Calenders - ADM 67 VOL.1 field.', Comment = '%';
                }
                group("Sports")
                {
                    field("Sports Organization Fedaration - ADM60 Url"; Rec."Sports Organization Fedaration - ADM60 Url")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Sports Organization Fedaration - ADM60 Url field.', Comment = '%';
                    }
                    field("Athletics Kenya - ADM60 02 URL"; Rec."Athletics Kenya - ADM60 02 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Athletics Kenya - ADM60 02 field.', Comment = '%';
                    }
                    field("Badminton Kenya - ADM60 23 URL"; Rec."Badminton Kenya - ADM60 23 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Badminton Kenya - ADM60 23 field.', Comment = '%';
                    }
                    field("Boxing Federation of Kenya - ADM60 27 URL"; Rec."Boxing Federation of Kenya - ADM60 27 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Boxing Federation of Kenya - ADM60 27 URL field.', Comment = '%';
                    }
                    field("Football Kenya - ADM60 03 URL"; Rec."Football Kenya - ADM60 03 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Football Kenya - ADM60 03 URL field.', Comment = '%';
                    }
                    field("Kenya Baseball Federation - ADM60 16 URL"; Rec."Kenya Baseball Federation - ADM60 16 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Baseball Federation - ADM60 16 URL field.', Comment = '%';
                    }
                    field("Kenya Basketball Federation - ADM60 12 URL"; Rec."Kenya Basketball Federation - ADM60 12 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Basketball Federation - ADM60 12 URL field.', Comment = '%';
                    }
                    field("Kenya Body Building Federation - ADM60 04 URL"; Rec."Kenya Body Building Federation - ADM60 04 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Body Building Federation - ADM60 04 URL field.', Comment = '%';
                    }
                    field("Kenya Bowling Federation - ADM60 26 URL"; Rec."Kenya Bowling Federation - ADM60 26 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Bowling Federation - ADM60 26 UEL field.', Comment = '%';
                    }
                    field("Kenya Cycling Federation - ADM6019 URL"; Rec."Kenya Cycling Federation - ADM6019 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Cycling Federation - ADM6019 URL field.', Comment = '%';
                    }
                    field("Kenya Golf Union- ADM60 21 URL"; Rec."Kenya Golf Union- ADM60 21 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Golf Union- ADM60 21 URL field.', Comment = '%';
                    }
                    field("Kenya Handball Federation - ADM60 11 URL"; Rec."Kenya Handball Federation - ADM60 11 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Handball Federation - ADM60 11 URL field.', Comment = '%';
                    }
                    field("Kenya Hockey Union - ADM60 14 URL"; Rec."Kenya Hockey Union - ADM60 14 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Hockey Union - ADM60 14 URL field.', Comment = '%';
                    }
                    field("Kenya Judo Association - ADM60 05 URL"; Rec."Kenya Judo Association - ADM60 05 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Judo Association - ADM60 05 URL field.', Comment = '%';
                    }
                    field("Kenya Kabaddi Sports Federation - ADM60 18 URL"; Rec."Kenya Kabaddi Sports Federation - ADM60 18 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Kabaddi Sports Federation - ADM60 18 URL field.', Comment = '%';
                    }
                    field("Kenya Karate Federation - ADM60 10 URL"; Rec."Kenya Karate Federation - ADM60 10 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Karate Federation - ADM60 10 URL field.', Comment = '%';
                    }
                    field("Kenya National Paralympic  - ADM60 08 URL"; Rec."Kenya National Paralympic  - ADM60 08 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya National Paralympic  - ADM60 08 URL field.', Comment = '%';
                    }
                    field("Kenya Netball Federation - ADM60 20 URL"; Rec."Kenya Netball Federation - ADM60 20 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Netball Federation - ADM60 20 URL field.', Comment = '%';
                    }
                    field("Kenya Rowing and Canoe Association - ADM60 09 URL"; Rec."Kenya Rowing and Canoe Association - ADM60 09 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Rowing and Canoe Association - ADM60 09 URL field.', Comment = '%';
                    }
                    field("Kenya Rugby Union - ADM60 07 URL"; Rec."Kenya Rugby Union - ADM60 07 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Rugby Union - ADM60 07 URL field.', Comment = '%';
                    }
                    field("Kenya Shooting Federation - ADM60 28 URL"; Rec."Kenya Shooting Federation - ADM60 28 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Shooting Federation - ADM60 28 URL field.', Comment = '%';
                    }
                    field("Kenya Squash Rackets Association - ADM60 22 URL"; Rec."Kenya Squash Rackets Association - ADM60 22 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Squash Rackets Association - ADM60 22 URL field.', Comment = '%';
                    }
                    field("Kenya Swimming Federation - ADM60 17 URL"; Rec."Kenya Swimming Federation - ADM60 17 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Swimming Federation - ADM60 17 URL field.', Comment = '%';
                    }
                    field("Kenya Table Tennis Federation - ADM60 13 URL"; Rec."Kenya Table Tennis Federation - ADM60 13 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Table Tennis Federation - ADM60 13 URL field.', Comment = '%';
                    }
                    field("Kenya Triathlon Federation - ADM60 25 URL"; Rec."Kenya Triathlon Federation - ADM60 25 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Triathlon Federation - ADM60 25 URL field.', Comment = '%';
                    }
                    field("Kenya Volleyball Federation - ADM60 06 URL"; Rec."Kenya Volleyball Federation - ADM60 06 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Volleyball Federation - ADM60 06 URL field.', Comment = '%';
                    }
                    field("Kenya Weight Lifting Association - ADM60 15 URL"; Rec."Kenya Weight Lifting Association - ADM60 15 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Weight Lifting Association - ADM60 15 URL field.', Comment = '%';
                    }
                    field("Tennis Kenya  - ADM60 24 URL"; Rec."Tennis Kenya  - ADM60 24 URL")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tennis Kenya  - ADM60 24 URL field.', Comment = '%';
                    }

                }
                field("Staff Welfare - ADM13 Url"; Rec."Staff Welfare - ADM13 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Welfare - ADM13 field.', Comment = '%';
                }
                field("Strategic Plans - ADM11 Url"; Rec."Strategic Plans - ADM11 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plans - ADM11 field.', Comment = '%';
                }
                field("Strategy Planning and Corporate Governance - ADM35 Url"; Rec."Strategy Planning and Corporate Governance - ADM35 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Planning and Corporate Governance - ADM35 field.', Comment = '%';
                }
                field("Travel Clearance - ADM12 Url"; Rec."Travel Clearance - ADM12 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Travel Clearance - ADM12 field.', Comment = '%';
                }
                field("UNESCO - ADM 63 VOL.1 Url"; Rec."UNESCO - ADM 63 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UNESCO - ADM 63 VOL.1 field.', Comment = '%';
                }
                field("Vision 2030 - ADM52 Url"; Rec."Vision 2030 - ADM52 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision 2030 - ADM52 field.', Comment = '%';
                }
                field("WADA-ADM 61 VOL.1 Url"; Rec."WADA-ADM 61 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WADA-ADM 61 VOL.1 field.', Comment = '%';
                }
                field("Workplans - ADM14 Url"; Rec."Workplans - ADM14 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplans - ADM14 field.', Comment = '%';
                }
            }
            group("Audit Files Urls")
            {

                field("Audit and Risk Management Committee(notices)-ADAK AUD 1 Url"; Rec."Audit and Risk Management Committee(notices)-ADAK AUD 1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit and Risk Management Committee(notices)-ADAK AUD 1 field.', Comment = '%';
                }
                field("Audit General- ADAK AUD 9 Url"; Rec."Audit General- ADAK AUD 9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit General- ADAK AUD 9 field.', Comment = '%';
                }
                field("Internal Audit Education and Research reports-ADAK AUD 3 Url"; Rec."Internal Audit Education and Research reports-ADAK AUD 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Education and Research reports-ADAK AUD 3 field.', Comment = '%';
                }
                field("Internal Audit Finance and Accounts reports-ADAK AUD 8 Url"; Rec."Internal Audit Finance and Accounts reports-ADAK AUD 8 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Finance and Accounts reports-ADAK AUD 8 field.', Comment = '%';
                }
                field("Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3 Url"; Rec."Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Human Capital and Administration reports-ADAK AUD 5D 3 field.', Comment = '%';
                }
                field("Internal Audit Legal Services reports-ADAK AUD 6 Url"; Rec."Internal Audit Legal Services reports-ADAK AUD 6 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Legal Services reports-ADAK AUD 6 field.', Comment = '%';
                }
                field("Internal Audit Standards and Compliance reports-ADAK AUD 4 Url"; Rec."Internal Audit Standards and Compliance reports-ADAK AUD 4 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Standards and Compliance reports-ADAK AUD 4 field.', Comment = '%';
                }
                field("Internal Audit Supply Chain reports-ADAK AUD 7 Url"; Rec."Internal Audit Supply Chain reports-ADAK AUD 7 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Supply Chain reports-ADAK AUD 7 field.', Comment = '%';
                }
            }
            group("Corporate Communication Files Urls")
            {

                field("Advertising and Publicity-ADAK COM 4 Url"; Rec."Advertising and Publicity-ADAK COM 4 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertising and Publicity-ADAK COM 4 field.', Comment = '%';
                }
                field("Branding- ADAK COM 7 Url"; Rec."Branding- ADAK COM 7 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branding- ADAK COM 7 field.', Comment = '%';
                }
                field("CSR-ADAK COM 3 Url"; Rec."CSR-ADAK COM 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CSR-ADAK COM 3 field.', Comment = '%';
                }
                field("Customer Feedback Reports- ADAK COM 5 Url"; Rec."Customer Feedback Reports- ADAK COM 5 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Feedback Reports- ADAK COM 5 field.', Comment = '%';
                }
                field("General Communication- ADAK COM 1 Url"; Rec."General Communication- ADAK COM 1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Communication- ADAK COM 1 field.', Comment = '%';
                }
                field("Newsletters and Publications-ADAK COM 8 Url"; Rec."Newsletters and Publications-ADAK COM 8 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Newsletters and Publications-ADAK COM 8 field.', Comment = '%';
                }
                field("Press Cutting-ADAK COM 10 Url"; Rec."Press Cutting-ADAK COM 10 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Press Cutting-ADAK COM 10 field.', Comment = '%';
                }
                field("Press Releases-ADAK COM 9 Url"; Rec."Press Releases-ADAK COM 9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Press Releases- ADAK COM 9 field.', Comment = '%';
                }
                field("Shows and Exhibitions- ADAK COM 2 Url"; Rec."Shows and Exhibitions- ADAK COM 2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shows and Exhibitions- ADAK COM 2 field.', Comment = '%';
                }
                field("Speeches - ADAK COM 6 Url"; Rec."Speeches - ADAK COM 6 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Speeches - ADAK COM 6 field.', Comment = '%';
                }
            }
            group("Education and Research Files Urls")
            {

                field("Anti-Doping Educators- ADAK E&R 9 Url"; Rec."Anti-Doping Educators- ADAK E&R 9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Anti-Doping Educators- ADAK E&R 9 field.', Comment = '%';
                }
                field("Anti-Doping Value Based Education- ADAK E&R 5 Url"; Rec."Anti-Doping Value Based Education- ADAK E&R 5 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Anti-Doping Value Based Education- ADAK E&R 5 field.', Comment = '%';
                }
                field("Anti-Doping Research Proposals & Reports- ADAK E&R 10 Url"; Rec."Anti-Doping Research Proposals & Reports- ADAK E&R 10 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Anti-Doping Research Proposals & Reports- ADAK E&R 10 field.', Comment = '%';
                }
                field("Anti-Doping workshop programmes- ADAK E&R 1 VOL.1 Url"; Rec."Anti-Doping workshop programmes- ADAK E&R 1 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Anti-Doping workshop programmes- ADAK E&R 1 VOL.1 field.', Comment = '%';
                }
                field("Research and Development- ADAK E&R 7 Url"; Rec."Research and Development- ADAK E&R 7 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research and Development- ADAK E&R 7 field.', Comment = '%';
                }
            }
            group("Finance and Accounts Files Urls")
            {

                field("Audited Financial Statements and Reports  - FIN14 Url"; Rec."Audited Financial Statements and Reports - FIN14 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audited Financial Statements and Reports  - FIN14 field.', Comment = '%';
                }
                field("Bad Debts and Write-offs - FIN20 Url"; Rec."Bad Debts and Write-offs - FIN20 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bad Debts and Write-offs - FIN20 field.', Comment = '%';
                }
                field("Board Expenditure - FIN10 Url"; Rec."Board Expenditure - FIN10 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Expenditure - FIN10 field.', Comment = '%';
                }
                field("Board of Survey Finance - FIN15 Url"; Rec."Board of Survey Finance - FIN15 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board of Survey Finance - FIN15 field.', Comment = '%';
                }
                field("Budgets and Estimates - FIN 7 Url"; Rec."Budgets and Estimates - FIN 7 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgets and Estimates - FIN 7 field.', Comment = '%';
                }
                field("Expenditure Control - FIN8 Url"; Rec."Expenditure Control - FIN8 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expenditure Control - FIN8 field.', Comment = '%';
                }
                field("Finance General- FIN 1 Url"; Rec."Finance General- FIN 1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance General- FIN 1 field.', Comment = '%';
                }
                field("Finance Statements and Reports - FIN13 Url"; Rec."Finance Statements and Reports - FIN13 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance Statements and Reports - FIN13 field.', Comment = '%';
                }
                field("Finance and General Purpose Committee Notices - FIN17 Url"; Rec."Finance and General Purpose Committee Notices - FIN17 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance and General Purpose Committee Notices - FIN17 field.', Comment = '%';
                }
                field("Government Grants- FIN 2 Url"; Rec."Government Grants- FIN 2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Government Grants- FIN 2 field.', Comment = '%';
                }
                field("Imprest and Advances - FIN9 Url"; Rec."Imprest and Advances - FIN9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest and Advances - FIN9 field.', Comment = '%';
                }
                field("MTEF- FIN 6 Url"; Rec."MTEF- FIN 6 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MTEF- FIN 6 field.', Comment = '%';
                }
                field("National Treasury Circulars - FIN19 Url"; Rec."National Treasury Circulars - FIN19 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the National Treasury Circulars - FIN19 field.', Comment = '%';
                }
                field("Other Grants- FIN 3 Url"; Rec."Other Grants- FIN 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Grants- FIN 3 field.', Comment = '%';
                }
                field("Pending Bills - FIN11 Url"; Rec."Pending Bills - FIN11 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Bills - FIN11 field.', Comment = '%';
                }
                field("Statutory Obligation Reports - FIN12 Url"; Rec."Statutory Obligation Reports - FIN12 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statutory Obligation Reports - FIN12 field.', Comment = '%';
                }
                field("Tax Matters - FIN21 Url"; Rec."Tax Matters - FIN21 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Matters - FIN21 field.', Comment = '%';
                }
            }
            group("Human Capital Files Urls")
            {

                field("Casual engagements- HCM 5 Url"; Rec."Casual engagements- HCM 5 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Casual engagements- HCM 5 field.', Comment = '%';
                }
                field("Cleaning Services-HCM 21 Url"; Rec."Cleaning Services-HCM 21 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cleaning Services-HCM 21 field.', Comment = '%';
                }
                field("Deployment and Secondment of staff - HCM 7 Url"; Rec."Deployment and Secondment of staff - HCM 7 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deployment and Secondment of staff - HCM 7 field.', Comment = '%';
                }
                field("HCM BOARD Committee (papers)-HCM 22 Url"; Rec."HCM BOARD Committee (papers)-HCM 22 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HCM BOARD Committee (papers)-HCM 22 field.', Comment = '%';
                }
                field("Human Capital Advisory Committee(Notices)- HCM 28 Url"; Rec."Human Capital Advisory Committee(Notices)- HCM 28 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Human Capital Advisory Committee(Notices)- HCM 28 field.', Comment = '%';
                }
                field("Human Capital Disciplinary Committee-HCM 35 Url"; Rec."Human Capital Disciplinary Committee-HCM 34 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Human Capital Disciplinary Committee-HCM 35 field.', Comment = '%';
                }
                field("Human Capital Management Board Committee(notices) -HCM 22 Url"; Rec."Human Capital Management Board Committee(notices) -HCM 22 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Human Capital Management Board Committee(notices) -HCM 22 field.', Comment = '%';
                }
                field("Human Resource Circulars - HCM 12 Url"; Rec."Human Resource Circulars - HCM 12 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Human Resource Circulars - HCM 12 field.', Comment = '%';
                }
                field("Human Resource Payroll Information - HCM 14 Url"; Rec."Human Resource Payroll Information - HCM 14 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Human Resource Payroll Information - HCM 14 field.', Comment = '%';
                }
                field("Induction-HCM 36 Url"; Rec."Induction-HCM 36 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction-HCM 36 field.', Comment = '%';
                }
                field("Industrial Attachments - HCM 17 Url"; Rec."Industrial Attachments - HCM 17 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Industrial Attachments - HCM 17 field.', Comment = '%';
                }
                field("Insurance Matters- HCM 35 Url"; Rec."Insurance Matters- HCM 35 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Matters- HCM 35 field.', Comment = '%';
                }
                field("Internships - HCM 18 Url"; Rec."Internships - HCM 18 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internships - HCM 18 field.', Comment = '%';
                }
                field("Pensions and Gratuity - HCM 15 Url"; Rec."Pensions and Gratuity - HCM 15 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pensions and Gratuity - HCM 15 field.', Comment = '%';
                }
                field("Performance Evaluation and Appraisal -HCM 9 Url"; Rec."Performance Evaluation and Appraisal -HCM 9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Evaluation and Appraisal -HCM 9 field.', Comment = '%';
                }
                field("Professional Associations - HCM 20 Url"; Rec."Professional Associations - HCM 20 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Associations - HCM 20 field.', Comment = '%';
                }
                field("Recruitment and Appointments - HCM 3 Url"; Rec."Recruitment and Appointments - HCM 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment and Appointments - HCM 3 field.', Comment = '%';
                }
                field("Salary and Remuneration(SRC)-HCM 8 Url"; Rec."Salary and Remuneration(SRC)-HCM 8 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary and Remuneration(SRC)-HCM 8 field.', Comment = '%';
                }
                field("Staff Leave - HCM 11 Url"; Rec."Staff Leave - HCM 11 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Leave - HCM 11 field.', Comment = '%';
                }
                field("Staff Matters - HCM 1 VOL.1 Url"; Rec."Staff Matters - HCM 1 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Matters - HCM 1 VOL.1 field.', Comment = '%';
                }
                field("Staff Training - HCM 16 Url"; Rec."Staff Training - HCM 16 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Training - HCM 16 field.', Comment = '%';
                }
                field("State Corporation Advisory Committee(SCAC)-HCM 19 Url"; Rec."State Corporation Advisory Committee(SCAC)-HCM 19 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the State Corporation Advisory Committee(SCAC)-HCM 19 field.', Comment = '%';
                }
                field("Statutory Deductions - HCM 13 Url"; Rec."Statutory Deductions - HCM 13 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statutory Deductions - HCM 13 field.', Comment = '%';
                }
            }
            group(OtherURLS)
            {

                field("Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1 URL"; Rec."Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enhanced Anti-Doping Education-ADAK EAP 2 VOL.1 URL field.', Comment = '%';
                }
                field("Enhanced Anti-Doping General-ADAK EAP 1 VOL.1 URL"; Rec."Enhanced Anti-Doping General-ADAK EAP 1 VOL.1 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enhanced Anti-Doping General-ADAK EAP 1 VOL.1 URL field.', Comment = '%';
                }
                field("Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1 URL"; Rec."Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enhanced Anti-Doping Legal Services-ADAK EAP 5 VOL.1 URL field.', Comment = '%';
                }
                field("Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II URL"; Rec."Enhanced Anti-Doping Testing-ADAK EAP 3 VOL II URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enhanced Anti-Doping Testing-ADAK EAP 3 VOL.1 URL field.', Comment = '%';
                }
                field("Monitoring Pool-ADAK EAP 6 URL"; Rec."Monitoring Pool-ADAK EAP 6 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monitoring Pool-ADAK EAP 6 URL field.', Comment = '%';
                }
                field("Office Accommodation Eldoret-ADAK EAP 4 VOL.1 URL"; Rec."Office Accommodation Eldoret-ADAK EAP 4 VOL.1 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Accommodation Eldoret-ADAK EAP 4 VOL.1 URL field.', Comment = '%';
                }
            }
            group("ICT Files Urls")
            {
                field("ICT Projects-ADAK ICT 5 URL"; Rec."ICT Projects-ADAK ICT 5 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Projects-ADAK ICT 5 URL field.', Comment = '%';
                }
                field("ICT Equipments and Services-ADAK ICT 2 URL"; Rec."ICT Equipments and Services-ADAK ICT 2 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Equipments and Services-ADAK ICT 2 URL field.', Comment = '%';
                }
                field("ICT Internal Support- ADAK ICT 3 URL"; Rec."ICT Internal Support- ADAK ICT 3 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Internal Support- ADAK ICT 3 URL field.', Comment = '%';
                }
                field("ISMS-ADAK ICT 4 URL"; Rec."ISMS-ADAK ICT 4 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ISMS-ADAK ICT 4 URL field.', Comment = '%';
                }
                field("Website Matters- ADAK ICT 1 URL"; Rec."Website Matters- ADAK ICT 1 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Website Matters- ADAK ICT 1 URL field.', Comment = '%';
                }
            }
            group("Legal Files Urls")
            {

                field("Legal Matters Correspondences-ADAK LEG 1 Url"; Rec."Legal Matters Correspondences-ADAK LEG 1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Matters Correspondences-ADAK LEG 1 field.', Comment = '%';
                }
                field("Legal Opinions and Advisories(internal)-ADAK LEG 9 Url"; Rec."Legal Opinions and Advisories(internal)-ADAK LEG 9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Opinions and Advisories(internal)-ADAK LEG 9 field.', Comment = '%';
                }
                field("Attorney General Matters-ADAK LEG 2 Url"; Rec."Attorney General Matters-ADAK LEG 2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attorney General Matters-ADAK LEG 2 field.', Comment = '%';
                }
            }
            group("EAP Files Urls")
            {
                field("Adlif James Khalonyere-ADAK EAP 007 URL"; Rec."Adlif James Khalonyere-ADAK EAP 007 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Adlif James Khalonyere-ADAK EAP 007 URL field.', Comment = '%';
                }
                field("Ann Wairimu-ADAK EAP 004 URL"; Rec."Ann Wairimu-ADAK EAP 004 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ann Wairimu-ADAK EAP 004 URL field.', Comment = '%';
                }
                field("Catherine Mkabahati Shegu-ADAK EAP 009 URL"; Rec."Catherine Mkabahati Shegu-ADAK EAP 009 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Catherine Mkabahati Shegu-ADAK EAP 009 URL field.', Comment = '%';
                }
                field("Chriss Carlos Mwachia-ADAK EAP 020 URL"; Rec."Chriss Carlos Mwachia-ADAK EAP 020 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chriss Carlos Mwachia-ADAK EAP 020 URL field.', Comment = '%';
                }
                field("Daisy Chebet Kurgat-ADAK EAP 026 URL"; Rec."Daisy Chebet Kurgat-ADAK EAP 026 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daisy Chebet Kurgat-ADAK EAP 026 URL field.', Comment = '%';
                }
                field("Dalacha Iram Gheneti-ADAK EAP 013 URL"; Rec."Dalacha Iram Gheneti-ADAK EAP 013 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dalacha Iram Gheneti-ADAK EAP 013 URL field.', Comment = '%';
                }
                field("Damaris Njeri Wanjiru-ADAK EAP 016 URL"; Rec."Damaris Njeri Wanjiru-ADAK EAP 016 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Damaris Njeri Wanjiru-ADAK EAP 016 URL field.', Comment = '%';
                }
                field("Diana Langat-ADAK EAP 025 URL"; Rec."Diana Langat-ADAK EAP 025 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Diana Langat-ADAK EAP 025 URL field.', Comment = '%';
                }
                field("Emily Karimi Mwirigi-ADAK EAP 014 URL"; Rec."Emily Karimi Mwirigi-ADAK EAP 014 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Emily Karimi Mwirigi-ADAK EAP 014 URL field.', Comment = '%';
                }
                field("Esther Wambui Kihara-ADAK EAP 021 URL"; Rec."Esther Wambui Kihara-ADAK EAP 021 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Esther Wambui Kihara-ADAK EAP 021 URL field.', Comment = '%';
                }
                field("Gibson Ronoh-ADAK EAP 002 URL"; Rec."Gibson Ronoh-ADAK EAP 002 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gibson Ronoh-ADAK EAP 002 URL field.', Comment = '%';
                }
                field("Gladwel Obaga Bitutu-ADAK EAP 008 URL"; Rec."Gladwel Obaga Bitutu-ADAK EAP 008 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gladwel Obaga Bitutu-ADAK EAP 008 URL field.', Comment = '%';
                }
                field("Grace Wanjiru Ngugi-ADAK EAP 010 URL"; Rec."Grace Wanjiru Ngugi-ADAK EAP 010 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grace Wanjiru Ngugi-ADAK EAP 010 URL field.', Comment = '%';
                }
                field("Januaris Ngemu Nicholas-ADAK EAP 012 URL"; Rec."Januaris Ngemu Nicholas-ADAK EAP 012 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Januaris Ngemu Nicholas-ADAK EAP 012 URL field.', Comment = '%';
                }
                field("Kipkoech Laban-ADAK EAP 022 URL"; Rec."Kipkoech Laban-ADAK EAP 022 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Kipkoech Laban-ADAK EAP 022 URL field.', Comment = '%';
                }
                field("Maryanne Waithera Mwaura-ADAK EAP 006 URL"; Rec."Maryanne Waithera Mwaura-ADAK EAP 006 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maryanne Waithera Mwaura-ADAK EAP 006 URL field.', Comment = '%';
                }
                field("Mildred Ondoi-ADAK EAP 019 URL"; Rec."Mildred Ondoi-ADAK EAP 019 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mildred Ondoi-ADAK EAP 019 URL field.', Comment = '%';
                }
                field("Morris Mugambi-ADAK EAP 027 URL"; Rec."Morris Mugambi-ADAK EAP 027 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Morris Mugambi-ADAK EAP 027 URL field.', Comment = '%';
                }
                field("Ong'inti Anyona Dennis-ADAK EAP 018 URL"; Rec."Ong'inti Anyona Dennis-ADAK EAP 018 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ong''inti Anyona Dennis-ADAK EAP 018 URL field.', Comment = '%';
                }
                field("Phyllis Nduta Mwangi-ADAK EAP 005 URL"; Rec."Phyllis Nduta Mwangi-ADAK EAP 005 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phyllis Nduta Mwangi-ADAK EAP 005 URL field.', Comment = '%';
                }
                field("Remicus Asitaka L. Khamasi-ADAK EAP 003 URL"; Rec."Remicus Asitaka L. Khamasi-ADAK EAP 003 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remicus Asitaka L. Khamasi-ADAK EAP 003 URL field.', Comment = '%';
                }
                field("Ronney Sumba Mandu-ADAK EAP 011 URL"; Rec."Ronney Sumba Mandu-ADAK EAP 011 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ronney Sumba Mandu-ADAK EAP 011 URL field.', Comment = '%';
                }
                field("Rosemary Wanjiru Wambui-ADAK EAP 023 URL"; Rec."Rosemary Wanjiru Wambui-ADAK EAP 023 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rosemary Wanjiru Wambui-ADAK EAP 023 URL field.', Comment = '%';
                }
                field("Victor Ashiali Indakwa- ADAK EAP 001 URL"; Rec."Victor Ashiali Indakwa- ADAK EAP 001 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Victor Ashiali Indakwa- ADAK EAP 001 URL field.', Comment = '%';
                }
                field("Vincent Owino Nyangor-ADAK EAP 017 URL"; Rec."Vincent Owino Nyangor-ADAK EAP 017 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vincent Owino Nyangor-ADAK EAP 017 URL field.', Comment = '%';
                }
                field("Wycliffe Ayiga Lumadede-ADAK EAP 015 URL"; Rec."Wycliffe Ayiga Lumadede-ADAK EAP 015 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Wycliffe Ayiga Lumadede-ADAK EAP 015 URL field.', Comment = '%';
                }
            }
            group("Personnel Files Urls")
            {
                field("Abdikadir Abdi Hassan-PF.ADAK 028 (46) URL"; Rec."Abdikadir Abdi Hassan-PF.ADAK 028 (46) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Abdikadir Abdi Hassan-PF.ADAK 028 (46) URL field.', Comment = '%';
                }
                field("Alice Kinyanjui-PF.2007041031(57) URL"; Rec."Alice Kinyanjui-PF.2007041031(57) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alice Kinyanjui-PF.2007041031(57) URL field.', Comment = '%';
                }
                field("Anthony Kamau-PF.2008034176(3) URL"; Rec."Anthony Kamau-PF.2008034176(3) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Anthony Kamau-PF.2008034176(3) URL field.', Comment = '%';
                }
                field("Betty Chege-PF. ADAK 032 (24) URL"; Rec."Betty Chege-PF. ADAK 032 (24) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Betty Chege-PF. ADAK 032 (24) URL field.', Comment = '%';
                }
                field("Bildad Kamwele-PF.ADAK 019(51) URL"; Rec."Bildad Kamwele-PF.ADAK 019(51) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bildad Kamwele-PF.ADAK 019(51) URL field.', Comment = '%';
                }
                field("Brenda Nyakoa-PF.ADAK 026 (70) URL"; Rec."Brenda Nyakoa-PF.ADAK 026 (70) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Brenda Nyakoa-PF.ADAK 026 (70) URL field.', Comment = '%';
                }
                field("Brian Vita-PF.ADAK 015 (2) URL"; Rec."Brian Vita-PF.ADAK 015 (2) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Brian Vita-PF.ADAK 015 (2) URL field.', Comment = '%';
                }
                field("Cosmus Mutwiri Njagi-PF.ADAK 018(2) URL"; Rec."Cosmus Mutwiri Njagi-PF.ADAK 018(2) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cosmus Mutwiri Njagi-PF.ADAK 018(2) URL field.', Comment = '%';
                }
                field("Darius Peter Mwakazi-PF.ADAK 029(4) URL"; Rec."Darius Peter Mwakazi-PF.ADAK 029(4) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Darius Peter Mwakazi-PF.ADAK 029(4) URL field.', Comment = '%';
                }
                field("Dennis Keitany-PF.ADAK.023(56) URL"; Rec."Dennis Keitany-PF.ADAK.023(56) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dennis Keitany-PF.ADAK.023(56) URL field.', Comment = '%';
                }
                field("Edna Koitie-PF. ADAK 003 (109) URL"; Rec."Edna Koitie-PF. ADAK 003 (109) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Edna Koitie-PF. ADAK 003 (109) URL field.', Comment = '%';
                }
                field("Elizabeth Shali-PF.ADAK 022(6) URL"; Rec."Elizabeth Shali-PF.ADAK 022(6) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Elizabeth Shali-PF.ADAK 022(6) URL field.', Comment = '%';
                }
                field("Elvis Njuguna Gitau-PF.ADAK 027(47) URL"; Rec."Elvis Njuguna Gitau-PF.ADAK 027(47) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Elvis Njuguna Gitau-PF.ADAK 027(47) URL field.', Comment = '%';
                }
                field("Erick O. Obwogo-PF. ADAK 031 (31) URL"; Rec."Erick O. Obwogo-PF. ADAK 031 (31) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Erick O. Obwogo-PF. ADAK 031 (31) URL field.', Comment = '%';
                }
                field("Fednard Machoka-PF. ADAK 020(49) URL"; Rec."Fednard Machoka-PF. ADAK 020(49) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fednard Machoka-PF. ADAK 020(49) URL field.', Comment = '%';
                }
                field("Frederick M.Shikami-PF. ADAK 030(5) URL"; Rec."Frederick M.Shikami-PF. ADAK 030(5) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frederick M.Shikami-PF. ADAK 030(5) URL field.', Comment = '%';
                }
                field("Gillian Otieno-PF.ADAK 035(3) URL"; Rec."Gillian Otieno-PF.ADAK 035(3) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gillian Otieno-PF.ADAK 035(3) URL field.', Comment = '%';
                }
                field("Ian Lutta-PF.ADAK 036(3) URL"; Rec."Ian Lutta-PF.ADAK 036(3) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ian Lutta-PF.ADAK 036(3) URL field.', Comment = '%';
                }
                field("Joseph Kithisya Mbithi-024 URL"; Rec."Joseph Kithisya Mbithi-024 URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Joseph Kithisya Mbithi-024 URL field.', Comment = '%';
                }
                field("Karen Chelangat Wairimu-PF.ADAK 017(8) URL"; Rec."Karen Chelangat Wairimu-PF.ADAK 017(8) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Karen Chelangat Wairimu-PF.ADAK 017(8) URL field.', Comment = '%';
                }
                field("Kennedy Mwai-PF.ADAK 007 (5) URL"; Rec."Kennedy Mwai-PF.ADAK 007 (5) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Kennedy Mwai-PF.ADAK 007 (5) URL field.', Comment = '%';
                }
                field("Martin Yauma- PF.ADAK 004(6) URL"; Rec."Martin Yauma- PF.ADAK 004(6) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Martin Yauma- PF.ADAK 004(6) URL field.', Comment = '%';
                }
                field("Mary Kairu Nyokabi-PF.ADAK 025(69) URL"; Rec."Mary Kairu Nyokabi-PF.ADAK 025(69) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mary Kairu Nyokabi-PF.ADAK 025(69) URL field.', Comment = '%';
                }
                field("Monicah Makau - PF.ADAK 012(44) URL"; Rec."Monicah Makau - PF.ADAK 012(44) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monicah Makau - PF.ADAK 012(44) URL field.', Comment = '%';
                }
                field("Patricia Nyiva-PF.2008003793(39) URL"; Rec."Patricia Nyiva-PF.2008003793(39) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Patricia Nyiva-PF.2008003793(39) URL field.', Comment = '%';
                }
                field("Peninah W. Wahome-PF.ADAK 002(6) URL"; Rec."Peninah W. Wahome-PF.ADAK 002(6) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Peninah W. Wahome-PF.ADAK 002(6) URL field.', Comment = '%';
                }
                field("Peter Omwenga-PF.2009100378(9) URL"; Rec."Peter Omwenga-PF.2009100378(9) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Peter Omwenga-PF.2009100378(9) URL field.', Comment = '%';
                }
                field("Ronald Amiani- PF. ADAK 011(69) URL"; Rec."Ronald Amiani- PF. ADAK 011(69) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ronald Amiani- PF. ADAK 011(69) URL field.', Comment = '%';
                }
                field("Sarah I. Shibutse-ADAK 034 (79) URL"; Rec."Sarah I. Shibutse-ADAK 034 (79) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sarah I. Shibutse-ADAK 034 (79) URL field.', Comment = '%';
                }
                field("Simon Katee-PF.ADAK 006 (6) URL"; Rec."Simon Katee-PF.ADAK 006 (6) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Simon Katee-PF.ADAK 006 (6) URL field.', Comment = '%';
                }
                field("Stanley Mwakio Mwandagha-PF.ADAK 024(1) URL"; Rec."Stanley Mwakio Mwandagha-PF.ADAK 024(1) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stanley Mwakio Mwandagha-PF.ADAK 024(1) URL field.', Comment = '%';
                }
                field("Vincent Alunga -PF.ADAK 016(5) URL"; Rec."Vincent Alunga -PF.ADAK 016(5) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vincent Alunga -PF.ADAK 016(5) URL field.', Comment = '%';
                }
                field("Vincent Ongera-PF.2008004600(84) URL"; Rec."Vincent Ongera-PF.2008004600(84) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vincent Ongera-PF.2008004600(84) URL field.', Comment = '%';
                }
            }
            group("Standards and Compliance Files Urls")
            {

                field("RTP-ADAK S&C 9 Url"; Rec."RTP-ADAK S&C 9 (VOL III) URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RTP-ADAK S&C 9 (VOL III) field.', Comment = '%';
                }
                field("S&C Departmental meetings- ADAK S&C 15 Url"; Rec."S&C Departmental meetings- ADAK S&C 15 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the S&C Departmental meetings- ADAK S&C 15 field.', Comment = '%';
                }
                field("Sample Collection Personnel Training-ADAK S&C 6 Url"; Rec."Sample Collection Personnel Training-ADAK S&C 6 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sample Collection Personnel Training-ADAK S&C 6 field.', Comment = '%';
                }
                field("Sample Collection Personnel-ADAK S&C 5 Url"; Rec."Sample Collection Personnel-ADAK S&C 5 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sample Collection Personnel-ADAK S&C 5 field.', Comment = '%';
                }
                field("Sports Federations Compliance Audit-ADAK S&C 10 Url"; Rec."Sports Federations Compliance Audit-ADAK S&C 10 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sports Federations Compliance Audit-ADAK S&C 10 field.', Comment = '%';
                }
                field("Standards & Compliance General-ADAK S&C 1 Url"; Rec."Standards & Compliance General-ADAK S&C 1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standards & Compliance General-ADAK S&C 1 field.', Comment = '%';
                }
                field("TUE- ADAK S&C 2 Url"; Rec."TUE- ADAK S&C 2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TUE- ADAK S&C 2 field.', Comment = '%';
                }
                field("Courier Services-ADAK S&C 12 Url"; Rec."Courier Services-ADAK S&C 12 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Courier Services-ADAK S&C 12 Url field.', Comment = '%';
                }
                field("Laboratory matters- ADAK S&C 13 Url"; Rec."Laboratory matters- ADAK S&C 13 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Laboratory matters- ADAK S&C 13 Url field.', Comment = '%';
                }
            }
            group("Supply Chain Management Files Urls")
            {

                field("Appointment to ADHOC Procurement Committee- ADAK SCM 5 Url"; Rec."Appointment to ADHOC Procurement Committee- ADAK SCM 5 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment to ADHOC procurement committee- ADAK SCM 5 field.', Comment = '%';
                }
                field("Procurement Plan-ADAK SCM 11 Url"; Rec."Procurement Plan-ADAK SCM 11 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan-ADAK SCM 11 field.', Comment = '%';
                }
                field("Procurement of Goods-ADAK SCM 1 Url"; Rec."Procurement of Goods-ADAK SCM 1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement of Goods-ADAK SCM 1 field.', Comment = '%';
                }
                field("Procurement of works- ADAK SCM 3 Url"; Rec."Procurement of works- ADAK SCM 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement of works- ADAK SCM 3 field.', Comment = '%';
                }
                field("Procurement of services-ADAK SCM 2 Url"; Rec."Procurement of services-ADAK SCM 2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement of services-ADAK SCM 2 field.', Comment = '%';
                }
                field("Procurement of Motor vehicle-ADAK SCM 4 Url"; Rec."Procurement of Motor vehicle-ADAK SCM 4 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement of Motor vehicle-ADAK SCM 4 field.', Comment = '%';
                }
                field("Procurement Policy and Circulars-ADAK SCM 9 Url"; Rec."Procurement Policy and Circulars-ADAK SCM 9 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Policy and Circulars-ADAK SCM 9 field.', Comment = '%';
                }
                field("Assets and Liabilities- ADAK SCM 15 Url"; Rec."Assets and Liabilities- ADAK SCM 15 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assets and Liabilities- ADAK SCM 15 field.', Comment = '%';
                }
                field("Board of survey- stores- ADAK SCM 10 Url"; Rec."Board of survey- stores- ADAK SCM 10 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board of survey- stores- ADAK SCM 10 field.', Comment = '%';
                }
                field("Notification of Tender Awards- ADAK SCM 6 Url"; Rec."Notification of Tender Awards- ADAK SCM 6 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification of Tender Awards- ADAK SCM 6 field.', Comment = '%';
                }
                field("Public Procurement Appeals and Review Board-ADAK SCM 7 Url"; Rec."Public Procurement Appeals and Review Board-ADAK SCM 7 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Public Procurement Appeals and Review Board-ADAK SCM 7 field.', Comment = '%';
                }
                field("Recommendations and Reference letters-ADAK SCM 13 Url"; Rec."Recommendations and Reference letters-ADAK SCM 13 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations and Reference letters-ADAK SCM 13 field.', Comment = '%';
                }
                field("Statutory Reports- ADAK SCM 12 Url"; Rec."Statutory Reports- ADAK SCM 12 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statutory Reports- ADAK SCM 12 field.', Comment = '%';
                }
            }
            group("Transport Files Urls")
            {
                field("General Transport Matters - ADAK TRA 1 VOL.1 Url"; Rec."General Transport Matters - ADAK TRA 1 VOL.1 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Transport Matters - ADAK TRA 1 VOL.1 field.', Comment = '%';
                }
                field("Motor Vehicle Returns- ADAK TRA 2 Url"; Rec."Motor Vehicle Returns- ADAK TRA 2 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Motor Vehicle Returns- ADAK TRA 2 field.', Comment = '%';
                }
                field("TOYOTA COROLLA SALON-TRA KCE 880D Url"; Rec."TOYOTA COROLLA SALON-TRA KCE 880D Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA COROLLA SALON-TRA KCE 880D field.', Comment = '%';
                }
                field("TOYOTA VAN HIACE- TRA KCE 925D Url"; Rec."TOYOTA VAN HIACE- TRA KCE 925D Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA VAN HIACE- TRA KCE 925D field.', Comment = '%';
                }
                field("TOYOTA FORTUNER- TRA KCD 878G Url"; Rec."TOYOTA FORTUNER- TRA KCD 878G Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA FORTUNER- TRA KCD 878G field.', Comment = '%';
                }
                field("TOYOTA HILUX-TRA KCD 877G Url"; Rec."TOYOTA HILUX-TRA KCD 877G Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA HILUX-TRA KCD 877G field.', Comment = '%';
                }
                field("TOYOTA PRADO - TRA GKB 474M Url"; Rec."TOYOTA PRADO - TRA GKB 474M Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA GKB 474M field.', Comment = '%';
                }
                field("TOYOTA PRADO - TRA GKB 478M Url"; Rec."TOYOTA PRADO - TRA GKB 478M Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA GKB 478M field.', Comment = '%';
                }
                field("TOYOTA PRADO - TRA KCD 891G Url"; Rec."TOYOTA PRADO - TRA KCD 891G Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA KCD 891G field.', Comment = '%';
                }
                field("TOYOTA PRADO - TRA KCE 901D Url"; Rec."TOYOTA PRADO - TRA KCE 901D Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TOYOTA PRADO - TRA KCE 901D field.', Comment = '%';
                }
                field("Transport Requisitions- ADAK TRA 3 Url"; Rec."Transport Requisitions- ADAK TRA 3 Url")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Requisitions- ADAK TRA 3 field.', Comment = '%';
                }
            }
        }
    }
}
