page 95378 "Vendor Signature"
{
    Caption = 'Signature';
    PageType = CardPart;
    SourceTable = Vendor;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            field(Signature; Rec.Signature)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Signature field.';
            }

        }
    }
    actions
    {
        area(processing)
        {
            action(TakePicture)
            {
                ApplicationArea = All;
                Caption = 'Take';
                Image = Camera;
                ToolTip = 'Activate the camera on the device.';
                Visible = CameraAvailable;

                trigger OnAction()
                begin
                    TakeNewPicture();
                end;
            }
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a Signature file.';

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    FileName: Text;
                    ClientFileName: Text;
                begin
                    Rec.TestField("No.");
                    Rec.TestField(Name);

                    if Rec.Signature.HasValue then
                        if not Confirm(OverrideSignatureQst) then
                            exit;

                    // FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
                    // if FileName = '' then
                    //     exit;

                    Clear(Rec.Signature);
                    // Rec.Signature.ImportFile(FileName, ClientFileName);
                    if not Rec.Modify(true) then
                        Rec.Insert(true);

                    // if FileManagement.DeleteServerFile(FileName) then;
                end;
            }
            action(ExportFile)
            {
                ApplicationArea = All;
                Caption = 'Export';
                Enabled = DeleteExportEnabled;
                Image = Export;
                ToolTip = 'Export the picture to a file.';

                trigger OnAction()
                var
                    DummyPictureEntity: Record "Picture Entity";
                    FileManagement: Codeunit "File Management";
                    ToFile: Text;
                    ExportPath: Text;
                begin
                    Rec.TestField("No.");
                    Rec.TestField(Name);

                    ToFile := DummyPictureEntity.GetDefaultMediaDescription(Rec);
                    // ExportPath := TemporaryPath + Rec."No." + Format(Rec.Signature.MediaId);
                    // Rec.Signature.ExportFile(ExportPath);

                    // FileManagement.ExportImage(ExportPath, ToFile);
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin
                    Rec.TestField("No.");

                    if not Confirm(DeleteSignatureQst) then
                        exit;

                    Clear(Rec.Signature);
                    Rec.Modify(true);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        SetEditableOnPictureActions;
    end;

    trigger OnOpenPage()
    begin
        CameraAvailable := Camera.IsAvailable();
    end;

    var
        Camera: Codeunit Camera;
      //  [InDataSet]
        CameraAvailable: Boolean;
        OverrideSignatureQst: Label 'The existing Signature will be replaced. Do you want to continue?';
        DeleteSignatureQst: Label 'Are you sure you want to delete the Signature?';
        SelectPictureTxt: Label 'Select a Signature to upload';
        DeleteExportEnabled: Boolean;
        MimeTypeTok: Label 'Image/jpeg', Locked = true;

    procedure TakeNewPicture()
    var
        PictureInstream: InStream;
        PictureDescription: Text;
    begin
        Rec.TestField("No.");
        Rec.TestField(Name);

        if Rec.Signature.HasValue() then
            if not Confirm(OverrideSignatureQst) then
                exit;

        if Camera.GetPicture(PictureInstream, PictureDescription) then begin
            Clear(Rec.Signature);
            Rec.Signature.ImportStream(PictureInstream, PictureDescription, MimeTypeTok);
            Rec.Modify(true)
        end;
    end;

    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := Rec.Signature.HasValue;
    end;
}
