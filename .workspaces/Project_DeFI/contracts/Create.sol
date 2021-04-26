pragma solidity ^0.5.0;
contract creatingGroup
{
    struct temp_teams
    {
        uint group_id;
        uint group_size;
        uint prem_amt;
        address[] user_id;
        bool payment_status;
    }
 
    
     mapping(uint=>temp_teams) public temp_teamsData;

     
     uint id=128965;
     address[]  temp_user_id; //remember to push into this array to add the team mates.
     
     function enrollTeam(uint size, address id_user) public returns(string memory,uint)
     {
         if(size<=4)
         {
             id++;
             temp_user_id.push(id_user);
             temp_teamsData[id]=temp_teams(id,size,50,temp_user_id,false);
         }
         
         return("Make a Payment of 48 ETH For Premium Amount... Your Group Id is:",id);
     }
     temp_teams teams_ref;
     function makePayment(uint pay,uint group_id) public returns(string memory)
     {
         if(pay==48)
         {
              teams_ref =temp_teamsData[group_id];
              teams_ref.payment_status=true;
              temp_teamsData[group_id]=teams_ref;
              return("Payment Successful");
         }
         else
         {
             return("Payment unsucessful, Please try again");
         }
     }
     
     function checkStatus(uint group_id)public returns(string memory,uint)
     {
         teams_ref=temp_teamsData[group_id];
         if(teams_ref.payment_status==true)
         {
             return("Payment was Done and your team is created, Share team id:",teams_ref.group_id);
         }
     }
     
   
    
    function joinTeam(uint grp_id, address id_user) public returns(string memory,uint)
    {
         teams_ref=temp_teamsData[grp_id];
         
         if(teams_ref.group_size<=4 && teams_ref.payment_status==true)
         {
             temp_user_id.push(id_user);
             teams_ref.user_id=temp_user_id;
             //temp_teamsData[grp_id]=teams_ref;
             return("Make a Payment of 12 ETH For Premium Amount... Your Group Id is:",grp_id);
         }
     }
     
     function paymentIndividual(uint pay,uint group_id) public returns(string memory)
     {
         if(pay==12)
         {
              temp_teamsData[group_id]=teams_ref;
              return("Payment Successful");
         }
         else
         {
             return("Payment unsucessful, Please try again");
         }
     }
     
     
      function() external payable
    {
        
    }
    
    function getBalanceCreate()external view returns(uint)
    {
        return(address(this).balance);
    }
    
     
}