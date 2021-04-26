pragma solidity ^0.5.0;
contract SendEther
{
     //1. A function without name is known as fallback function and it should be declared as external
     //2. A Fallback function will not return any value or variables
     //3. Not more than 1 fallback function is declared in a contract
     //4.Fallback function should be payable inorder to send money to our contract
    function()external payable
    {
       //This is a Fallback function 
    }
    
    function getbalance() public view returns(uint)
    {
        return address(this).balance;
    }
}