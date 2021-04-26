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
    address public contract_address;
    uint public grp_size;
    constructor(uint size,address id_user)public
    {
        contract_address=id_user;
        grp_size=size;
        enrollTeam();
    }
    
    // function getAddress()public returns(address)
    // {
    //     contract_address=address(this);
    //     return(contract_address);
    // }
 
    
    mapping(uint=>temp_teams) public temp_teamsData;

     
     uint public id=128965;
     address[]  public temp_user_id; //remember to push into this array to add the team mates.
     
     function enrollTeam() public 
     {
         for(uint i=0;i<temp_user_id.length;i++)
         {
             temp_user_id.pop();
         }
         if(grp_size<=4)
         {
             id++;
             temp_user_id.push(contract_address);
             temp_teamsData[id]=temp_teams(id,grp_size,40,temp_user_id,true);//payment_status=false
             //TODO:Send ERC Token from the address to the the contract
         }
     }
     temp_teams teams_ref;
     
    
    function joinTeam(uint grp_id, address id_user) public 
    {
         teams_ref=temp_teamsData[grp_id];
         
         if(teams_ref.group_size<=4 && teams_ref.payment_status==true)
         {
             temp_user_id.push(id_user);
             teams_ref.user_id=temp_user_id;
             //temp_teamsData[grp_id]=teams_ref;
             //TODO:Send ERC Token from the address to the the owner
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