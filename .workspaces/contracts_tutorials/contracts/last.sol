pragma solidity ^0.5.0;
import SafeMath for uint256;
contract Insurance
{
    library SafeMath 
    { 
        // Only relevant functions 
        function sub(uint256 a, uint256 b)internal pure returns (uint256) 
        {
            assert(b <= a); return a — b; 
        }
     
        function add(uint256 a, uint256 b) internal pure returns (uint256) 
        {
            uint256 c = a + b; assert(c >= a); 
            return c; 
        }
    }
    struct temp_teams
    {
        uint group_id;
        uint group_size;
        uint prem_amt;
        address[] user_id;
        bool payment_status;
    }
    address public contract_address;
    function getAddress()public
    {
        contract_address=address(this);
    }
 
    
    mapping(uint=>temp_teams) public temp_teamsData;
    mapping(address => uint256) balances; 
    mapping(address => mapping (address => uint256)) allowed;

     
     uint public id=128965;
     address[]  public temp_user_id; //remember to push into this array to add the team mates.
     address public leader_addr;
     
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
             //TODO:Send ERC Token from the address to the the contract 
             getAddress();
             transfer(contract_address,2);
         }
         return(id);
     }

     function transfer(address receiver,uint numTokens) public returns (bool) 
     {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens); 
        balances[receiver] = balances[receiver].add(numTokens);
        // balances[msg.sender] = balances[msg.sender] — numTokens;
        // balances[receiver] = balances[receiver] + numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
     temp_teams teams_ref;
     
    
    function joinTeam(uint grp_id, address id_user) public 
    {
         teams_ref=temp_teamsData[grp_id];
         
         if(teams_ref.group_size<=4 && teams_ref.payment_status==true)
         {
             temp_user_id.push(id_user);
             teams_ref.user_id=temp_user_id;
             leader_addr=temp_user_id[0];
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