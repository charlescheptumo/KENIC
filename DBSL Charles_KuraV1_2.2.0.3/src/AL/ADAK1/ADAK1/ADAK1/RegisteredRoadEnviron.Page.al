#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72356 "Registered Road Environ"
{
    PageType = Card;
    SourceTable = "Road Environ Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Environ ID"; Rec."Environ ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Environ ID field.';
                }
                field("Road Environ Category"; Rec."Road Environ Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Environ Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Section No. field.';
                }
                field("Road Side"; Rec."Road Side")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Side field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Connected to Road Link"; Rec."Connected to Road Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Connected to Road Link field.';
                }
                field("Connection Road Length (Km)"; Rec."Connection Road Length (Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Connection Road Length (Km) field.';
                }
                field("Location Details"; Rec."Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Details field.';
                }
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class ID field.';
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Documentations & Photos action.';

                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    DMSManagement.UploadRoadLinkDocuments(Rec."Environ ID", 'Road Environ', Rec.RecordId, Rec."Region ID");
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

