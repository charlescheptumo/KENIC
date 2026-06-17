page 50201 "Sharepoint File List"
{
    PageType = Listpart;
    SourceTable = "Sharepoint File List";
    //InsertAllowed = false;
    //DeleteAllowed = false;
    //ModifyAllowed = false;
    //SourceTableTemporary = true;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Attachments';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                    visible = false;
                }
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.';
                    visible = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    visible = false;
                }
                field(Name; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.';

                    trigger OnDrillDown()
                    var
                        FileList: Page "Sharepoint File List";
                    begin
                        if Rec.Folder then begin
                            FileList.LookupMode(true);
                            FileList.SetParentFolderURL(Rec."Server Relative Url");
                            FileList.RunModal();
                        end;
                    end;
                }
                field(CreatedBy; Rec.CreatedBy)
                {
                    ToolTip = 'Specifies the value of the CreatedBy field.';
                    Caption = 'Uploaded By';
                }
                field(Created; Rec.Created)
                {
                    ToolTip = 'Specifies the value of the Created field.';
                }
                field(OdataId; Rec.OdataId)
                {
                    ToolTip = 'Specifies the value of the Odata.Id field.';
                    Visible = false;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(Upload)
            {
                ApplicationArea = All;
                ToolTip = 'Executes the Upload action.';

                trigger OnAction()
                var
                    SharepointFile: Record "SharePoint File";
                    SPC: Codeunit "SharePoint Client";
                    SPM: Codeunit "Sharepoint Management";
                    RefinedNo : Code[100];
                begin
                    No := Rec."No.";
                    RefinedNo := ConvertStr(No,'/','_');
                    // Url := DMS.UploadDocument(RefinedNo, GlobalDocType);
                    Url := DMS.UploadDocument(RefinedNo, GlobalDocType);
                    Filename := DMS.GetFilname();
                    GOdataId := DMS.getOdataID();
                    CreateMetaData(Filename, Url);
                end;

            }
            action(Download)
            {
                ApplicationArea = all;
                Scope = Repeater;
                ToolTip = 'Executes the Download action.';
                trigger OnAction()
                var


                begin
                    DMS.DownloadDocument(Rec.OdataId, Rec.Title);

                end;
            }

        }
    }


    procedure SetParentFolderURL(NewURL: Text)
    begin
        ParentFolderURL := NewURL;
    end;

    var
        ParentFolderURL: Text;
        MainRecordRef: RecordRef;
        GlobalRecordID: RecordID;
        DMS: Codeunit SharepointDMS;
        GlobalDocType: Enum "Approval Document Type";
        No: Code[30];
        Url: Text;
        Filename: Text;
        GOdataID: Text;


    procedure Documenttype(DocType: Enum "Approval Document Type"; RecNo: Code[30])
    begin
        GlobalDocType := DocType;
        CurrPage.Update(false);
    end;

    procedure CreateMetaData(Filename: Text; ServerRelativeUrl: Text)
    var
        SP: Record "Sharepoint File List";
        LineNO: Integer;
    begin
        sp.Reset();
        sp.SetRange("No.", No);
        sp.SetRange("Document Type", GlobalDocType);
        if sp.FindLast() then
            LineNO := SP.Id;
        Rec.Init();
        Rec.CreatedBy := UserId;
        rec."No." := No;
        Rec.Id := LineNO + 1;
        Rec."Document Type" := GlobalDocType;
        Rec.Created := CurrentDateTime;
        Rec.Title := Filename;
        Rec.OdataId := GOdataID;
        Rec."Server Relative Url" := ServerRelativeUrl;

        Rec.Insert();

    end;


}