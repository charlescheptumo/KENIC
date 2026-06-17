page 50267 "Memo Nos Setup"
{
    ApplicationArea = All;
    Caption = 'Memo Nos Setup';
    PageType = Card;
    SourceTable = "Memo Nos Setup";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("General Correspondences Nos"; Rec."General Correspondences Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Incoming Correspondences Nos"; Rec."Incoming Correspondence Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Correspondence Contact Nos"; Rec."Correspondence Contact Nos")
                {
                    ApplicationArea = Basic;
                }
            }
            // SharePoint
            // group("Memo Directories")
            // {
            //     field("Administration Memos"; Rec."Administration Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Administration Memos field.', Comment = '%';
            //     }
            //     field("Audit Memo"; Rec."Audit Memo")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Audit Memo field.', Comment = '%';
            //     }
            //     field("Corporate Communication Memo"; Rec."Corporate Communication Memo")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Corporate Communication Memo field.', Comment = '%';
            //     }
            //     field("EAP Memo"; Rec."EAP Memo")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the EAP Memo field.', Comment = '%';
            //     }
            //     field("Education and Research Memo"; Rec."Education and Research Memo")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Education and Research Memo field.', Comment = '%';
            //     }
            //     field("Finance & Accounts Memos"; Rec."Finance & Accounts Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Finance & Accounts Memos field.', Comment = '%';
            //     }
            //     field("Human Capital Memos"; Rec."Human Capital Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Human Capital Memos field.', Comment = '%';
            //     }
            //     field("ICT Memos"; Rec."ICT Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the ICT Memos field.', Comment = '%';
            //     }
            //     field("Legal Services Memos"; Rec."Legal Services Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Legal Services Memos field.', Comment = '%';
            //     }
            //     field("Project Files"; Rec."Project Files")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Project Files field.', Comment = '%';
            //     }
            //     field("Staff Personnel Files"; Rec."Staff Personnel Files")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Staff Personnel Files field.', Comment = '%';
            //     }
            //     field("Standards and Compliance Memos"; Rec."Standards and Compliance Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Standards and Compliance Memos field.', Comment = '%';
            //     }
            //     field("Supply Chain Management Memos"; Rec."Supply Chain Management Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Supply Chain Management Memos field.', Comment = '%';
            //     }
            //     field("Transport Memos"; Rec."Transport Memos")
            //     {
            //         ApplicationArea = Basic;
            //         ToolTip = 'Specifies the value of the Transport Memos field.', Comment = '%';
            //     }
            // }
            group("CURRICULUM , RESEARCH AND CONSULTANCE SERVICES")
            {
                Group("POLICY, PROCEDURES, & REGULATIONS")
                {
                    field("POLICY"; Rec."POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the POLICY field.', Comment = '%';
                    }
                    field("Circulars On Education"; Rec."Circulars On Education")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Circulars On Education field.', Comment = '%';
                    }
                    field("Term Dates"; Rec."Term Dates")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Term Dates field.', Comment = '%';
                    }
                    field("Basic Education Course Panel"; Rec."Basic Education Course Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Basic Education Course Panel field.', Comment = '%';
                    }
                    field("Membership to KICD Subject Panels"; Rec."Membership to KICD Subject Panels")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Membership to KICD Subject Panels field.', Comment = '%';
                    }
                    field("East African Cooperation on Education"; Rec."East African Cooperation on Education")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the East African Cooperation on Education field.', Comment = '%';
                    }
                    field("Collaborations and Partnerships-CRS"; Rec."Collaborations and Partnerships-CRS")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Collaborations and Partnerships-CRS field.', Comment = '%';
                    }
                    field("Usaid"; Rec."Usaid")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Usaid field.', Comment = '%';
                    }
                    field("Unesco"; Rec."Unesco")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Unesco field.', Comment = '%';
                    }
                    field("Unicef"; Rec."Unicef")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Unicef field.', Comment = '%';
                    }
                    field("ILO/IPEC Education & Training"; Rec."ILO/IPEC Education & Training")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the ILO/IPEC Education & Training field.', Comment = '%';
                    }
                    field("NACADAA"; Rec."NACADAA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NACADAA field.', Comment = '%';
                    }
                    field("MOE"; Rec."MOE")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the MOE field.', Comment = '%';
                    }
                    field("K NEC"; Rec."K NEC")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the K NEC field.', Comment = '%';
                    }
                    field("NEMA"; Rec."NEMA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NEMA field.', Comment = '%';
                    }
                    field("National Parks/Museums of Kenya"; Rec."National Parks/Museums of Kenya")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the National Parks/Museums of Kenya field.', Comment = '%';
                    }
                    field("City Council of Nairobi"; Rec."City Council of Nairobi")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the City Council of Nairobi field.', Comment = '%';
                    }
                    field("JICA"; Rec."JICA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the JICA field.', Comment = '%';
                    }
                    field("Kenya Bureau of Standards"; Rec."Kenya Bureau of Standards")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Bureau of Standards field.', Comment = '%';
                    }
                    field("I Choose Life"; Rec."I Choose Life")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the I Choose Life field.', Comment = '%';
                    }
                    field("Feed the Children"; Rec."Feed the Children")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Feed the Children field.', Comment = '%';
                    }
                    field("Kenya Association of Professional Counsellors"; Rec."Kenya Association of Professional Counsellors")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Association of Professional Counsellors field.', Comment = '%';
                    }
                    field("URAIA"; Rec."URAIA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the URAIA field.', Comment = '%';
                    }
                    field("CCK"; Rec."CCK")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the CCK field.', Comment = '%';
                    }
                    field("KEPSHA"; Rec."KEPSHA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KEPSHA field.', Comment = '%';
                    }
                    field("KESSHA"; Rec."KESSHA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KESSHA field.', Comment = '%';
                    }
                    field("Kenya Publishers Association"; Rec."Kenya Publishers Association")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Publishers Association field.', Comment = '%';
                    }
                    field("National Book Development Council of Kenya"; Rec."National Book Development Council of Kenya")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the National Book Development Council of Kenya field.', Comment = '%';
                    }
                    field("Ministry of Roads & Public Works"; Rec."Ministry of Roads & Public Works")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Ministry of Roads & Public Works field.', Comment = '%';
                    }
                    field("Public Service Commission"; Rec."Public Service Commission")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Public Service Commission field.', Comment = '%';
                    }
                    field("KBC"; Rec."KBC")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBC field.', Comment = '%';
                    }
                    field("TSC"; Rec."TSC")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the TSC field.', Comment = '%';
                    }
                    field("WSPA"; Rec."WSPA")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the WSPA field.', Comment = '%';
                    }
                    field("IBM"; Rec."IBM")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the IBM field.', Comment = '%';
                    }
                    field("Women Educational Researchers of Kenya"; Rec."Women Educational Researchers of Kenya")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Women Educational Researchers of Kenya field.', Comment = '%';
                    }
                    field("Memorandum of Understanding"; Rec."Memorandum of Understanding")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Memorandum of Understanding field.', Comment = '%';
                    }
                    field("KISE"; Rec."KISE")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KISE field.', Comment = '%';
                    }
                    field("Association of Charitable Children Institutions of Kenya(ACCICK)"; Rec."Association of Charitable Children Institutions of Kenya(ACCICK)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Association of Charitable Children Institutions of Kenya(ACCICK) field.', Comment = '%';
                    }
                    field("IEBC"; Rec."IEBC")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the IEBC field.', Comment = '%';
                    }
                    field("Education for Sustainable Development(ESD)"; Rec."Education for Sustainable Development(ESD)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Education for Sustainable Development(ESD) field.', Comment = '%';
                    }
                }
                group("EDUCATION PROJECTS")
                {
                    field("Curriculum Review Projects"; Rec."Curriculum Review Projects")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Curriculum Review Projects field.', Comment = '%';
                    }
                    field("NESSP"; Rec."NESSP")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NESSP field.', Comment = '%';
                    }
                    field("Tafakari"; Rec."Tafakari")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tafakari field.', Comment = '%';
                    }
                    field("NEPAD Schools"; Rec."NEPAD Schools")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NEPAD Schools field.', Comment = '%';
                    }
                    field("Laptops Project cf digital literacy programme"; Rec."Laptops Project cf digital literacy programme")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Laptops Project cf digital literacy programme field.', Comment = '%';
                    }
                    field("Kenya Future Leaders"; Rec."Kenya Future Leaders")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Future Leaders field.', Comment = '%';
                    }
                    field("Evaluation & Validation of Curriculum-Basic"; Rec."Evaluation & Validation of Curriculum-Basic")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Evaluation & Validation of Curriculum-Basic field.', Comment = '%';
                    }
                    field("Evaluation & Validation of Curriculum-TVET"; Rec."Evaluation & Validation of Curriculum-TVET")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Evaluation & Validation of Curriculum-TVET field.', Comment = '%';
                    }
                    field("Evaluation & Validation of Curriculum-SP"; Rec."Evaluation & Validation of Curriculum-SP")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Evaluation & Validation of Curriculum-SP field.', Comment = '%';
                    }
                    field("Evaluation & Validation of Curriculum-Research"; Rec."Evaluation & Validation of Curriculum-Research")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Evaluation & Validation of Curriculum-Research field.', Comment = '%';
                    }

                    field("Evaluation & Validation of Curriculum-MES"; Rec."Evaluation & Validation of Curriculum-MES")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Evaluation & Validation of Curriculum-MES field.', Comment = '%';
                    }
                    field("Curriculum Reforms"; Rec."Curriculum Reforms")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Curriculum Reforms field.', Comment = '%';
                    }
                    field("Curriculum Reforms Pathways"; Rec."Curriculum Reforms Pathways")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Curriculum Reforms Pathways field.', Comment = '%';
                    }
                    field("Consultancy Services-basic"; Rec."Consultancy Services-basic")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Consultancy Services-basic field.', Comment = '%';
                    }
                    field("Stakeholder Reports and publications"; Rec."Stakeholder Reports and publications")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Stakeholder Reports and publications field.', Comment = '%';
                    }
                    field("Academic Board-Agenda & Minutes"; Rec."Academic Board-Agenda & Minutes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Academic Board-Agenda & Minutes field.', Comment = '%';
                    }
                    field("Correspondence on Education Systems-not opened"; Rec."Correspondence on Education Systems-not opened")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Correspondence on Education Systems-not opened field.', Comment = '%';
                    }


                    field("Translations"; Rec."Translations")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Translations field.', Comment = '%';
                    }
                }



                group("ECD")
                {
                    field("Nacece general correspondence"; Rec."Nacece general correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Nacece general correspondence field.', Comment = '%';
                    }
                    field("Training programmes"; Rec."Training programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Training programmes field.', Comment = '%';
                    }
                    field("ECD activity areas"; Rec."ECD activity areas")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the ECD activity areas field.', Comment = '%';
                    }
                    field("Pre School education course correspondence"; Rec."Pre School education course correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Pre School education course correspondence field.', Comment = '%';
                    }
                    field("Pre School curriculum"; Rec."Pre School curriculum")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Pre School curriculum field.', Comment = '%';
                    }
                    field("Early Childhood Development-Diploma"; Rec."Early Childhood Development-Diploma")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Early Childhood Development-Diploma field.', Comment = '%';
                    }
                    field("World forum on early care and education"; Rec."World forum on early care and education")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the World forum on early care and education field.', Comment = '%';
                    }
                    field("Islamic Intergrated Education Programmes"; Rec."Islamic Intergrated Education Programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of theIslamic Intergrated Education Programmes field.', Comment = '%';
                    }
                }
                group("PRIMARY")
                {
                    field("MATTER 1"; Rec."MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the MATTER 1 field.', Comment = '%';
                    }
                    field("Primary english panel correspondence"; Rec."Primary english panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary english panel correspondence field.', Comment = '%';
                    }
                    field("Primary kiswahili panel correspondence"; Rec."Primary kiswahili panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary kiswahili panel correspondence field.', Comment = '%';
                    }
                    field("Primary mathematics panel correspondence"; Rec."Primary mathematics panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary mathematics panel correspondence field.', Comment = '%';
                    }
                    field("Primary science panel correspondence"; Rec."Primary science panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary science panel correspondence field.', Comment = '%';
                    }
                    field("Primary CRE panel correspondence"; Rec."Primary CRE panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary CRE panel correspondence field.', Comment = '%';
                    }
                    field("Primary Hindu R E panel correspondence"; Rec."Primary Hindu R E panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary Hindu R E panel correspondence field.', Comment = '%';
                    }
                    field("Primary social studies panel correspondence"; Rec."Primary social studies panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary social studies panel correspondence field.', Comment = '%';
                    }
                    field("Primary Islamic R E panel correspondence"; Rec."Primary Islamic R E panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary Islamic R E panel correspondence field.', Comment = '%';
                    }
                    field("Primary creative Arts panel correspondence"; Rec."Primary creative Arts panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary creative Arts panel correspondence field.', Comment = '%';
                    }
                    field("Primary Mothertongue panel correspondence"; Rec."Primary Mothertongue panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary Mothertongue panel correspondence field.', Comment = '%';
                    }
                    field("Primary P.E panel correspondence"; Rec."Primary P.E panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary P.E panel correspondence field.', Comment = '%';
                    }
                }
                group("SECONDARY")
                {
                    field("Secondary education course panel"; Rec."Secondary education course panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary education course panel field.', Comment = '%';
                    }
                    field("Secondary Alternative curriculum"; Rec."Secondary Alternative curriculum")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Alternative curriculum field.', Comment = '%';
                    }
                    field("Secondary english panel correspondence"; Rec."Secondary english panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary english panel correspondence field.', Comment = '%';
                    }
                    field("Secondary kiswahili panel correspondence"; Rec."Secondary kiswahili panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary kiswahili panel correspondence field.', Comment = '%';
                    }
                    field("Secondary german panel correspondence"; Rec."Secondary german panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary german panel correspondence field.', Comment = '%';
                    }
                    field("Secondary french panel correspondence"; Rec."Secondary french panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary french panel correspondence field.', Comment = '%';
                    }
                    field("Secondary Arabic panel correspondence"; Rec."Secondary Arabic panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Arabic panel correspondence field.', Comment = '%';
                    }
                    field("Secondary Chinese panel correspondence"; Rec."Secondary Chinese panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Chinese panel correspondence field.', Comment = '%';
                    }
                    field("Secondary mathematics panel correspondence"; Rec."Secondary mathematics panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary mathematics panel correspondence field.', Comment = '%';
                    }
                    field("Secondary physics panel correspondence"; Rec."Secondary physics panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary physics panel correspondence field.', Comment = '%';
                    }
                    field("Secondary biology panel correspondence"; Rec."Secondary biology panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary biology panel correspondence field.', Comment = '%';
                    }
                    field("Secondary agriculture panel correspondence"; Rec."Secondary agriculture panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary agriculture panel correspondence field.', Comment = '%';
                    }
                    field("Secondary homescience panel correspondence"; Rec."Secondary homescience panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary homescience panel correspondence field.', Comment = '%';
                    }
                    field("Secondary computer studies panel"; Rec."Secondary computer studies panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary computer studies panel field.', Comment = '%';
                    }
                    field("Secondary music panel correspondence"; Rec."Secondary music panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary music panel correspondence field.', Comment = '%';
                    }
                    field("Secondary art and design panel correspondence"; Rec."Secondary art and design panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary art and design panel correspondence field.', Comment = '%';
                    }
                    field("Secondary business studies panel"; Rec."Secondary business studies panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary business studies panel field.', Comment = '%';
                    }
                    field("Secondary geography panel correspondence"; Rec."Secondary geography panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary geography panel correspondence field.', Comment = '%';
                    }
                    field("Secondary history panel correspondence"; Rec."Secondary history panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary history panel correspondence field.', Comment = '%';
                    }
                    field("Secondary CRE panel correspondence"; Rec."Secondary CRE panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary CRE panel correspondence field.', Comment = '%';
                    }
                    field("Secondary IRE panel correspondence"; Rec."Secondary IRE panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary IRE panel correspondence field.', Comment = '%';
                    }
                    field("Secondary HRE panel correspondence"; Rec."Secondary HRE panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary HRE panel correspondence field.', Comment = '%';
                    }
                    field("Secondary physical sciences panel"; Rec."Secondary physical sciences panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary physical sciences panel field.', Comment = '%';
                    }
                    field("Secondary Chemistry Panel Correspondence"; Rec."Secondary Chemistry Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Chemistry Panel Correspondence field.', Comment = '%';
                    }
                    field("Secondary PE Panel Correspondence"; Rec."Secondary PE Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary PE Panel Correspondence field.', Comment = '%';
                    }
                    field("Secondary Woodwork Panel Correspondence"; Rec."Secondary Woodwork Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Press Releases- ADAK COM 9 field.', Comment = '%';
                    }
                    field("Secondary Metalwork Panel Correspondence"; Rec."Secondary Metalwork Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Metalwork Panel Correspondence field.', Comment = '%';
                    }
                    field("Secondary Building and Construction Panel"; Rec."Secondary Building and Construction Panel ")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Building and Construction Panel field.', Comment = '%';
                    }
                    field("Secondary Aviation Panel Correspondence"; Rec."Secondary Aviation Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Aviation Panel Correspondence field.', Comment = '%';
                    }
                    field("Secondary Power Mechanics Panel"; Rec."Secondary Power Mechanics Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Power Mechanics Panel field.', Comment = '%';
                    }
                    field("Secondary Electricity Panel Correspondence"; Rec."Secondary Electricity Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Electricity Panel Correspondence field.', Comment = '%';
                    }
                    field("Secondary Drawing and Design Panel"; Rec."Secondary Drawing and Design Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Drawing and Design Panel field.', Comment = '%';
                    }
                    field("Secondary General Science Panel"; Rec."Secondary General Science Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary General Science Panel field.', Comment = '%';
                    }
                }

                group("TEACHER EDUCATION")
                {

                    field("PTE general correspondence"; Rec."PTE general correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PTE general correspondence field.', Comment = '%';
                    }
                    field("DTE general corespondence"; Rec."DTE general corespondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE general corespondence field.', Comment = '%';
                    }
                    field("Diploma in primary teacher education review"; Rec."Diploma in primary teacher education review")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Diploma in primary teacher education review field.', Comment = '%';
                    }
                    field("PTE Languages panel correspondence"; Rec."PTE Languages panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PTE Languages panel correspondence field.', Comment = '%';
                    }
                    field("PTE Sciences & mathematics panel correspondence"; Rec."PTE Sciences & mathematics panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PTE Sciences & mathematics panel correspondence field.', Comment = '%';
                    }
                    field("PTE Humanities panel correspondence"; Rec."PTE Humanities panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PTE Humanities panel correspondence field.', Comment = '%';
                    }
                    field("PTE Creative arts panel correspondence"; Rec."PTE Creative arts panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PTE Creative arts panel correspondence field.', Comment = '%';
                    }
                    field("PTE Professional subjects"; Rec."PTE Professional subjects")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PTE Professional subjects field.', Comment = '%';
                    }
                    field("DTE languages panel correspondence"; Rec."DTE languages panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE languages panel correspondence field.', Comment = '%';
                    }
                    field("DTE Sciences and mathematics panel"; Rec."DTE Sciences and mathematics panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE Sciences and mathematics panel field.', Comment = '%';
                    }
                    field("DTE Humanities panel correspondence"; Rec."DTE Humanities panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE Humanities panel correspondence field.', Comment = '%';
                    }
                    field("DTE Creative arts panel correspondence"; Rec."DTE Creative arts panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE Creative arts panel correspondence field.', Comment = '%';
                    }
                    field("DTE Professional & support subjects panel"; Rec."DTE Professional & support subjects panel ")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE Professional & support subjects panel field.', Comment = '%';
                    }
                    field("DTE Technical subjects panel correspondence"; Rec."DTE Technical subjects panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the DTE Technical subjects panel correspondence field.', Comment = '%';
                    }
                }
                group("NON FORMAL EDUCATION")
                {
                    field("NFE Project general correspondence"; Rec."NFE Project general correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NFE Project general correspondence field.', Comment = '%';
                    }
                    field("Basic NFE languages"; Rec."Basic NFE languages")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Basic NFE languages field.', Comment = '%';
                    }
                    field("Basic NFE sciences"; Rec."Basic NFE sciences")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Basic NFE sciences field.', Comment = '%';
                    }
                    field("NFE technical subjects"; Rec."NFE technical subjects")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NFE technical subjects field.', Comment = '%';
                    }
                    field("Basic NFE humanities"; Rec."Basic NFE humanities")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Basic NFE humanities field.', Comment = '%';
                    }
                }
                group("ADULT AND CONTINUING EDUCATION")
                {


                    field("MATTER1"; Rec."MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the MATTER 1 field.', Comment = '%';
                    }
                    field("Literacy panel correspondence"; Rec."Literacy panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Literacy panel correspondence field.', Comment = '%';
                    }
                    field("Adult and continuing education course panel"; Rec."Adult and continuing education course panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Adult and continuing education course panel field.', Comment = '%';
                    }
                    field("Accounting Panel Correspondence"; Rec."Accounting Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Accounting Panel Correspondence field.', Comment = '%';
                    }
                    field("Adult teacher education correspondence (ATEC)"; Rec."Adult teacher education correspondence (ATEC)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Adult teacher education correspondence (ATEC) field.', Comment = '%';
                    }
                }
                group("SPECIAL NEEDS EDUCATION")
                {


                    field("Special education course panel"; Rec."Special education course panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education course panel field.', Comment = '%';
                    }
                    field("Special education general correspondence"; Rec."Special education general correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education general correspondence field.', Comment = '%';
                    }
                    field("Sign language"; Rec."Sign language")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Sign language field.', Comment = '%';
                    }
                    field("Disability Mainstreaming"; Rec."Disability Mainstreaming")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Disability Mainstreaming field.', Comment = '%';
                    }
                    field("Special education physically handicapped panel"; Rec."Special education physically handicapped panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education physically handicapped panel field.', Comment = '%';
                    }
                    field("Special education mentally handicapped panel"; Rec."Special education mentally handicapped panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education mentally handicapped panel field.', Comment = '%';
                    }
                    field("Special education visually handicapped panel"; Rec."Special education visually handicapped panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education visually handicapped panel field.', Comment = '%';
                    }
                    field("Special education Deaf-Blind panel"; Rec."Special education Deaf-Blind panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education Deaf-Blind panel field.', Comment = '%';
                    }
                    field("Special education gifted and talented panel"; Rec."Special education gifted and talented panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education gifted and talented panel field.', Comment = '%';
                    }
                    field("Autism"; Rec."Autism")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Autism field.', Comment = '%';
                    }
                    field("Learning disability panel correspondence"; Rec."Learning disability panel correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Learning disability panel correspondence field.', Comment = '%';
                    }
                    field("special education hearing impaired panel"; Rec."special education hearing impaired panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the special education hearing impaired panel field.', Comment = '%';
                    }
                }
                group("CROSS CUTTING ISSUES")
                {
                    field("HIV AIDS Committee"; Rec."HIV AIDS Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the HIV AIDS Committee field.', Comment = '%';
                    }
                    field("Voluntary Counselling and Testing (VCT)"; Rec."Voluntary Counselling and Testing (VCT)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Voluntary Counselling and Testing (VCT) field.', Comment = '%';
                    }
                    field("Aids Control Unit (ACU)"; Rec."Aids Control Unit (ACU)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Aids Control Unit (ACU) field.', Comment = '%';
                    }
                    field("Disaster Risk Reduction"; Rec."Disaster Risk Reduction")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Disaster Risk Reduction field.', Comment = '%';
                    }

                    field("Emerging issues general correspondence"; Rec."Emerging issues general correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Emerging issues general correspondence field.', Comment = '%';
                    }
                    field("Guidance on sexuality matters"; Rec."Guidance on sexuality matters")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Guidance on sexuality matters field.', Comment = '%';
                    }
                    field("Gender mainstreaming education and training"; Rec."Gender mainstreaming education and training")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Gender mainstreaming education and training field.', Comment = '%';
                    }
                    field("Civic Education General correspondence"; Rec."Civic Education General correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Civic Education General correspondence field.', Comment = '%';
                    }
                    field("Peace Education"; Rec."Peace Education")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Peace Education field.', Comment = '%';
                    }
                    field("Guidance and Counselling"; Rec."Guidance and Counselling")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Guidance and Counselling field.', Comment = '%';
                    }

                    field("Life Skills"; Rec."Life Skills")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Life Skills field.', Comment = '%';
                    }
                }
                group("SPECIAL PROGRAMMES")
                {


                    field("Dvisional Reports"; Rec."Dvisional Reports")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Dvisional Reports field.', Comment = '%';
                    }
                    field("Special Programmes General Correspondence"; Rec."Special Programmes General Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special Programmes General Correspondence field.', Comment = '%';
                    }
                }
                group("RESEARCH")
                {


                    field("Research and Evaluation"; Rec."Research and Evaluation")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Research and Evaluation field.', Comment = '%';
                    }
                    field("Request to Conduct Research"; Rec."Request to Conduct Research")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request to Conduct Research field.', Comment = '%';
                    }


                    field("Research Journal"; Rec."Research Journal")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Research Journal field.', Comment = '%';
                    }
                    field("KIE Education Symposium"; Rec."KIE Education Symposium")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Education Symposium field.', Comment = '%';
                    }
                    field("Collaborations with Research Institutions"; Rec."Collaborations with Research Institutions")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Collaborations with Research Institutions field.', Comment = '%';
                    }

                    field("Research Panel Correspondence"; Rec."Research Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Research Panel Correspondence field.', Comment = '%';
                    }
                    field("Basic Research"; Rec."Basic Research")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Basic Research field.', Comment = '%';
                    }
                    field("Applied Research"; Rec."Applied Research")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applied Research field.', Comment = '%';
                    }
                }
                group("COFS")
                {


                    field("COFS -General correspondence"; Rec."COFS -General correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -General correspondence field.', Comment = '%';
                    }
                    field("COFS -Orientation report"; Rec."COFS -Orientation report")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Orientation report field.', Comment = '%';
                    }
                    field("COFS -Gender"; Rec."COFS -Gender")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Gender field.', Comment = '%';
                    }
                    field("COFS -Lifeskills"; Rec."COFS -Lifeskills")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Lifeskills field.', Comment = '%';
                    }
                    field("COFS -Research and evaluation"; Rec."COFS -Research and evaluation")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Research and evaluation field.', Comment = '%';
                    }
                    field("COFS-ECD"; Rec."COFS-ECD")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS-ECD field.', Comment = '%';
                    }
                    field("COFS -Primary"; Rec."COFS -Primary")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Primary field.', Comment = '%';
                    }
                    field("COFS-Secondary"; Rec."COFS-Secondary")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS-Secondary field.', Comment = '%';
                    }
                    field("COFS-NFE"; Rec."COFS-NFE")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS-NFE field.', Comment = '%';
                    }
                    field("COFS-ACE"; Rec."COFS-ACE")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS-ACE field.', Comment = '%';
                    }
                    field("COFS-TIVET"; Rec."COFS-TIVET")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS-TIVET field.', Comment = '%';
                    }
                    field("COFS -Electronics and emerging media"; Rec."COFS -Electronics and emerging media")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Electronics and emerging media field.', Comment = '%';
                    }

                    field("COFS -Symposium"; Rec."COFS -Symposium")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Symposium field.', Comment = '%';
                    }
                    field("COFS -Radio programmes"; Rec."COFS -Radio programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS -Radio programmes field.', Comment = '%';
                    }
                }
                group("TIVET")
                {
                    field("Tivet Course Panel Correspondence"; Rec."Tivet Course Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tivet Course Panel Correspondence field.', Comment = '%';
                    }
                    field("Tourism Management Panel Correspondence"; Rec."Tourism Management Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tourism Management Panel Correspondence field.', Comment = '%';
                    }
                    field("Insurance Courses Correspondence"; Rec."Insurance Courses Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Insurance Courses Correspondence field.', Comment = '%';
                    }

                    field("Business And Hospitality Management Panel"; Rec."Business And Hospitality Management Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Business And Hospitality Management Panel field.', Comment = '%';
                    }
                    field("Disaster And Risk Management"; Rec."Disaster And Risk Management")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Disaster And Risk Management field.', Comment = '%';
                    }
                    field("Secretarial National Panel Correspondence"; Rec."Secretarial National Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secretarial National Panel Correspondence field.', Comment = '%';
                    }
                    field("Co-Operative Education"; Rec."Co-Operative Education")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Co-Operative Education field.', Comment = '%';
                    }
                    field("Entrepreneurship Panel Correspondence"; Rec."Entrepreneurship Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Entrepreneurship Panel Correspondence field.', Comment = '%';
                    }
                    field("Transport Panel General Correspondence"; Rec."Transport Panel General Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Panel General Correspondence field.', Comment = '%';
                    }
                    field("Building And Civil Engineering Panel Correspondence"; Rec."Building And Civil Engineering Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Building And Civil Engineering Panel Correspondence field.', Comment = '%';
                    }
                    field("Domestic/Home Management Panel Correspondence"; Rec."Domestic/Home Management Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Domestic/Home Management Panel Correspondence field.', Comment = '%';
                    }
                    field("Front Office Management Panel Correspondence"; Rec."Front Office Management Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Front Office Management Panel Correspondence field.', Comment = '%';
                    }
                    field("Catering And Accommodation Panel Correspondence"; Rec."Catering And Accommodation Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Catering And Accommodation Panel Correspondence field.', Comment = '%';
                    }
                    field("Water Engineering Panel Correspondence"; Rec."Water Engineering Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Water Engineering Panel Correspondence field.', Comment = '%';
                    }
                    field("Computer Studies"; Rec."Computer Studies")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Computer Studies field.', Comment = '%';
                    }


                    field("Mechanical Automobile Agricultural And Prime Mover"; Rec."Mechanical Automobile Agricultural And Prime Mover")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Mechanical Automobile Agricultural And Prime Mover field.', Comment = '%';
                    }
                    field("Leather Technology Panel Correspondence"; Rec."Leather Technology Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Leather Technology Panel Correspondence field.', Comment = '%';
                    }
                    field("Fisheries Technology Panel Correspondence"; Rec."Fisheries Technology Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Fisheries Technology Panel Correspondence field.', Comment = '%';
                    }
                    field("Medical Engineering Panel Orrespondence"; Rec."Medical Engineering Panel Orrespondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Medical Engineering Panel Orrespondence field.', Comment = '%';
                    }
                    field("Texile And Garment Management Panel"; Rec."Texile And Garment Management Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Texile And Garment Management Panel field.', Comment = '%';
                    }
                    field("Electrical Electronics And Telecommunication Engineering"; Rec."Electrical Electronics And TelecommunicationEngineering")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Electrical Electronics And Telecommunication Engineering field.', Comment = '%';
                    }
                    field("Information Studies"; Rec."Information Studies")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Information Studies field.', Comment = '%';
                    }
                    field("Food Processing Technology"; Rec."Food Processing Technology")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Food Processing Technology field.', Comment = '%';
                    }
                    field("Agriculture Panel Correspondence"; Rec."Agriculture Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Agriculture Panel Correspondence field.', Comment = '%';
                    }
                    field("Applied Sciences Panel Correspondence"; Rec."Applied Sciences Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applied Sciences Panel Correspondence field.', Comment = '%';
                    }
                    field("Nutrition And Dietetics"; Rec."Nutrition And Dietetics")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Nutrition And Dietetics field.', Comment = '%';
                    }
                    field("Supply Chain Management Panel Correspondence"; Rec."Supply Chain Management Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Supply Chain Management Panel Correspondence field.', Comment = '%';
                    }
                    field("Medical Laboratory Technology"; Rec."Medical Laboratory Technology")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Medical Laboratory Technology field.', Comment = '%';
                    }
                    field("Analytical Chemistry"; Rec."Analytical Chemistry")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Analytical Chemistry field.', Comment = '%';
                    }
                    field("Community Health And Nutrition"; Rec."Community Health And Nutrition")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Community Health And Nutrition field.', Comment = '%';
                    }
                    field("Sustainable Agriculture"; Rec."Sustainable Agriculture")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Sustainable Agriculture field.', Comment = '%';
                    }
                    field("Food and Beverages"; Rec."Food and Beverages")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Food and Beverages field.', Comment = '%';
                    }
                    field("Human Resource Management panel"; Rec."Human Resource Management panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Human Resource Management panel field.', Comment = '%';
                    }
                    field("Science Laboratory Tecnology Panel"; Rec."Science Laboratory Tecnology Panel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Ong''inti Anyona Dennis-ADAK EAP 018 field.', Comment = '%';
                    }
                    field("AccountingPanelCorrespondence"; Rec."Accounting Panel Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Accounting Panel Correspondence field.', Comment = '%';
                    }
                }

                group("CONSULTANCY SERVICES")
                {
                    field("Consultancyservices"; Rec."Consultancy services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Consultancy services field.', Comment = '%';
                    }
                    field("Kenya ports authority bandari college"; Rec."Kenya ports authority bandari college")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya ports authority bandari college field.', Comment = '%';
                    }
                    field("Kenya Institute of bankers"; Rec."Kenya Institute of bankers")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Institute of bankers field.', Comment = '%';
                    }
                    field("Public procurenet oversight authority"; Rec."Public procurenet oversight authority")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Public procurenet oversight authority field.', Comment = '%';
                    }
                    field("Kenya wildlife services"; Rec."Kenya wildlife services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya wildlife services field.', Comment = '%';
                    }
                    field("Computer for Schools"; Rec."Computer for Schools")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Computer for Schools field.', Comment = '%';
                    }


                    field("Kenya Prisons"; Rec."Kenya Prisons")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Prisons field.', Comment = '%';
                    }
                    field("Kenya Police Service"; Rec."Kenya Police Service")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Police Service field.', Comment = '%';
                    }
                    field("Youth Polytechnic Programmes"; Rec."Youth Polytechnic Programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Youth Polytechnic Programmes field.', Comment = '%';
                    }
                    field("Directorate of Occupational Safety and Health Services. (DOSH)"; Rec."Directorate of Occupational Safety and HealthServices.(DOSH)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Directorate of Occupational Safety and Health Services. (DOSH) field.', Comment = '%';
                    }
                }
                group("TEXT BOOK ADMINISTRATION")
                {
                    field("Textbook submission and review"; Rec."Textbook submission and review")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Textbook submission and review field.', Comment = '%';
                    }
                    field("Book Review"; Rec."Book Review")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Book Review field.', Comment = '%';
                    }
                    field("Ministerial Textbook Vetting Committee"; Rec."Ministerial Textbook Vetting Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Ministerial Textbook Vetting Committee field.', Comment = '%';
                    }
                }

            }
            group("MEDIA AND TECHNICAL SERVICES")
            {
                group("RADIO")
                {
                    field("School Broadcast Timetable"; Rec."Textbook submission and review")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Textbook submission and review field.', Comment = '%';
                    }
                    field("Radio General Correspondence"; Rec."Radio General Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Radio General Correspondence field.', Comment = '%';
                    }
                    field("Interactive Radio Instruction"; Rec."Interactive Radio Instruction")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Interactive Radio Instruction field.', Comment = '%';
                    }
                    field("Post box"; Rec."Post box")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Post box field.', Comment = '%';
                    }
                    field("Primary IRE radio"; Rec."Primary IRE radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary IRE radio field.', Comment = '%';
                    }
                    field("Primary science radio"; Rec."Primary science radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary science radio field.', Comment = '%';
                    }
                    field("Primary english radio"; Rec."Primary english radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary english radio field.', Comment = '%';
                    }
                    field("Primary kiswahili production radio"; Rec."Primary kiswahili production radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary kiswahili production radio field.', Comment = '%';
                    }
                    field("Primary CRE radio"; Rec."Primary CRE radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary CRE radio field.', Comment = '%';
                    }
                    field("Primary mathematics radio"; Rec."Primary mathematics radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary mathematics radio field.', Comment = '%';
                    }
                    field("Primary social studies radio"; Rec."Primary social studies radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary social studies radio field.', Comment = '%';
                    }
                    field("Primary physical education radio "; Rec."Primary physical education radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary physical education radio  field.', Comment = '%';
                    }
                    //Secondary
                    field("Secondary mathematics radio"; Rec."Secondary mathematics radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary mathematics radio field.', Comment = '%';
                    }
                    field("Secondary music radio"; Rec."Secondary music radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary music radio field.', Comment = '%';
                    }
                    field("Secondary biology radio"; Rec."Secondary biology radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary biology radio field.', Comment = '%';
                    }
                    field("Secondary french radio"; Rec."Secondary french radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary french radio field.', Comment = '%';
                    }
                    field("Secondary CRE radio"; Rec."Secondary CRE radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary CRE radio field.', Comment = '%';
                    }
                    field("Secondary business studies radio"; Rec."Secondary business studies radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary business studies radio field.', Comment = '%';
                    }
                    field("Secondary computer studies radio"; Rec."Secondary computer studies radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary computer studies radio field.', Comment = '%';
                    }
                    field("Proposal for secondary kiswahili production radio"; Rec."Proposal for secondary kiswahili production radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Proposal for secondary kiswahili production radio field.', Comment = '%';
                    }
                    field("Secondary chemistry radio"; Rec."Secondary chemistry radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary chemistry radio field.', Comment = '%';
                    }
                    field("Secondary physics radio"; Rec."Secondary physics radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary physics radio field.', Comment = '%';
                    }
                    field("Secondary geography radio"; Rec."Secondary geography radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary geography radio field.', Comment = '%';
                    }
                    field("History and goverment radio"; Rec."History and goverment radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the History and goverment radio field.', Comment = '%';
                    }
                    field("Secondary english radio"; Rec."Secondary english radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary english radio field.', Comment = '%';
                    }



                    field("Human rights education radio"; Rec."Human rights education radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Human rights education radio field.', Comment = '%';
                    }
                    field("Guidance and counselling programme radio"; Rec."Guidance and counselling programme radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Guidance and counselling programme radio field.', Comment = '%';
                    }
                    field("HIV and AIDS radio"; Rec."HIV and AIDS radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the HIV and AIDS radio field.', Comment = '%';
                    }
                    field("Lifeskills Radio"; Rec."Lifeskills Radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Lifeskills Radiol field.', Comment = '%';
                    }
                    field("SNE Radio"; Rec."SNE Radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Membership to KICD Subject Panels field.', Comment = '%';
                    }
                    field("Drugs and Substance abuse Radio"; Rec."Drugs and Substance abuse Radio")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Drugs and Substance abuse Radio field.', Comment = '%';
                    }
                }
                group("TV & FILM")
                {



                    field("Film & TV general correspondence"; Rec."Film & TV general correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Film & TV general correspondence field.', Comment = '%';
                    }
                    field("Drama perfomance"; Rec."Drama perfomance")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Drama perfomance field.', Comment = '%';
                    }
                    field("Science Congress"; Rec."Science Congress")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Science Congress field.', Comment = '%';
                    }
                    field("Music Festivals"; Rec."Music Festivals")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Music Festivals field.', Comment = '%';
                    }
                    field("setbook analysis and recording-english"; Rec."setbook analysis and recording-english")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the setbook analysis and recording-english field.', Comment = '%';
                    }
                    field("setbook analysis and recording-kiswahili"; Rec."setbook analysis and recording-kiswahili")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the setbook analysis and recording-kiswahili field.', Comment = '%';
                    }
                    field("SUBJECT 1"; Rec."SUBJECT 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the SUBJECT 1 field.', Comment = '%';
                    }
                    field("TV languages foreign"; Rec."TV languages foreign")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the TV languages foreign field.', Comment = '%';
                    }
                    field("Media proposals Sciences-TV"; Rec."Media proposals Sciences-TV ")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Media proposals Sciences-TV field.', Comment = '%';
                    }
                    field("Media proposals humanities-TV"; Rec."Media proposals humanities-TV")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the National Parks/Museums of Kenya field.', Comment = '%';
                    }
                    field("TV languages-english"; Rec."TV languages-english")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the TV languages-english field.', Comment = '%';
                    }
                    field("Secondary mathematics-TV"; Rec."Secondary mathematics-TV")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary mathematics-TV field.', Comment = '%';
                    }
                    field("Script Writers and artists"; Rec."Script Writers and artists")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of theScript Writers and artists field.', Comment = '%';
                    }
                    field("Other media productions"; Rec."Other media productions")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Other media productions field.', Comment = '%';
                    }
                    //Generalties

                    field("General TV Production"; Rec."General TV Production")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the General TV Production field.', Comment = '%';
                    }
                    field("TV Generalities"; Rec."TV Generalities")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the TV Generalities field.', Comment = '%';
                    }
                    field("Feature Production"; Rec."Feature Production")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Feature Production field.', Comment = '%';
                    }
                    field("Documentaries"; Rec."Documentaries")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Documentaries field.', Comment = '%';
                    }
                    field("Outreach Programmes"; Rec."Outreach Programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Outreach Programmes field.', Comment = '%';
                    }
                    //MES COLLABORATIONS
                    field("Collaborations and Partnerships - MES"; Rec."Collaborations and Partnerships - MES")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Collaborations and patnerships- MES field.', Comment = '%';
                    }
                    field("Talents"; Rec."Talents")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Talents field.', Comment = '%';
                    }
                    field("Innovations for Poverty Action (IPA)"; Rec."Innovations for Poverty Action (IPA)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Innovations for Poverty Action (IPA) field.', Comment = '%';
                    }
                }
                group("EDUCATIONAL RESOURCES")
                {
                    field("Library Services"; Rec."Library Services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Library Services field.', Comment = '%';
                    }
                    field("Kenya Gazette"; Rec."Kenya Gazette")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Gazette field.', Comment = '%';
                    }

                    //Bookshop

                    field("BOOKSHOP POLICY"; Rec."BOOKSHOP POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the BOOKSHOP POLICY field.', Comment = '%';
                    }
                    field("BOOKSHOP MATTER 1"; Rec."BOOKSHOP MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the BOOKSHOP MATTER 1 field.', Comment = '%';
                    }
                    field("Bookshop reports"; Rec."Bookshop reports")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bookshop reports field.', Comment = '%';
                    }
                    field("Request for syllabi"; Rec."Request for syllabi")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for syllabi field.', Comment = '%';
                    }
                    field("Request for Books"; Rec."Request for Books")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Books field.', Comment = '%';
                    }
                    field("Bookshop Sales"; Rec."Bookshop Sales")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bookshop Sales field.', Comment = '%';
                    }

                    //RESOURCE MATERIALS
                    field("RESOURCE MATERIALS POLICY"; Rec."RESOURCE MATERIALS POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the RESOURCE MATERIALS POLICY field.', Comment = '%';
                    }

                    field("Educational Resources General correspondence"; Rec."Educational Resources General correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Educational Resources General correspondence field.', Comment = '%';
                    }
                    field("Dissemination and utilization of curriculum support materials"; Rec."Dissemination and utilization of curriculum support materials")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Dissemination and utilization of curriculum support materials field.', Comment = '%';
                    }
                    field("E R Materials development & production"; Rec."E R Materials development & production")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the E R Materials development & production field.', Comment = '%';
                    }

                    //PRINT & PUBLICATION

                    field("PRINT & PUBLICATION POLICY"; Rec."PRINT & PUBLICATION POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PRINT & PUBLICATION POLICY field.', Comment = '%';
                    }
                    field("PRINT & PUBLICATION MATTER 1"; Rec."PRINT & PUBLICATION MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PRINT & PUBLICATION MATTER 1 field.', Comment = '%';
                    }
                    field("Print and Publications"; Rec."Print and Publications")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Print and Publications+confidential field.', Comment = '%';
                    }
                    field("International Standard Book Number (ISBN)"; Rec."International Standard Book Number (ISBN)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the International Standard Book Number (ISBN) field.', Comment = '%';
                    }
                    field("Printing Machines"; Rec."Printing Machines")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Printing Machines field.', Comment = '%';
                    }
                    field("Request for Printing Services - External Clients"; Rec."Request for Printing Services - External Clients")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Printing Services - External Clients field.', Comment = '%';
                    }

                    //Request for Printing Services-Internal

                    field("Request for Printing Services - TIVET"; Rec."Request for Printing Services - TIVET")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Printing Services - TIVET field.', Comment = '%';
                    }
                    field("Request for Printing Services - Basic"; Rec."Request for Printing Services - Basic")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Printing Services - Basic field.', Comment = '%';
                    }
                    field("Request for Printing Services-RM&E"; Rec."Request for Printing Services-RM&E")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Printing Services-RM&E field.', Comment = '%';
                    }
                    field("Request for Printing Services-ER"; Rec."Request for Printing Services-ER")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Printing Services-ER field.', Comment = '%';
                    }
                    field("Request for printing services-CS"; Rec."Request for printing services-CS")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for printing services-CS field.', Comment = '%';
                    }
                    field("Request for printing services-SP"; Rec."Request for printing services-SP")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for printing services-SP field.', Comment = '%';
                    }
                    field("Request for Printing Services-EEM"; Rec."Request for Printing Services-EEM")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Printing Services-EEM field.', Comment = '%';
                    }
                    field("Repair and maintenance of printing equipment"; Rec."Repair and maintenance of printing equipment")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Repair and maintenance of printing equipment field.', Comment = '%';
                    }
                }
                group("TECHNICAL SERVICES")
                {


                    //ENGINEERING
                    field("TECHNICAL SERVICES POLICY"; Rec."TECHNICAL SERVICES POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the TECHNICAL SERVICES POLICY field.', Comment = '%';
                    }
                    //MATTERS NOT SPECIFIED
                    field("TECHNICAL SERVICES MATTER 1"; Rec."TECHNICAL SERVICES MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the TECHNICAL SERVICES MATTER 1 field.', Comment = '%';
                    }
                    field("Hire of OB Van"; Rec."Hire of OB Van")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Hire of OB Van field.', Comment = '%';
                    }
                    field("Installation of equipments"; Rec."Installation of equipments")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Installation of equipments field.', Comment = '%';
                    }
                    field("Hire of EMS technical equipment"; Rec."Hire of EMS technical equipment")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Hire of EMS technical equipment field.', Comment = '%';
                    }
                    field("Request for use of EMS FACILITIES"; Rec."Request for use of EMS FACILITIES")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for use of EMS FACILITIES field.', Comment = '%';
                    }
                    field("Requisitions for EMS technical equipment"; Rec."Requisitions for EMS technical equipment")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Requisitions for EMS technical equipment field.', Comment = '%';
                    }
                    //ELECTRONIC LEARNING
                    field("ELECTRONIC LEARNING POLICY"; Rec."ELECTRONIC LEARNING POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the ELECTRONIC LEARNING POLICY field.', Comment = '%';
                    }
                    field("E-Learning Consultancy Services"; Rec."E-Learning Consultancy Services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the E-Learning Consultancy Services field.', Comment = '%';
                    }
                    field("Elimika"; Rec."Elimika")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Elimika field.', Comment = '%';
                    }
                    field("E-Learning"; Rec."E-Learning")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the E-Learning field.', Comment = '%';
                    }
                    field("Digital Content Development"; Rec."Digital Content Development")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Digital Content Development field.', Comment = '%';
                    }

                    //PROGRAMMING

                    field("PROGRAMMING POLICY"; Rec."PROGRAMMING POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PROGRAMMING POLICY field.', Comment = '%';
                    }
                    field("PROGRAMMING MATTER 1"; Rec."PROGRAMMING MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PROGRAMMING MATTER 1 field.', Comment = '%';
                    }
                    field("Digital Broadcast Channel"; Rec."Digital Broadcast Channel")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Digital Broadcast Channel field.', Comment = '%';
                    }
                    field("Edu-Channel Generalities"; Rec."Edu-Channel Generalities")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Edu-Channel Generalities field.', Comment = '%';
                    }
                    field("Edu-Channel Programming"; Rec."Edu-Channel Programming")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Edu-Channel Programming field.', Comment = '%';
                    }

                    //ICT

                    field("ICT POLICY"; Rec."ICT POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the ICT POLICY field.', Comment = '%';
                    }
                    field("Curriculum Innovation Centre"; Rec."Curriculum Innovation Centre")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Curriculum Innovation Centre field.', Comment = '%';
                    }
                    field("Project 1"; Rec."Project 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Project 1 field.', Comment = '%';
                    }
                    field("Requisitions for ICT Hardware/Infrastructure"; Rec."Requisitions for ICT Hardware/Infrastructure")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Requisitions for ICT Hardware/Infrastructure field.', Comment = '%';
                    }
                    field("Repair and Maintenance of ICT Hardware/Infrastructure"; Rec."Repair and Maintenance of ICT Hardware/Infrastructure")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Repair and Maintenance of ICT Hardware/Infrastructure field.', Comment = '%';
                    }
                    field("Management Information Systems"; Rec."Management Information Systems")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Management Information Systems field.', Comment = '%';
                    }
                    field("KIE Website"; Rec."KIE Website")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Website field.', Comment = '%';
                    }
                    field("Software Licences"; Rec."Software Licences")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Software Licences field.', Comment = '%';
                    }
                }
            }
            group("GENERAL ADMINISTRATIVE AND SUPPORT SERVICES")
            {
                group("HUMAN RESOURCES")
                {
                    //Human Resources
                    field("Human Resources POLICY"; Rec."Human Resources POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Human Resources POLICY field.', Comment = '%';
                    }
                    //HRM
                    field("HRM POLICY"; Rec."HRM POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the HRM POLICY field.', Comment = '%';
                    }


                    field("Circulars On HRMD"; Rec."Circulars On HRMD")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Secondary Alternative curriculum field.', Comment = '%';
                    }
                    field("Disciplinary Committee"; Rec."Disciplinary Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Disciplinary Committeee field.', Comment = '%';
                    }
                    field("Board of Trustees-Agenda and Minutes"; Rec."Board of Trustees-Agenda and Minutes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Board of Trustees-Agenda and Minutes field.', Comment = '%';
                    }
                    field("Safaricom Laptop Project"; Rec."Safaricom Laptop Project")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Safaricom Laptop Project field.', Comment = '%';
                    }
                    field("Employment Applications"; Rec."Employment Applications")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employment Applications field.', Comment = '%';
                    }
                    field("KICD interviews"; Rec."KICD interviews")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KICD interviews field.', Comment = '%';
                    }
                    field("Offer of Voluntary services"; Rec."Offer of Voluntary services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Offer of Voluntary services field.', Comment = '%';
                    }
                    field("Attachment /Attachment Committee Minutes-Confidential"; Rec."Attachment /Attachment Committee Minutes-Confidential")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Attachment /Attachment Committee Minutes-Confidential field.', Comment = '%';
                    }
                    field("Internship"; Rec."Internship")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Internship field.', Comment = '%';
                    }
                    field("Schemes of Service"; Rec."Schemes of Service")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Schemes of Service field.', Comment = '%';
                    }
                    field("Performance Appraisal"; Rec."Performance Appraisal")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Performance Appraisal field.', Comment = '%';
                    }
                    field("Wealth Declaration"; Rec."Wealth Declaration")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Wealth Declaration field.', Comment = '%';
                    }
                    field("Staff Pension"; Rec."Staff Pension")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Staff Pension field.', Comment = '%';
                    }
                    field("Staff salaries"; Rec."Staff salaries")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Staff salaries field.', Comment = '%';
                    }
                    field("KIE Job Advertisements"; Rec."KIE Job Advertisements")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Job Advertisements field.', Comment = '%';
                    }
                    field("Group Personal Accidents"; Rec."Group Personal Accidents")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Group Personal Accidents field.', Comment = '%';
                    }

                    field("Medical Insurance-Inpatient"; Rec."Medical Insurance-Inpatient")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Medical Insurance-Inpatient field.', Comment = '%';
                    }
                    field("Medical Insurance-Outpatient"; Rec."Medical Insurance-Outpatient")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Medical Insurance-Outpatient field.', Comment = '%';
                    }
                    field("Leave Roster"; Rec."Leave Roster")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Leave Roster field.', Comment = '%';
                    }
                    field("Staff Hospital statements"; Rec."Staff Hospital statements")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Staff Hospital statements field.', Comment = '%';
                    }
                    field("Staff Deployments"; Rec."Staff Deployments")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Staff Deployments field.', Comment = '%';
                    }
                    field("Overtime"; Rec."Overtime")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Overtime field.', Comment = '%';
                    }
                    field("Personnel Matters"; Rec."Personnel Matters")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of thePersonnel Matters field.', Comment = '%';
                    }
                    field("National Industrial Training Authority"; Rec."National Industrial Training Authority")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the National Industrial Training Authority field.', Comment = '%';
                    }
                    field("Offer of Contract Terms"; Rec."Offer of Contract Terms")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Offer of Contract Terms field.', Comment = '%';
                    }
                    field("KIE Establishment and Staffing"; Rec."KIE Establishment and Staffing")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Establishment and Staffing field.', Comment = '%';
                    }
                    field("National Hospital Insurance Fund"; Rec."National Hospital Insurance Fund")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the National Hospital Insurance Fund field.', Comment = '%';
                    }
                    field("National Social Security Fund"; Rec."National Social Security Fund")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the National Social Security Fund field.', Comment = '%';
                    }
                    field("Other Allowances"; Rec."Other Allowances")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Other Allowances field.', Comment = '%';
                    }

                    //STAFF WELFARE

                    field("Staff Welfare Fund"; Rec."Staff Welfare Fund")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Staff Welfare Fund field.', Comment = '%';
                    }
                    field("Taasisi Sacco"; Rec."Taasisi Sacco")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Taasisi Sacco field.', Comment = '%';
                    }
                    field("Taasisi Housing"; Rec."Taasisi Housing")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Taasisi Housinge field.', Comment = '%';
                    }
                    field("Ardhi Sacco"; Rec."Ardhi Sacco")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Ardhi Sacco field.', Comment = '%';
                    }
                    field("Mwalimu Sacco"; Rec."Mwalimu Sacco")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of theMwalimu Sacco field.', Comment = '%';
                    }
                    field("U K C S"; Rec."U K C S")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the U K C S field.', Comment = '%';
                    }
                    field("HRMDMinutes"; Rec."HRMD Minute")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the HRMD Minutes field.', Comment = '%';
                    }

                    //REQUEST FOR SERVICES/RELEASE OF KIE STAFF

                    field("Request for services of KIE staff-General"; Rec."Request for services of KIE staff-General")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for services of KIE staff-General field.', Comment = '%';
                    }
                    field("KIE MOE"; Rec."KIE MOE")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE MOE field.', Comment = '%';
                    }
                    field("KNEC-Basic"; Rec."KNEC-Basic")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KNEC-Basic field.', Comment = '%';
                    }
                    field("KNEC-Tivet"; Rec."KNEC-Tivet")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KNEC-Tivet field.', Comment = '%';
                    }
                    field("KNEC-COFS"; Rec."KNEC-COFS")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KNEC-COFS field.', Comment = '%';
                    }
                    field("KNEC-Research"; Rec."KNEC-Research")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KNEC-Research field.', Comment = '%';
                    }
                    field("KNEC-Media"; Rec."KNEC-Media")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KNEC-Media field.', Comment = '%';
                    }
                    field("Offer of Products and Marketing to KIE staff"; Rec."Offer of Products and Marketing to KIE staff")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Offer of Products and Marketing to KIE staff.', Comment = '%';
                    }
                    // field("Training Bonding"; Rec."Training Bonding")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Training Bonding field.', Comment = '%';
                    // }
                    field("KIE Code of Conduct and Ethics - Transfer"; Rec."KIE Code of Conduct and Ethics - Transfer")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Code of Conduct and Ethics - Transfer field.', Comment = '%';
                    }
                    field("Confirmation in Appointment"; Rec."Confirmation in Appointment")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Confirmation in Appointment field.', Comment = '%';
                    }
                    field("Exit Interviews"; Rec."Exit Interviews")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Exit Interviews field.', Comment = '%';
                    }
            
                    field("Casual Employment-MES"; Rec."Casual Employment-MES")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Casual Employment-MES field.', Comment = '%';
                    }
                    field("Appointments and Promotions"; Rec."Appointments and Promotions")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Appointments and Promotions field.', Comment = '%';
                    }
                    field("Medical Insurance General Correspondence"; Rec."Medical Insurance General Correspondence")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Medical Insurance General Correspondence field.', Comment = '%';
                    }
                    field("Perfomance Contracts"; Rec."Perfomance Contracts")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Perfomance Contracts field.', Comment = '%';
                    }
                    field("Handing and Taking Over"; Rec."Handing and Taking Over")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Handing and Taking Over field.', Comment = '%';
                    }
                    field("Selection of temporary staff-agenda & minutes"; Rec."Selection of temporary staff-agenda & minutes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Selection of temporary staff-agenda & minutes field.', Comment = '%';
                    }
                    field("Recruitment of KICD Director/CEO"; Rec."Recruitment of KICD Director/CEO")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Recruitment of KICD Director/CEO field.', Comment = '%';
                    }
                    field("Time and attendance of staff"; Rec."Time and attendance of staff")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Time and attendance of staff field.', Comment = '%';
                    }

                    //TRAINING

                    field("Training POLICY"; Rec."Training POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Training POLICY field.', Comment = '%';
                    }
                    field("Training General (Committee)"; Rec."Training General (Committee)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Training General (Committee)field.', Comment = '%';
                    }
                    field("Training Bonding"; Rec."Training Bonding")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Training Bonding field.', Comment = '%';
                    }
                    field("Training Committee - corporate services"; Rec."Training Committee - corporate services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Special education physically handicapped panel field.', Comment = '%';
                    }
                    field("Seminars And Workshops"; Rec."Seminars And Workshops")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Seminars And Workshops panel field.', Comment = '%';
                    }
                    field("Conferences And Conventions"; Rec."Conferences And Conventions")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Conferences And Conventions field.', Comment = '%';
                    }
                    field("Inhouse Training Programmes"; Rec."Inhouse Training Programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Inhouse Training Programmes field.', Comment = '%';
                    }
                    field("External Training Programmes"; Rec."External Training Programmes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the External Training Programmes field.', Comment = '%';
                    }
                    field("ISO Training"; Rec."ISO Training")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the ISO Training field.', Comment = '%';
                    }
                    field("Training Reports"; Rec."Training Reports")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Training Reports field.', Comment = '%';
                    }

                    //TRANSPORT
                    field("B/P POLICY"; Rec."B/P POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the B/P POLICY field.', Comment = '%';
                    }
                    field("KAN 896U Peugeot 504"; Rec."KAN 896U Peugeot 504")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAN 896U Peugeot 504 field.', Comment = '%';
                    }
                    field("KAN 897U Peugeot 504 Saloon"; Rec."KAN 897U Peugeot 504 Saloon")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAN 897U Peugeot 504 Saloon field.', Comment = '%';
                    }
                    field("KAN 898U Peugeot 504"; Rec."KAN 898U Peugeot 504")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAN 898U Peugeot 504 field.', Comment = '%';
                    }
                    field("KAN 899U Peugeot 406"; Rec."KAN 899U Peugeot 406")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAN 899U Peugeot 406 field.', Comment = '%';
                    }
                    field("KAN 945U Peugeot 406"; Rec."KAN 945U Peugeot 406")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAN 945U Peugeot 406 field.', Comment = '%';
                    }
                    field("KAL 215 U Peugeot"; Rec."KAL 215 U Peugeot")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAL 215 U Peugeot field.', Comment = '%';
                    }
                    field("KAW 582Z Land rover (Gk A 539H)"; Rec."KAW 582Z Land rover (Gk A 539H)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAW 582Z Land rover (Gk A 539H) field.', Comment = '%';
                    }
                    field("KAT 730X Toyota Pajero"; Rec."KAT 730X Toyota Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAT 730X Toyota Pajero field.', Comment = '%';
                    }
                    field("KAT 731X Mitsubishi Pajero"; Rec."KAT 731X Mitsubishi Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAT 731X Mitsubishi Pajero field.', Comment = '%';
                    }
                    field("KAT 732X Mitsubishi Pajero"; Rec."KAT 732X Mitsubishi Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAT 732X Mitsubishi Pajerofield.', Comment = '%';
                    }
                
                    field("KAT 733X Mitsubishi Pajero"; Rec."KAT 733X Mitsubishi Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAT 733X Mitsubishi Pajero field.', Comment = '%';
                    }
                    field("KAV O71E Isuzu Minibus"; Rec."KAV O71E Isuzu Minibus")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAV O71E Isuzu Minibus field.', Comment = '%';
                    }
                    field("KAB 582F Nissan B12"; Rec."KAB 582F Nissan B12")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAB 582F Nissan B12 field.', Comment = '%';
                    }
                    field("KAA 704 Land rover"; Rec."KAA 704 Land rover")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAA 704 Land rover field.', Comment = '%';
                    }
                    field("KAC 819G Isuzu Trooper"; Rec."KAC 819G Isuzu Trooper")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KAC 819G Isuzu Trooper field.', Comment = '%';
                    }
                    field("KBB 268S Pajero"; Rec."KBB 268S Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBB 268S Pajero field.', Comment = '%';
                    }
                    field("KBB 269S Pajero"; Rec."KBB 269S Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBB 269S Pajero field.', Comment = '%';
                    }
                    field("KBB 270S Pajero"; Rec."KBB 270S Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBB 270S Pajero field.', Comment = '%';
                    }
                   field("KBB 272S Pajero"; Rec."KBB 272S Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBB 272S Pajero field.', Comment = '%';
                    }
                    field("KBB 271S Pajero"; Rec."KBB 271S Pajero")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBB 271S Pajero field.', Comment = '%';
                    }
                    field("KBB 466S Toyota"; Rec."KBB 466S Toyota")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBB 466S Toyota field.', Comment = '%';
                    }
                    field("KIE Transport Policy"; Rec."KIE Transport Policy")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Transport Policy field.', Comment = '%';
                    }
                    field("Transport Services-Standing Imprest"; Rec."Transport Services - Standing Imprest")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Services-Standing Imprest field.', Comment = '%';
                    }
                    field("Transport Staff Meeting"; Rec."Transport Staff Meeting")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Staff Meeting field.', Comment = '%';
                    }
                    field("KBL 337G Volkswagen Passat 1.8"; Rec."KBL 337G Volkswagen Passat 1.8")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBL 337G Volkswagen Passat 1.8 field.', Comment = '%';
                    }
                    field("KBL 854G Nissan X-trail"; Rec."KBL 854G Nissan X-trail")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBL 854G Nissan X-trail field.', Comment = '%';
                    }
                    // field("Transport Schedules"; Rec."Transport Schedules")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Transport Schedules field.', Comment = '%';
                    // }
                    field("KBU 181T Toyota Hilux"; Rec."KBU 181T Toyota Hilux")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBU 181T Toyota Hilux field.', Comment = '%';
                    }
                    field("KBU 167T Ford Ranger"; Rec."KBU 167T Ford Ranger")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KBU 167T Ford Ranger field.', Comment = '%';
                    }
                    field("KCD 352G Ford Ranger"; Rec."KCD 352G Ford Ranger")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KCD 352G Ford Ranger field.', Comment = '%';
                    }
                    field("KCD 351G Ford Ranger"; Rec."KCD 351G Ford Ranger")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KCD 351G Ford Ranger field.', Comment = '%';
                    }

                    //TRANSPORT MATTERS

                    field("Motor Vehicle-General"; Rec."Motor Vehicle - General")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Motor Vehicle-Generaly field.', Comment = '%';
                    }
                    field("Transport Matters"; Rec."Transport Matters")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Matters field.', Comment = '%';
                    }
                    field("Request for Transport Services"; Rec."Request for Transport Services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the AUTHORITY TO USE MOTOR VEHICLE field.', Comment = '%';
                    }
                    field("Transport Services Standing Imprest"; Rec."Transport Services Standing Imprest")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Services Standing Imprest field.', Comment = '%';
                    }
                    field("Transport Schedules"; Rec."Transport Schedules")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Schedules field.', Comment = '%';
                    }
                    field("Fuel Consumption"; Rec."Fuel Consumption")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Fuel Consumption field.', Comment = '%';
                    }
                    field("Motor vehicle Insurances"; Rec."Motor vehicle Insurances")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Motor vehicle Insurances field.', Comment = '%';
                    }
                    field("Transport Meetings and Minutes"; Rec."Transport Meetings and Minutes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Transport Meetings and Minutes field.', Comment = '%';
                    }
                    field("Fuel Cards"; Rec."Fuel Cards")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Fuel Cards field.', Comment = '%';
                    }

                    //MATTERS NOT SPECIFIED

                    field("B/3/1 MATTER 1"; Rec."B/3/1 MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the B/3/1 MATTER 1 field.', Comment = '%';
                    }
                }
            }
            group("FINANCE , AUDIT , NRC, PLANNING, CORPORATE, COMMUNICATIONS, PROCUREMENT AND STORES")
            {
                group("FINANCE")
                {
                    field("FINANCE POLICY"; Rec."FINANCE POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the FINANCE POLICY.', Comment = '%';
                    }
                    field("Cash Survey Board Committee-Transfer"; Rec."Cash Survey Board Committee - Transfer")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Cash Survey Board Committee-Transfer field.', Comment = '%';
                    }
                    field("Investments"; Rec."Investments")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Investments field.', Comment = '%';
                    }                
                    field("Estimates"; Rec."Estimates")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Estimates field.', Comment = '%';
                    }
                    field("Returned cheques"; Rec."Returned cheques")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Returned cheques field.', Comment = '%';
                    }
                    field("Invoices and statements"; Rec."Invoices and statements")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applied Research field.', Comment = '%';
                    }
                    field("Applications for Imprest"; Rec."Applications for Imprest")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applications for Imprest field.', Comment = '%';
                    }
                    field("KRA-VAT"; Rec."KRA - VAT")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KRA-VAT field.', Comment = '%';
                    }
                    field("M-Pesa"; Rec."M-Pesa")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the M-Pesa field.', Comment = '%';
                    }
                    field("Government Grants"; Rec."Government Grants")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Government Grants field.', Comment = '%';
                    }
                    field("Data Returns"; Rec."Data Returns")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Data Returns.', Comment = '%';
                    }
                    field("KIE Finances"; Rec."KIE Finances")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KIE Finances field.', Comment = '%';
                    }
                    field("Equity Bank Agency-transfer"; Rec."Equity Bank Agency - transfer")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Equity Bank Agency-transfer field.', Comment = '%';
                    }
                    field("Remittances"; Rec."Remittances")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the COFS-Secondary field.', Comment = '%';
                    }
                    field("Institutes Debtors"; Rec."Institutes Debtors")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institutes Debtors field.', Comment = '%';
                    }
                    field("Kenya Commercial Bank"; Rec."Kenya Commercial Bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Kenya Commercial Bank field.', Comment = '%';
                    }
                    field("Standard Chartered Bank"; Rec."Standard Chartered Bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Standard Chartered Bank field.', Comment = '%';
                    }
                    field("Co-operative bank"; Rec."Co-operative bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Co-operative bank field.', Comment = '%';
                    }
                    field("Request for Temporary Imprest - Non KICD Staff"; Rec."Request for Temporary Imprest - Non KICD Staff")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Request for Temporary Imprest - Non KICD Staff field.', Comment = '%';
                    }
                }
                group("PROCUREMENT AND STORES")
                {
                    field("PROCUREMENT AND STORES POLICY"; Rec."PROCUREMENT AND STORES POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PROCUREMENT AND STORES POLICY field.', Comment = '%';
                    }
                    field("Tender Committee"; Rec."Tender Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tender Committee field.', Comment = '%';
                    }
                    field("Procurement Committee"; Rec."Procurement Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Procurement Committee field.', Comment = '%';
                    }
                    field("Inspection and Acceptance Committee"; Rec."Inspection and Acceptance Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Inspection and Acceptance Committee field.', Comment = '%';
                    }
                    field("Tender Evaluation Committee"; Rec."Tender Evaluation Committee")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tender Evaluation Committee field.', Comment = '%';
                    }
                    field("Tender &Quotations Comm. Appointments"; Rec."Tender & Quotations Comm. Appointments")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tender &Quotations Comm. Appointments field.', Comment = '%';
                    }
                    field("Letters of Introduction-Suppliers/Service Providers"; Rec."Letters of Introduction - Suppliers/Service Providers")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Letters of Introduction-Suppliers/Service Providers field.', Comment = '%';
                    }
                    field("External Advertisements"; Rec."External Advertisements")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the External Advertisements field.', Comment = '%';
                    }
                    field("Disposal of Assets"; Rec."Disposal of Assets")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Disposal of Assets field.', Comment = '%';
                    }
                    field("Stores Services"; Rec."Stores Services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Stores Services field.', Comment = '%';
                    }
                    field("Purchase of Stores"; Rec."Purchase of Stores")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Purchase of Stores field.', Comment = '%';
                    }
                    field("Tender Evaluation Recommendations."; Rec."Tender Evaluation Recommendations")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tender Evaluation Recommendations.e field.', Comment = '%';
                    }
                    field("Insurance Policies"; Rec."Insurance Policies")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Insurance Policies field.', Comment = '%';
                    }
                    field("PPOA Correspondences"; Rec."PPOA Correspondences")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PPOA Correspondences field.', Comment = '%';
                    }
                }
                group("AUDIT(L)")
                {
                    field("Audit Policy"; Rec."Audit Policy")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Audit Policy field.', Comment = '%';
                    }
                    field("KENAO"; Rec."KENAO")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the KENAO field.', Comment = '%';
                    }
                    field("ISO Surveilance Audits"; Rec."ISO Surveilance Audits")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the ISO Surveilance Audits field.', Comment = '%';
                    }
                    field("Internal Audits"; Rec."Internal Audits")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Internal Audits field.', Comment = '%';
                    }
                    field("Audit Committee - Agenda & Minutes"; Rec."Audit Committee - Agenda & Minutes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Audit Committee - Agenda & Minutes field.', Comment = '%';
                    }
                    field("Investigations (D & SDDCS only)"; Rec."Investigations (D & SDDCS only)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Youth Polytechnic Programmes field.', Comment = '%';
                    }
                }
                group("NACECE RESOURCE CENTRE")
                {
                    field("NRC POLICY"; Rec."NRC POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NRC POLICY field.', Comment = '%';
                    }
                    field("NRC Committee-Agenda & Minutes"; Rec."NRC Committee - Agenda & Minutes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NRC Committee-Agenda & Minutes field.', Comment = '%';
                    }
                    field("NRC LIFTS"; Rec."NRC LIFTS")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Book Review field.', Comment = '%';
                    }
                    field("NRC Equipment/Machines"; Rec."NRC Equipment/Machines")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NRC Equipment/Machines field.', Comment = '%';
                    }
                    field("Hotel Bookings"; Rec."Hotel Bookings")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Hotel Bookings field.', Comment = '%';
                    }
                    field("Bookings for NRC"; Rec."Bookings for NRC")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bookings for NRC field.', Comment = '%';
                    }

                    field("NRC Staffing"; Rec."NRC Staffing")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NRC Staffing field.', Comment = '%';
                    }
                    field("NRC Medical Examination"; Rec."NRC Medical Examination")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Radio General Correspondence field.', Comment = '%';
                    }
                    field("Wages For Nrc Daily Hirees"; Rec."Wages For Nrc Daily Hirees")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Wages For Nrc Daily Hirees field.', Comment = '%';
                    }
                    field("House Keeping Services"; Rec."House Keeping Services")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the House Keeping Services field.', Comment = '%';
                    }
                    field("Requisition of Office Beverages"; Rec."Requisition of Office Beverages")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Requisition of Office Beverages field.', Comment = '%';
                    }
                    field("NRC Marketing"; Rec."NRC Marketing")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the NRC Marketing field.', Comment = '%';
                    }
                    field("Commissions for NRC Business"; Rec."Commissions for NRC Business")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Commissions for NRC Business field.', Comment = '%';
                    }
                    field("Nacece Resource Center"; Rec."Nacece Resource Center")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Nacece Resource Center field.', Comment = '%';
                    }
                }
                group("PLANNING")
                {
                    field("PLANNING POLICY"; Rec."PLANNING POLICY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PLANNING POLICY field.', Comment = '%';
                    }
                    field("PLANNING MATTER 1"; Rec."PLANNING MATTER 1")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the PLANNING MATTER 1 field.', Comment = '%';
                    }
                    field("Vision 2030"; Rec."Vision 2030")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Vision 2030 field.', Comment = '%';
                    }
                    field("Customer Satisfaction Surveys"; Rec."Customer Satisfaction Surveys")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Customer Satisfaction Surveys field.', Comment = '%';
                    }
                    field("Strategic plan"; Rec."Strategic plan")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Strategic plan field.', Comment = '%';
                    }
                }
                    
                
                group("Employee Number Series")
                {
                    field("Employee Open";Rec."Employee Open")
                    { 
                    ApplicationArea = Basic;
                    }
                     field("Employee Confidential";Rec."Employee Confidential")
                    { 
                    ApplicationArea = Basic;
                    }   

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Transfer)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MemoNosSetup2: Record "Memo Nos Setup";
                    MemoNosSetup: Record "Memo Nos Setup";
                begin
                    MemoNosSetup.Get();
                    MemoNosSetup2.Get();
                    MemoNosSetup2.TransferFields(MemoNosSetup);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}
