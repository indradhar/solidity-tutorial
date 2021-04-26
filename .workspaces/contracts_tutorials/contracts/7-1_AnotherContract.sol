pragma solidity ^0.5.0;

contract ContractC
{
    function sayHello()external pure returns(string memory) //should be "external" inorder to visible to another class
    {
        return("Hello_C");
    }
}
