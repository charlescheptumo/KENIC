/// <summary>
/// Developed by Ian Casper
/// 
/// </summary>
codeunit 50024 SharepointDMS
{

    procedure UploadDocument(DocNo: Text; DocType: Enum "Approval Document Type"): Text
    var
        Ins: InStream;
        FromFilter: Text;
        Ok: Boolean;
        FileMgt: Codeunit "File Management";
        FileName: Text;
        SharepointFile: Record "SharePoint File" temporary;
        SharepointFolder: Record "SharePoint Folder" temporary;
        ServerRelativeURL: Text;
        ShareConnectorSetup: Record "Cash Management Setup";
        SharePointConnector: Record "Sharepoint Connector Setup";
        SPC: Codeunit "SharePoint Client";
        DepartmentalFolders: Text;
        CustomFunction: Codeunit "Custom Function";
        MemosFolder: Text;
    begin
        //Message(DocNo + Format(DocType) + SharepointList."No.");
        //Upload file from clients computer into server stream
        FromFilter := 'All Files (*.*)|*.*';
        Ok := UploadIntoStream('Upload', '', FromFilter, FileName, Ins);
        Filetxt := FileName;
        //Check if folder for this document exists
        ShareConnectorSetup.Get();
        SharePointConnector.Get();
        //For Separation of BC Folders and Memos for each department
        // ServerRelativeURL := ShareConnectorSetup."SharePoint Document Library" + ShareConnectorSetup."Payment Voucher DMS Link";
        // ServerRelativeURL := SharePointConnector.Directory + Format(DocType);
        if DocType = DocType::Memos then begin
            MemosFolder := CustomFunction.MemosToSharePoint(DocType,DocNo);
            ServerRelativeURL := SharePointConnector.Directory + MemosFolder;
            
        end else begin
            // DepartmentalFolders := CustomFunction.SharePointDocumentTypeSelector();
            DepartmentalFolders := CustomFunction.SharePointDocumentTypeSelector(DocType);
            ServerRelativeURL := SharePointConnector.Directory + DepartmentalFolders;
        end;
        //For Separation of BC Folders and Memos for each department

        SharepointMgt.GetFilesFromServerRelativeURL(ServerRelativeURL, SharepointFolder, SharepointFile);
        SharepointFolder.Reset();
        
        SharepointFolder.SetRange(Name, DocNo);
        if SharepointFolder.FindFirst() then begin
            ServerRelativeURL := ServerRelativeURL + '/' + DocNo;
            if SharepointMgt.SaveFile(ServerRelativeURL, FileName, Ins) then begin
                //For Separation of BC Folders and Memos for each department
                // ServerRelativeURL := ServerRelativeURL + '/' + FileName;
                if DocType = DocType::Memos then begin
                    ServerRelativeURL := ServerRelativeURL + '/' + FileName;
                end else begin
                    ServerRelativeURL := ServerRelativeURL + '/' + FileName;
                end;
                //For Separation of BC Folders and Memos for each department
                OD := SharepointMgt.getOdataID();
                exit(ServerRelativeURL);

            end;
        end else begin
            // ServerRelativeURL := ServerRelativeURL + '/' + DocNo;
            if DocType = DocType::Memos then begin
                ServerRelativeURL := ServerRelativeURL + '/' + DocNo;
            end else begin
                ServerRelativeURL := ServerRelativeURL + '/' + DocNo;
            end;
            if SharepointMgt.CreateFolder(ServerRelativeURL) then
                if SharepointMgt.SaveFile(ServerRelativeURL, FileName, Ins) then begin
                    //For Separation of BC Folders and Memos for each department
                    // ServerRelativeURL := ServerRelativeURL + '/' + FileName;
                    if DocType = DocType::Memos then begin
                        ServerRelativeURL := ServerRelativeURL + MemosFolder + '/' + FileName;
                    end else begin
                        ServerRelativeURL := ServerRelativeURL + DepartmentalFolders + '/' + FileName;
                    end;
                    //For Separation of BC Folders and Memos for each department
                    OD := SharepointMgt.getOdataID();
                    exit(ServerRelativeURL);
                end;

        end;
    end;


    Procedure DownloadDocument(OD: Text; Filename: Text)
    begin
        SharepointMgt.OpenFile(OD, Filename);
    end;

    procedure getOdataID(): Text
    begin
        exit(OD);
    end;

    Procedure GetFilname(): Text
    begin
        exit(Filetxt);
    end;

    procedure DeleteFileInSharePoint(var SharePointAttachment: Record "Sharepoint File List")
    var
        
        SharePointAttachment2: Record "Sharepoint File List";
    begin
        // Check if the file exists in other customers, if it exists, just delete it in the BC side.
        SharePointAttachment2.Reset();
        SharePointAttachment2.SetRange("No.",SharePointAttachment."No.");
        SharePointAttachment2.SetRange(id,SharePointAttachment.id);
        if SharePointAttachment2.FindFirst then begin
            SharePointAttachment.Delete();
            exit;
        end;
    end;



    var
        Filetxt: text;
        SharepointMgt: Codeunit "Sharepoint Management";
        OD: Text;


}
