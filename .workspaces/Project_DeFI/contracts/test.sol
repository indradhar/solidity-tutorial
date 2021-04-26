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
             temp_teamsData[id]=temp_teams(id,size,40,temp_user_id,true);//payment_status=false
             //Send ERC Token from the address to the the contract

         }

         return(id);
     }
     temp_teams teams_ref;
     
     
     

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
     
     //SEND ERC From address to the addr[0]
     
     
    function() external payable
    {
        
    }
    
    function getBalanceCreate()external view returns(uint)
    {
        return(address(this).balance);
    }
    
     
}