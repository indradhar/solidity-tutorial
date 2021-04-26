pragma solidity ^0.5.0;
contract Insurance
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
     address[]  public temp_user_id; //remember to push into this array to add the team mates.
     
     function enrollTeam(uint size, address id_user) public returns(uint)
     {
         for(uint i=0;i<temp_user_id.length;i++)
         {
             temp_user_id.pop();
         }
         if(size<=4)
         {
             id++;
             temp_user_id.push(id_user);
             temp_teamsData[id]=temp_teams(id,size,50,temp_user_id,false);
         }
         
         return(id);
     }
     temp_teams teams_ref;
     
     function makePayment(uint pay,uint group_id,uint addr) public returns(string memory)
     {//from addr to smart contract
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
     
     function checkStatus(uint group_id)public returns(uint)
     {
         teams_ref=temp_teamsData[group_id];
         if(teams_ref.payment_status==true)
         {
             //return(teams_ref.group_id);
             return 1;//need to update again
         }
         return 0;
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
     
     function paymentIndividual(uint pay,uint group_id,address addr) public returns(string memory)
     {//from addr to user_id[0];
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