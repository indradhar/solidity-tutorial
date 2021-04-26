pragma solidity ^0.5.0;
import './Create.sol';

contract joiningGroup
{
    address address_create;

    function setAddress_create(address payable _Setaddress) external //should be external since we are giving address of another contract: At time of deploying
    {
        address_create=_Setaddress;
    }
    function joinTeam(uint grp_id, address id_user) public returns(string memory,uint)
     {
         creatingGroup create_ref=creatingGroup(address_create);
         create_ref.temp_teams memory team_ref=create_ref.temp_teamsData[group_id];
         
         if(teams_ref.group_size<=4)
         {
             create_ref.temp_user_id.push(id_user);
             //teams_ref.user_id=
         }
         
         return("Make a Payment of 50 ETH For Premium Amount... Your Group Id is:",id);
     }
}
