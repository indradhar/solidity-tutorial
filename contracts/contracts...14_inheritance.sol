pragma solidity ^0.5.0;
contract ContractA
{
    function sayHelloB()external pure returns(string memory);
    function sayHelloInterface()external pure returns(string memory);
    function contracta() external pure returns(string memory)
    {
        return("Hello");
    }
}


contract ContractB is ContractA
{
    function sayHelloB()external pure returns(string memory)
    {
        return("Hello: ContractB1");
    }
    function sayHelloInterface()external pure returns(string memory)
    {
        return("Hello: ContractB2");
    }
}


