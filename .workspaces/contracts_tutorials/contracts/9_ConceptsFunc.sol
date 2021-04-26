pragma solidity ^0.5.0;
interface Inter1
{
    function sayhello()external pure returns(string memory); //all functions in an interface should be external
}
contract Demo is Inter1
{
        function sayhello()external pure returns(string memory)
        {
            return("HEllo");
        }
}

contract SetGet
{
    uint a1;
    function setVal(uint a)public
    {
        a1=a;
    }
    function getVal()public view returns(uint)
    {
        return(a1);
    }
}