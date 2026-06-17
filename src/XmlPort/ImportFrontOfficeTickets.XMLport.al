#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 60025 "Import Front Office Tickets"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Front Office Management"; "Front Office Management")
            {
                XmlName = 'FrontOfficeTickets';
                fieldelement(DocType; "Front Office Management"."Document Type")
                {
                }
                fieldelement(Date; "Front Office Management".Date)
                {
                }
                fieldelement(TicketDescription; "Front Office Management".Description)
                {
                }
                fieldelement(PhoneNumber; "Front Office Management"."Phone Number")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Tickets Imported Successfully');
    end;
}

