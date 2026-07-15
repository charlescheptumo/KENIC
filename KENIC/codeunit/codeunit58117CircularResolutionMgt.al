// codeunit 58117 "Circular Resolution Mgt."
// {
    
//     procedure GenerateVoters(Header: Record "Circular Resolution Header"; GroupType: Option "Individual","Responsibility Center","Operating Unit Type","Branch"; SelectionCode: Code[20])
//     var
//         Employee: Record Employee;
//         RespCenter: Record "Responsibility Center";
//         ResVote: Record "Circular Resolution Vote";
//         NextLineNo: Integer;
//     begin
//         Header.TestField("No.");
//         if GroupType <> GroupType::"Individual" then
//             if SelectionCode = '' then
//                 Error('Please specify a valid selection value.');

     
//         ResVote.Reset();
//         ResVote.SetRange("Resolution No.", Header."No.");
//         if ResVote.FindLast() then
//             NextLineNo := ResVote."Line No." + 10000
//         else
//             NextLineNo := 10000;

      
//         Employee.Reset();
//         Employee.SetRange(Status, Employee.Status::Active);

//         case GroupType of
//             GroupType::"Responsibility Center":
//                 Employee.SetRange("Responsibility Center", SelectionCode);

//             GroupType::"Operating Unit Type":
//                 begin
                    
//                     RespCenter.Reset();
                   
//                     RespCenter.SetFilter("Operating Unit Type", SelectionCode);
//                     if RespCenter.FindSet() then begin
                  
//                         repeat
//                             if Employee.GetFilter("Responsibility Center") <> '' then
//                                 Employee.SetFilter("Responsibility Center", Employee.GetFilter("Responsibility Center") + '|' + RespCenter.Code)
//                             else
//                                 Employee.SetRange("Responsibility Center", RespCenter.Code);
//                         until RespCenter.Next() = 0;
//                     end else
//                         Error('No Responsibility Centers found with Operating Unit Type: %1', SelectionCode);
//                 end;

//             GroupType::"Branch":
                
//                 Employee.SetRange("Branch Code", SelectionCode); 
//         end;

        
//         if Employee.FindSet() then begin
//             repeat
               
//                 ResVote.Reset();
//                 ResVote.SetRange("Resolution No.", Header."No.");
//                 ResVote.SetRange("Employee No.", Employee."No.");
//                 if ResVote.IsEmpty() then begin
//                     ResVote.Init();
//                     ResVote."Resolution No." := Header."No.";
//                     ResVote."Line No." := NextLineNo;
//                     ResVote.Validate("Employee No.", Employee."No.");
//                     ResVote."Vote Status" := ResVote."Vote Status"::Pending;
//                     ResVote."Notification Sent" := false;
//                     ResVote.Insert(true);
//                     NextLineNo += 10000;
//                 end;
//             until Employee.Next() = 0;
//         end else
//             Message('No active employees were found matching the selection criteria.');
//     end;

//     // Handles the email notifications
//     procedure NotifyCommitteeMembers(Header: Record "Circular Resolution Header")
//     var
//         ResVote: Record "Circular Resolution Vote";
//         NotificationCount: Integer;
//     begin
//         Header.TestField("No.");
//         Header.TestField("Voting Deadline");
//         Header.TestField("Approval Status", Header."Approval Status"::Released);

//         ResVote.Reset();
//         ResVote.SetRange("Resolution No.", Header."No.");
//         if ResVote.FindSet() then begin
//             repeat
        
                
//                 ResVote."Notification Sent" := true;
//                 ResVote.Modify();
//                 NotificationCount += 1;
//             until ResVote.Next() = 0;
//             Message('%1 committee members have been successfully notified about Resolution %2.', NotificationCount, Header."No.");
//         end else
//             Error('There are no voter lines configured on this resolution to notify.');
//     end;
// }