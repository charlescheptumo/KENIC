codeunit 57120 "Circular Resolution Mgt."

{

    Subtype = Normal;



    trigger OnRun()

    var

        ResolutionHeader: Record "Circular Resolution Header";
        ResolutionMgt: Codeunit "Resolution Management";

    begin

        ResolutionHeader.Reset();



        ResolutionHeader.SetFilter(Status, '%1|%2|%3',

            ResolutionHeader.Status::"Pending Approval",

            ResolutionHeader.Status::Approved,

            ResolutionHeader.Status::Voting);



        if ResolutionHeader.FindSet() then

            repeat

                ResolutionHeader.UpdateStatusBasedOnDeadline();

            until ResolutionHeader.Next() = 0;
        // Send reminder emails
        ResolutionMgt.SendAutomatedVotingReminders();
    end;

      

}