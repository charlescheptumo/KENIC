page 50199 "Sharepoint Connector Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sharepoint Connector Setup";
    ModifyAllowed = true;
    //InsertAllowed = false;
    //DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Setup)
            {
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client ID field.';
                }
                field("Client Secret"; Rec."Client Secret")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                    ToolTip = 'Specifies the value of the Client Secret field.';
                }
                field("Sharepoint URL"; Rec."Sharepoint URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sharepoint URL field.';
                }
                field(Scope; Rec.Scope)
                {
                    ToolTip = 'Specifies the value of the Scope field.';
                }
            }
            group(test)
            {

                field(FileName; Rec.FileName)
                {
                    ToolTip = 'Specifies the value of the FileName field.';
                }
                field(Directory; Rec.Directory)
                {
                    ToolTip = 'Specifies the value of the Directory field.';
                }
            }
            group("Memo Directories")
            {
                field("Main Memo Directory"; Rec."Main Memo Directory")
                {
                    ToolTip = 'Specifies the value of the Main Memo Directory field.';

                }
                field("Administration Memos"; Rec."Administration Memos")
                {
                    ToolTip = 'Specifies the value of the Administration Memos field.', Comment = '%';
                }
                field("Finance & Accounts Memos"; Rec."Finance & Accounts Memos")
                {
                    ToolTip = 'Specifies the value of the Finance Memos field.', Comment = '%';
                }
                field("Human Capital & Administration Memos"; Rec."Human Capital & Administration Memos")
                {
                    ToolTip = 'Specifies the value of the Human Capital Memos field.', Comment = '%';
                }
                field("ICT Memos"; Rec."ICT Memos")
                {
                    ToolTip = 'Specifies the value of the ICT Memos field.', Comment = '%';
                }
                field("Legal Services Memos"; Rec."Legal Services Memos")
                {
                    ToolTip = 'Specifies the value of the Legal Services Memos field.', Comment = '%';
                }
                field("Education & Research Memos"; Rec."Education & Research Memos")
                {
                    ToolTip = 'Specifies the value of the Education & Research Memos field.', Comment = '%';
                }
                field("Standard & Compliance Memos"; Rec."Standard & Compliance Memos")
                {
                    ToolTip = 'Specifies the value of the Standard & Compliance Memos field.';

                }
                field("Supply Chain Management Memos"; Rec."Supply Chain Management Memos")
                {
                    ToolTip = 'Specifies the value of the Supply Chain Management Memos field.', Comment = '%';
                }
                field("Standards and Compliance Memos"; Rec."Standards and Compliance Memos")
                {
                    ToolTip = 'Specifies the value of the Standards and Compliance Memos field.', Comment = '%';
                }
                field("Transport Memos"; Rec."Transport Memos")
                {
                    ToolTip = 'Specifies the value of the Transport Memos field.', Comment = '%';
                }
                field("Research & Development Memos"; Rec."Research & Development Memos")
                {
                    ToolTip = 'Specifies the value of the Research & Development Memos field.', Comment = '%';
                }
                field("Anti-Doping Education Memos"; Rec."Anti-Doping Education Memos")
                {
                    ToolTip = 'Specifies the value of the Anti-Doping Education Memos field.';
                    Visible = false;

                }
                field("Internal Audit Memos"; Rec."Internal Audit Memos")
                {
                    ToolTip = 'Specifies the value of the Internal Audit Memos field.';

                }
                field("Compliance Memos"; Rec."Compliance Memos")
                {
                    ToolTip = 'Specifies the value of the Compliance Memos field.';

                }
                field("Testing Memos"; Rec."Testing Memos")
                {
                    ToolTip = 'Specifies the value of the Testing Memos field.';

                }
                field("Corporate Communication Memos"; Rec."Corporate Communication Memos")
                {
                    ToolTip = 'Specifies the value of the Corporate Communication Memos field.';

                }
            }
            group("Main Directories")
            {

                field("Administration Documents"; Rec."Administration Documents")
                {
                    ToolTip = 'Specifies the value of the Administration Documents field.', Comment = '%';
                }
                field("Finance Documents"; Rec."Finance & Accounts Documents")
                {
                    ToolTip = 'Specifies the value of the Finance Documents field.', Comment = '%';
                }
                field("Human Capital Documents"; Rec."Human Capital & Administration Documents")
                {
                    ToolTip = 'Specifies the value of the Human Capital Documents field.', Comment = '%';
                }
                field("ICT Documents"; Rec."ICT Documents")
                {
                    ToolTip = 'Specifies the value of the ICT Documents field.', Comment = '%';
                }
                field("Legal Documents"; Rec."Legal Documents")
                {
                    ToolTip = 'Specifies the value of the Legal Documents field.', Comment = '%';
                }
                field("Standards and Compliance Documents"; Rec."Standards and Compliance Documents")
                {
                    ToolTip = 'Specifies the value of the Standards and Compliance Documents field.', Comment = '%';
                }
                field("Supply Chain Management Documents"; Rec."Supply Chain Management Documents")
                {
                    ToolTip = 'Specifies the value of the Supply Chain Management Documents field.', Comment = '%';
                }
                field("Transport Documents"; Rec."Transport Documents")
                {
                    ToolTip = 'Specifies the value of the Transport Documents field.', Comment = '%';
                }
            }
            group(Directories)
            {
                field("Asset Transfer"; Rec."Asset Transfer")
                {
                    ToolTip = 'Specifies the value of the Asset Transfer field.', Comment = '%';
                }
                field("Cash Request"; Rec."Cash Request")
                {
                    ToolTip = 'Specifies the value of the Cash Request field.', Comment = '%';
                }
                field("Credit Memo"; Rec."Credit Memo")
                {
                    ToolTip = 'Specifies the value of the Credit Memo field.', Comment = '%';
                }
                field("Driver Out Of Office Req"; Rec."Driver Out Of Office Req")
                {
                    ToolTip = 'Specifies the value of the Driver Out Of Office Req field.', Comment = '%';
                }
                field(FuelReq; Rec.FuelReq)
                {
                    ToolTip = 'Specifies the value of the FuelReq field.', Comment = '%';
                }
                field("Imprest Memo"; Rec."Imprest Memo")
                {
                    ToolTip = 'Specifies the value of the Imprest Memo field.', Comment = '%';
                }
                field(Invoice; Rec.Invoice)
                {
                    ToolTip = 'Specifies the value of the Invoice field.', Comment = '%';
                }
                field("Blanket Order"; Rec."Blanket Order")
                {
                    ToolTip = 'Specifies the value of the Blanket Order field.', Comment = '%';
                }
                field("AIE Funds Transfer"; Rec."AIE Funds Transfer")
                {
                    ToolTip = 'Specifies the value of the AIE Funds Transfer field.', Comment = '%';
                }
                field("Order"; Rec."Order")
                {
                    ToolTip = 'Specifies the value of the Order field.', Comment = '%';
                }
                field("Recruitment Header"; Rec."Recruitment Header")
                {
                    ToolTip = 'Specifies the value of the Recruitment Header field.', Comment = '%';
                }
                field(Payroll; Rec.Payroll)
                {
                    ToolTip = 'Specifies the value of the Payroll field.', Comment = '%';
                }
                field("Return Order"; Rec."Return Order")
                {
                    ToolTip = 'Specifies the value of the Return Order field.', Comment = '%';
                }
                field("Staff Appointment"; Rec."Staff Appointment")
                {
                    ToolTip = 'Specifies the value of the Staff Appointment field.', Comment = '%';
                }
                field("Store Requisition"; Rec."Store Requisition")
                {
                    ToolTip = 'Specifies the value of the Store Requisition field.', Comment = '%';
                }
                field(Surrender; Rec.Surrender)
                {
                    ToolTip = 'Specifies the value of the Surrender field.', Comment = '%';
                }

                field("Bank Reconciliation"; Rec."Bank Reconciliation")
                {
                    ToolTip = 'Specifies the value of the Bank Reconciliation field.';
                }
                field("Bank Transfer"; Rec."Bank Transfer")
                {
                    ToolTip = 'Specifies the value of the Bank Transfer field.';
                }
                field("Bid Evaluation Register Card"; Rec."Bid Evaluation Register Card")
                {
                    ToolTip = 'Specifies the value of the Bid Evaluation Register Card field.';
                }
                field("Bid Evaluation Template Card"; Rec."Bid Evaluation Template Card")
                {
                    ToolTip = 'Specifies the value of the Bid Evaluation Template Card field.';
                }
                field("Bid Response Card"; Rec."Bid Response Card")
                {
                    ToolTip = 'Specifies the value of the Bid Response Card field.';
                }
                field("Candidate Selection Panel"; Rec."Candidate Selection Panel")
                {
                    ToolTip = 'Specifies the value of the Candidate Selection Panel field.';
                }
                field("Clustered Tender Committee"; Rec."Clustered Tender Committee")
                {
                    ToolTip = 'Specifies the value of the Clustered Tender Committee field.';
                }
                field("Dept Procurement Card"; Rec."Dept Procurement Card")
                {
                    ToolTip = 'Specifies the value of the Dept Procurement Card field.';
                }
                field(Employee; Rec.Employee)
                {
                    ToolTip = 'Specifies the value of the Employee field.';
                }
                field("Evaluation Report"; Rec."Evaluation Report")
                {
                    ToolTip = 'Specifies the value of the Evaluation Report field.';
                }
                field("File Movement"; Rec."File Movement")
                {
                    ToolTip = 'Specifies the value of the File Movement field.';
                }
                field("Financial Bid Evaluation Card"; Rec."Financial Bid Evaluation Card")
                {
                    ToolTip = 'Specifies the value of the Financial Bid Evaluation Card field.';
                }
                field("Grant Funding Application"; Rec."Grant Funding Application")
                {
                    ToolTip = 'Specifies the value of the Grant Funding Application field.';
                }
                field("HR Leave"; Rec."HR Leave")
                {
                    ToolTip = 'Specifies the value of the HR Leave field.';
                }
                field("ICT Issuance"; Rec."ICT Issuance")
                {
                    ToolTip = 'Specifies the value of the ICT Issuance field.';
                }
                field("IFP Card"; Rec."IFP Card")
                {
                    ToolTip = 'Specifies the value of the IFP Card field.';
                }
                field(IFS; Rec.IFS)
                {
                    ToolTip = 'Specifies the value of the IFS field.';
                }
                field("IFS Prebid Register Card"; Rec."IFS Prebid Register Card")
                {
                    ToolTip = 'Specifies the value of the IFS Prebid Register Card field.';
                }
                field("IFS Tender Committee Card"; Rec."IFS Tender Committee Card")
                {
                    ToolTip = 'Specifies the value of the IFS Tender Committee Card field.';
                }
                field(Imprest; Rec.Imprest)
                {
                    ToolTip = 'Specifies the value of the Imprest field.';
                }
                field("Imprest Surrender"; Rec."Imprest Surrender")
                {
                    ToolTip = 'Specifies the value of the Imprest Surrender field.';
                }
                field("Job Application"; Rec."Job Application")
                {
                    ToolTip = 'Specifies the value of the Job Application field.';
                }
                field("Leave Application"; Rec."Leave Application")
                {
                    ToolTip = 'Specifies the value of the Leave Application field.';
                }
                field("Notice of Award"; Rec."Notice of Award")
                {
                    ToolTip = 'Specifies the value of the Notice of Award field.';
                }
                field("Payment Schedule"; Rec."Payment Schedule")
                {
                    ToolTip = 'Specifies the value of the Payment Schedule field.';
                }
                field("Payment Voucher"; Rec."Payment Voucher")
                {
                    ToolTip = 'Specifies the value of the Payment Voucher field.';
                }
                field("Petty Cash"; Rec."Petty Cash")
                {
                    ToolTip = 'Specifies the value of the Petty Cash field.';
                }
                field("Petty Cash Surrender"; Rec."Petty Cash Surrender")
                {
                    ToolTip = 'Specifies the value of the Petty Cash Surrender field.';
                }
                field(Prequalification; Rec.Prequalification)
                {
                    ToolTip = 'Specifies the value of the Prequalification field.';
                }
                field("Prequalification Score Card"; Rec."Prequalification Score Card")
                {
                    ToolTip = 'Specifies the value of the Prequalification Score Card field.';
                }
                field(Procurement; Rec.Procurement)
                {
                    ToolTip = 'Specifies the value of the Procurement field.';
                }
                field("Procurement Plan Card"; Rec."Procurement Plan Card")
                {
                    ToolTip = 'Specifies the value of the Procurement Plan Card field.';
                }
                field("Project Contract"; Rec."Project Contract")
                {
                    ToolTip = 'Specifies the value of the Project Contract field.';
                }
                field("Project Funding Request"; Rec."Project Funding Request")
                {
                    ToolTip = 'Specifies the value of the Project Funding Request field.';
                }
                field("Purchase requisition"; Rec."Purchase requisition")
                {
                    ToolTip = 'Specifies the value of the Purchase requisition field.';
                }
                field("Receipt Processing"; Rec."Receipt Processing")
                {
                    ToolTip = 'Specifies the value of the Receipt Processing field.';
                }
                field("Recruitment Requisition"; Rec."Recruitment Requisition")
                {
                    ToolTip = 'Specifies the value of the Recruitment Requisition field.';
                }
                field(RFI; Rec.RFI)
                {
                    ToolTip = 'Specifies the value of the RFI field.';
                }
                field(RFQ; Rec.RFQ)
                {
                    ToolTip = 'Specifies the value of the RFQ field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("Salary Voucher"; Rec."Salary Voucher")
                {
                    ToolTip = 'Specifies the value of the Salary Voucher field.';
                }
                field(sclaims; Rec.sclaims)
                {
                    ToolTip = 'Specifies the value of the sclaims field.';
                }
                field("staff Claims"; Rec."staff Claims")
                {
                    ToolTip = 'Specifies the value of the staff Claims field.';
                }
                field("Standing Imprest"; Rec."Standing Imprest")
                {
                    ToolTip = 'Specifies the value of the Standing Imprest field.';
                }
                field("Standing Imprest Surrender"; Rec."Standing Imprest Surrender")
                {
                    ToolTip = 'Specifies the value of the Standing Imprest Surrender field.';
                }
                field("Sub Award Contract"; Rec."Sub Award Contract")
                {
                    ToolTip = 'Specifies the value of the Sub Award Contract field.';
                }
                field("Sub Contract Extension"; Rec."Sub Contract Extension")
                {
                    ToolTip = 'Specifies the value of the Sub Contract Extension field.';
                }
                field("Technical Bid Evaluation Card"; Rec."Technical Bid Evaluation Card")
                {
                    ToolTip = 'Specifies the value of the Technical Bid Evaluation Card field.';
                }
                field("Temp Salary Voucher"; Rec."Temp Salary Voucher")
                {
                    ToolTip = 'Specifies the value of the Temp Salary Voucher field.';
                }
                field("Tender Addendum Notice Card"; Rec."Tender Addendum Notice Card")
                {
                    ToolTip = 'Specifies the value of the Tender Addendum Notice Card field.';
                }
                field("Transport Requisition"; Rec."Transport Requisition")
                {
                    ToolTip = 'Specifies the value of the Transport Requisition field.';
                }
                field(Vacancy; Rec.Vacancy)
                {
                    ToolTip = 'Specifies the value of the Vacancy field.';
                }
                field("Vacancy Announcement"; Rec."Vacancy Announcement")
                {
                    ToolTip = 'Specifies the value of the Vacancy Announcement field.';
                }
                field("Vend Debarment"; Rec."Vend Debarment")
                {
                    ToolTip = 'Specifies the value of the Vend Debarment field.';
                }
                field("Vendor Due Diligence Voucher"; Rec."Vendor Due Diligence Voucher")
                {
                    ToolTip = 'Specifies the value of the Vendor Due Diligence Voucher field.';
                }
                field("Vendor Registration Card"; Rec."Vendor Registration Card")
                {
                    ToolTip = 'Specifies the value of the Vendor Registration Card field.';
                }
                field("Warrant Voucher"; Rec."Warrant Voucher")
                {
                    ToolTip = 'Specifies the value of the Warrant Voucher field.';
                }
                field(Maintenance;Rec.Maintenance)
                {
                    ToolTip = 'Specifies the value of the Maintenance field.';
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Connect)
            {
                ApplicationArea = all;
                ToolTip = 'Executes the Connect action.';
                trigger OnAction()
                var
                    SharepointSetup: Record "Sharepoint Connector Setup";
                    AadTenantId: Text;
                    Diag: Interface "HTTP Diagnostics";
                    SharePointList: Record "SharePoint List" temporary;
                begin
                    SharepointSetup.Get();
                    AadTenantId := GetAadTenantNameFromBaseUrl(SharepointSetup."Sharepoint URL"); //Used to get an Azure Active Directory ID from a URL
                    SharePointClient.Initialize(SharepointSetup."Sharepoint URL", GetSharePointAuthorization(AadTenantId)); //Initializes the client

                    SharePointClient.GetLists(SharePointList); //We need to perform at least one action to get diagnostics data
                                                               //Otherwise, the GetDiagnostics function will just return 0
                    Diag := SharePointClient.GetDiagnostics(); //Optional: used to get diagnostics, useful for debugging errors

                    if (not Diag.IsSuccessStatusCode()) then //Check if the status is success, if not - failure to connect, display error message.
                        Error(DiagError, Diag.GetErrorMessage());

                    Connected := true; //Set the connection status to true so that we won't have to re-connect when already connected.
                end;
            }
            action(GetList)
            {
                ApplicationArea = all;
                ToolTip = 'Executes the GetList action.';

                trigger OnAction()
                var
                    SharepointList: Record "SharePoint List" temporary;
                    SCListRec: Record "Sharepoint File List";
                    spfolder: Record "SharePoint Folder" temporary;
                    spfile: Record "SharePoint File" temporary;
                begin
                    if SharePointClient.GetLists(SharepointList) then begin
                        SCListRec.DeleteAll();
                        SharepointList.FindSet();
                        repeat
                            SCListRec.Init();
                            //SCListRec.id := SharepointList.id;
                            SCListRec.Title := SharepointList.Title;
                            SCListRec.OdataId := SharepointList.OdataId;
                            SCListRec.Insert();

                        until SharepointList.Next() = 0;
                        SharepointList.Reset();
                        SharepointList.SetRange(Title, 'Documents');
                        //SharepointList.SetRange(Title, 'Documents');
                        if SharepointList.FindFirst() then begin
                            if SharePointClient.GetDocumentLibraryRootFolder(SharepointList.OdataId, spfolder) then begin
                                if SharePointClient.GetFolderFilesByServerRelativeUrl(spfolder."Server Relative Url", spfile) then begin
                                    spfile.FindSet();
                                    repeat
                                        SCListRec.Init();
                                        //SCListRec.id := spfile."Unique Id";
                                        SCListRec.Title := spfile.Name;
                                        SCListRec.OdataId := spfile.OdataId;
                                        SCListRec."Server Relative Url" := spfile."Server Relative Url";
                                        SCListRec.Insert();


                                    until spfile.Next() = 0;
                                end;
                            end;
                        end;

                    end;

                end;
            }
            action(CreateFile)
            {
                ApplicationArea = All;
                Caption = 'Create File';
                ToolTip = 'Executes the Create File action.';

                trigger OnAction()
                var
                    SharePointFile: Record "SharePoint File" temporary;
                    IS: InStream;
                    OS: OutStream;
                    TempBlob: Codeunit "Temp Blob";
                    SharepointMgt: Codeunit "Sharepoint Management";
                    //Filename: Text;
                    AadTenantId: Text;
                    SharePointClient: Codeunit "SharePoint Client";
                begin
                    //UploadIntoStream('Upload', '', '', Rec.Filename, IS);
                    OS := TempBlob.CreateOutStream();
                    OS.Write('Testing file contents');
                    IS := TempBlob.CreateInStream();
                    //SharepointMgt.InitializeConnection();
                    AadTenantId := GetAadTenantNameFromBaseUrl(Rec."Sharepoint URL"); //Used to get an Azure Active Directory ID from a URL
                    SharePointClient.Initialize(Rec."Sharepoint URL", GetSharePointAuthorization(AadTenantId));
                    SharePointClient.AddFileToFolder(Rec.Directory, Rec.FileName, IS, SharePointFile);

                    //SharePointClient.DownloadFileContent()
                    //SaveFile(Rec."Sharepoint URL", Rec.Directory, Rec.FileName, TempBlob);
                    //if SharepointMgt.SaveFile(Rec.Directory, Filename, IS) then
                    // Message('File created successfully!');
                end;
            }
        }
    }
    var
        Connected: Boolean;
        SharePointClient: Codeunit "SharePoint Client";
        DiagError: Label 'Sharepoint Management error:\\%1';

    local procedure GetAadTenantNameFromBaseUrl(BaseUrl: Text): Text
    var
        Uri: Codeunit Uri;
        MySiteHostSuffixTxt: Label '-my.sharepoint.com', Locked = true;
        SharePointHostSuffixTxt: Label '.sharepoint.com', Locked = true;
        OnMicrosoftTxt: Label '.onmicrosoft.com', Locked = true;
        UrlInvalidErr: Label 'The Base Url %1 does not seem to be a valid SharePoint Online Url.', Comment = '%1=BaseUrl';
        Host: Text;
    begin
        //This procedure formats the sharepoint's site URL to a format accepted by CreateAuthorizationCode function
        // SharePoint Online format:  https://tenantname.sharepoint.com/SiteName/LibraryName/
        // SharePoint My Site format: https://tenantname-my.sharepoint.com/personal/user_name/
        Uri.Init(BaseUrl);
        Host := Uri.GetHost();
        if not Host.EndsWith(SharePointHostSuffixTxt) then
            Error(UrlInvalidErr, BaseUrl);
        if Host.EndsWith(MySiteHostSuffixTxt) then
            exit(CopyStr(Host, 1, StrPos(Host, MySiteHostSuffixTxt) - 1) + OnMicrosoftTxt);
        exit(CopyStr(Host, 1, StrPos(Host, SharePointHostSuffixTxt) - 1) + OnMicrosoftTxt);
    end;

    local procedure GetSharePointAuthorization(AadTenantId: Text): Interface "SharePoint Authorization"
    var
        SharepointSetup: Record "Sharepoint Connector Setup";
        SharePointAuth: Codeunit "SharePoint Auth.";
        Scopes: List of [Text];
    begin
        SharepointSetup.Get(); //Get Sharepoint Setup data. Optionally, this can be made into a global variable as well.
        Scopes.Add(SharepointSetup.Scope);
        // Scopes.Add('00000003-0000-0ff1-ce00-000000000000/.default'); //Using a default scope provided as an example
        //We return an authorization code that will be used to initialize the Sharepoint Client
        exit(SharePointAuth.CreateAuthorizationCode(AadTenantId, SharepointSetup."Client ID", SharepointSetup."Client Secret", Scopes));
    end;

    internal procedure SaveFile(BaseUrl: Text; LibraryAndFolderPath: Text; Filename: Text; var TempBlob: Codeunit "Temp Blob")
    var
        SharePointFile: Record "SharePoint File";
        SharePointClient: Codeunit "SharePoint Client";
        SaveFailedErr: Label 'Save to SharePoint failed.\ErrorMessage: %1\HttpRetryAfter: %2\HttpStatusCode: %3\ResponseReasonPhrase: %4', Comment = '%1=GetErrorMessage; %2=GetHttpRetryAfter; %3=GetHttpStatusCode; %4=GetResponseReasonPhrase';
        AadTenantId: Text;
        InStream: InStream;
        HttpDiagnostics: Interface "HTTP Diagnostics";
    begin
        AadTenantId := GetAadTenantNameFromBaseUrl(BaseUrl);
        SharePointClient.Initialize(BaseUrl, GetSharePointAuthorization(AadTenantId));
        InStream := TempBlob.CreateInStream();
        if not SharePointClient.AddFileToFolder(LibraryAndFolderPath, Filename, InStream, SharePointFile) then begin
            HttpDiagnostics := SharePointClient.GetDiagnostics();
            Error(SaveFailedErr, HttpDiagnostics.GetErrorMessage(), HttpDiagnostics.GetHttpRetryAfter(), HttpDiagnostics.GetHttpStatusCode(), HttpDiagnostics.GetResponseReasonPhrase());
        end;
    end;
}