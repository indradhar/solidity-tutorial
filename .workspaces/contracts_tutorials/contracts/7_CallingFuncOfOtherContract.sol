pragma solidity ^0.5.0;
import './7-1_AnotherContract.sol';
//visibility: Public:- Visible in blockchain
//Private and internal:- Not visible to blockchain but can be accesseble within the contract
//Private:- accesseble For inheritance
//External:- Inorder to access the function outside the contract
//Internal:- Is accesseble only within the contract
contract ContractA
{
    address address_contractb;
    address address_contractc;

    function setAddress_b(address _Setaddress) external //should be external since we are giving address of another contract: At time of deploying
    {
        address_contractb=_Setaddress;
    }
    
    function setAddress_c(address _Setaddress) external //should be external since we are giving address of another contract: At time of deploying
    {
        address_contractc=_Setaddress;
    }
    
    function callsayHelloB()external view returns(string memory) //should be external since we are giving address of ContractB at line 17
    {
        ContractB contractb=ContractB(address_contractb);//we need address of contractb
        return(contractb.sayHello());
    }
    function callsayHelloC()external view returns(string memory) //should be external since we are giving address of ContractB at line 17
    {
        ContractC contractc=ContractC(address_contractc);//we need address of contractb
        return(contractc.sayHello());
    }
}

contract ContractB
{
    function sayHello()external pure returns(string memory) //should be "external" inorder to visible to another class
    {
        return("Hello_B");
    }
}